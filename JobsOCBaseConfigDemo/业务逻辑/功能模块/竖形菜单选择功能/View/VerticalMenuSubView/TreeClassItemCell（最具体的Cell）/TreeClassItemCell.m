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
@property(nonatomic,strong)BaseButton *btn;
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
        collectionView.registerCollectionViewCellClass(TreeClassItemCell.class,@"");
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
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(GoodsClassModel *_Nullable model) {
        @jobs_strongify(self)
        self.dataModel = model;
        self.logoImgView.alpha = 1;
        self.nameLabel.alpha = 1;
        self.btn.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)cellSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(74), TreeClassItemCell_Height);
    };
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
        @jobs_weakify(self)
        _logoImgView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.clipsToBounds = YES;
            imageView.cornerCutToCircleWithCornerRadius(JobsWidth(8));
            self.contentView.addSubview(imageView);
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(self.imageWidth, self.imageWidth));
                make.centerX.equalTo(self.contentView);
                make.top.equalTo(self.contentView);
            }];
        });
    }
    
    if(self.dataModel.bgImage){
        _logoImgView.image = self.dataModel.bgImage;
    }else{
        _logoImgView.backgroundColor = JobsRandomCor(.5f);
    }return _logoImgView;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        @jobs_weakify(self)
        _nameLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.textAlignment= NSTextAlignmentCenter;
            label.font = UIFontWeightRegularSize(12);
            label.textColor = JobsBlackColor;
            self.contentView.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.contentView);
                make.top.equalTo(self.logoImgView.mas_bottom).offset(JobsWidth(5));
                make.height.mas_equalTo(JobsWidth(10));
            }];
        });
    }_nameLabel.text = self.dataModel.textModel.text;
    return _nameLabel;
}

-(BaseButton *)btn{
    if (!_btn) {
        @jobs_weakify(self)
        _btn = BaseButton.jobsInit()
            .bgColor(JobsClearColor.colorWithAlphaComponent(0))
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(JobsWidth(5))
            .jobsResetBtnImage(JobsIMG(@"APPLY NOW"))
            .jobsResetBtnBgImage(JobsIMG(@"未点赞"))
            .jobsResetBtnTitleCor(HEXCOLOR(0xC4C4C4))
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(12))
            .jobsResetBtnTitle(JobsInternationalization(@"APPLY NOW"))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                x.selected = !x.selected;
                if(x.selected){
                    x.jobsResetBtnImage(JobsIMG(@"已点赞"));
                    self.dataModel.jobsSelected = x.selected;
                }
                if (self.objectBlock) self.objectBlock(x);
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        [self.contentView addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(12));
            make.centerX.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(JobsWidth(-5));
        }];
    }
    _btn.selected = self.dataModel.jobsSelected;
    _btn.makeBtnTitleByShowingType(UILabelShowingType_03);
    return _btn;
}

@end
