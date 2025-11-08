//
//  JobsBtnStyleTBVCell.m
//  FM
//
//  Created by User on 8/11/24.
//

#import "JobsBtnStyleTBVCell.h"

@interface JobsBtnStyleTBVCell ()

@end

@implementation JobsBtnStyleTBVCell
/// UIViewModelProtocol
UIViewModelProtocol_synthesize_part1
UIViewModelProtocol_synthesize_part2
/// BaseLayerProtocol
BaseLayerProtocol_synthesize_part3
/// AppToolsProtocol
AppToolsProtocol_synthesize
/// BaseViewProtocol
BaseViewProtocol_synthesize
@synthesize contentEdgeInsets = _contentEdgeInsets;
-(void)layoutSubviews{
    [super layoutSubviews];
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    /// 此时，self.btn.titleLabel 和 self.btn.subtitleLabel 有正确的Frame，可以指导 self.btn.titleTextView 和 self.btn.subtitleTextView 进行下一步的正常工作
    if(self.viewModel) self.button.resetByViewModel(self.viewModel,self.selected);
    if(self.buttonModel) self.button.resetByButtonModel(self.buttonModel,self.selected);
}
#pragma mark —— BaseViewProtocol
/// 获取绑定的数据源
-(UIViewModel *)getViewModel{
    return self.viewModel;
}

-(UIButtonModel *_Nullable)getButtonModel{
    return self.buttonModel;
}
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleDefaultWithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsBtnStyleTBVCell *cell = JobsRegisterDequeueTableViewDefaultCell(JobsBtnStyleTBVCell);
        return cell;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(id _Nullable model) {
        @jobs_strongify(self)
        self.button.data = model;
        if(KindOfViewModelCls(model)) self.viewModel = model;
        if(KindOfButtonModelCls(model)) self.buttonModel = model;
        return self;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(55);
    };
}

-(void)setViewModel:(UIViewModel *)viewModel{
    _viewModel = viewModel;
    @jobs_weakify(self)
    /// viewModel + textModel
    _button.selected = viewModel.jobsSelected;
    _button.enabled = viewModel.jobsEnabled;/// 这个属性为YES，则优先响应Btn。这个属性为NO，则响应UITableViewCell
    _button.resetByViewModel(viewModel,self.selected)
        .onClickBy(^(UIButton *x){
            @jobs_strongify(self)
            if (self.objBlock) self.objBlock(x);
        }).onLongPressGestureBy(^(id data){
            JobsLog(@"");
        });
    /// 背景图
    if(viewModel.normalBgImageURL){
        _button.imageURL(viewModel.normalBgImageURLString.imageURLPlus.jobsUrl)
            .placeholderImage(viewModel.normalImage)
            .options(self.makeSDWebImageOptions)
            .completed(^(UIImage *_Nullable image,
                         NSError *_Nullable error,
                         SDImageCacheType cacheType,
                         NSURL *_Nullable imageURL) {
                if (error) {
                    JobsLog(@"aa图片加载失败: %@-%@", error,imageURL);
                }else{
                    JobsLog(@"图片加载成功");
                }
            }).bgNormalLoad();
    }else _button.jobsResetBtnBgImage(viewModel.backgroundImage);
    /// 图文间距
    if (@available(iOS 16.0, *)) _button.jobsResetImagePadding(viewModel.imageTitleSpace);
    /// 图文相对位置关系
    if (@available(iOS 16.0, *)) _button.jobsResetImagePlacement(viewModel.buttonEdgeInsetsStyle);
    /// 圆切角
    _button.jobsResetBtnCornerRadiusValue(viewModel.layerCornerRadius);
}

-(void)setButtonModel:(UIButtonModel *)buttonModel{
    _buttonModel = buttonModel;
    @jobs_weakify(self)
    _button.selected = buttonModel.jobsSelected;
    _button.enabled = buttonModel.jobsEnabled;
    _button.resetByButtonModel(buttonModel,self.selected)
        .onClickBy(^(UIButton *x){
            @jobs_strongify(self)
            if (self.objBlock) self.objBlock(x);
        }).onLongPressGestureBy(^(id data){
            JobsLog(@"");
        });
    /// 背景图
    if(buttonModel.normalBgImageURL){
        _button.imageURL(buttonModel.normalBgImageURLString.imageURLPlus.jobsUrl)
            .placeholderImage(buttonModel.backgroundImage)
            .options(self.makeSDWebImageOptions)
            .completed(^(UIImage * _Nullable image,
                         NSError * _Nullable error,
                         SDImageCacheType cacheType,
                         NSURL * _Nullable imageURL) {
                if (error) {
                    JobsLog(@"aa图片加载失败: %@-%@", error,imageURL);
                } else {
                    JobsLog(@"图片加载成功");
                }
            }).bgNormalLoad();
    }else _button.jobsResetBtnBgImage(buttonModel.backgroundImage);
    /// 图文间距
    if (@available(iOS 16.0, *)) _button.jobsResetImagePadding(buttonModel.imagePadding);
    /// 图文相对位置关系
    if (@available(iOS 16.0, *)) _button.jobsResetImagePlacement(buttonModel.imagePlacement);
    /// 圆切角
    _button.jobsResetBtnCornerRadiusValue(buttonModel.cornerRadiusValue);
}
#pragma mark —— BaseButtonProtocol
-(JobsRetTableViewCellByUIEdgeInsetsBlock _Nonnull)byContentEdgeInsets{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UIEdgeInsets insets){
        @jobs_strongify(self)
        self.contentEdgeInsets = insets;
        return self;
    };
}
#pragma mark —— lazyLoad
-(BaseButton *)button{
    if(!_button){
        @jobs_weakify(self)
        _button = BaseButton.jobsInit();
        /// enabled 是 userInteractionEnabled 的子集
        /// enabled = NO ,则不响应：-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event（此方法不要写在分类里面）
        _button.enabled = NO; /// 这个属性为YES，则优先响应Btn。这个属性为NO，则响应 UITableViewCell 协议方法
        _button.userInteractionEnabled = YES;
        _button.onClickBy(^(UIButton *x){
            @jobs_strongify(self)
            if(self.objBlock) self.objBlock(x);
            x.selected = !x.selected;
            if(self.viewModel) x.resetByViewModel(self.viewModel,self.selected);
            if(self.buttonModel) x.resetByButtonModel(self.buttonModel,self.selected);
        });
        [self.contentView.addSubview(_button) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(self.contentEdgeInsets);/// 如果这里用self.contentView，在某些情况下，约束会失灵。因为self.contentView的生命周期的缘故，还没有完全展开
        }];
    }return _button;
}

@end
