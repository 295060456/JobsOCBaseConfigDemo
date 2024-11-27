//
//  ImageNumberViewCVCell.m
//  Casino
//
//  Created by Jobs on 2021/11/29.
//

#import "JobsImageNumberViewCVCell.h"

@interface JobsImageNumberViewCVCell ()

@property(nonatomic,strong)UIImageView *textIMGV;

@end

@implementation JobsImageNumberViewCVCell
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    JobsImageNumberViewCVCell *cell = (JobsImageNumberViewCVCell *)[collectionView collectionViewCellClass:JobsImageNumberViewCVCell.class forIndexPath:indexPath];
    if (!cell) {
        collectionView.registerCollectionViewCellClass(JobsImageNumberViewCVCell.class,@"");
        cell = (JobsImageNumberViewCVCell *)[collectionView collectionViewCellClass:JobsImageNumberViewCVCell.class forIndexPath:indexPath];
    }
    cell.indexPath = indexPath;
    return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        self.backgroundColor = self.contentView.backgroundColor = JobsClearColor;
        self.textIMGV.image = model;
    };
}

+(JobsReturnCGSizeByIDBlock _Nonnull)cellSizeByModel{
    return ^CGSize(UIImage *_Nullable data){
        if ([data isEqual:JobsIMG(@"小数点")]) {
            return CGSizeMake(JobsWidth(15), JobsWidth(28));
        }return CGSizeMake(JobsWidth(19), JobsWidth(28));
    };
}
#pragma mark —— lazyLoad
-(UIImageView *)textIMGV{
    if (!_textIMGV) {
        @jobs_weakify(self)
        _textIMGV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            self.contentView.addSubview(imageView);
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.contentView);
            }];
        });
    }return _textIMGV;
}

@end
