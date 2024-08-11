//
//  JobsBtnStyleTBVCell.m
//  MataShop
//
//  Created by Jobs Hi on 10/14/23.
//

#import "JobsBtnsStyleTBVCell.h"

@interface JobsBtnsStyleTBVCell ()
/// UI
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UIButton *rightBtn;

@end

@implementation JobsBtnsStyleTBVCell
#pragma mark —— @synthesize UIViewModelProtocol
UIViewModelProtocol_synthesize
-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleDefaultWithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsBtnsStyleTBVCell *cell = (JobsBtnsStyleTBVCell *)tableView.tableViewCellClass(JobsBtnsStyleTBVCell.class,@"");
        if (!cell) {
            cell = JobsBtnsStyleTBVCell.initTableViewCellWithStyle(UITableViewCellStyleDefault);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }return cell;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)richElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        self.leftBtn.alpha = 1;
        self.rightBtn.alpha = 1;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)cellHeightWithModel:(UIViewModel *_Nullable)model{
    return JobsWidth(55);
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGFloat)cellHeightWithModel:(UIViewModel *_Nullable)model{
    return [self.class cellHeightWithModel:model];
}

-(UIButton *)getLeftBtn{
    return self.leftBtn;
}

-(UIButton *)getRightBtn{
    return self.rightBtn;
}
#pragma mark —— BaseViewProtocol
/// 获取绑定的数据源
-(UIViewModel *)getViewModel{
    return _viewModel;
}
#pragma mark —— lazyLoad
-(UIButton *)leftBtn{
    if(!_leftBtn){
        @jobs_weakify(self)
        _leftBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
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
                                            baseBackgroundColor:JobsWhiteColor
                                                backgroundImage:nil
                                                   imagePadding:JobsWidth(0)
                                                   titlePadding:JobsWidth(0)
                                                 imagePlacement:NSDirectionalRectEdgeNone
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
        _leftBtn.tag = 1;
        [self.contentView addSubview:_leftBtn];
        [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(JobsWidth(15));
            make.height.mas_equalTo(JobsWidth(50));
        }];
    }
    _leftBtn.data = self.viewModel;
    _leftBtn.jobsResetBtnTitle(self.viewModel.buttonModel.title);
    _leftBtn.selected = self.viewModel.buttonModel.jobsSelected;
    _leftBtn.jobsResetBtnImage(_rightBtn.selected ? self.viewModel.buttonModel.highlightImage : self.viewModel.buttonModel.normalImage);
    _leftBtn.jobsResetImagePlacement(NSDirectionalRectEdgeLeading);
    _leftBtn.jobsResetImagePadding(JobsWidth(5));
    _leftBtn.jobsResetTitleFont(self.viewModel.buttonModel.titleFont);
    _leftBtn.jobsResetBtnTitleCor(self.viewModel.buttonModel.titleCor);
    _leftBtn.makeBtnLabelByShowingType(UILabelShowingType_03);
    return _leftBtn;
}

-(UIButton *)rightBtn{
    if(!_rightBtn){
        @jobs_weakify(self)
        _rightBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
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
                                             baseBackgroundColor:JobsWhiteColor
                                                 backgroundImage:nil
                                                    imagePadding:JobsWidth(0)
                                                    titlePadding:JobsWidth(0)
                                                  imagePlacement:NSDirectionalRectEdgeNone
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
        _rightBtn.tag = 2;
        [self.contentView addSubview:_rightBtn];
        [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.contentView).offset(JobsWidth(-15));
            make.height.mas_equalTo(JobsWidth(50));
        }];
    }
    _rightBtn.data = self.viewModel;
    _rightBtn.jobsResetBtnTitle(self.viewModel.subButtonModel.title);
    _rightBtn.selected = self.viewModel.subButtonModel.jobsSelected;
    _rightBtn.jobsResetBtnImage(_rightBtn.selected ? self.viewModel.subButtonModel.highlightImage : self.viewModel.subButtonModel.normalImage);
    _rightBtn.jobsResetImagePlacement(NSDirectionalRectEdgeLeading);
    _rightBtn.jobsResetImagePadding(JobsWidth(5));
    _rightBtn.jobsResetTitleFont(self.viewModel.subButtonModel.titleFont);
    _rightBtn.jobsResetBtnTitleCor(self.viewModel.subButtonModel.titleCor);
    _rightBtn.makeBtnLabelByShowingType(UILabelShowingType_03);
    return _rightBtn;
}

@end
