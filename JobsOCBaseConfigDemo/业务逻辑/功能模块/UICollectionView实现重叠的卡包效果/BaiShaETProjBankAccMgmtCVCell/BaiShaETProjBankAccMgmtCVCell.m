//
//  BaiShaETProjBankAccMgmtCVCell.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/7/7.
//

#import "BaiShaETProjBankAccMgmtCVCell.h"

@interface BaiShaETProjBankAccMgmtCVCell ()
/// UI
@property(nonatomic,strong)BaseButton *titleBtn;
@property(nonatomic,strong)UILabel *detailLab;
/// Data
@property(nonatomic,strong)UIColor *cor1;
@property(nonatomic,strong)UIColor *cor2;
@property(nonatomic,strong)UIColor *cor3;

@end

@implementation BaiShaETProjBankAccMgmtCVCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
//        self.backgroundColor = JobsWhiteColor;
//        self.contentView.backgroundColor = JobsRandomColor;
        [self cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    }return self;
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    BaiShaETProjBankAccMgmtCVCell *cell = (BaiShaETProjBankAccMgmtCVCell *)[collectionView collectionViewCellClass:BaiShaETProjBankAccMgmtCVCell.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:BaiShaETProjBankAccMgmtCVCell.class];
        cell = (BaiShaETProjBankAccMgmtCVCell *)[collectionView collectionViewCellClass:BaiShaETProjBankAccMgmtCVCell.class forIndexPath:indexPath];
    }
    cell.indexPath = indexPath;
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model ? : UIViewModel.new;
    self.titleBtn.alpha = 1;
    self.detailLab.alpha = 1;
    
    switch (self.indexPath.item) {
        case 0:
            JobsCellSelfCor(self.cor1);
            break;
        case 1:
            JobsCellSelfCor(self.cor2);
            break;
        case 2:
            JobsCellSelfCor(self.cor3);
            break;
        default:
            JobsCellSelfCor(JobsWhiteColor);
            break;
    } 
}
#pragma mark —— lazyLoad
-(BaseButton *)titleBtn{
    if (!_titleBtn) {
        _titleBtn = BaseButton.new;
        [self.contentView addSubview:_titleBtn];
        [_titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(12));
            make.centerY.equalTo(self.contentView);
        }];
    }
    _titleBtn.normalTitle = self.viewModel.textModel.text;
    _titleBtn.normalImage = self.viewModel.image;
    _titleBtn.normalTitleColor = HEXCOLOR(0x3D4A58);
    _titleBtn.titleFont = notoSansBold(14);

    _titleBtn.imageViewSize = CGSizeMake(JobsWidth(40), JobsWidth(40));
    [_titleBtn.imageView cornerCutToCircleWithCornerRadius:JobsWidth(20)];
    [_titleBtn.imageView layerBorderCor:HEXCOLOR(0xEEE2C8) andBorderWidth:JobsWidth(1)];
    
    [_titleBtn makeBtnLabelByShowingType:UILabelShowingType_03];
    [_titleBtn layoutButtonWithEdgeInsetsStyle:NSDirectionalRectEdgeLeading
                                  imagePadding:JobsWidth(50)];
    
    _titleBtn.imageView.y = -JobsWidth(12);
    _titleBtn.imageView.x = 0;
    _titleBtn.titleLabel.x = JobsWidth(60);
    return _titleBtn;
}

-(UILabel *)detailLab{
    if (!_detailLab) {
        _detailLab = UILabel.new;
        _detailLab.font = notoSansBold(18);
        _detailLab.textColor = HEXCOLOR(0x3D4A58);
        _detailLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_detailLab];
        [_detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(JobsWidth(-12));
            make.centerY.equalTo(self.contentView);
        }];
    }
    _detailLab.text = self.viewModel.subTextModel.text;
    [_detailLab makeLabelByShowingType:UILabelShowingType_03];
    return _detailLab;
}

-(UIColor *)cor1{
    if (!_cor1) {
        _cor1 = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xD4EDFE),HEXCOLOR(0xE6F5FF)]]
                                    startPoint:CGPointZero
                                      endPoint:CGPointZero
                                        opaque:NO
                                targetViewRect:CGRectMake(0, 0, JobsWidth(343), JobsWidth(76))];
    }return _cor1;
}

-(UIColor *)cor2{
    if (!_cor2) {
        _cor2 = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xFFE5E6),HEXCOLOR(0xFFF3F3)]]
                                    startPoint:CGPointZero
                                      endPoint:CGPointZero
                                        opaque:NO
                                targetViewRect:CGRectMake(0, 0, JobsWidth(343), JobsWidth(76))];
    }return _cor2;
}

-(UIColor *)cor3{
    if (!_cor3) {
        _cor3 = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xFFEFC3),HEXCOLOR(0xFFF7E0)]]
                                    startPoint:CGPointZero
                                      endPoint:CGPointZero
                                        opaque:NO
                                targetViewRect:CGRectMake(0, 0, JobsWidth(343), JobsWidth(76))];
    }return _cor3;
}

@end
