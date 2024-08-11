//
//  JobsBtnStyleTBVCell.m
//  FM
//
//  Created by User on 8/11/24.
//

#import "JobsBtnStyleTBVCell.h"

@interface JobsBtnStyleTBVCell ()
/// UI
@property(nonatomic,strong)BaseButton *btn;
/// Data

@end

@implementation JobsBtnStyleTBVCell
#pragma mark —— @synthesize UIViewModelProtocol
UIViewModelProtocol_synthesize
-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleDefaultWithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsBtnStyleTBVCell *cell = (JobsBtnStyleTBVCell *)tableView.tableViewCellClass(JobsBtnStyleTBVCell.class,@"");
        if (!cell) {
            cell = JobsBtnStyleTBVCell.initTableViewCellWithStyle(UITableViewCellStyleDefault);
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
    //    self.viewModel.buttonModel;
        self.btn.alpha = 1;
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
#pragma mark —— BaseViewProtocol
/// 获取绑定的数据源
-(UIViewModel *)getViewModel{
    return _viewModel;
}
#pragma mark —— lazyLoad
-(BaseButton *)btn{
    @jobs_weakify(self)
    if(!_btn){
        _btn = [BaseButton.alloc jobsInitBtnByConfiguration:self.viewModel.buttonModel.btnConfiguration
                                                 background:self.viewModel.buttonModel.background
                                 buttonConfigTitleAlignment:self.viewModel.buttonModel.buttonConfigTitleAlignment
                                              textAlignment:self.viewModel.buttonModel.textAlignment
                                           subTextAlignment:self.viewModel.buttonModel.subTextAlignment
                                                normalImage:self.viewModel.buttonModel.normalImage
                                             highlightImage:self.viewModel.buttonModel.highlightImage
                                            attributedTitle:self.viewModel.buttonModel.attributedTitle
                                    selectedAttributedTitle:self.viewModel.buttonModel.selectedAttributedTitle
                                         attributedSubtitle:self.viewModel.buttonModel.attributedSubtitle
                                                      title:self.viewModel.buttonModel.title
                                                   subTitle:self.viewModel.buttonModel.subTitle
                                                  titleFont:self.viewModel.buttonModel.titleFont
                                               subTitleFont:self.viewModel.buttonModel.subTitleFont
                                                   titleCor:self.viewModel.buttonModel.titleCor
                                                subTitleCor:self.viewModel.buttonModel.subTitleCor
                                         titleLineBreakMode:self.viewModel.buttonModel.titleLineBreakMode
                                      subtitleLineBreakMode:self.viewModel.buttonModel.subtitleLineBreakMode
                                        baseBackgroundColor:self.viewModel.buttonModel.baseBackgroundColor
                                            backgroundImage:self.viewModel.buttonModel.backgroundImage
                                               imagePadding:self.viewModel.buttonModel.imagePadding
                                               titlePadding:self.viewModel.buttonModel.titlePadding
                                             imagePlacement:self.viewModel.buttonModel.imagePlacement
                                 contentHorizontalAlignment:self.viewModel.buttonModel.contentHorizontalAlignment
                                   contentVerticalAlignment:self.viewModel.buttonModel.contentVerticalAlignment
                                              contentInsets:self.viewModel.buttonModel.contentInsets
                                          cornerRadiusValue:self.viewModel.buttonModel.cornerRadiusValue
                                            roundingCorners:self.viewModel.buttonModel.roundingCorners
                                       roundingCornersRadii:self.viewModel.buttonModel.roundingCornersRadii
                                             layerBorderCor:self.viewModel.buttonModel.layerBorderCor
                                                borderWidth:self.viewModel.buttonModel.borderWidth
                                              primaryAction:self.viewModel.buttonModel.primaryAction
                                 longPressGestureEventBlock:self.viewModel.buttonModel.longPressGestureEventBlock ? : ^(id  _Nullable weakSelf,
                                                                                                                        id  _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
        }
                                            clickEventBlock:self.viewModel.buttonModel.clickEventBlock ? : ^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
        [self.contentView addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _btn;
}

@end
