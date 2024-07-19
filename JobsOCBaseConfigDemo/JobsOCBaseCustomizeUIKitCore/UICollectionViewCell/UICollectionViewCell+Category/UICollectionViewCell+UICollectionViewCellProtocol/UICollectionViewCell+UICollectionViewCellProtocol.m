//
//  UICollectionViewCell+UICollectionViewCellProtocol.m
//  DouDong-II
//
//  Created by Jobs on 2021/3/11.
//

#import "UICollectionViewCell+UICollectionViewCellProtocol.h"

@implementation UICollectionViewCell (UICollectionViewCellProtocol)
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    id cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier(self.class)
                                                        forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerClass:self.class
           forCellWithReuseIdentifier:reuseIdentifier(self.class)];
        [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier(self.class)
                                                  forIndexPath:indexPath];
    }return cell;
}
/// 获取这个UICollectionViewCell所承载的UICollectionView
-(UICollectionView *)jobsGetCurrentCollectionView{
    return (UICollectionView *)self.superview;
}
/// 获取当前的UICollectionViewCell对应的indexPath
-(NSIndexPath *)jobsGetCurrentIndexPath{
    return [(UICollectionView *)self.jobsGetCurrentCollectionView indexPathForCell:self];
}
/// 获取当前的UICollectionViewCell对应的section个数
-(NSInteger)jobsGetCurrentNumberOfSections{
    return [self.jobsGetCurrentCollectionView numberOfSections];
}
/// 获取当前的UICollectionViewCell对应的section的的item个数
-(NSInteger)jobsGetCurrentNumberOfItemsInSection{
    return [self.jobsGetCurrentCollectionView numberOfItemsInSection:self.jobsGetCurrentIndexPath.section];
}
/// 对UICollectionView上的每一组的第一个和最后一个UICollectionViewCell进行圆切角
/// 要求切第一个UICollectionViewCell的左上+右上，最后一个UICollectionViewCell的左下和右下
/// 作用域 ：UICollectionViewCell子类的 - (void)drawRect:(CGRect)rect
/// - Parameters:
///   - cellBgCor: UICollectionViewCell 的背景色
///   - cellOutLineCor: UICollectionViewCell 外线的颜色
///   - bottomLineCor: UICollectionViewCell 下线的颜色
///   - borderWidth: 切线宽
///   - cornerRadiusSize: 切线圆角度数
///   - dx: 内有介绍
///   - dy: 内有介绍
-(void)cutFirstAndLastCollectionViewCellWithBackgroundCor:(UIColor *_Nullable)cellBgCor
                                           cellOutLineCor:(UIColor *_Nullable)cellOutLineCor
                                            bottomLineCor:(UIColor *_Nullable)bottomLineCor
                                              borderWidth:(CGFloat)borderWidth
                                         cornerRadiusSize:(CGSize)cornerRadiusSize
                                                       dx:(CGFloat)dx
                                                       dy:(CGFloat)dy{
    if(!cellBgCor) cellBgCor = JobsGreenColor;
    if(!borderWidth) borderWidth = 1.0f;
    if (!bottomLineCor) bottomLineCor = JobsWhiteColor;
    CGRect bounds = [self dx:dx dy:dy];
    
    NSIndexPath *indexPath = self.jobsGetCurrentIndexPath;
//    NSInteger numberOfSections = self.jobsGetCurrentNumberOfSections;
    NSInteger numberOfItemsInSection = self.jobsGetCurrentNumberOfItemsInSection;

    {
        // 绘制曲线
        UIBezierPath *bezierPath = nil;
        {
            if(numberOfItemsInSection <= 1){/// 一个section里面只有一个item = 四个角都为圆角
                bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                   byRoundingCorners:UIRectCornerAllCorners
                                                         cornerRadii:cornerRadiusSize];
            }else{/// 一个section里面有多个item
                if(indexPath.row == 0){/// 首行 = 左上、右上角为圆角
                    bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                       byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                                             cornerRadii:cornerRadiusSize];
                }else if (indexPath.row == numberOfItemsInSection - 1){/// 末行 = 左下、右下角为圆角
                    bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                       byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight)
                                                             cornerRadii:cornerRadiusSize];
                }else{/// 中间的都为矩形
                    bezierPath = [UIBezierPath bezierPathWithRect:bounds];
                }
            }
        }
        
        {
            CAShapeLayer *layer1 = CAShapeLayer.layer;/// 新建一个图层
            layer1.borderWidth = borderWidth;/// 线宽
            layer1.path = bezierPath.CGPath;/// 图层边框路径
            layer1.fillColor = cellBgCor.CGColor;/// 图层填充色,也就是cell的底色
            layer1.strokeColor = cellOutLineCor.CGColor;/// 图层边框线条颜色
            [self.layer insertSublayer:layer1 atIndex:0];/// 将图层添加到cell的图层中,并插到最底层
        }
        /// 除了最后一行以外，所有的cell的最下面的线为bottomLineCor
        [self makeBottomLineWithIndexPath:indexPath
                                   bounds:bounds
                   numberOfItemsInSection:numberOfItemsInSection
                              borderWidth:borderWidth
                            bottomLineCor:bottomLineCor];
        /// 除了第一行以外，所有的cell的最上面的线为bottomLineCor
        [self makeTopLineWithIndexPath:indexPath
                                bounds:bounds
                numberOfItemsInSection:numberOfItemsInSection
                           borderWidth:borderWidth
                         bottomLineCor:bottomLineCor];
    }
}
/// 除了最后一行以外，所有的cell的最下面的线为bottomLineCor
/// - Parameters:
///   - indexPath: indexPath
///   - bounds: bounds
///   - numberOfItemsInSection: 当前的UICollectionViewCell对应的section的的item个数
///   - borderWidth: 线宽
///   - bottomLineCor: cell 底部线条颜色
-(void)makeBottomLineWithIndexPath:(NSIndexPath *)indexPath
                            bounds:(CGRect)bounds
            numberOfItemsInSection:(NSInteger)numberOfItemsInSection
                       borderWidth:(CGFloat)borderWidth
                     bottomLineCor:(UIColor *_Nullable)bottomLineCor{
    if (indexPath.row != numberOfItemsInSection - 1) {
        UIBezierPath *linePath = UIBezierPath.bezierPath;
        /// 起点
        [linePath moveToPoint:CGPointMake(bounds.origin.x, bounds.size.height)];
        /// 其他点
        [linePath addLineToPoint:CGPointMake(bounds.origin.x + bounds.size.width, bounds.size.height)];
        /// 新建一个图层
        CAShapeLayer *layer2 = CAShapeLayer.layer;
        layer2.borderWidth = borderWidth;
        layer2.path = linePath.CGPath;
        layer2.strokeColor = bottomLineCor.CGColor;
        /// 将图层添加到cell的图层中,并插到最底层
        [self.layer insertSublayer:layer2 atIndex:1];
    }
}
/// 除了第一行以外，所有的cell的最上面的线为bottomLineCor
/// - Parameters:
///   - indexPath: indexPath
///   - bounds: bounds
///   - numberOfItemsInSection: 当前的UICollectionViewCell对应的section的的item个数
///   - borderWidth: 线宽
///   - bottomLineCor: cell 底部线条颜色
-(void)makeTopLineWithIndexPath:(NSIndexPath *)indexPath
                         bounds:(CGRect)bounds
         numberOfItemsInSection:(NSInteger)numberOfItemsInSection
                    borderWidth:(CGFloat)borderWidth
                  bottomLineCor:(UIColor *_Nullable)bottomLineCor{
    if(indexPath.row){
        UIBezierPath *linePath = UIBezierPath.bezierPath;
        /// 起点
        [linePath moveToPoint:CGPointMake(bounds.origin.x, 0)];
        /// 其他点
        [linePath addLineToPoint:CGPointMake(bounds.origin.x + bounds.size.width,0)];
        /// 新建一个图层
        CAShapeLayer *layer3 = CAShapeLayer.layer;
        layer3.borderWidth = borderWidth;
        layer3.path = linePath.CGPath;
        layer3.strokeColor = bottomLineCor.CGColor;
        /// 将图层添加到cell的图层中,并插到最底层
        [self.layer insertSublayer:layer3 atIndex:1];
    }
}
/// 利用UIBezierPath，对 UICollectionViewCell 描边 + 切角
/// 作用域 ：UICollectionViewCell子类的 - (void)drawRect:(CGRect)rect
/// - Parameters:
///   - borderSideType: 描边方位
///   - cellBackgroundCor: UICollectionViewCell 的背景色
///   - borderColor: 描边颜色
///   - borderWidth: 描边线宽
///   - cornerRadiusSize: 切角弧度
///   - roundingCorners: 切角方位
-(void)outlineByBezierPath:(UIBorderSideType)borderSideType
         cellBackgroundCor:(UIColor *_Nullable)cellBackgroundCor
               borderColor:(UIColor *_Nullable)borderColor
               borderWidth:(CGFloat)borderWidth
          cornerRadiusSize:(CGSize)cornerRadiusSize
           roundingCorners:(UIRectCorner)roundingCorners{
    if(!borderColor) borderColor = JobsRedColor;
    if(!cellBackgroundCor) cellBackgroundCor = JobsGreenColor;
    if(!borderWidth) borderWidth = 1.0f;
     // 创建一个贝塞尔曲线
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                               byRoundingCorners:roundingCorners
                                                     cornerRadii:cornerRadiusSize];
    // 设置填充颜色为背景颜色，以保留原始背景
    [cellBackgroundCor setFill];
    [path fill];
     
    // 设置边框的属性
    [borderColor setStroke];// 设置边框颜色
    path.lineWidth = borderWidth; // 设置边框宽度
     
    // 添加路径到上下文中并绘制
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path.CGPath);
    CGContextDrawPath(context, kCGPathStroke);
}
/// 利用CALayer，对 UICollectionViewCell 只描边、不切角
/// 作用域 ：UICollectionViewCell子类的 - (void)drawRect:(CGRect)rect
/// - Parameters:
///   - borderSideType: 描边方位
///   - borderColor: 描边颜色
///   - borderWidth: 描边线宽
-(void)outlineByLayer:(UIBorderSideType)borderSideType
          borderColor:(UIColor *_Nullable)borderColor
          borderWidth:(CGFloat)borderWidth{
    
    if(!borderColor) borderColor = JobsRedColor;
    if(!borderWidth) borderWidth = 1.0f;
    
    CALayer *topBorder = nil;
    CALayer *bottomBorder = nil;
    CALayer *leftBorder = nil;
    CALayer *rightBorder = nil;
    
    if(borderSideType & UIBorderSideTypeTop || borderSideType & UIBorderSideTypeAll){
        topBorder = CALayer.layer;
        topBorder.borderColor = borderColor.CGColor; // 选择你想要的颜色
        topBorder.borderWidth = borderWidth;// 选择边框的宽度
        // 设置边框的位置和大小
        topBorder.frame = CGRectMake(0,
                                     0,
                                     self.contentView.frame.size.width,
                                     borderWidth);
    }
    
    if(borderSideType & UIBorderSideTypeBottom || borderSideType & UIBorderSideTypeAll){
        bottomBorder = CALayer.layer;
        bottomBorder.borderColor = borderColor.CGColor; // 选择你想要的颜色
        bottomBorder.borderWidth = borderWidth;// 选择边框的宽度
        // 设置边框的位置和大小
        bottomBorder.frame = CGRectMake(0,
                                        self.contentView.frame.size.height - borderWidth,
                                        self.contentView.frame.size.width,
                                        borderWidth);
    }
    
    if(borderSideType & UIBorderSideTypeLeft || borderSideType & UIBorderSideTypeAll){
        leftBorder = CALayer.layer;
        leftBorder.borderColor = borderColor.CGColor; // 选择你想要的颜色
        leftBorder.borderWidth = borderWidth;// 选择边框的宽度
        // 设置边框的位置和大小
        leftBorder.frame = CGRectMake(0,
                                      0,
                                      borderWidth,
                                      self.contentView.frame.size.height);
    }
    
    if(borderSideType & UIBorderSideTypeRight || borderSideType & UIBorderSideTypeAll){
        rightBorder = CALayer.layer;
        rightBorder.borderColor = borderColor.CGColor; // 选择你想要的颜色
        rightBorder.borderWidth = borderWidth;// 选择边框的宽度
        // 设置边框的位置和大小
        rightBorder.frame = CGRectMake(self.contentView.frame.size.width - borderWidth,
                                       0,
                                       borderWidth,
                                       self.contentView.frame.size.height);
    }
    
    if(topBorder) [self.contentView.layer addSublayer:topBorder];
    if(bottomBorder) [self.contentView.layer addSublayer:bottomBorder];
    if(leftBorder) [self.contentView.layer addSublayer:leftBorder];
    if(rightBorder) [self.contentView.layer addSublayer:rightBorder];
}
#pragma mark —— 一些私有的功能方法
/// 附加偏移量以后的大小
-(CGRect)dx:(CGFloat)dx dy:(CGFloat)dy{
    /**
     CGRectInset会进行平移和缩放两个操作;CGRectOffset做的只是平移
     CGRectInset(CGRect rect, CGFloat dx, CGFloat dy),
     三个参数:
     rect：待操作的CGRect；
     dx：为正数时，向右平移dx，宽度缩小2dx。为负数时，向左平移dx，宽度增大2dx；
     dy：为正数是，向下平移dy，高度缩小2dy。为负数是，向上平移dy，高度增大2dy。
     */
    return CGRectInset(self.bounds,dx,dy);/// 获取显示区域大小
}

@end
