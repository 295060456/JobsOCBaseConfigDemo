//
//  UITableViewCell+UITableViewCellProtocol.m
//  DouDong-II
//
//  Created by Jobs on 2021/11/19.
//

#import "UITableViewCell+UITableViewCellProtocol.h"

@implementation UITableViewCell (UITableViewCellProtocol)
#pragma mark —— @dynamic UITableViewCellProtocol
UITableViewCellProtocol_dynamic
#pragma mark —— UITableViewCellProtocol
+(instancetype)initTableViewCellWithStyle:(UITableViewCellStyle)style{
    return [self.alloc initWithStyle:style
                     reuseIdentifier:self.class.description];
}

+(instancetype)initTableViewCell:(Class)tableViewCellClass
                       withStyle:(UITableViewCellStyle)style{
    return [tableViewCellClass.alloc initWithStyle:style
                                   reuseIdentifier:tableViewCellClass.class.description];
}
/// 4种UITableViewCell系统样式类型
/// UITableViewCellStyleDefault = 左边：imageView＋textLabel
+(instancetype)cellStyleDefaultWithTableView:(UITableView *)tableView{
    UITableViewCell *cell = (UITableViewCell *)[tableView tableViewCellClass:self.class];
    if (!cell) {
        cell = [self initTableViewCell:self
                             withStyle:UITableViewCellStyleDefault];
        [self settingForTableViewCell:cell];
    }return cell;
}
/// UITableViewCellStyleValue1 = 左边：imageView＋textLabel；右边：detailTextLabel
+(instancetype)cellStyleValue1WithTableView:(UITableView *)tableView{
    UITableViewCell *cell = (UITableViewCell *)[tableView tableViewCellClass:self.class];
    if (!cell) {
        cell = [self initTableViewCell:self
                             withStyle:UITableViewCellStyleValue1];
        [self settingForTableViewCell:cell];
    }return cell;
}
/// UITableViewCellStyleValue2 = 左边：textLabel字体偏小；右边：detailTextLabel。imageView可选（显示在最左边）
+(instancetype)cellStyleValue2WithTableView:(UITableView *)tableView{
    UITableViewCell *cell = (UITableViewCell *)[tableView tableViewCellClass:self.class];
    if (!cell) {
        cell = [self initTableViewCell:self
                             withStyle:UITableViewCellStyleValue2];
        [self settingForTableViewCell:cell];
    }return cell;
}
/// UITableViewCellStyleSubtitle = 左边：textLabel字体偏小；右边：detailTextLabel。imageView可选（显示在最左边）
+(instancetype)cellStyleSubtitleWithTableView:(UITableView *)tableView{
    UITableViewCell *cell = (UITableViewCell *)[tableView tableViewCellClass:self.class];
    if (!cell) {
        cell = [self initTableViewCell:self
                             withStyle:UITableViewCellStyleSubtitle];
        [self settingForTableViewCell:cell];
    }return cell;
}
/// UITableViewCell的一些默认样式设置
+(void)settingForTableViewCell:(UITableViewCell *)tableViewCell{
    tableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    /// 适配iOS 13夜间模式/深色外观(Dark Mode)
    tableViewCell.backgroundColor = [UIColor xy_createWithLightColor:JobsWhiteColor darkColor:JobsWhiteColor];
    tableViewCell.detailTextLabel.textColor = JobsBrownColor;
    tableViewCell.textLabel.textColor = JobsBlackColor;
}
/// 获取这个UITableViewCell所承载的UITableView
-(UITableView *)jobsGetCurrentTableView{
    return (UITableView *)self.superview;
}
/// 获取当前的UITableViewCell对应的indexPath
-(NSIndexPath *)jobsGetCurrentIndexPath{
    return [(UITableView *)self.jobsGetCurrentTableView indexPathForCell:self];
}
/// 获取当前的UITableViewCell对应的section个数
-(NSInteger)jobsGetCurrentNumberOfSections{
    return [self.jobsGetCurrentTableView numberOfSections];
}
/// 获取当前的UITableViewCell对应的section的的row个数
-(NSInteger)jobsGetCurrentNumberOfRowsInSection{
    return [self.jobsGetCurrentTableView numberOfRowsInSection:self.jobsGetCurrentIndexPath.section];
}
#pragma mark —— BaseCellProtocol
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    if ([model isKindOfClass:UIViewModel.class]) {
        self.textLabel.textColor = model.textModel.textCor;
        self.textLabel.font = model.textModel.font;
        self.textLabel.text = model.textModel.text;
        self.imageView.image = model.image;
    }
}

-(void)richElementsInCellWithModel2:(UIViewModel *_Nullable)model{
    if ([model isKindOfClass:UIViewModel.class]) {
        self.textLabel.textColor = model.textCor;
        self.textLabel.font = model.font;
        self.textLabel.text = model.text;
        self.imageView.image = model.image;
    }
}

-(void)setCellBgImage:(UIImage *)bgImage{
    self.backgroundColor = self.contentView.backgroundColor = JobsClearColor;
    self.backgroundImageView.image = bgImage;
}

+(CGFloat)cellHeightWithModel:(id _Nullable)model{
    return JobsWidth(44);
}
#pragma mark —— UITableViewCellProtocol
/// 以section为单位，每个section的第一行和最后一行的cell圆角化处理【cell之间没有分割线】
/// - Parameters:
///   - cellBgCor: UITableViewCell 的背景色
///   - bottomLineCor: UITableViewCell 的底部线颜色
///   - cellOutLineCor: UITableViewCell 的外线颜色
///   - cornerRadiusSize: 切角弧度
///   - borderWidth: 线宽
///   - dx: 内有介绍
///   - dy: 内有介绍
-(void)cutFirstAndLastTableViewCellWithBackgroundCor:(UIColor *_Nullable)cellBgCor
                                       bottomLineCor:(UIColor *_Nullable)bottomLineCor
                                      cellOutLineCor:(UIColor *_Nullable)cellOutLineCor
                                    cornerRadiusSize:(CGSize)cornerRadiusSize
                                         borderWidth:(CGFloat)borderWidth
                                                  dx:(CGFloat)dx
                                                  dy:(CGFloat)dy{
    if (!cellBgCor) cellBgCor = JobsWhiteColor;
    if (!bottomLineCor) bottomLineCor = JobsWhiteColor;
    if (!cellOutLineCor) cellOutLineCor = JobsWhiteColor;
    CGRect bounds = [self dx:dx dy:dy];
    NSInteger numberOfRowsInSection = self.jobsGetCurrentNumberOfRowsInSection;
    NSIndexPath *indexPath = self.jobsGetCurrentIndexPath;
    // 绘制曲线
    UIBezierPath *bezierPath = nil;
    {
        if(numberOfRowsInSection <= 1){/// 一个section里面只有一个row = 四个角都为圆角
            bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                               byRoundingCorners:UIRectCornerAllCorners
                                                     cornerRadii:cornerRadiusSize];
        }else{/// 一个section里面有多个item
            if(indexPath.row == 0){/// 首行 = 左上、右上角为圆角
                bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                   byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                                         cornerRadii:cornerRadiusSize];
            }else if (indexPath.row == numberOfRowsInSection - 1){/// 末行 = 左下、右下角为圆角
                bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                   byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight)
                                                         cornerRadii:cornerRadiusSize];
            }else{/// 中间的都为矩形
                bezierPath = [UIBezierPath bezierPathWithRect:bounds];
            }
        }
    }
    
    {
        // 新建一个图层
        CAShapeLayer *layer = CAShapeLayer.layer;
        // 线宽
        layer.borderWidth = borderWidth;
        // 图层边框路径
        layer.path = bezierPath.CGPath;
        // 图层填充色,也就是cell的底色
        layer.fillColor = cellBgCor.CGColor;
        // 图层边框线条颜色
        /*
         如果self.tableView.style = UITableViewStyleGrouped时,每一组的首尾都会有一根分割线,目前我还没找到去掉每组首尾分割线,保留cell分割线的办法。
         所以这里取巧,用带颜色的图层边框替代分割线。
         这里为了美观,最好设为和tableView的底色一致。
         设为透明,好像不起作用。
         */
        layer.strokeColor = cellOutLineCor.CGColor;
        //将图层添加到cell的图层中,并插到最底层
        [self.layer insertSublayer:layer atIndex:0];
    }
    /// 除了最后一行以外，所有的cell的最下面的线的颜色为bottomLineCor
    [self tableViewMakesLastRowCellAtIndexPath:indexPath
                                        bounds:bounds
                         numberOfRowsInSection:numberOfRowsInSection
                                   borderWidth:borderWidth
                                 bottomLineCor:bottomLineCor];
    /// 除了第一行以外，所有的cell的最上面的线为bottomLineCor
    [self tableViewMakesFirstRowCellAtIndexPath:indexPath
                                         bounds:bounds
                          numberOfRowsInSection:numberOfRowsInSection
                                  bottomLineCor:bottomLineCor
                                    borderWidth:borderWidth];
}
/// 除了最后一行以外，所有的cell的最下面的线的颜色为bottomLineCor
/// - Parameters:
///   - indexPath: indexPath
///   - bounds: bounds
///   - numberOfRowsInSection: 当前的UITableViewCell对应的section的的row个数
///   - borderWidth: 线宽
///   - bottomLineCor: cell 底部线条颜色
-(void)tableViewMakesLastRowCellAtIndexPath:(NSIndexPath *_Nonnull)indexPath
                                     bounds:(CGRect)bounds
                      numberOfRowsInSection:(NSInteger)numberOfRowsInSection
                                borderWidth:(CGFloat)borderWidth
                              bottomLineCor:(UIColor *_Nullable)bottomLineCor{
    if (!indexPath) return;
    if (!bottomLineCor) bottomLineCor = JobsWhiteColor;
    if (indexPath.row != numberOfRowsInSection - 1) {
        UIBezierPath *linePath = UIBezierPath.bezierPath;
        // 起点
        [linePath moveToPoint:CGPointMake(bounds.origin.x, bounds.size.height)];
        // 其他点
        [linePath addLineToPoint:CGPointMake(bounds.origin.x + bounds.size.width, bounds.size.height)];
        // 新建一个图层
        CAShapeLayer *layer = CAShapeLayer.layer;
        layer.borderWidth = borderWidth;
        layer.path = linePath.CGPath;
        layer.strokeColor = bottomLineCor.CGColor;
        //将图层添加到cell的图层中,并插到最底层
        [self.layer insertSublayer:layer atIndex:1];
    }
}
/// 除了第一行以外，所有的cell的最上面的线为bottomLineCor
/// - Parameters:
///   - indexPath: indexPath
///   - bounds: bounds
///   - numberOfRowsInSection: 当前的UITableViewCell对应的section的的row个数
///   - borderWidth: 线宽
///   - bottomLineCor: cell 底部线条颜色
-(void)tableViewMakesFirstRowCellAtIndexPath:(NSIndexPath *_Nonnull)indexPath
                                      bounds:(CGRect)bounds
                       numberOfRowsInSection:(NSInteger)numberOfRowsInSection
                               bottomLineCor:(UIColor *_Nullable)bottomLineCor
                                 borderWidth:(CGFloat)borderWidth{
    if (!indexPath) return;
    if (!bottomLineCor) bottomLineCor = JobsWhiteColor;
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
