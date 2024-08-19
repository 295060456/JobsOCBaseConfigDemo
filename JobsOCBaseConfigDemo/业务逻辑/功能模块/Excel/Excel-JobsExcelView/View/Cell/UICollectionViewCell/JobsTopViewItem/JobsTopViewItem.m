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
@property(nonatomic,strong)UIBezierPath *linePath;
@property(nonatomic,strong)CAShapeLayer *lineLayer;
@property(nonatomic,strong)UIImageView *bgImageView;
/// Data
@property(nonatomic,strong)JobsExcelConfigureViewModel *viewModel_;
@property(nonatomic,assign)CGSize size;

@end

@implementation JobsTopViewItem

+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    JobsTopViewItem *cell = (JobsTopViewItem *)[collectionView collectionViewCellClass:JobsTopViewItem.class forIndexPath:indexPath];
    if (!cell) {
        collectionView.registerCollectionViewCellClass(JobsTopViewItem.class,@"");
        cell = (JobsTopViewItem *)[collectionView collectionViewCellClass:JobsTopViewItem.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell圆切角
//    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
//    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
//    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
//    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;

    cell.indexPath = indexPath;
    
    return cell;
}
#pragma mark —— BaseCellProtocol
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(JobsExcelConfigureViewModel *_Nullable viewModel) {
        @jobs_strongify(self)
        self.viewModel_ = viewModel;
        self.bgImageView.alpha = 1;
        CGSize size = CGSizeMake(viewModel.itemW, viewModel.itemH);
        if (!CGSizeEqualToSize(self.size, size)) {
            self.size = size;
            [self drawLineWithSize:size];
        }
    };
}

-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel2{
    return ^(UIButtonModel *_Nullable model) {
        super.jobsRichElementsInCellWithModel(model);
    };
}

- (void)drawLineWithSize:(CGSize)size{
    // 其他点
    [self.linePath addLineToPoint:CGPointMake(size.width, 0)];
    [self.linePath addLineToPoint:CGPointMake(size.width, size.height)];
    [self.linePath addLineToPoint:CGPointMake(0, size.height)];
    
    UIGraphicsBeginImageContext(size);
    [self.linePath stroke];
    UIGraphicsEndImageContext();
    self.lineLayer.hidden = NO;
}
#pragma mark —— lazyLoad
-(UIImageView *)bgImageView{
    if(!_bgImageView){
        _bgImageView = UIImageView.new;
        _bgImageView.image = JobsIMG(@"投注记录");
        [self.contentView addSubview:_bgImageView];
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }return _bgImageView;
}

-(UIBezierPath *)linePath{
    if(!_linePath){
        _linePath = UIBezierPath.bezierPath;
        [_linePath moveToPoint:CGPointMake(0, 0)];// 起点
    }return _linePath;
}

-(CAShapeLayer *)lineLayer{
    if(!_lineLayer){
        _lineLayer = CAShapeLayer.layer;
        _lineLayer.lineWidth = LineWidth;
        _lineLayer.strokeColor = LineColor.CGColor;
        _lineLayer.path = self.linePath.CGPath;
        _lineLayer.fillColor = nil; // 默认为blackColor
        [self.btn.layer addSublayer:_lineLayer];
    }return _lineLayer;
}

@end
