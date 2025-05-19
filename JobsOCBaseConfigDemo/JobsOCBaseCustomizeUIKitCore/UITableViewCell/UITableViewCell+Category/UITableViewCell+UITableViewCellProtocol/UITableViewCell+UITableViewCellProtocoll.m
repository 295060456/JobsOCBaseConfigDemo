//
//  UITableViewCell+UITableViewCellProtocol.m
//  DouDong-II
//
//  Created by Jobs on 2021/11/19.
//

#import "UITableViewCell+UITableViewCellProtocol.h"

@implementation UITableViewCell (UITableViewCellProtocol)
#pragma mark —— UITableViewCellProtocol
UITableViewCellProtocol_dynamic
+(JobsReturnTableViewCellByTableViewCellStyleBlock _Nonnull)initTableViewCellWithStyle{
    @jobs_weakify(self)
    return ^(UITableViewCellStyle tableViewCellStyle) {
        @jobs_strongify(self)
        return [self.alloc initWithStyle:tableViewCellStyle
                         reuseIdentifier:self.class.description];
    };
}

+(instancetype)initTableViewCell:(Class)tableViewCellClass
                       withStyle:(UITableViewCellStyle)style{
    return [tableViewCellClass.alloc initWithStyle:style
                                   reuseIdentifier:tableViewCellClass.class.description];
}
/// 4种UITableViewCell系统样式类型
/// UITableViewCellStyleDefault = 左边：imageView＋textLabel
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleDefaultWithTableView{
    @jobs_weakify(self)
    return ^(UITableView * _Nonnull tableView) {
        @jobs_strongify(self)
        UITableViewCell *cell = tableView.tableViewCellClass(self.class,JobsEmpty);
        if (!cell) {
            cell = [self initTableViewCell:self withStyle:UITableViewCellStyleDefault];
            cell.settingForTableViewCell();
        }return cell;
    };
}
/// UITableViewCellStyleValue1 = 左边：imageView＋textLabel；右边：detailTextLabel
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView{
    @jobs_weakify(self)
    return ^(UITableView * _Nonnull tableView) {
        @jobs_strongify(self)
        UITableViewCell *cell = tableView.tableViewCellClass(self.class,JobsEmpty);
        if (!cell) {
            cell = [self initTableViewCell:self withStyle:UITableViewCellStyleValue1];
            cell.settingForTableViewCell();
        }return cell;
    };
}
/// UITableViewCellStyleValue2 = 左边：textLabel字体偏小；右边：detailTextLabel。imageView可选（显示在最左边）
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleValue2WithTableView{
    @jobs_weakify(self)
    return ^(UITableView * _Nonnull tableView) {
        @jobs_strongify(self)
        UITableViewCell *cell = tableView.tableViewCellClass(self.class,JobsEmpty);
        if (!cell) {
            cell = [self initTableViewCell:self withStyle:UITableViewCellStyleValue2];
            cell.settingForTableViewCell();
        }return cell;
    };
}
/// UITableViewCellStyleSubtitle = 左边：textLabel字体偏小；右边：detailTextLabel。imageView可选（显示在最左边）
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleSubtitleWithTableView{
    @jobs_weakify(self)
    return ^(UITableView * _Nonnull tableView) {
        @jobs_strongify(self)
        UITableViewCell *cell = (UITableViewCell *)tableView.tableViewCellClass(self.class,JobsEmpty);
        if (!cell) {
            cell = [self initTableViewCell:self withStyle:UITableViewCellStyleSubtitle];
            cell.settingForTableViewCell();
        }return cell;
    };
}
/// UITableViewCell的一些默认样式设置
-(jobsByVoidBlock _Nonnull)settingForTableViewCell{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        /// 适配iOS 13夜间模式/深色外观(Dark Mode)
        self.backgroundColor = [UIColor xy_createWithLightColor:JobsWhiteColor darkColor:JobsWhiteColor];
        self.detailTextLabel.textColor = JobsBrownColor;
        self.textLabel.textColor = JobsBlackColor;
    };
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
-(JobsReturnTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        if (model.isKindOfClass(UIViewModel.class)) {
            self.textLabel.textColor = model.textModel.textCor;
            self.textLabel.font = model.textModel.font;
            self.textLabel.text = model.textModel.text;
            self.imageView.image = model.image;
        } return self;
    };
}

-(jobsByImageBlock _Nonnull)setCellBgImage{
    @jobs_weakify(self)
    return ^(UIImage *_Nullable bgImage){
        @jobs_strongify(self)
        self.backgroundColor = self.contentView.backgroundColor = JobsClearColor;
        self.backgroundImageView.image = bgImage;
    };
}

+(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(44);
    };
}
#pragma mark —— UITableViewCellProtocol
/// 以section为单位，每个section的第一行和最后一行的cell圆角化处理【cell之间没有分割线】
-(__kindof CALayer *)roundedCornerFirstAndLastCellByTableView:(UITableView *)tableView
                                                    indexPath:(NSIndexPath *)indexPath
                                                  layerConfig:(JobsLocationModel *)layerConfig{
    // 关闭分割线
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    @jobs_weakify(self)
    if (jobsZeroSizeValue(layerConfig.roundingCornersRadii)) layerConfig.roundingCornersRadii = CGSizeMake(JobsWidth(10.0), JobsWidth(10.0));
    // 当前 section 的总行数
    NSInteger numberOfRows = tableView.rowsInSection(indexPath.section);
    // 初始化将要设置的圆角类型
    UIRectCorner corner = 0;
    if (numberOfRows == 1) {
        corner = UIRectCornerAllCorners;
    } else if (indexPath.row == 0) {
        corner = UIRectCornerTopLeft | UIRectCornerTopRight;
    } else if (indexPath.row == numberOfRows - 1) {
        corner = UIRectCornerBottomLeft | UIRectCornerBottomRight;
    } else {
        // 中间 cell，无圆角和边框
        self.layer.mask = nil;
        // 移除边框 Layer（避免复用残留）
        NSArray *sublayers = self.layer.sublayers.copy;
        for (CALayer *sublayer in sublayers) {
            if ([sublayer.name isEqualToString:RoundedBorderLayer]) {
                [sublayer removeFromSuperlayer];
            }
        }return self.layer;
    }
    // 设置圆角路径
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corner
                                                         cornerRadii:layerConfig.roundingCornersRadii];
    self.layer.mask = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
        @jobs_strongify(self)
        layer.frame = self.bounds;
        layer.path = maskPath.CGPath;
    });
    // 添加边框 Layer（可选）
    if (layerConfig.layerBorderCor && layerConfig.borderWidth > 0) {
        // 移除之前旧的 border layer，避免复用叠加
        NSArray *sublayers = self.layer.sublayers.copy;
        for (CALayer *sublayer in sublayers) {
            if ([sublayer.name isEqualToString:RoundedBorderLayer]) {
                [sublayer removeFromSuperlayer];
            }
        }
        self.layer.addSublayer(jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable borderLayer) {
            @jobs_strongify(self)
            borderLayer.frame = self.bounds;
            borderLayer.path = maskPath.CGPath;
            borderLayer.strokeColor = layerConfig.layerBorderCor.CGColor;
            borderLayer.fillColor = UIColor.clearColor.CGColor;
            borderLayer.lineWidth = layerConfig.borderWidth;
            borderLayer.name = RoundedBorderLayer;
        }));
    }return self.layer;
}
/// 以 section 为单位，仅对每个 section 的最后一行 cell 做圆角处理（cell 之间没有分割线），且不描边顶部
-(__kindof CALayer *)roundedCornerLastCellByTableView:(UITableView *)tableView
                                            indexPath:(NSIndexPath *)indexPath
                                          layerConfig:(JobsLocationModel *)layerConfig{
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    NSInteger numberOfRows = [tableView numberOfRowsInSection:indexPath.section];
    @jobs_weakify(self)
    if (jobsZeroSizeValue(layerConfig.roundingCornersRadii)) {
        layerConfig.roundingCornersRadii = CGSizeMake(JobsWidth(10.0), JobsWidth(10.0));
    }
    if (indexPath.row == numberOfRows - 1) {
        // 当前为该 section 的最后一个 cell，处理圆角遮罩
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                       byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight)
                                                             cornerRadii:layerConfig.roundingCornersRadii];
        self.layer.mask = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
            @jobs_strongify(self)
            layer.frame = self.bounds;
            layer.path = maskPath.CGPath;
        });
        // 处理边框
        if (layerConfig.layerBorderCor && layerConfig.borderWidth > 0) {
            // 移除旧的边框图层
            NSArray *sublayers = self.layer.sublayers.copy;
            for (CALayer *sublayer in sublayers) {
                if ([sublayer.name isEqualToString:RoundedBorderLayer]) {
                    [sublayer removeFromSuperlayer];
                }
            }
            CGFloat width = CGRectGetWidth(self.bounds);
            CGFloat height = CGRectGetHeight(self.bounds);
            CGFloat radius = layerConfig.roundingCornersRadii.height;

            UIBezierPath *borderPath = [UIBezierPath bezierPath];

            // 左下圆弧起点
            [borderPath moveToPoint:CGPointMake(0, height - radius)];
            // 左下圆角
            [borderPath addArcWithCenter:CGPointMake(radius, height - radius)
                                  radius:radius
                              startAngle:M_PI
                                endAngle:M_PI_2
                               clockwise:NO];
            // 底边线到右下角
            [borderPath addLineToPoint:CGPointMake(width - radius, height)];
            // 右下圆角
            [borderPath addArcWithCenter:CGPointMake(width - radius, height - radius)
                                  radius:radius
                              startAngle:M_PI_2
                                endAngle:0
                               clockwise:NO];
            // 右边竖线往上
            [borderPath addLineToPoint:CGPointMake(width, 0)];
            // 👉 左边竖线补充（修复左边断线问题）
            [borderPath moveToPoint:CGPointMake(0, height - radius)];
            [borderPath addLineToPoint:CGPointMake(0, 0)];
            // 添加边框图层
            self.layer.addSublayer(jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable borderLayer) {
                @jobs_strongify(self)
                borderLayer.frame = self.bounds;
                borderLayer.path = borderPath.CGPath;
                borderLayer.strokeColor = layerConfig.layerBorderCor.CGColor;
                borderLayer.fillColor = UIColor.clearColor.CGColor;
                borderLayer.lineWidth = layerConfig.borderWidth;
                borderLayer.name = RoundedBorderLayer;
            }));
        }
    } else {
        // 非最后一个 cell，清除圆角遮罩和边框
        self.layer.mask = nil;
        NSArray *sublayers = self.layer.sublayers.copy;
        for (CALayer *sublayer in sublayers) {
            if ([sublayer.name isEqualToString:RoundedBorderLayer]) {
                [sublayer removeFromSuperlayer];
            }
        }
    }return self.layer;
}
/// 以section为单位，每个section的第一行的cell圆角化处理【cell之间没有分割线】
-(__kindof CALayer *)roundedCornerFirstCellByTableView:(UITableView *)tableView
                                             indexPath:(NSIndexPath *)indexPath
                                           layerConfig:(JobsLocationModel *)layerConfig{
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    NSInteger numberOfRows = [tableView numberOfRowsInSection:indexPath.section];
    @jobs_weakify(self)
    if (jobsZeroSizeValue(layerConfig.roundingCornersRadii)) {
        layerConfig.roundingCornersRadii = CGSizeMake(JobsWidth(10.0), JobsWidth(10.0));
    }

    if (indexPath.row == 0 && numberOfRows > 0) {
        // 当前为该 section 的第一个 cell，处理圆角遮罩
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                       byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                                             cornerRadii:layerConfig.roundingCornersRadii];
        self.layer.mask = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
            @jobs_strongify(self)
            layer.frame = self.bounds;
            layer.path = maskPath.CGPath;
        });
        // 处理边框
        if (layerConfig.layerBorderCor && layerConfig.borderWidth > 0) {
            // 移除旧的边框图层
            NSArray *sublayers = self.layer.sublayers.copy;
            for (CALayer *sublayer in sublayers) {
                if ([sublayer.name isEqualToString:RoundedBorderLayer]) {
                    [sublayer removeFromSuperlayer];
                }
            }
            CGFloat width = CGRectGetWidth(self.bounds);
            CGFloat height = CGRectGetHeight(self.bounds);
            CGFloat radius = layerConfig.roundingCornersRadii.height;

            UIBezierPath *borderPath = [UIBezierPath bezierPath];
            // 左上圆弧起点
            [borderPath moveToPoint:CGPointMake(0, radius)];
            // 左上圆角
            [borderPath addArcWithCenter:CGPointMake(radius, radius)
                                  radius:radius
                              startAngle:M_PI
                                endAngle:3 * M_PI_2
                               clockwise:YES];
            // 顶部边线到右上角
            [borderPath addLineToPoint:CGPointMake(width - radius, 0)];
            // 右上圆角
            [borderPath addArcWithCenter:CGPointMake(width - radius, radius)
                                  radius:radius
                              startAngle:3 * M_PI_2
                                endAngle:0
                               clockwise:YES];
            // 右边竖线到底部
            [borderPath addLineToPoint:CGPointMake(width, height)];
            // 👉 左边竖线补充（修复左边断线问题）
            [borderPath moveToPoint:CGPointMake(0, radius)];
            [borderPath addLineToPoint:CGPointMake(0, height)];
            // 添加边框图层
            self.layer.addSublayer(jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable borderLayer) {
                @jobs_strongify(self)
                borderLayer.frame = self.bounds;
                borderLayer.path = borderPath.CGPath;
                borderLayer.strokeColor = layerConfig.layerBorderCor.CGColor;
                borderLayer.fillColor = UIColor.clearColor.CGColor;
                borderLayer.lineWidth = layerConfig.borderWidth;
                borderLayer.name = RoundedBorderLayer;
            }));
        }
    } else {
        // 非第一个 cell，清除圆角遮罩和边框
        self.layer.mask = nil;
        NSArray *sublayers = self.layer.sublayers.copy;
        for (CALayer *sublayer in sublayers) {
            if ([sublayer.name isEqualToString:RoundedBorderLayer]) {
                [sublayer removeFromSuperlayer];
            }
        }
    }return self.layer;
}
/// 只描 UITableViewCell 的左右两边
-(void)leftAndRightLineCellByTableView:(UITableView *)tableView
                             indexPath:(NSIndexPath *)indexPath
                           layerConfig:(JobsLocationModel *)layerConfig {
    // 移除之前添加的边框（防止复用时重复）
    NSArray<CALayer *> *sublayers = self.contentView.layer.sublayers.copy;
    for (CALayer *layer in sublayers) {
        if ([layer.name isEqualToString:@"left-border"] ||
            [layer.name isEqualToString:@"right-border"]) {
            [layer removeFromSuperlayer];
        }
    }

    if (!layerConfig.layerBorderCor) layerConfig.layerBorderCor = JobsGrayColor;
    if (!layerConfig.borderWidth) layerConfig.borderWidth = JobsWidth(1);

    CGFloat borderWidth = layerConfig.borderWidth;
    CGFloat height = CGRectGetHeight(self.contentView.bounds);
    CGFloat width  = CGRectGetWidth(self.contentView.bounds);

    // 左边线
    self.contentView.layer.addSublayer(jobsMakeCALayer(^(__kindof CALayer * _Nullable leftLayer) {
        leftLayer.name = @"left-border";
        leftLayer.backgroundColor = layerConfig.layerBorderCor.CGColor;
        leftLayer.frame = CGRectMake(0, 0, borderWidth, height);
    }));

    // 右边线
    self.contentView.layer.addSublayer(jobsMakeCALayer(^(__kindof CALayer * _Nullable rightLayer) {
        rightLayer.name = @"right-border";
        rightLayer.backgroundColor = layerConfig.layerBorderCor.CGColor;
        rightLayer.frame = CGRectMake(width - borderWidth, 0, borderWidth, height);
    }));
}
/// 除了最后一行以外，所有的cell的最下面的线的颜色为：layerConfig.layerBorderCor
/// - Parameters:
///   - indexPath: indexPath
///   - bounds: bounds
///   - numberOfRowsInSection: 当前的UITableViewCell对应的section的的row个数
///   - layerConfig: layer的配置文件
-(void)tableViewMakesLastRowCellAtIndexPath:(NSIndexPath *_Nonnull)indexPath
                                     bounds:(CGRect)bounds
                      numberOfRowsInSection:(NSInteger)numberOfRowsInSection
                                layerConfig:(JobsLocationModel *)layerConfig{
    if (!indexPath) return;
    if (!layerConfig.layerBorderCor) layerConfig.layerBorderCor = JobsWhiteColor;
    if (indexPath.row != numberOfRowsInSection - 1) {
        /// 将图层添加到cell的图层中,并插到最底层
        [self.layer insertSublayer:jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
            layer.borderWidth = layerConfig.borderWidth;
            layer.strokeColor = layerConfig.layerBorderCor.CGColor;
            layer.path = jobsMakeBezierPath(^(__kindof UIBezierPath * _Nullable data) {
                [data moveToPoint:CGPointMake(bounds.origin.x, bounds.size.height)];// 起点
                [data addLineToPoint:CGPointMake(bounds.origin.x + bounds.size.width, bounds.size.height)];// 其他点
            }).CGPath;
        }) atIndex:1];
    }
}
/// 除了第一行以外，所有的cell的最上面的线为：layerConfig.layerBorderCor
/// - Parameters:
///   - indexPath: indexPath
///   - bounds: bounds
///   - numberOfRowsInSection: 当前的UITableViewCell对应的section的的row个数
///   - layerConfig: layer的配置文件
-(void)tableViewMakesFirstRowCellAtIndexPath:(NSIndexPath *_Nonnull)indexPath
                                      bounds:(CGRect)bounds
                       numberOfRowsInSection:(NSInteger)numberOfRowsInSection
                                 layerConfig:(JobsLocationModel *)layerConfig{
    if (!indexPath) return;
    if (!layerConfig.layerBorderCor) layerConfig.layerBorderCor = JobsWhiteColor;
    if(indexPath.row){
        /// 将图层添加到cell的图层中,并插到最底层
        [self.layer insertSublayer:jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
            layer.borderWidth = layerConfig.borderWidth;
            layer.strokeColor = layerConfig.layerBorderCor.CGColor;
            layer.path = jobsMakeBezierPath(^(__kindof UIBezierPath * _Nullable linePath) {
                [linePath moveToPoint:CGPointMake(bounds.origin.x, 0)];/// 起点
                [linePath addLineToPoint:CGPointMake(bounds.origin.x + bounds.size.width,0)];/// 其他点
            }).CGPath;
        }) atIndex:1];
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

-(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.cellHeightByModel(data);
    };
}

-(JobsReturnCGSizeByIDBlock _Nonnull)cellSizeByModel{
    @jobs_weakify(self)
    return ^CGSize(id _Nullable data){
        @jobs_strongify(self)
        return self.class.cellSizeByModel(data);
    };
}

@end
