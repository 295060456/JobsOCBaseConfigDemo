//
//  UIView+Extras.m
//  MJRefreshExample
//
//  Created by Aalto on 14-5-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "UIView+Extras.h"

@implementation UIView (Extras)
#pragma mark —— 打印
-(jobsByStringBlock _Nonnull)jobsLogFrame{
    return ^(NSString *_Nonnull str) {
        NSLog(@"%@ = %@", str, NSStringFromCGRect(self.frame));
    };
}

-(jobsByStringBlock _Nonnull)jobsLogPoint{
    return ^(NSString *_Nonnull str) {
        NSLog(@"%@ = %@", str, NSStringFromCGPoint(self.origin));
    };
}

-(jobsByStringBlock _Nonnull)jobsLogSize{
    return ^(NSString *_Nonnull str) {
        NSLog(@"%@ = %@", str, NSStringFromCGSize(self.size));
    };
}
#pragma mark —— 键盘事件
/// 监听键盘事件
-(void)monitorKeyboardAction{
    @jobs_weakify(self)
    JobsAddNotification(self,
                    selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                              id _Nullable arg){
        NSNotification *notification = (NSNotification *)arg;
        if([notification.object isKindOfClass:NSNumber.class]){
            NSNumber *b = notification.object;
            NSLog(@"SSS = %d",b.boolValue);
        }
        @jobs_strongify(self)
        NSLog(@"通知传递过来的 = %@",notification.object);
        return nil;
    },nil, self),UIKeyboardWillShowNotification,nil);
    
    JobsAddNotification(self,
                    selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                              id _Nullable arg){
        NSNotification *notification = (NSNotification *)arg;
        if([notification.object isKindOfClass:NSNumber.class]){
            NSNumber *b = notification.object;
            NSLog(@"SSS = %d",b.boolValue);
        }
        @jobs_strongify(self)
        NSLog(@"通知传递过来的 = %@",notification.object);
        return nil;
    },nil, self),UIKeyboardWillHideNotification,nil);
}
#pragma mark —— 截屏
/*
 1、将图片存本地相册 UIImageWriteToSavedPhotosAlbum
 2、iOS安全 —— 录屏、截屏判断
    2.1、UIApplicationUserDidTakeScreenshotNotification iOS7+ 截屏事件通知
    2.2、UIScreenCapturedDidChangeNotification 判断是否在录屏状态 而当录屏状态改变时，UIKit会发送录屏通知
 */
/// 获取屏幕截图
-(UIImage *_Nullable)screenShot{
    CGSize size = UIScreen.mainScreen.bounds.size;
    CGFloat scale = UIScreen.mainScreen.scale;
    UIGraphicsBeginImageContextWithOptions(size,
                                           YES,
                                           scale);
    [jobsGetMainWindow().layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
/// 获取启动页的截图
-(UIImage *_Nullable)lanuchScreenShot{
    NSString *name = NSBundle.mainBundle.infoDictionary.valueForKeyBlock(@"UILaunchStoryboardName");
    if(!name) return nil;
    UIViewController *vc = [self vcByStoryboardWithName:name storyboardBundle:nil];
    if(vc){
        UIView *view = vc.view;
        UIWindow *window = jobsGetMainWindow();
        view.frame = window.bounds;
        [window addSubview:view];
        [window layoutIfNeeded];
        UIImage *image = self.screenShot;
        window = nil;
        return image;
    }return nil;
}
/// 获取某个view 上的截图
-(UIImage *_Nullable)viewShots{
    if (CGRectIsEmpty(self.frame)) return nil;
    CGSize size = self.bounds.size;
    CGFloat scale = UIScreen.mainScreen.scale;
    UIGraphicsBeginImageContextWithOptions(size,
                                           NO,
                                           scale);
    if ([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        /// 对view进行一个快照，然后将快照渲染到当前的上下文中 https://www.jianshu.com/p/3d246235388c
        /// rect：指定图片绘制的坐标
        /// afterUpdates：截图的瞬间是否将屏幕当前的变更渲染进去
        [self drawViewHierarchyInRect:self.bounds
                   afterScreenUpdates:YES];
    }else{
        /// 将view的layer渲染到当前的绘制的上下文中
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
/// 获取某个scrollview 上的截图
-(UIImage *_Nullable)scrollViewShot{
    if ([self isKindOfClass:UIScrollView.class]) {
        UIScrollView *scrollview = (UIScrollView *)self;
        UIGraphicsBeginImageContextWithOptions(scrollview.contentSize,
                                               YES,
                                               UIScreen.mainScreen.scale);

        /// 获取当前scrollview的frame 和 contentOffset
        CGRect saveFrame = scrollview.frame;
        CGPoint saveOffset = scrollview.contentOffset;
        /// 置为起点
        scrollview.contentOffset = CGPointZero;
        scrollview.frame = CGRectMake(0,
                                      0,
                                      scrollview.contentSize.width,
                                      scrollview.contentSize.height);

        [scrollview.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        /// 还原
        scrollview.frame = saveFrame;
        scrollview.contentOffset = saveOffset;
        return image;
    }return nil;
}
/// 获取某个 范围内的 截图
-(UIImage *_Nullable)innerViewShotAtFrame:(CGRect)rect{
    UIGraphicsBeginImageContext(self.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(rect);
    [self.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
#pragma mark —— 描边
/// 指定描边 【在使用这个方法的一个前提是被描边的view刷新后存在frame】
/// @param color 作用颜色
/// @param borderWidth 线宽
/// @param borderType 作用方向
-(void)setBorderWithColor:(UIColor *_Nullable)color
              borderWidth:(CGFloat)borderWidth
               borderType:(UIBorderSideType)borderType{
    [self.superview layoutIfNeeded];
    /// 左
    if (borderType & UIBorderSideTypeLeft) {
        CALayer *layer = CALayer.layer;
        layer.frame = CGRectMake(0,
                                 0,
                                 borderWidth,
                                 self.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [self.layer addSublayer:layer];
    }
    /// 右
    if (borderType & UIBorderSideTypeRight){
        CALayer *layer = CALayer.layer;
        layer.frame = CGRectMake(self.frame.size.width - borderWidth,
                                 0,
                                 borderWidth,
                                 self.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [self.layer addSublayer:layer];
    }
    /// 上
    if (borderType & UIBorderSideTypeTop) {
        CALayer *layer = CALayer.layer;
        layer.frame = CGRectMake(0,
                                 0,
                                 self.frame.size.width,
                                 borderWidth);
        layer.backgroundColor = color.CGColor;
        [self.layer addSublayer:layer];
    }
    /// 下
    if (borderType & UIBorderSideTypeBottom) {
        CALayer *layer = CALayer.layer;
        layer.frame = CGRectMake(0,
                                 self.frame.size.height - borderWidth,
                                 self.frame.size.width,
                                 borderWidth);
        layer.backgroundColor = color.CGColor;
        [self.layer addSublayer:layer];
    }
}
/// 描边
/// @param layerBorderCor 颜色
/// @param borderWidth 边线宽度
-(void)layerBorderCor:(UIColor *_Nullable)layerBorderCor
       andBorderWidth:(CGFloat)borderWidth{
    self.layer.borderColor = layerBorderCor.CGColor;
    self.layer.borderWidth = borderWidth;
}
#pragma mark —— 切角
/// 切整个View的4个角为统一的切角参数
-(jobsByCGFloatBlock _Nonnull)cornerCutToCircleWithCornerRadius{
    @jobs_weakify(self)
    return ^(CGFloat cornerRadiusValue) {
        @jobs_strongify(self)
        self.layer.cornerRadius = cornerRadiusValue;
        self.layer.masksToBounds = YES;
    };
}
/// 指定圆切角（方法一）
/// ⚠️这种写法存在一定的弊端：如果在某个View上添加子View，并对这个View使用如下方法的圆切角，则这个View上的子视图不可见⚠️
-(void)appointCornerCutToCircleByRoundingCorners:(UIRectCorner)corners
                                     cornerRadii:(CGSize)cornerRadii{
    // 设置切哪个直角
    //    UIRectCornerTopLeft     = 1 << 0,  左上角
    //    UIRectCornerTopRight    = 1 << 1,  右上角
    //    UIRectCornerBottomLeft  = 1 << 2,  左下角
    //    UIRectCornerBottomRight = 1 << 3,  右下角
    //    UIRectCornerAllCorners  = ~0UL     全部角
    if (CGSizeEqualToSize(cornerRadii, CGSizeZero)) {
        cornerRadii = CGSizeMake(self.width / 2,self.height / 2);
    }
    /// 得到view的遮罩路径
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:cornerRadii];
    /// 创建 layer
    CAShapeLayer *maskLayer = CAShapeLayer.new;
    maskLayer.frame = self.bounds;
    /// 赋值
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
/// 指定圆切角（方法二），避免了（方法一）的弊端
/// 作用于需要切的View的子类里面的-(void)layoutSubviews方法
-(void)layoutSubviewsCutCnrByRoundingCorners:(UIRectCorner)corners
                                 cornerRadii:(CGSize)cornerRadii{
    //    设置切哪个直角
    //    UIRectCornerTopLeft     = 1 << 0,  左上角
    //    UIRectCornerTopRight    = 1 << 1,  右上角
    //    UIRectCornerBottomLeft  = 1 << 2,  左下角
    //    UIRectCornerBottomRight = 1 << 3,  右下角
    //    UIRectCornerAllCorners  = ~0UL     全部角
    
    if (CGSizeEqualToSize(cornerRadii, CGSizeZero)) {
        cornerRadii = CGSizeMake(self.width / 2,self.height / 2);
    }
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = CAShapeLayer.layer;
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
#pragma mark —— @implementation UILabel (AutoScroll)
/// 根据文字长短自动判断是否需要显示TextLayer，并且滚动
-(void)setTextLayerScroll{
    CATextLayer * textLayer = self.getTextLayer;
    if (self.shouldAutoScroll){
        CABasicAnimation * ani = self.getAnimation;
        [textLayer addAnimation:ani forKey:nil];
        [self.layer addSublayer:textLayer];
    }else{
        [textLayer removeAllAnimations];
        [textLayer removeFromSuperlayer];
    }
    /// 下面的代码是防止当横屏切且手机屏幕旋转的时候，因为UI超过屏幕宽度造成的崩溃
    /// 具体是：-(CATextLayer *_Nonnull)getTextLayer里面的：layer.frame = CGRectMake(0, 0, stringWidth, self.frame.size.height);发生崩溃
    if([self isKindOfClass:UILabel.class]){
        UILabel *label = (UILabel *)self;
        // 优化文本布局以减少过宽文本
        label.numberOfLines = 0; // 设置文本包装的行数
        label.lineBreakMode = NSLineBreakByWordWrapping; // 启用文字换行
    }else if ([self isKindOfClass:UIButton.class]){
        UIButton *btn = (UIButton *)self;
        btn.titleLabel.numberOfLines = 0; // 设置文本包装的行数
        btn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping; // 启用文字换行
    }else{}
}
/// runtime存放textLayer，避免多次生成
-(CATextLayer *_Nonnull)getTextLayer{
    CATextLayer *layer = objc_getAssociatedObject(self, _cmd);
    if (!layer) {
        layer = CATextLayer.layer;
        objc_setAssociatedObject(self,
                                 _cmd,
                                 layer,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }

    if ([self isKindOfClass:UILabel.class]) {
        UILabel *label = (UILabel *)self;
        CGSize size = [label.text sizeWithAttributes:@{NSFontAttributeName:label.font}];
        CGFloat stringWidth = size.width;

        NSLog(@"stringWidth = %f",stringWidth);
        JobsLogCGRect(@"layer.frame = %@",layer.frame);
        JobsLogCGRect(@"self.frame = %@",self.frame);
        
        layer.frame = CGRectMake(0, 0, stringWidth, self.frame.size.height);
        layer.alignmentMode = kCAAlignmentCenter;
        layer.font = (__bridge CFTypeRef _Nullable)(label.font.fontName);
        layer.fontSize = label.font.pointSize;
        layer.foregroundColor = label.textColor.CGColor;
        layer.string = label.text;
    }else if ([self isKindOfClass:UIButton.class]){
        UIButton *button = (UIButton *)self;
        CGSize size = [button.titleForNormalState sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
        CGFloat stringWidth = size.width;
        layer.frame = CGRectMake(0, 0, stringWidth, self.frame.size.height);
        layer.alignmentMode = kCAAlignmentCenter;
        layer.font = (__bridge CFTypeRef _Nullable)(button.titleLabel.font.fontName);
        layer.fontSize = button.titleLabel.font.pointSize;
        layer.foregroundColor = button.titleLabel.textColor.CGColor;
        layer.string = button.titleForNormalState;
    }else{}
    layer.contentsScale = UIScreen.mainScreen.scale;// 不写这句可能导致layer的文字在某些情况下不清晰
    return layer;
}
/// runtime存放动画对象，避免多次生成
-(CABasicAnimation *_Nonnull)getAnimation{
    CABasicAnimation * ani = objc_getAssociatedObject(self, _cmd);
    if (!ani) {
        ani = [CABasicAnimation animationWithKeyPath:@"position.x"];
        objc_setAssociatedObject(self,
                                 _cmd,
                                 ani,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    CATextLayer * textLayer = self.getTextLayer;
    CGPoint point = textLayer.position;
    CGFloat lenth = textLayer.frame.size.width - self.frame.size.width;
    // 起点位置
    CGPoint pointSrc = CGPointMake(point.x + 20, point.y);
    // 终点位置
    CGPoint pointDes = CGPointMake(pointSrc.x - lenth - 30, pointSrc.y);
    id toValue = [NSValue valueWithCGPoint:pointDes];
    id fromValue = [NSValue valueWithCGPoint:pointSrc];
    ani.toValue = toValue;
    ani.fromValue = fromValue;
    ani.duration = 2;
    ani.fillMode = kCAFillModeBoth;
    ani.repeatCount = HUGE_VALF;
    // 结束后逆向执行动画
    ani.autoreverses = YES;
    ani.removedOnCompletion = false;
    return ani;
}
/// 判断是否需要滚动
-(BOOL)shouldAutoScroll{
    BOOL shouldScroll = false;
    if ([self isKindOfClass:UILabel.class]) {
        UILabel *label = (UILabel *)self;
        if (label.numberOfLines == 1) {
            CGSize size = [label.text sizeWithAttributes:@{NSFontAttributeName:label.font}];
            CGFloat stringWidth = size.width;
            CGFloat labelWidth = self.frame.size.width;
            if (labelWidth < stringWidth) {
                shouldScroll = true;
            }
        }
    }else if ([self isKindOfClass:UIButton.class]){
        UIButton *button = (UIButton *)self;
        if (button.titleLabel.numberOfLines == 1) {
            CGSize size = [button.titleForNormalState sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
            CGFloat stringWidth = size.width;
            CGFloat labelWidth = self.frame.size.width;
            if (labelWidth < stringWidth) {
                shouldScroll = true;
            }
        }
    }else{}

    Class ModelClass = NSClassFromString(@"_UIAlertControllerActionView");
    if ([self.superview.superview isKindOfClass:ModelClass]) {
        shouldScroll = false;
    }
    
    return shouldScroll;
}
/// 数据（字符串）定宽
+(CGFloat)widthByData:(UIViewModel *_Nonnull)data{
    return 0;
}
/// 数据（字符串）定高
+(CGFloat)heightByData:(UIViewModel *_Nonnull)data{
    return 0;
}
#pragma mark —— 其他
-(jobsByViewBlock _Nullable)addSubview{
    return ^(__kindof UIView *_Nullable subView) {
        [self addSubview:subView];
    };
}
/// 针对数据源是UIImage  *的GKPhotoBrowser
-(void)viewTapGRSavePicsWithImageDataMutArr:(NSMutableArray <UIImage *>* _Nonnull)imageDataMutArr
                                atIndexPath:(NSIndexPath * _Nonnull)indexPath
                                   byTarget:(id _Nonnull)target{
    [self viewTapGRSavePicsBaseConfigByTarget:target];
    @jobs_weakify(self)
    self.tapGR_SelImp.selector = [target jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                         UITapGestureRecognizer *_Nullable arg) {
        @jobs_strongify(self)
        GKPhotoBrowser *browser = [target tapImageWithIndexPath:indexPath imageDataMutArr:imageDataMutArr];
        [browser showFromVC:self.currentController];
        return nil;
    }];self.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
}
/// 针对数据源是NSURL  *的GKPhotoBrowser
-(void)viewTapGRSavePicsWithImageUrlMutArr:(NSMutableArray <NSURL *>* _Nonnull)imageUrlMutArr
                               atIndexPath:(NSIndexPath * _Nonnull)indexPath
                                  byTarget:(id _Nonnull)target{
    [self viewTapGRSavePicsBaseConfigByTarget:target];
    @jobs_weakify(self)
    self.tapGR_SelImp.selector = [target jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                         UITapGestureRecognizer *_Nullable arg) {
        @jobs_strongify(self)
        GKPhotoBrowser *browser = [target tapImageWithIndexPath:indexPath imageUrlMutArr:imageUrlMutArr];
        [browser showFromVC:self.currentController];
        return nil;
    }];self.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
}
/// 针对数据源是NSString  *的GKPhotoBrowser
-(void)viewTapGRSavePicsWithImageUrlStrMutArr:(NSMutableArray <NSString *>* _Nonnull)imageUrlStrMutArr
                                  atIndexPath:(NSIndexPath * _Nonnull)indexPath
                                     byTarget:(id _Nonnull)target{
    [self viewTapGRSavePicsBaseConfigByTarget:target];
    @jobs_weakify(self)
    self.tapGR_SelImp.selector = [target jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                         UITapGestureRecognizer *_Nullable arg) {
        @jobs_strongify(self)
        GKPhotoBrowser *browser = [target tapImageWithIndexPath:indexPath imageUrlStrMutArr:imageUrlStrMutArr];
        [browser showFromVC:self.currentController];
        return nil;
    }];self.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
}
/// 对GKPhotoBrowser保存图片的基础设置
-(void)viewTapGRSavePicsBaseConfigByTarget:(id _Nonnull)target{
    self.numberOfTouchesRequired = 1;
    self.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
    self.minimumPressDuration = 0.1;
    self.numberOfTouchesRequired = 1;
    self.allowableMovement = 1;
    self.userInteractionEnabled = YES;
    self.target = target;
}
/// popView取消按钮常规处理方法
-(void)cancelBtnActionForPopView:(id _Nullable)object{
    [self tf_hide];
    [self.class destroySingleton];
    if(self.objectBlock) self.objectBlock(object);
}
/// 顺时针旋转radians度【依据中心点进行旋转】
-(void)transformByRadians:(CGFloat)radians{
    self.transform = CGAffineTransformMakeRotation(M_PI * radians);
//    [self transformByRadians:1.5f]; // 逆时针旋转 3 * 90度
}
/// 顺时针旋转degrees弧度【依据中心点进行旋转】
-(void)transformByDegrees:(CGFloat)degrees{
    // 将度数转换为弧度
    CGFloat radians = degrees * (M_PI / 180.0);
    // 应用旋转变换（radians为正数将逆时针旋转）
    self.transform = CGAffineTransformMakeRotation(radians);
//    [self transformByDegrees:45];// 逆时针旋转 45 度
}

-(UIImage *_Nullable)getImage{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size,
                                           NO,
                                           UIScreen.mainScreen.scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
/// iOS 阴影效果 添加了shadowPath后消除了离屏渲染问题 。特别提示：不能存在 -(void)drawRect:(CGRect)rect 或者在-(void)drawRect:(CGRect)rect里面写，否则无效
/// @param targetShadowview 需要作用阴影效果的View
/// @param superview 该阴影效果的View的父View
/// @param ShadowDirection 阴影朝向
/// @param offsetX 贝塞尔曲线X轴偏移量
/// @param offsetY 贝塞尔曲线Y轴偏移量
/// @param cornerRadius 圆切角参数，传0表示不切
/// @param shadowOffset  阴影偏移量
/// @param shadowOpacity 阴影的不透明度,取值范围在0~1
/// @param layerShadowColor 阴影颜色
/// @param layerShadowRadius  模糊计算的半径
+(void)makeTargetShadowview:(UIView *__nonnull)targetShadowview
                  superView:(UIView *__nullable)superview
            shadowDirection:(ShadowDirection)ShadowDirection
          shadowWithOffsetX:(CGFloat)offsetX
                    offsetY:(CGFloat)offsetY
               cornerRadius:(CGFloat)cornerRadius
               shadowOffset:(CGSize)shadowOffset
              shadowOpacity:(CGFloat)shadowOpacity
           layerShadowColor:(UIColor *__nullable)layerShadowColor
          layerShadowRadius:(CGFloat)layerShadowRadius{
    
    targetShadowview.layer.cornerRadius = cornerRadius;//圆切角
    
    if (superview && CGRectEqualToRect(targetShadowview.frame,CGRectZero)) {
        [superview layoutIfNeeded];//targetShadowview当在某些masonry约束的时候，没有frame,需要进行刷新得到frame，否则不会出现阴影效果
    }
    
    targetShadowview.layer.shadowOpacity = (shadowOpacity != 0) ? : 0.7f;//shadowOpacity设置了阴影的不透明度,取值范围在0~1;
    targetShadowview.layer.shadowOffset = shadowOffset;//阴影偏移量
    targetShadowview.layer.shadowColor = (layerShadowColor ? :JobsDarkGrayColor).CGColor;//阴影颜色   JobsLightGrayColor.CGColor;
    targetShadowview.layer.shadowRadius = (layerShadowRadius != 0) ? : 8.0f;//模糊计算的半径
    
    UIBezierPath *path = UIBezierPath.bezierPath;

    //偏移量保持为正数，便于后续计算
    offsetX = offsetX >= 0 ? offsetX : -offsetX;
    offsetY = offsetY >= 0 ? offsetY : -offsetY;
    //偏移量默认值
    offsetX = offsetX != 0 ? :20;
    offsetY = offsetY != 0 ? :20;

    switch (ShadowDirection) {
        case ShadowDirection_top:{
            [path moveToPoint:CGPointMake(0, -offsetY)];//左上角为绘制的贝塞尔曲线原点
            [path addLineToPoint:CGPointMake(0, targetShadowview.height)];//👇
            [path addLineToPoint:CGPointMake(targetShadowview.width, targetShadowview.height)];//👉
            [path addLineToPoint:CGPointMake(targetShadowview.width, -offsetY)];//👆
        }break;
        case ShadowDirection_down:{
            [path moveToPoint:CGPointMake(0, 0)];//左上角为绘制的贝塞尔曲线原点
            [path addLineToPoint:CGPointMake(0, targetShadowview.height + offsetY)];//👇
            [path addLineToPoint:CGPointMake(targetShadowview.width, targetShadowview.height + offsetY)];//👉
            [path addLineToPoint:CGPointMake(targetShadowview.width, 0)];//👆
        }break;
        case ShadowDirection_left:{
            [path moveToPoint:CGPointMake(offsetX, 0)];//左上角
            [path addLineToPoint:CGPointMake(offsetX, targetShadowview.height)];//👇
            [path addLineToPoint:CGPointMake(targetShadowview.width, targetShadowview.height)];//👉
            [path addLineToPoint:CGPointMake(targetShadowview.width, 0)];//👆
        }break;
        case ShadowDirection_right:{
            [path moveToPoint:CGPointMake(0, 0)];//左上角
            [path addLineToPoint:CGPointMake(0, targetShadowview.height)];//👇
            [path addLineToPoint:CGPointMake(targetShadowview.width + offsetX, targetShadowview.height)];//👉
            [path addLineToPoint:CGPointMake(targetShadowview.width + offsetX, 0)];//👆
        }break;
        case ShadowDirection_leftTop:{
            [path moveToPoint:CGPointMake(-offsetX, -offsetY)];//左上角
            [path addLineToPoint:CGPointMake(-offsetX, targetShadowview.height - offsetY)];//👇
            [path addLineToPoint:CGPointMake(targetShadowview.width - offsetX, targetShadowview.height - offsetY)];//👉
            [path addLineToPoint:CGPointMake(targetShadowview.width - offsetX, -offsetY)];//👆
        }break;
        case ShadowDirection_leftDown:{
            [path moveToPoint:CGPointMake(-offsetX, offsetY)];//左上角
            [path addLineToPoint:CGPointMake(-offsetX, targetShadowview.height + offsetY)];//👇
            [path addLineToPoint:CGPointMake(targetShadowview.width - offsetX, targetShadowview.height + offsetX)];//👉
            [path addLineToPoint:CGPointMake(targetShadowview.width - offsetX, offsetY)];//👆
        }break;
        case ShadowDirection_rightTop:{
            [path moveToPoint:CGPointMake(offsetX, -offsetY)];//左上角
            [path addLineToPoint:CGPointMake(offsetX, targetShadowview.height - offsetY)];//👇
            [path addLineToPoint:CGPointMake(targetShadowview.width + offsetX, targetShadowview.height - offsetY)];//👉
            [path addLineToPoint:CGPointMake(targetShadowview.width + offsetX, -offsetY)];//👆
        }break;
        case ShadowDirection_rightDown:{
            [path moveToPoint:CGPointMake(offsetX, offsetY)];//左上角
            [path addLineToPoint:CGPointMake(offsetX, targetShadowview.height + offsetY)];//👇
            [path addLineToPoint:CGPointMake(targetShadowview.width + offsetX, targetShadowview.height + offsetY)];//👉
            [path addLineToPoint:CGPointMake(targetShadowview.width + offsetX, offsetY)];//👆
        }break;
        case ShadowDirection_All:{
            [path moveToPoint:CGPointMake(-offsetX, -offsetY)];//左上角
            [path addLineToPoint:CGPointMake(-offsetX, targetShadowview.height + offsetY)];//👇
            [path addLineToPoint:CGPointMake(targetShadowview.width + offsetX, targetShadowview.height + offsetY)];//👉
            [path addLineToPoint:CGPointMake(targetShadowview.width + offsetX, -offsetY)];//👆
        }break;
            
        default:
            break;
    }targetShadowview.layer.shadowPath = path.CGPath;
}
/// 设置控件是否可见，对影响可视化的hidden 和 alpha属性进行操作
/// 需要特别注意的是：这个地方的jobsVisible不能属性化，否则在某些情况下会出现异常（只会走子类方法不会走分类方法）
JobsKey(_jobsVisible)
-(BOOL)jobsVisible{
    BOOL JobsVisible = [Jobs_getAssociatedObject(_jobsVisible) boolValue];
    return JobsVisible;
}

-(void)setJobsVisible:(BOOL)jobsVisible{
    self.hidden = !jobsVisible;
    self.alpha = jobsVisible;
    Jobs_setAssociatedRETAIN_NONATOMIC(_jobsVisible, @(jobsVisible))
}

@end
