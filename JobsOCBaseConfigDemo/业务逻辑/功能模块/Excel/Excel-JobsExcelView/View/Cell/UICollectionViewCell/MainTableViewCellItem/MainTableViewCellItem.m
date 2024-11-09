//
//  MainTableViewCellItem.m
//  BlankProject
//
//  Created by mac on 17/6/15.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import "MainTableViewCellItem.h"

@interface MainTableViewCellItem()
/// Data
@property(nonatomic,strong)JobsExcelConfigureViewModel *viewModel_;
@property(nonatomic,assign)CGSize size;

@end

@implementation MainTableViewCellItem

+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    MainTableViewCellItem *cell = (MainTableViewCellItem *)[collectionView collectionViewCellClass:MainTableViewCellItem.class
                                                                                      forIndexPath:indexPath];
    if (!cell) {
        collectionView.registerCollectionViewCellClass(MainTableViewCellItem.class,@"");
        cell = (MainTableViewCellItem *)[collectionView collectionViewCellClass:MainTableViewCellItem.class
                                                                   forIndexPath:indexPath];
    }cell.indexPath = indexPath;
    return cell;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel *_Nullable data) {
        data.layerCor = JobsLightGrayColor;
        data.jobsWidth = JobsWidth(.5f);
    }));
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(JobsExcelConfigureViewModel *_Nullable viewModel) {
        @jobs_strongify(self)
        self.viewModel_ = viewModel;
        CGSize size = CGSizeMake(viewModel.itemW - 1.0f, viewModel.itemH - 1.0f);
        if (!CGSizeEqualToSize(self.size, size)) {
            self.size = size;
        }
    };
}

-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel2{
    return ^(UIButtonModel *_Nullable model) {
        super.jobsRichElementsInCellWithModel(model);
    };
}

@end
