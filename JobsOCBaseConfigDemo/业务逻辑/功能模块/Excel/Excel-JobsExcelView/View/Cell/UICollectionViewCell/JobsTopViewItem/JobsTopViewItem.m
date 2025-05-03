//
//  JobsTopViewItem.m
//  JobsExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import "JobsTopViewItem.h"

@interface JobsTopViewItem()
/// UI
Prop_strong()UIBezierPath *linePath;
Prop_strong()CAShapeLayer *lineLayer;
/// Data
Prop_strong()JobsExcelConfigureViewModel *viewModel_;
Prop_assign()CGSize size;

@end

@implementation JobsTopViewItem

+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    JobsTopViewItem *cell = JobsRegisterDequeueCollectionViewCell(JobsTopViewItem);
    // UICollectionViewCell圆切角
//    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
//    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
//    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
//    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;

    cell.indexPath = indexPath;
    return cell;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    /// 内部指定圆切角
    [self appointCornerCutToCircleByRoundingCorners:UIRectCornerAllCorners
                                        cornerRadii:CGSizeMake(JobsWidth(0), JobsWidth(0))];
}
#pragma mark —— BaseCellProtocol
-(JobsReturnCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(JobsExcelConfigureViewModel *_Nullable viewModel) {
        @jobs_strongify(self)
        self.viewModel_ = viewModel;
        self.bgImageView.alpha = 1;
        CGSize size = CGSizeMake(viewModel.itemW, viewModel.itemH);
        if (!CGSizeEqualToSize(self.size, size)) {
            self.size = size;
            // 其他点
            self.linePath.add(CGPointMake(size.width, 0));
            self.linePath.add(CGPointMake(size.width, size.height));
            self.linePath.add(CGPointMake(0, size.height));
            
            UIGraphicsBeginImageContext(size);
            [self.linePath stroke];
            UIGraphicsEndImageContext();
            self.lineLayer.hidden = NO;
        } return self;
    };
}
#pragma mark —— lazyLoad
@synthesize bgImageView = _bgImageView;
-(UIImageView *)bgImageView{
    if(!_bgImageView){
        @jobs_weakify(self)
        _bgImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.image = JobsIMG(@"投注记录");
            [self.contentView.addSubview(imageView) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
            }];
        });
    }return _bgImageView;
}

-(UIBezierPath *)linePath{
    if(!_linePath){
        _linePath = jobsMakeBezierPath(^(__kindof UIBezierPath *_Nullable data) {
            data.moveTo(CGPointZero);// 起点
        });
    }return _linePath;
}

-(CAShapeLayer *)lineLayer{
    if(!_lineLayer){
        @jobs_weakify(self)
        _lineLayer = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable data) {
            @jobs_strongify(self)
            data.lineWidth = self.viewModel_.LineWidth;
            data.strokeColor = self.viewModel_.cor6.CGColor;
            data.path = self.linePath.CGPath;
            data.fillColor = JobsClearColor.CGColor; // 默认为blackColor
            self.button.layer.addSublayer(data);
        });
    }return _lineLayer;
}

@end
