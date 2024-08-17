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
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.backgroundColor = self.contentView.backgroundColor = JobsClearColor;
        self.textIMGV.image = model;
    };
}
////具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
//+(CGFloat)cellHeightWithModel:(id _Nullable)model;
//具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIImage *_Nullable)model{
    if ([model isEqual:JobsIMG(@"小数点")]) {
        return CGSizeMake(JobsWidth(15), JobsWidth(28));
    }return CGSizeMake(JobsWidth(19), JobsWidth(28));
}
#pragma mark —— lazyLoad
-(UIImageView *)textIMGV{
    if (!_textIMGV) {
        _textIMGV = UIImageView.new;
        [self.contentView addSubview:_textIMGV];
        [_textIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _textIMGV;
}

@end
