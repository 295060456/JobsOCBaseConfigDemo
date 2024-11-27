//
//  UIView+Extras.m
//  MJRefreshExample
//
//  Created by Aalto on 14-5-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "UIView+Extras.h"

@implementation UIView (Extras)
#pragma mark —— BaseViewProtocol
+(JobsReturnViewByIDBlock _Nonnull)JobsRichViewByModel{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        UIView <BaseViewProtocol>*instance = self.class.new;
        if ([instance respondsToSelector:@selector(jobsRichViewByModel)]) {
            instance.jobsRichViewByModel(data);
        }return instance;
    };
}

-(JobsReturnViewByIDBlock _Nonnull)JobsRichViewByModel2{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.jobsRichViewByModel(data);
        return self;
    };
}

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    return ^(id _Nullable data) {};
}

-(jobsByIDBlock _Nonnull)update{
    return ^(id _Nullable data) {};
}
#pragma mark —— 用类方法定义
/// 具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)viewWidthByModel{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)viewHeightByModel{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)heightForFooterInSectionByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(0);
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)heightForHeaderInSection{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeZero;
    };
}
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGRectByIDBlock _Nonnull)viewFrameByModel{
    return ^CGRect(id _Nullable data){
        return CGRectZero;
    };
}
/// 具体由子类进行复写【FrameX的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)viewChangeXByModel{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
/// 具体由子类进行复写【FrameY的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)viewChangeYByModel{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
/// 具体由子类进行复写【FrameWidth的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)viewChangeWidthByModel{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
/// 具体由子类进行复写【FrameHeight的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)viewChangeHeightByModel{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
/// UICollectionViewDelegateFlowLayout
+(JobsReturnCGSizeByIDBlock _Nonnull)collectionReusableViewSizeByModel{
    return ^(id _Nullable data){
        return CGSizeZero;
    };
}
/// 数据（字符串）定宽
+(JobsReturnCGFloatByIDBlock _Nonnull)widthByData{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
/// 数据（字符串）定高
+(JobsReturnCGFloatByIDBlock _Nonnull)heightByData{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
#pragma mark —— 用实例方法定义
/// 具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)viewWidthByModel{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.viewWidthByModel(data);
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)viewHeightByModel{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.viewHeightByModel(data);
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)heightForFooterInSectionByModel{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.heightForFooterInSectionByModel(data);
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)heightForHeaderInSection{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.heightForHeaderInSection(data);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    @jobs_weakify(self)
    return ^CGSize(id _Nullable data){
        @jobs_strongify(self)
        return self.class.viewSizeByModel(data);
    };
}
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGRectByIDBlock _Nonnull)viewFrameByModel{
    @jobs_weakify(self)
    return ^CGRect(id _Nullable data){
        @jobs_strongify(self)
        return self.class.viewFrameByModel(data);
    };
}
/// 具体由子类进行复写【FrameX的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)viewChangeXByModel{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.viewChangeXByModel(data);
    };
}
/// 具体由子类进行复写【FrameY的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)viewChangeYByModel{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.viewChangeYByModel(data);
    };
}
/// 具体由子类进行复写【FrameWidth的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)viewChangeWidthByModel{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.viewChangeWidthByModel(data);
    };
}
/// 具体由子类进行复写【FrameHeight的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)viewChangeHeightByModel{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.viewChangeHeightByModel(data);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
/// UICollectionViewDelegateFlowLayout
-(JobsReturnCGSizeByIDBlock _Nonnull)collectionReusableViewSizeByModel{
    @jobs_weakify(self)
    return ^(id _Nullable data){
        @jobs_strongify(self)
        return self.class.collectionReusableViewSizeByModel(data);
    };
}
/// 数据（字符串）定宽
-(JobsReturnCGFloatByIDBlock _Nonnull)widthByData{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.widthByData(data);
    };
}
/// 数据（字符串）定高
-(JobsReturnCGFloatByIDBlock _Nonnull)heightByData{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.heightByData(data);
    };
}

-(void)actionNavBarBackBtnClickBlock:(jobsByBtnBlock)objectBlock{
    self.backBtnClickAction = objectBlock;
}
    
-(void)actionNavBarCloseBtnClickBlock:(jobsByBtnBlock)objectBlock{
    self.closeBtnClickAction = objectBlock;
}
#pragma mark —— 打印
-(jobsByStringBlock _Nonnull)jobsLogFrame{
    @jobs_weakify(self)
    return ^(NSString *_Nonnull str) {
        @jobs_strongify(self)
        NSLog(@"%@ = %@", str, NSStringFromCGRect(self.frame));
    };
}

-(jobsByStringBlock _Nonnull)jobsLogPoint{
    @jobs_weakify(self)
    return ^(NSString *_Nonnull str) {
        @jobs_strongify(self)
        NSLog(@"%@ = %@", str, NSStringFromCGPoint(self.Origin));
    };
}

-(jobsByStringBlock _Nonnull)jobsLogSize{
    @jobs_weakify(self)
    return ^(NSString *_Nonnull str) {
        @jobs_strongify(self)
        NSLog(@"%@ = %@", str, NSStringFromCGSize(self.sizer));
    };
}
#pragma mark —— 键盘事件
/// 监听键盘事件
-(void)monitorKeyboardAction{
    //    @jobs_weakify(self)
    [self addNotificationName:UIKeyboardWillShowNotification
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        //        @jobs_strongify(self)
        NSNotification *notification = (NSNotification *)arg;
        if([notification.object isKindOfClass:NSNumber.class]){
            NSNumber *b = notification.object;
            NSLog(@"SSS = %d",b.boolValue);
        }
        NSLog(@"通知传递过来的 = %@",notification.object);
    }];
    
    [self addNotificationName:UIKeyboardWillHideNotification
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        //        @jobs_strongify(self)
        NSNotification *notification = (NSNotification *)arg;
        if([notification.object isKindOfClass:NSNumber.class]){
            NSNumber *b = notification.object;
            NSLog(@"SSS = %d",b.boolValue);
        }
        NSLog(@"通知传递过来的 = %@",notification.object);
    }];
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
    [MainWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
/// 获取启动页的截图
-(UIImage *_Nullable)lanuchScreenShot{
    NSString *name = NSBundle.mainBundle.infoDictionary.valueForKey(@"UILaunchStoryboardName");
    if(!name) return nil;
    UIViewController *vc = [self vcByStoryboardWithName:name storyboardBundle:nil];
    if(vc){
        UIView *view = vc.view;
        UIWindow *window = MainWindow;
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
        // CGRect saveFrame = scrollview.frame;
        // CGPoint saveOffset = scrollview.contentOffset;
        /// 置为起点
        scrollview.contentOffset = CGPointZero;
        scrollview.frame = CGRectMake(0,
                                      0,
                                      scrollview.contentSize.width,
                                      scrollview.contentSize.height);

        [scrollview.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    }return nil;
}
/// 截图
-(JobsReturnImageByViewBlock _Nonnull)rendImage{
    @jobs_weakify(self)
    return ^UIImage *_Nonnull(__kindof UIView *_Nonnull data){
        @jobs_strongify(self)
        /// 1、开始位图上下文
        UIGraphicsBeginImageContext(CGSizeMake(self.width,self.height - 80));
        /// 2、获取上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        /// 3、截图
        [self.layer renderInContext:ctx];
        /// 4、获取图片
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        /// 5、关闭上下文
        UIGraphicsEndImageContext() ;
        return newImage;
    };
}
/// 获取某个 范围内的 截图
-(JobsReturnImageByCGRectBlock _Nonnull)innerViewShotAtFrame{
    @jobs_weakify(self)
    return ^UIImage *_Nonnull(CGRect rect){
        @jobs_strongify(self)
        UIGraphicsBeginImageContext(self.frame.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        UIRectClip(rect);
        [self.layer renderInContext:context];
        UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return theImage;
    };
}
#pragma mark —— 描边
JobsKey(_leftBorderLayer)
-(CALayer *)leftBorderLayer{
    CALayer *layer = Jobs_getAssociatedObject(_leftBorderLayer);
    if (!layer) {
        layer = CALayer.layer;// 如果没有找到已存在的 layer，则创建并添加一个
        [self.layer addSublayer:layer];
        // 关联这个 layer 到 UIView 实例
        Jobs_setAssociatedRETAIN_NONATOMIC(_leftBorderLayer, layer);
    }return layer;
}
JobsKey(_rightBorderLayer)
-(CALayer *)rightBorderLayer{
    CALayer *layer = Jobs_getAssociatedObject(_rightBorderLayer);
    if (!layer) {
        layer = CALayer.layer;// 如果没有找到已存在的 layer，则创建并添加一个
        [self.layer addSublayer:layer];
        // 关联这个 layer 到 UIView 实例
        Jobs_setAssociatedRETAIN_NONATOMIC(_rightBorderLayer, layer);
    }return layer;
}
JobsKey(_topBorderLayer)
-(CALayer *)topBorderLayer{
    CALayer *layer = Jobs_getAssociatedObject(_topBorderLayer);
    if (!layer) {
        layer = CALayer.layer;// 如果没有找到已存在的 layer，则创建并添加一个
        [self.layer addSublayer:layer];
        // 关联这个 layer 到 UIView 实例
        Jobs_setAssociatedRETAIN_NONATOMIC(_topBorderLayer, layer);
    }return layer;
}
JobsKey(_bottomBorderLayer)
-(CALayer *)bottomBorderLayer{
    CALayer *layer = Jobs_getAssociatedObject(_bottomBorderLayer);
    if (!layer) {
        layer = CALayer.layer;// 如果没有找到已存在的 layer，则创建并添加一个
        [self.layer addSublayer:layer];
        // 关联这个 layer 到 UIView 实例
        Jobs_setAssociatedRETAIN_NONATOMIC(_bottomBorderLayer, layer);
    }return layer;
}
/// 调用方式：view.leftBorderColor(color).leftBorderWidth(borderType);
-(JobsReturnViewByCorBlock _Nonnull)leftBorderColor{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        CALayer *layer = self.leftBorderLayer;
        layer.backgroundColor = color.CGColor;
        return self;
    };
}
/// 调用方式：view.rightBorderColor(color).rightBorderWidth(borderType);
-(JobsReturnViewByCorBlock _Nonnull)rightBorderColor{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        CALayer *layer = self.rightBorderLayer;
        layer.backgroundColor = color.CGColor;
        return self;
    };
}
/// 调用方式：view.topBorderColor(color).topBorderWidth(borderType);
-(JobsReturnViewByCorBlock _Nonnull)topBorderColor{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        CALayer *layer = self.topBorderLayer;
        layer.backgroundColor = color.CGColor;
        return self;
    };
}
/// 调用方式：view.bottomBorderColor(color).bottomBorderWidth(borderType);
-(JobsReturnViewByCorBlock _Nonnull)bottomBorderColor{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        CALayer *layer = self.bottomBorderLayer;
        layer.backgroundColor = color.CGColor;
        return self;
    };
}
/// 调用方式：view.leftBorderColor(color).leftBorderWidth(borderType);
-(JobsReturnViewByFloatBlock _Nonnull)leftBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat borderWidth){
        @jobs_strongify(self)
        CALayer *layer = self.leftBorderLayer;
        layer.frame = CGRectMake(0,
                                 0,
                                 borderWidth,
                                 self.frame.size.height);
        return self;
    };
}
/// 调用方式：view.rightBorderColor(color).rightBorderWidth(borderType);
-(JobsReturnViewByFloatBlock _Nonnull)rightBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat borderWidth){
        @jobs_strongify(self)
        CALayer *layer = self.leftBorderLayer;
        layer.frame = CGRectMake(self.frame.size.width - borderWidth,
                                 0,
                                 borderWidth,
                                 self.frame.size.height);
        return self;
    };
}
/// 调用方式：view.topBorderColor(color).topBorderWidth(borderType);
-(JobsReturnViewByFloatBlock _Nonnull)topBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat borderWidth){
        @jobs_strongify(self)
        CALayer *layer = self.leftBorderLayer;
        layer.frame = CGRectMake(0,
                                 0,
                                 self.frame.size.width,
                                 borderWidth);
        return self;
    };
}
/// 调用方式：view.bottomBorderColor(color).bottomBorderWidth(borderType);
-(JobsReturnViewByFloatBlock _Nonnull)bottomBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat borderWidth){
        @jobs_strongify(self)
        CALayer *layer = self.leftBorderLayer;
        layer.frame = CGRectMake(0,
                                 self.frame.size.height - borderWidth,
                                 self.frame.size.width,
                                 borderWidth);
        return self;
    };
}
/// 描边：统一设置Layer的线宽+颜色+圆切角（一定切角）
-(JobsReturnViewByLocationModelBlock _Nonnull)setLayerBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof JobsLocationModel *_Nullable data){
        @jobs_strongify(self)
        data.masksToBounds = YES;
        self.layerBy(data);
        return self;
    };
}
/// 描边：统一设置Layer的线宽+颜色+圆切角（不一定切角）
-(JobsReturnViewByLocationModelBlock _Nonnull)layerBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof JobsLocationModel *_Nullable data){
        @jobs_strongify(self)
        self.layer.borderColor = data.layerCor.CGColor;
        self.layer.borderWidth = data.jobsWidth;
        self.layer.cornerRadius = data.cornerRadius;
        self.layer.masksToBounds = data.masksToBounds;
        return self;
    };
}
/// 指定描边 【在使用这个方法的一个前提是被描边的view刷新后存在frame】
/// @param color 作用颜色
/// @param borderWidth 线宽
/// @param borderType 作用方向
-(void)setBorderWithColor:(UIColor *_Nullable)color
              borderWidth:(CGFloat)borderWidth
               borderType:(UIBorderSideType)borderType{
    [self.superview layoutIfNeeded];
    /// 左
    if (borderType & UIBorderSideTypeLeft) self.leftBorderColor(color).leftBorderWidth(borderType);
    /// 右
    if (borderType & UIBorderSideTypeRight) self.rightBorderColor(color).rightBorderWidth(borderType);
    /// 上
    if (borderType & UIBorderSideTypeTop) self.topBorderColor(color).topBorderWidth(borderType);
    /// 下
    if (borderType & UIBorderSideTypeBottom) self.bottomBorderColor(color).bottomBorderWidth(borderType);
}
/// 调用方式：view.layerByBorderCor(JobsCor(@"#FFD8D8")).layerByBorderWidth(1);
-(JobsReturnViewByCorBlock _Nonnull)layerByBorderCor{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIColor *_Nullable layerBorderCor) {
        @jobs_strongify(self)
        self.layer.borderColor = layerBorderCor.CGColor;
        return self;
    };
}
/// 调用方式：view.layerByBorderCor(JobsCor(@"#FFD8D8")).layerByBorderWidth(1);
-(JobsReturnViewByFloatBlock _Nonnull)layerByBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat borderWidth) {
        @jobs_strongify(self)
        self.layer.borderWidth = borderWidth;
        return self;
    };
}
#pragma mark —— 切角
/// 切整个View的4个角为统一的切角参数
-(JobsReturnViewByFloatBlock _Nonnull)cornerCutToCircleWithCornerRadius{
    @jobs_weakify(self)
    return ^(CGFloat cornerRadiusValue) {
        @jobs_strongify(self)
        self.layer.cornerRadius = cornerRadiusValue;
        self.layer.masksToBounds = YES;
        return self;
    };
}
/// 调用方式：view.appointCorners(UIRectCornerTopLeft | UIRectCornerBottomRight).cornerRadii(CGSizeMake(10, 10));
JobsKey(_appointCorners)
- (JobsReturnViewByNSUIntegerBlock _Nonnull)appointCorners {
    @jobs_weakify(self)
    return ^UIView * (UIRectCorner corners) {
        @jobs_strongify(self)
        Jobs_setAssociatedRETAIN_NONATOMIC(_appointCorners, @(corners));
        return self;
    };
}
/// 调用方式：view.appointCorners(UIRectCornerTopLeft | UIRectCornerBottomRight).cornerRadii(CGSizeMake(10, 10));
JobsKey(_cornerRadii)
- (JobsReturnViewBySizeBlock _Nonnull)cornerRadii {
    @jobs_weakify(self)
    return ^UIView * (CGSize cornerRadii) {
        @jobs_strongify(self)
        Jobs_setAssociatedRETAIN_NONATOMIC(_cornerRadii,[NSValue valueWithCGSize:cornerRadii])
        UIRectCorner corners = [Jobs_getAssociatedObject(_appointCorners) unsignedIntegerValue];
        // 如果 cornerRadii 是 CGSizeZero，自动计算
        if (CGSizeEqualToSize(cornerRadii, CGSizeZero)) {
            cornerRadii = CGSizeMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        }
        // 创建 UIBezierPath 遮罩路径
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                       byRoundingCorners:corners
                                                             cornerRadii:cornerRadii];
        // 创建 CAShapeLayer 并设置 path
        CAShapeLayer *maskLayer = CAShapeLayer.layer;
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.CGPath;
         
        self.layer.mask = maskLayer;
        return self;
    };
}
/// 指定圆切角
/// ⚠️这种写法存在一定的弊端：如果在某个View上添加子View，并对这个View使用如下方法的圆切角，则这个View上的子视图不可见⚠️
-(void)appointCornerCutToCircleByRoundingCorners:(UIRectCorner)corners
                                     cornerRadii:(CGSize)cornerRadii{
    // 设置切哪个直角
    //    UIRectCornerTopLeft     = 1 << 0,  左上角
    //    UIRectCornerTopRight    = 1 << 1,  右上角
    //    UIRectCornerBottomLeft  = 1 << 2,  左下角
    //    UIRectCornerBottomRight = 1 << 3,  右下角
    //    UIRectCornerAllCorners  = ~0UL     全部角
    /// 得到view的遮罩路径
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:cornerRadii];
    self.layer.mask = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable data) {
        data.frame = self.bounds;
        data.path = maskPath.CGPath;
    });
}
#pragma mark —— @implementation UILabel (AutoScroll)
/// 根据文字长短自动判断是否需要显示TextLayer，并且滚动
-(void)setTextLayerScroll{
    CATextLayer * textLayer = self.getTextLayer;
    if (self.shouldAutoScroll){
        CABasicAnimation *ani = self.getAnimation;
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
JobsKey(_getTextLayer)
-(CATextLayer *_Nonnull)getTextLayer{
    CATextLayer *layer = Jobs_getAssociatedObject(_getTextLayer);
    if (!layer) {
        layer = CATextLayer.layer;
        Jobs_setAssociatedRETAIN_NONATOMIC(_getTextLayer, layer);
    }

    if ([self isKindOfClass:UILabel.class]) {
        UILabel *label = (UILabel *)self;
        CGSize size = [label.text sizeWithAttributes:jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
            [data setValue:label.font forKey:NSFontAttributeName];
        })];
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
        CGSize size = [button.titleForNormalState sizeWithAttributes:jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
            [data setValue:button.titleLabel.font forKey:NSFontAttributeName];
        })];
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
JobsKey(_getAnimation)
-(CABasicAnimation *_Nonnull)getAnimation{
    CABasicAnimation *ani = Jobs_getAssociatedObject(_getAnimation);
    if (!ani) {
        ani = [CABasicAnimation animationWithKeyPath:@"position.x"];
        Jobs_setAssociatedRETAIN_NONATOMIC(_getAnimation, ani);
    }
    CATextLayer * textLayer = self.getTextLayer;
    CGPoint point = textLayer.position;
    CGFloat lenth = textLayer.frame.size.width - self.frame.size.width;
    /// 起点位置
    CGPoint pointSrc = CGPointMake(point.x + 20, point.y);
    /// 终点位置
    CGPoint pointDes = CGPointMake(pointSrc.x - lenth - 30, pointSrc.y);
    id toValue = [NSValue valueWithCGPoint:pointDes];
    id fromValue = [NSValue valueWithCGPoint:pointSrc];
    ani.toValue = toValue;
    ani.fromValue = fromValue;
    ani.duration = 2;
    ani.fillMode = kCAFillModeBoth;
    ani.repeatCount = HUGE_VALF;
    /// 结束后逆向执行动画
    ani.autoreverses = YES;
    ani.removedOnCompletion = false;
    return ani;
}
/// 判断是否需要滚动
-(BOOL)shouldAutoScroll{
    BOOL shouldScroll = NO;
    if ([self isKindOfClass:UILabel.class]) {
        UILabel *label = (UILabel *)self;
        if (label.numberOfLines == 1) {
            CGSize size = [label.text sizeWithAttributes:jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
                [data setValue:label.font forKey:NSFontAttributeName];
            })];
            CGFloat stringWidth = size.width;
            CGFloat labelWidth = self.frame.size.width;
            if (labelWidth < stringWidth) {
                shouldScroll = YES;
            }
        }
    }else if ([self isKindOfClass:UIButton.class]){
        UIButton *button = (UIButton *)self;
        if (button.titleLabel.numberOfLines == 1) {
            CGSize size = [button.titleForNormalState sizeWithAttributes:jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
                [data setValue:button.titleLabel.font forKey:NSFontAttributeName];
            })];
            CGFloat stringWidth = size.width;
            CGFloat labelWidth = self.frame.size.width;
            if (labelWidth < stringWidth) shouldScroll = YES;
        }
    }else{}

    Class ModelClass = NSClassFromString(@"_UIAlertControllerActionView");
    if ([self.superview.superview isKindOfClass:ModelClass]) {
        shouldScroll = false;
    }return shouldScroll;
}
#pragma mark —— 其他
-(JobsReturnViewByGestureRecognizer _Nonnull)addGesture{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIGestureRecognizer *_Nonnull gesture) {
        @jobs_strongify(self)
        [self addGestureRecognizer:gesture];
        return self;
    };
}

-(JobsReturnBarButtonItemByVoidBlock _Nonnull)barButtonItem{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(){
        @jobs_strongify(self)
        return UIBarButtonItem.initBy(self);
    };
}

-(JobsReturnViewByViewBlock _Nonnull)addSubview{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView) {
        @jobs_strongify(self)
        [self addSubview:subView];
        if(subView.masonryBlock){
            [subView mas_makeConstraints:subView.masonryBlock];
            self.refresh();
        }return subView;
    };
}

-(JobsReturnViewByViewBlock _Nonnull)sendSubviewToBack{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView) {
        @jobs_strongify(self)
        [self sendSubviewToBack:subView];
        return subView;
    };
}

-(JobsReturnViewByVoidBlock _Nonnull)remove{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable() {
        @jobs_strongify(self)
        [self removeFromSuperview];
        return self;
    };
}
/// 针对数据源是UIImage  *的GKPhotoBrowser
-(void)viewTapGRSavePicsWithImageDataMutArr:(NSMutableArray <UIImage *>*_Nonnull)imageDataMutArr
                                atIndexPath:(NSIndexPath *_Nonnull)indexPath
                                   byTarget:(id _Nonnull)target{
    self.viewTapGRSavePicsBaseConfigByTarget(target);
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
-(void)viewTapGRSavePicsWithImageUrlMutArr:(NSMutableArray <NSURL *>*_Nonnull)imageUrlMutArr
                               atIndexPath:(NSIndexPath *_Nonnull)indexPath
                                  byTarget:(id _Nonnull)target{
    self.viewTapGRSavePicsBaseConfigByTarget(target);
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
-(void)viewTapGRSavePicsWithImageUrlStrMutArr:(NSMutableArray <NSString *>*_Nonnull)imageUrlStrMutArr
                                  atIndexPath:(NSIndexPath *_Nonnull)indexPath
                                     byTarget:(id _Nonnull)target{
    self.viewTapGRSavePicsBaseConfigByTarget(target);
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
-(jobsByIDBlock _Nonnull)viewTapGRSavePicsBaseConfigByTarget{
    @jobs_weakify(self)
    return ^(id _Nullable target){
        @jobs_strongify(self)
        self.numberOfTouchesRequired = 1;
        self.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
        self.minimumPressDuration = 0.1;
        self.numberOfTouchesRequired = 1;
        self.allowableMovement = 1;
        self.userInteractionEnabled = YES;
        self.target = target;
    };
}
/// popView取消按钮常规处理方法
-(jobsByIDBlock _Nonnull)cancelBtnActionForPopView{
    @jobs_weakify(self)
    return ^(id _Nullable object){
        @jobs_strongify(self)
        [self tf_hide:nil];
        [self.class destroySingleton];
        if(self.objectBlock) self.objectBlock(object);
    };
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

-(UIImage *_Nullable)getImage {
    /// 检查视图的大小是否为有效值
    CGSize size = self.bounds.size;
    /// 如果 size 是 {0, 0}，直接返回 nil
    if (CGSizeEqualToSize(size, CGSizeZero)) return nil;
    /// 使用 UIGraphicsImageRenderer 创建图像
    UIGraphicsImageRenderer *renderer = [UIGraphicsImageRenderer.alloc initWithSize:size];
    @jobs_weakify(self )
    UIImage *image = [renderer imageWithActions:^(UIGraphicsImageRendererContext * _Nonnull context) {
        @jobs_strongify(self)
        [self.layer renderInContext:context.CGContext];
    }];return image;
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
+(void)makeTargetShadowview:(__kindof UIView *__nonnull)targetShadowview
                  superView:(__kindof UIView *__nullable)superview
            shadowDirection:(ShadowDirection)ShadowDirection
          shadowWithOffsetX:(CGFloat)offsetX
                    offsetY:(CGFloat)offsetY
               cornerRadius:(CGFloat)cornerRadius
               shadowOffset:(CGSize)shadowOffset
              shadowOpacity:(CGFloat)shadowOpacity
           layerShadowColor:(UIColor *__nullable)layerShadowColor
          layerShadowRadius:(CGFloat)layerShadowRadius{
    
    targetShadowview.layer.cornerRadius = cornerRadius;/// 圆切角
    
    if (superview && CGRectEqualToRect(targetShadowview.frame,CGRectZero)) {
        /// targetShadowview当在某些masonry约束的时候，没有frame,需要进行刷新得到frame，否则不会出现阴影效果
        superview.refresh();
    }
    
    targetShadowview.layer.shadowOpacity = (shadowOpacity != 0) ? : 0.7f;//shadowOpacity设置了阴影的不透明度,取值范围在0~1;
    targetShadowview.layer.shadowOffset = shadowOffset;//阴影偏移量
    targetShadowview.layer.shadowColor = (layerShadowColor ? :JobsDarkGrayColor).CGColor;//阴影颜色   JobsLightGrayColor.CGColor;
    targetShadowview.layer.shadowRadius = (layerShadowRadius != 0) ? : 8.0f;//模糊计算的半径
    
    UIBezierPath *path = UIBezierPath.bezierPath;

    /// 偏移量保持为正数，便于后续计算
    offsetX = offsetX >= 0 ? offsetX : -offsetX;
    offsetY = offsetY >= 0 ? offsetY : -offsetY;
    /// 偏移量默认值
    offsetX = offsetX != 0 ? :20;
    offsetY = offsetY != 0 ? :20;

    switch (ShadowDirection) {
        case ShadowDirection_top:{
            path.moveTo(CGPointMake(0, -offsetY));/// 左上角为绘制的贝塞尔曲线原点
            path.add(CGPointMake(0, targetShadowview.height));/// 👇
            path.add(CGPointMake(targetShadowview.width, targetShadowview.height));/// 👉
            path.add(CGPointMake(targetShadowview.width, -offsetY));///👆
        }break;
        case ShadowDirection_down:{
            path.moveTo(CGPointZero);/// 左上角为绘制的贝塞尔曲线原点
            path.add(CGPointMake(0, targetShadowview.height + offsetY));/// 👇
            path.add(CGPointMake(targetShadowview.width, targetShadowview.height + offsetY));/// 👉
            path.add(CGPointMake(targetShadowview.width, 0));///👆
        }break;
        case ShadowDirection_left:{
            path.moveTo(CGPointMake(offsetX, 0));/// 左上角
            path.add(CGPointMake(offsetX, targetShadowview.height));///👇
            path.add(CGPointMake(targetShadowview.width, targetShadowview.height));/// 👉
            path.add(CGPointMake(targetShadowview.width, 0));/// 👆
        }break;
        case ShadowDirection_right:{
            path.moveTo(CGPointZero);/// 左上角
            path.add(CGPointMake(0, targetShadowview.height));/// 👇
            path.add(CGPointMake(targetShadowview.width + offsetX, targetShadowview.height));/// 👉
            path.add(CGPointMake(targetShadowview.width + offsetX, 0));/// 👆
        }break;
        case ShadowDirection_leftTop:{
            path.moveTo(CGPointMake(-offsetX, -offsetY));/// 左上角
            path.add(CGPointMake(-offsetX, targetShadowview.height - offsetY));/// 👇
            path.add(CGPointMake(targetShadowview.width - offsetX, targetShadowview.height - offsetY));/// 👉
            path.add(CGPointMake(targetShadowview.width - offsetX, -offsetY));/// 👆
        }break;
        case ShadowDirection_leftDown:{
            path.moveTo(CGPointMake(-offsetX, offsetY));/// 左上角
            path.add(CGPointMake(-offsetX, targetShadowview.height + offsetY));/// 👇
            path.add(CGPointMake(targetShadowview.width - offsetX, targetShadowview.height + offsetX));/// 👉
            path.add(CGPointMake(targetShadowview.width - offsetX, offsetY));/// 👆
        }break;
        case ShadowDirection_rightTop:{
            path.moveTo(CGPointMake(offsetX, -offsetY));/// 左上角
            path.add(CGPointMake(offsetX, targetShadowview.height - offsetY));/// 👇
            path.add(CGPointMake(targetShadowview.width + offsetX, targetShadowview.height - offsetY));/// 👉
            path.add(CGPointMake(targetShadowview.width + offsetX, -offsetY));/// 👆
        }break;
        case ShadowDirection_rightDown:{
            path.moveTo(CGPointMake(offsetX, offsetY));/// 左上角
            path.add(CGPointMake(offsetX, targetShadowview.height + offsetY));/// 👇
            path.add(CGPointMake(targetShadowview.width + offsetX, targetShadowview.height + offsetY));/// 👉
            path.add(CGPointMake(targetShadowview.width + offsetX, offsetY));/// 👆
        }break;
        case ShadowDirection_All:{
            path.moveTo(CGPointMake(-offsetX, -offsetY));/// 左上角
            path.add(CGPointMake(-offsetX, targetShadowview.height + offsetY));/// 👇
            path.add(CGPointMake(targetShadowview.width + offsetX, targetShadowview.height + offsetY));/// 👉
            path.add(CGPointMake(targetShadowview.width + offsetX, -offsetY));/// 👆
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
