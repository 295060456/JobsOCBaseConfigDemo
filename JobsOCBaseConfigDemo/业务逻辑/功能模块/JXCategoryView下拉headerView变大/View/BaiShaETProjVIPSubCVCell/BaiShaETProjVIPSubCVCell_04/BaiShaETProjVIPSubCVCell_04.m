//
//  BaiShaETProjVIPSubCVCell_04.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/10.
//

#import "BaiShaETProjVIPSubCVCell_04.h"

@interface BaiShaETProjVIPSubCVCell_04 ()

@end

@implementation BaiShaETProjVIPSubCVCell_04
@synthesize viewModel = _viewModel;
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = JobsBlackColor;
    }return self;
}
#pragma mark —— JobsDoorInputViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    return self.viewModel;
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    BaiShaETProjVIPSubCVCell_04 *cell = (BaiShaETProjVIPSubCVCell_04 *)[collectionView collectionViewCellClass:BaiShaETProjVIPSubCVCell_04.class forIndexPath:indexPath];
    if (!cell) {
        collectionView.registerCollectionViewCellClass(BaiShaETProjVIPSubCVCell_04.class,@"");
        cell = (BaiShaETProjVIPSubCVCell_04 *)[collectionView collectionViewCellClass:BaiShaETProjVIPSubCVCell_04.class forIndexPath:indexPath];
    }
    cell.indexPath = indexPath;
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)richElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        if (self.viewModel) {
            
        }
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(343), JobsWidth(40 + 40 + 18));
}
#pragma mark —— lazyLoad

@end
