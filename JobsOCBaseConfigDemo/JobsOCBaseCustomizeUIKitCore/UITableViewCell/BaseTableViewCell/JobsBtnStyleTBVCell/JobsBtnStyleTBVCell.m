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
UIViewModelProtocol_self_synthesize
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
+(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(55);
    };
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
        _btn = BaseButton.jobsInit();
        _btn.enabled = NO;/// 这个属性为YES，则优先响应Btn。这个属性为NO，则响应UICollectionViewCell
        [self.contentView addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);/// 如果这里用self.contentView，在某些情况下，约束会失灵。因为self.contentView的生命周期的缘故，还没有完全展开
        }];
    }
    if(self.viewModel){
        _btn.selected = self.viewModel.jobsSelected;
        _btn.enabled = self.viewModel.jobsEnabled;/// 这个属性为YES，则优先响应Btn。这个属性为NO，则响应UITableViewCell
        /// 主标题
        _btn.jobsResetBtnTitle(self.viewModel.textModel.text);
        _btn.jobsResetBtnTitleCor(self.viewModel.textModel.textCor);
        _btn.jobsResetBtnTitleFont(self.viewModel.textModel.font);
        /// 子标题
        _btn.jobsResetBtnSubTitle(self.viewModel.subTextModel.text);
        _btn.jobsResetBtnSubTitleCor(self.viewModel.subTextModel.textCor);
        _btn.jobsResetBtnSubTitleFont(self.viewModel.subTextModel.font);
        /// 点击事件
        [_btn jobsBtnClickEventBlock:self.viewModel.clickEventBlock ? : ^id _Nullable(BaseButton *_Nullable x) {
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
        /// 长按事件
        [_btn jobsBtnLongPressGestureEventBlock:self.viewModel.longPressGestureEventBlock ? : ^id(__kindof UIButton *x) {
//            @jobs_strongify(self)
            return nil;
        }];
        /// 背景色
        _btn.jobsResetBtnBgCor(self.viewModel.bgCor);
        /// 背景图
        if(self.viewModel.normalBgImageURL){
            self->_btn
                .imageURL(self.viewModel.normalBgImageURLString.imageURLPlus.jobsUrl)
                .placeholderImage(self.viewModel.normalImage)
                .options(self.makeSDWebImageOptions)
                .completed(^(UIImage * _Nullable image,
                             NSError * _Nullable error,
                             SDImageCacheType cacheType,
                             NSURL * _Nullable imageURL) {
                    if (error) {
                        NSLog(@"aa图片加载失败: %@-%@", error,imageURL);
                    } else {
                        NSLog(@"图片加载成功");
                    }
                }).bgNormalLoad();
        }else{
            _btn.jobsResetBtnBgImage(self.viewModel.backgroundImage);
        }
        /// 按钮图
        _btn.jobsResetBtnImage(self.viewModel.image);
        /// 图文间距
        if (@available(iOS 16.0, *)) {
            _btn.jobsResetImagePadding(self.viewModel.imageTitleSpace);
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
        _btn.enabled = self.buttonModel.enabled;
        /// 主标题
        _btn.jobsResetBtnTitle(self.buttonModel.title);
        _btn.jobsResetBtnTitleCor(self.buttonModel.titleCor);
        _btn.jobsResetBtnTitleFont(self.buttonModel.titleFont);
        /// 子标题
        _btn.jobsResetBtnSubTitle(self.buttonModel.subTitle);
        _btn.jobsResetBtnSubTitleCor(self.buttonModel.subTitleCor);
        _btn.jobsResetBtnSubTitleFont(self.buttonModel.subTitleFont);
        /// 背景图
        if(self.buttonModel.normalBgImageURL){
            self->_btn
                .imageURL(self.buttonModel.normalBgImageURLString.imageURLPlus.jobsUrl)
                .placeholderImage(self.viewModel.backgroundImage)
                .options(self.makeSDWebImageOptions)
                .completed(^(UIImage * _Nullable image,
                             NSError * _Nullable error,
                             SDImageCacheType cacheType,
                             NSURL * _Nullable imageURL) {
                    if (error) {
                        NSLog(@"aa图片加载失败: %@-%@", error,imageURL);
                    } else {
                        NSLog(@"图片加载成功");
                    }
                }).bgNormalLoad();
        }else{
            _btn.jobsResetBtnBgImage(self.buttonModel.backgroundImage);
        }
        /// 按钮图
        _btn.jobsResetBtnImage(self.buttonModel.normalImage);
        /// 背景色
        _btn.jobsResetBtnBgCor(self.buttonModel.baseBackgroundColor);
        /// 图文间距
        if (@available(iOS 16.0, *)) {
            _btn.jobsResetImagePadding(self.buttonModel.imagePadding);
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
