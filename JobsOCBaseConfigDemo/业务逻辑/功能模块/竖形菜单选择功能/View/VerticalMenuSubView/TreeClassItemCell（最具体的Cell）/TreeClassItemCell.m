//
//  TreeClassItemCell.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/15.
//

#import "TreeClassItemCell.h"

@interface TreeClassItemCell ()
/// UI
@property(nonatomic,strong)UIImageView *logoImgView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UIButton *btn;
/// Data
@property(nonatomic,assign)CGFloat imageWidth;
@property(nonatomic,strong)GoodsClassModel *dataModel;

@end

@implementation TreeClassItemCell
#pragma mark —— UILocationProtocol
UILocationProtocol_UIViewModelSynthesize
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    TreeClassItemCell *cell = (TreeClassItemCell *)[collectionView collectionViewCellClass:TreeClassItemCell.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:TreeClassItemCell.class];
        cell = (TreeClassItemCell *)[collectionView collectionViewCellClass:TreeClassItemCell.class forIndexPath:indexPath];
    }
    cell.indexPath = indexPath;
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        self.jobsRect = frame;
        self.backgroundColor = self.contentView.backgroundColor = ThreeClassCellBgCor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(GoodsClassModel *_Nullable)model{
    self.dataModel = model;
    self.logoImgView.alpha = 1;
    self.nameLabel.alpha = 1;
    self.btn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(74), TreeClassItemCell_Height);
}
#pragma mark —— lazyLoad
-(CGFloat)imageWidth{
    CGFloat imageWidth = JobsWidth(68.f);
    if (self.jobsRect.size.width < imageWidth){
        imageWidth = self.jobsRect.size.width;
    }return imageWidth;
}

-(UIImageView *)logoImgView{
    if (!_logoImgView) {
        _logoImgView = UIImageView.new;
        _logoImgView.contentMode = UIViewContentModeScaleAspectFill;
        _logoImgView.clipsToBounds = YES;
        [_logoImgView cornerCutToCircleWithCornerRadius:JobsWidth(8)];
        [self.contentView addSubview:_logoImgView];
        [_logoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(self.imageWidth, self.imageWidth));
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
        }];
    }
    _logoImgView.image = self.dataModel.bgImage;
    return _logoImgView;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = UILabel.new;
        _nameLabel.textAlignment= NSTextAlignmentCenter;
        _nameLabel.font = notoSansRegular(12);
        _nameLabel.textColor = JobsBlackColor;
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.logoImgView.mas_bottom).offset(JobsWidth(5));
            make.height.mas_equalTo(JobsWidth(10));
        }];
    }
    _nameLabel.text = self.dataModel.textModel.text;
    return _nameLabel;
}

-(UIButton *)btn{
    if (!_btn) {
        _btn = UIButton.new;
        _btn.normalImage = JobsIMG(@"未点赞");
        _btn.selectedImage = JobsIMG(@"已点赞");
        _btn.titleFont = notoSansRegular(12);
        _btn.normalTitleColor = HEXCOLOR(0xC4C4C4);
        [self.contentView addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(12));
            make.centerX.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(JobsWidth(-5));
        }];
    }
    _btn.selected = self.dataModel.jobsSelected;
    _btn.normalTitle =  self.dataModel.subTextModel.text;
    [_btn makeBtnLabelByShowingType:UILabelShowingType_03];
    [_btn layoutButtonWithEdgeInsetsStyle:NSDirectionalRectEdgeLeading
                             imagePadding:JobsWidth(5)];
    return _btn;
}

@end
