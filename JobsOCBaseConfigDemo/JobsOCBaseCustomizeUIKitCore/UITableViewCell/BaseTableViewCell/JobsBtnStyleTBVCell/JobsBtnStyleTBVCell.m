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
UIViewModelProtocol_synthesize_part1
UIViewModelProtocol_synthesize_part2
BaseLayerProtocol_synthesize_part3
AppToolsProtocol_synthesize
-(void)layoutSubviews{
    [super layoutSubviews];
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    /// 此时，self.btn.titleLabel 和 self.btn.subtitleLabel 有正确的Frame，可以指导 self.btn.titleTextView 和 self.btn.subtitleTextView 进行下一步的正常工作
    if(self.viewModel.textModel.attributedTitle){
        self.btn.jobsResetBtnTextViewNormalAttributedTitle(self.viewModel.textModel.attributedTitle);
    }
    
    if(self.viewModel.textModel.attributedSubTitle){
        self.btn.jobsResetBtnTextViewNormalAttributedSubTitle(self.viewModel.textModel.attributedSubTitle);
    }
    
    if(self.buttonModel.attributedTitle){
        self.btn.jobsResetBtnTextViewNormalAttributedTitle(self.buttonModel.attributedTitle);
    }
    
    if(self.buttonModel.attributedSubTitle){
        self.btn.jobsResetBtnTextViewNormalAttributedSubTitle(self.buttonModel.attributedSubTitle);
    }
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
-(jobsByIDBlock _Nonnull)jobsRichElementsCellBy{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        self.btn.data = model;
        if(KindOfViewModelCls(model)){
            self.viewModel = model;
        }
        if(KindOfButtonModelCls(model)){
            self.buttonModel = model;
        }
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(55);
    };
}

-(void)setViewModel:(UIViewModel *)viewModel{
    _viewModel = viewModel;
    @jobs_weakify(self)
    /// viewModel + textModel
    _btn.selected = viewModel.jobsSelected;
    _btn.enabled = viewModel.jobsEnabled;/// 这个属性为YES，则优先响应Btn。这个属性为NO，则响应UITableViewCell
    if(viewModel.textModel.attributedTitle){/// 主标题（富文本）
        _btn.jobsResetBtnNormalAttributedTitle(viewModel.textModel.attributedTitle);
    }else{/// 主标题（普通）
        _btn.jobsResetBtnTitle(viewModel.textModel.text);
        _btn.jobsResetBtnTitleCor(viewModel.textModel.textCor);
        _btn.jobsResetBtnTitleFont(viewModel.textModel.font);
    }
    if(self.viewModel.subTextModel.attributedSubTitle){/// 子标题（富文本）
        _btn.jobsResetBtnNormalAttributedSubTitle(viewModel.subTextModel.attributedSubTitle);
    }else{/// 子标题
        _btn.jobsResetBtnSubTitle(viewModel.subTextModel.text);
        _btn.jobsResetBtnSubTitleCor(viewModel.subTextModel.textCor);
        _btn.jobsResetBtnSubTitleFont(viewModel.subTextModel.font);
    }
    /// 点击事件
    [_btn jobsBtnClickEventBlock:viewModel.clickEventBlock ? : ^id _Nullable(BaseButton *_Nullable x) {
        @jobs_strongify(self)
        if (self.objectBlock) self.objectBlock(x);
        return nil;
    }];
    /// 长按事件
    [_btn jobsBtnLongPressGestureEventBlock:viewModel.longPressGestureEventBlock ? : ^id(__kindof UIButton *x) {
//        @jobs_strongify(self)
        return nil;
    }];
    /// 背景色
    _btn.jobsResetBtnBgCor(viewModel.bgCor);
    /// 背景图
    if(viewModel.normalBgImageURL){
        self->_btn
            .imageURL(viewModel.normalBgImageURLString.imageURLPlus.jobsUrl)
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
    }else{
        _btn.jobsResetBtnBgImage(viewModel.backgroundImage);
    }
    /// 按钮图
    _btn.jobsResetBtnImage(self.selected ? viewModel.selectedImage_ : viewModel.image);
    /// 图文间距
    if (@available(iOS 16.0, *)) {
        _btn.jobsResetImagePadding(viewModel.imageTitleSpace);
    } else {
        // Fallback on earlier versions
    }
    /// 图文相对位置关系
    if (@available(iOS 16.0, *)) {
        _btn.jobsResetImagePlacement(viewModel.buttonEdgeInsetsStyle);
    } else {
        // Fallback on earlier versions
    }
    /// 圆切角
    _btn.jobsResetBtnCornerRadiusValue(viewModel.layerCornerRadius);
}

-(void)setButtonModel:(UIButtonModel *)buttonModel{
    _buttonModel = buttonModel;
    _btn.selected = buttonModel.jobsSelected;
    _btn.enabled = buttonModel.jobsEnabled;
    if(buttonModel.attributedTitle){/// 主标题（富文本）
        _btn.jobsResetBtnNormalAttributedTitle(buttonModel.attributedTitle);
    }else{/// 主标题（普通文本）
        _btn.jobsResetBtnTitle(buttonModel.title);
        _btn.jobsResetBtnTitleCor(buttonModel.titleCor);
        _btn.jobsResetBtnTitleFont(buttonModel.titleFont);
    }
    if(buttonModel.attributedSubTitle){/// 子标题（富文本）
        _btn.jobsResetBtnNormalAttributedSubTitle(buttonModel.attributedSubTitle);
    }else{/// 子标题（普通文本）
        _btn.jobsResetBtnSubTitle(buttonModel.subTitle);
        _btn.jobsResetBtnSubTitleCor(buttonModel.subTitleCor);
        _btn.jobsResetBtnSubTitleFont(buttonModel.subTitleFont);
    }
    /// 背景图
    if(buttonModel.normalBgImageURL){
        self->_btn
            .imageURL(buttonModel.normalBgImageURLString.imageURLPlus.jobsUrl)
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
    }else{
        _btn.jobsResetBtnBgImage(buttonModel.backgroundImage);
    }
    /// 按钮图
    _btn.jobsResetBtnImage(self.selected ? buttonModel.highlightImage : buttonModel.normalImage);
    /// 背景色
    _btn.jobsResetBtnBgCor(buttonModel.baseBackgroundColor);
    /// 图文间距
    if (@available(iOS 16.0, *)) {
        _btn.jobsResetImagePadding(buttonModel.imagePadding);
    } else {
        // Fallback on earlier versions
    }
    /// 图文相对位置关系
    if (@available(iOS 16.0, *)) {
        _btn.jobsResetImagePlacement(buttonModel.imagePlacement);
    } else {
        // Fallback on earlier versions
    }
    /// 圆切角
    _btn.jobsResetBtnCornerRadiusValue(buttonModel.cornerRadiusValue);
}
#pragma mark —— lazyLoad
-(BaseButton *)btn{
    if(!_btn){
        @jobs_weakify(self)
        _btn = BaseButton.jobsInit();
        /// enabled 是 userInteractionEnabled 的子集
        /// enabled = NO ,则不响应：-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event（此方法不要写在分类里面）
        _btn.enabled = NO; /// 这个属性为YES，则优先响应Btn。这个属性为NO，则响应 UITableViewCell 协议方法
        _btn.userInteractionEnabled = YES;
        _btn.onClickBy(^(UIButton *x){
            @jobs_strongify(self)
            if(self.objectBlock) self.objectBlock(x);
        });[self.contentView addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);/// 如果这里用self.contentView，在某些情况下，约束会失灵。因为self.contentView的生命周期的缘故，还没有完全展开
        }];
    }return _btn;
}

@end
