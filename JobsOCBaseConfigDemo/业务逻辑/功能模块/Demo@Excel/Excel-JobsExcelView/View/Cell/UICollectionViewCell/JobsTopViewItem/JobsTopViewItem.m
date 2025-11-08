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
    cell.contentView.layer
        .cornerRadiusBy(JobsWidth(8))
        .borderWidthBy(JobsWidth(1))
        .borderColorBy(RGBA_COLOR(255, 225, 144, 1))
        .masksToBoundsBy(YES);
    cell.layer
        .cornerRadiusBy(JobsWidth(8))
        .borderWidthBy(JobsWidth(1))
        .borderColorBy(RGBA_COLOR(255, 225, 144, 1))
        .masksToBoundsBy(YES);
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
-(JobsRetCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
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
            imageView.image = @"投注记录".img;
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
            self.button.layer.addSublayer(data.lineWidthBy(self.viewModel_.LineWidth)
                                          .strokeColorBy(self.viewModel_.cor6)
                                          .pathByBezierPath(self.linePath)
                                          .fillColorBy(JobsClearColor));
        });
    }return _lineLayer;
}

@end
