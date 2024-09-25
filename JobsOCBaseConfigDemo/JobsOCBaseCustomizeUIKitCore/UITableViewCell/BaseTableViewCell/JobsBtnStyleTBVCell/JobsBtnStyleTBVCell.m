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
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        if(KindOfViewModelCls(model)){
            self.viewModel = model;
        }
        if(KindOfButtonModelCls(model)){
            self.buttonModel = model;
        }
        
        self.btn.alpha = 1;
        self.btn.data = model;
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
    if(!_btn){
        @jobs_weakify(self)
        UIButtonModel *buttonModel = UIButtonModel.new;
        _btn = BaseButton.initByButtonModel(buttonModel);
        _btn.enabled = NO;/// 这个属性为YES，则优先响应Btn。这个属性为NO，则响应UICollectionViewCell
        [self.contentView addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);/// 如果这里用self.contentView，在某些情况下，约束会失灵。因为self.contentView的生命周期的缘故，还没有完全展开
        }];
    }
    
    if(self.viewModel){
        _btn.selected = self.viewModel.jobsSelected;
        /// 主标题
        _btn.jobsResetBtnTitle(self.viewModel.textModel.text);
        _btn.jobsResetBtnTitleCor(self.viewModel.textModel.textCor);
        [_btn jobsSetBtnTitleFont:self.viewModel.textModel.font ? : UIFontWeightSemiboldSize(12)
                      btnTitleCor: self.viewModel.textModel.textCor ? : JobsBlueColor];
        /// 子标题
        _btn.jobsResetSubTitle(self.viewModel.subTextModel.text);
        [_btn jobsSetBtnSubTitleFont:self.viewModel.subTextModel.font ? : UIFontWeightSemiboldSize(12)
                      btnSubTitleCor: self.viewModel.subTextModel.textCor ? : JobsBlueColor];
        /// 按钮图
        _btn.jobsResetImage(self.viewModel.image);
        /// 背景色
        _btn.jobsResetBtnBgCor(self.viewModel.bgCor);
        /// 图文间距
        if (@available(iOS 16.0, *)) {
            _btn.jobsResetImagePlacement(self.viewModel.imageTitleSpace);
        } else {
            // Fallback on earlier versions
        }
        /// 图文相对位置关系
        if (@available(iOS 16.0, *)) {
            _btn.jobsResetImagePlacement(self.viewModel.buttonEdgeInsetsStyle);
        } else {
            // Fallback on earlier versions
        }
        /// 圆切角
        _btn.jobsResetBtnCornerRadiusValue(self.viewModel.layerCornerRadius);
    }
    
    if(self.buttonModel){
        _btn.selected = self.buttonModel.jobsSelected;
        /// 背景色
        _btn.jobsResetBtnBgCor(self.buttonModel.baseBackgroundColor);
        /// 背景图
        _btn.jobsResetBtnBgImage(self.buttonModel.backgroundImage);
        /// 主标题
        _btn.jobsResetBtnTitle(self.buttonModel.title);
        _btn.jobsResetBtnTitleCor(self.buttonModel.titleCor);
        /// 按钮图
        _btn.jobsResetImage(self.buttonModel.normalImage);
        /// 子标题
        _btn.jobsResetSubTitle(self.buttonModel.subTitle);
        [_btn jobsSetBtnSubTitleFont:self.buttonModel.subTitleFont ? : UIFontWeightSemiboldSize(12)
                      btnSubTitleCor: self.buttonModel.subTitleCor ? : JobsBlueColor];
        /// 图文间距
        if (@available(iOS 16.0, *)) {
            _btn.jobsResetImagePlacement(self.buttonModel.imagePadding);
        } else {
            // Fallback on earlier versions
        }
        /// 图文相对位置关系
        if (@available(iOS 16.0, *)) {
            _btn.jobsResetImagePlacement(self.buttonModel.imagePlacement);
        } else {
            // Fallback on earlier versions
        }
        /// 圆切角
        _btn.jobsResetBtnCornerRadiusValue(self.buttonModel.cornerRadiusValue);
    }return _btn;
}

@end
