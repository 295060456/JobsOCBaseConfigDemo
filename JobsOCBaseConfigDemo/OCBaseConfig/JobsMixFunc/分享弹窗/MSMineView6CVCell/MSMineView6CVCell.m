//
//  MSMineView6.m
//  MataShop
//
//  Created by Jobs Hi on 9/27/23.
//

#import "MSMineView6CVCell.h"

@interface MSMineView6CVCell ()

@end

@implementation MSMineView6CVCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}
#pragma mark —— BaseViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    return self.viewModel;
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    MSMineView6CVCell *cell = JobsRegisterDequeueCollectionViewCell(MSMineView6CVCell);
    cell.indexPath = indexPath;
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        model.buttonEdgeInsetsStyle = NSDirectionalRectEdgeTop;
        model.bgSelectedCor = model.bgCor = JobsClearColor;
        super.jobsRichElementsCollectionViewCellBy(model);
        self.contentView.backgroundColor = self.backgroundColor = JobsCor(@"#FFFFFF");
        return self;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)cellSizeByModel{
    return ^CGSize(id _Nullable data){
//        if([model.cls isEqual:MSMySocialTitleView.class]){
//            return CGSizeMake(JobsWidth(40), JobsWidth(60));
//        }else if ([model.cls isEqual:MSMineVC.class]){
//            return CGSizeMake(JobsWidth(70), JobsWidth(70));
//        }else return CGSizeZero;
        return CGSizeMake(JobsWidth(70), JobsWidth(70));
    };
}
#pragma mark —— lazyLoad

@end
