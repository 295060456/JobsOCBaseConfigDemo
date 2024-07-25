//
//  JobsBtnStyleCVCell.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/16.
//

#import "JobsBtnStyleCVCell.h"

@interface JobsBtnStyleCVCell ()
/// UI
@property(nonatomic,strong)UIButton *btn;
/// Data

@end

@implementation JobsBtnStyleCVCell
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
    JobsBtnStyleCVCell *cell = (JobsBtnStyleCVCell *)[collectionView collectionViewCellClass:JobsBtnStyleCVCell.class forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerCollectionViewCellClass:JobsBtnStyleCVCell.class];
        cell = (JobsBtnStyleCVCell *)[collectionView collectionViewCellClass:JobsBtnStyleCVCell.class forIndexPath:indexPath];
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
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    self.btn.alpha = 1;
    self.btn.data = model;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(106), JobsWidth(30));
}
#pragma mark —— 一些公有方法
-(UIButton *)getBtn{
    return self.btn;
}
#pragma mark —— lazyLoad
-(UIButton *)btn{
    if(!_btn){
        @jobs_weakify(self)
        _btn = [BaseButton.alloc jobsInitBtnByConfiguration:UIButtonConfiguration.plainButtonConfiguration
                                                 background:nil
                                 buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                              textAlignment:NSTextAlignmentCenter
                                           subTextAlignment:NSTextAlignmentCenter
                                                normalImage:nil
                                             highlightImage:nil
                                            attributedTitle:nil
                                    selectedAttributedTitle:nil
                                         attributedSubtitle:nil
                                                      title:nil
                                                   subTitle:nil
                                                  titleFont:nil
                                               subTitleFont:nil
                                                   titleCor:nil
                                                subTitleCor:nil
                                         titleLineBreakMode:NSLineBreakByWordWrapping
                                      subtitleLineBreakMode:NSLineBreakByWordWrapping
                                        baseBackgroundColor:nil
                                            backgroundImage:nil
                                               imagePadding:JobsWidth(0)
                                               titlePadding:JobsWidth(0)
                                             imagePlacement:NSDirectionalRectEdgeTop
                                 contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                   contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                              contentInsets:jobsSameDirectionalEdgeInsets(0)
                                          cornerRadiusValue:JobsWidth(0)
                                            roundingCorners:UIRectCornerAllCorners
                                       roundingCornersRadii:CGSizeZero
                                             layerBorderCor:nil
                                                borderWidth:JobsWidth(0)
                                              primaryAction:nil
                                 longPressGestureEventBlock:nil
                                            clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
        _btn.enabled = NO;/// 这个属性为YES，则优先响应Btn。这个属性为NO，则响应UICollectionViewCell
        [self.contentView addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
    _btn.selected = self.viewModel.jobsSelected;

    _btn.jobsResetBtnTitle(self.viewModel.textModel.text);
    _btn.jobsResetImage(self.viewModel.image);
    _btn.jobsResetBtnTitleCor(self.viewModel.textModel.textCor);
    _btn.jobsResetBtnBgCor(self.viewModel.bgCor);
    [_btn jobsSetBtnTitleFont:self.viewModel.textModel.font ? : UIFontWeightSemiboldSize(12)
                  btnTitleCor: self.viewModel.textModel.textCor ? : JobsBlueColor];
    if (@available(iOS 16.0, *)) {
        _btn.jobsResetImagePadding(self.viewModel.imageTitleSpace);
    } else {
        // Fallback on earlier versions
    }
    if (@available(iOS 16.0, *)) {
        _btn.jobsResetImagePlacement(self.viewModel.buttonEdgeInsetsStyle);
    } else {
        // Fallback on earlier versions
    }
    _btn.cornerCutToCircleWithCornerRadius(self.viewModel.layerCornerRadius ? : JobsWidth(8));
    return _btn;
}

@end
