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
Prop_strong()JobsExcelConfigureViewModel *excelConfigureData;
Prop_assign()CGSize size;

@end

@implementation MainTableViewCellItem

+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    MainTableViewCellItem *cell = JobsRegisterDequeueCollectionViewCell(MainTableViewCellItem);
    cell.indexPath = indexPath;
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
-(JobsRetCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(UIViewModel *_Nullable viewModel) {
        @jobs_strongify(self)
        JobsExcelConfigureViewModel *model =  viewModel.data;
        self.excelConfigureData = model;
        CGSize size = CGSizeMake(model.itemW - 1.0f, model.itemH - 1.0f);
        if (!CGSizeEqualToSize(self.size, size)) self.size = size;
        self.makeUp(viewModel.buttonModel);
        return self;
    };
}

@end
