//
//  JobsImageViewStyleCVCell.m
//  MataShop
//
//  Created by Jobs Hi on 9/23/23.
//

#import "JobsImageViewStyleCVCell.h"

@interface JobsImageViewStyleCVCell ()
/// UI
@property(nonatomic,strong)UIImageView *imageView;
/// Data

@end

@implementation JobsImageViewStyleCVCell
@synthesize viewModel = _viewModel;
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}
#pragma mark —— JobsDoorInputViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    return self.viewModel;
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    JobsImageViewStyleCVCell *cell = (JobsImageViewStyleCVCell *)[collectionView collectionViewCellClass:JobsImageViewStyleCVCell.class forIndexPath:indexPath];
    if (!cell) {
        collectionView.registerCollectionViewCellClass(JobsImageViewStyleCVCell.class,@"");
        cell = (JobsImageViewStyleCVCell *)[collectionView collectionViewCellClass:JobsImageViewStyleCVCell.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell圆切角
//    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
//    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
//    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
//    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;

    cell.indexPath = indexPath;
    
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)richElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        self.imageView.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(106), JobsWidth(30));
}
#pragma mark —— 一些公有方法
-(UIImageView *)getImageView{
    return self.imageView;
}
#pragma mark —— lazyLoad
-(UIImageView *)imageView{
    if(!_imageView){
        _imageView = UIImageView.new;
        [self.contentView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _imageView;
}

@end
