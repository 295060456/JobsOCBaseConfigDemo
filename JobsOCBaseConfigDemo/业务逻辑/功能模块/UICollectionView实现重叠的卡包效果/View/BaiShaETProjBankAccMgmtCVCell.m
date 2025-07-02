//
//  BaiShaETProjBankAccMgmtCVCell.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/7/7.
//

#import "BaiShaETProjBankAccMgmtCVCell.h"

@interface BaiShaETProjBankAccMgmtCVCell ()
/// UI
Prop_strong()BaseButton *titleBtn;
Prop_strong()UILabel *detailLab;

@end

@implementation BaiShaETProjBankAccMgmtCVCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
//        self.backgroundColor = JobsWhiteColor;
//        self.contentView.backgroundColor = JobsRandomColor;
        self.cornerCutToCircleWithCornerRadius(JobsWidth(8));
    }return self;
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    BaiShaETProjBankAccMgmtCVCell *cell = JobsRegisterDequeueCollectionViewCell(BaiShaETProjBankAccMgmtCVCell);
    cell.indexPath = indexPath;
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model ? : UIViewModel.new;
        self.titleBtn.alpha = 1;
        self.detailLab.alpha = 1;
        switch (self.indexPath.item) {
            case 0:
                JobsCellSelfCor([UIColor gradientCorDataMutArr:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
                    data.add(HEXCOLOR(0xD4EDFE));
                    data.add(HEXCOLOR(0xE6F5FF));
                })
                                            startPoint:CGPointZero
                                              endPoint:CGPointZero
                                                opaque:NO
                                        targetViewRect:CGRectMake(0, 0, JobsWidth(343), JobsWidth(76))]);
                break;
            case 1:
                JobsCellSelfCor([UIColor gradientCorDataMutArr:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
                    data.add(HEXCOLOR(0xFFE5E6));
                    data.add(HEXCOLOR(0xFFF3F3));
                })
                                            startPoint:CGPointZero
                                              endPoint:CGPointZero
                                                opaque:NO
                                        targetViewRect:CGRectMake(0, 0, JobsWidth(343), JobsWidth(76))]);
                break;
            case 2:
                JobsCellSelfCor([UIColor gradientCorDataMutArr:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
                    data.add(HEXCOLOR(0xFFEFC3));
                    data.add(HEXCOLOR(0xFFF7E0));
                })
                                            startPoint:CGPointZero
                                              endPoint:CGPointZero
                                                opaque:NO
                                        targetViewRect:CGRectMake(0, 0, JobsWidth(343), JobsWidth(76))]);
                break;
            default:
                JobsCellSelfCor(JobsWhiteColor);
                break;
        } return self;
    };
}
#pragma mark —— lazyLoad
-(BaseButton *)titleBtn{
    if (!_titleBtn) {
        _titleBtn = BaseButton.jobsInit();
        [self.contentView.addSubview(_titleBtn) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(12));
            make.centerY.equalTo(self.contentView);
        }];
    }
    _titleBtn.jobsResetBtnTitle(self.viewModel.textModel.text);
    _titleBtn.jobsResetBtnImage(self.viewModel.image);
    _titleBtn.jobsResetBtnTitleCor(HEXCOLOR(0x3D4A58));
    _titleBtn.jobsResetBtnTitleFont(UIFontWeightBoldSize(14));

    _titleBtn.imageViewSize = CGSizeMake(JobsWidth(40), JobsWidth(40));
    _titleBtn.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable model) {
        model.jobsWidth = 1;
        model.layerCor = HEXCOLOR(0xEEE2C8);
        model.cornerRadiusValue = JobsWidth(20);
    }));
    
    _titleBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
    _titleBtn.jobsResetImagePlacement_Padding(NSDirectionalRectEdgeLeading,JobsWidth(50));
    
    _titleBtn.imageView.y = -JobsWidth(12);
    _titleBtn.imageView.x = 0;
    _titleBtn.titleLabel.x = JobsWidth(60);
    return _titleBtn;
}

-(UILabel *)detailLab{
    if (!_detailLab) {
        @jobs_weakify(self)
        _detailLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.font = UIFontWeightBoldSize(18);
            label.textColor = HEXCOLOR(0x3D4A58);
            label.textAlignment = NSTextAlignmentCenter;
            [self.contentView.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.contentView).offset(JobsWidth(-12));
                make.centerY.equalTo(self.contentView);
            }];
        });
    }
    _detailLab.text = self.viewModel.subTextModel.text;
    _detailLab.makeLabelByShowingType(UILabelShowingType_03);
    return _detailLab;
}

@end
