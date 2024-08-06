//
//  BaiShaETProjVIPSubCVCell_02.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/10.
//

#import "BaiShaETProjVIPSubCVCell_02.h"

@interface BaiShaETProjVIPSubCVCell_02 ()

@end

@implementation BaiShaETProjVIPSubCVCell_02

@synthesize viewModel = _viewModel;

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = JobsBlueColor;
    }return self;
}
#pragma mark —— JobsDoorInputViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    return self.viewModel;
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    BaiShaETProjVIPSubCVCell_02 *cell = (BaiShaETProjVIPSubCVCell_02 *)[collectionView collectionViewCellClass:BaiShaETProjVIPSubCVCell_02.class forIndexPath:indexPath];
    if (!cell) {
        collectionView.registerCollectionViewCellClass(BaiShaETProjVIPSubCVCell_02.class,@"");
        cell = (BaiShaETProjVIPSubCVCell_02 *)[collectionView collectionViewCellClass:BaiShaETProjVIPSubCVCell_02.class forIndexPath:indexPath];
    }
    cell.indexPath = indexPath;
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    if (self.viewModel) {
        
    }
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(164), JobsWidth(66));
}
#pragma mark —— lazyLoad

@end
