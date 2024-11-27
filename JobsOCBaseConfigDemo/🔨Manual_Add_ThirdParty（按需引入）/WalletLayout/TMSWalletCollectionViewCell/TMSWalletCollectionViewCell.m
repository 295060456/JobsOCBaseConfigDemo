//
//  TMSWalletCollectionViewCell.m
//  TMSWalletCollectionViewLayout
//
//  Created by TmmmS on 2019/8/8.
//  Copyright © 2019 TMS. All rights reserved.
//

#import "TMSWalletCollectionViewCell.h"

@interface TMSWalletCollectionViewCell ()
/// UI
@property(nonatomic,strong)UILabel *titleLabel;

@end

@implementation TMSWalletCollectionViewCell

@synthesize viewModel = _viewModel;
- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = JobsWhiteColor;
        self.contentView.backgroundColor = JobsRandomColor;
        self.layer.cornerRadius = 20;
        self.layer.masksToBounds = YES;
    }return self;
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    TMSWalletCollectionViewCell *cell = (TMSWalletCollectionViewCell *)[collectionView collectionViewCellClass:TMSWalletCollectionViewCell.class forIndexPath:indexPath];
    if (!cell) {
        collectionView.registerCollectionViewCellClass(TMSWalletCollectionViewCell.class,@"");
        cell = (TMSWalletCollectionViewCell *)[collectionView collectionViewCellClass:TMSWalletCollectionViewCell.class forIndexPath:indexPath];
    }
    cell.indexPath = indexPath;
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model ? : UIViewModel.new;
        self.titleLabel.alpha = 1;
    };
}
#pragma mark —— lazyLoad
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        @jobs_weakify(self)
        _titleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.font = UIFontWeightRegularSize(15);
            self.contentView.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView).offset(10);
                make.top.equalTo(self.contentView).offset(20);
            }];
        });
    }_titleLabel.text = [NSString stringWithFormat:@"indexPath:%zd--%zd selected:%@", self.indexPath.section,self.indexPath.row,self.viewModel.jobsSelected ? @"YES" : @"NO"];
    return _titleLabel;
}

@end
