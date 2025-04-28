//
//  TreeClassItemCell.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/15.
//

#import "TreeClassItemCell.h"

@interface TreeClassItemCell ()
/// UI
Prop_strong()UIImageView *logoImgView;
Prop_strong()UILabel *nameLabel;
Prop_strong()BaseButton *btn;
/// Data
Prop_assign()CGFloat imageWidth;
Prop_strong()GoodsClassModel *dataModel;

@end

@implementation TreeClassItemCell
#pragma mark —— UILocationProtocol
UILocationProtocol_synthesize
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    TreeClassItemCell *cell = JobsRegisterDequeueCollectionViewCell(TreeClassItemCell);
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
-(jobsByIDBlock _Nonnull)jobsRichElementsCellBy{
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
            .bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0))
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(self.dataModel.imagePadding)/// JobsWidth(5)
            .jobsResetBtnImage(self.dataModel.normalImage)
            .jobsResetBtnBgImage(self.dataModel.backgroundImage)
            .jobsResetBtnBgCor(self.dataModel.baseBackgroundColor)
            .jobsResetBtnTitleCor(self.dataModel.titleCor)/// HEXCOLOR(0xC4C4C4)
            .jobsResetBtnTitleFont(self.dataModel.titleFont)/// UIFontWeightRegularSize(12)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                x.selected = !x.selected;
                if(x.selected){
                    x.jobsResetBtnImage(self.dataModel.highlightImage);
                    self.dataModel.jobsSelected = x.selected;
                }
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        self.contentView.addSubview(_btn);
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(12));
            make.centerX.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(JobsWidth(-5));
        }];
    }
    _btn.jobsResetBtnTitle(self.dataModel.title);
    _btn.selected = self.dataModel.jobsSelected;
    _btn.makeBtnTitleByShowingType(UILabelShowingType_03);
    return _btn;
}

@end
