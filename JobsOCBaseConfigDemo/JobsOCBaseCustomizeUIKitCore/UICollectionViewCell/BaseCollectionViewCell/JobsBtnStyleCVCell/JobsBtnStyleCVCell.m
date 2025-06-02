//
//  JobsBtnStyleCVCell.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/16.
//

#import "JobsBtnStyleCVCell.h"

@interface JobsBtnStyleCVCell ()

@end

@implementation JobsBtnStyleCVCell
/// UIViewModelProtocol
UIViewModelProtocol_synthesize_part1
UIViewModelProtocol_synthesize_part2
/// BaseViewProtocol
BaseViewProtocol_synthesize
/// BaseLayerProtocol
BaseLayerProtocol_synthesize_part3
/// AppToolsProtocol
AppToolsProtocol_synthesize
#pragma mark —— 复写父类相关方法和属性
-(void)layoutSubviews{
    [super layoutSubviews];
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— 复写系统方法
@synthesize selected = _selected;
-(BOOL)isSelected{
    return _selected;
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    _selected = selected;
    self.button.selected = selected;
    
    if(self.buttonModel){
        self.button.jobsResetBtnTitle(selected ? (self.buttonModel.selectedTitle ? : self.buttonModel.title) : self.buttonModel.title);
        self.button.jobsResetBtnTitleCor(selected ? (self.buttonModel.selectedTitleCor ? : self.buttonModel.titleCor) : self.buttonModel.titleCor);
        self.button.jobsResetBtnTitleFont(selected ? (self.buttonModel.selectedTitleFont ? : self.buttonModel.titleFont) : self.buttonModel.titleFont);
        
        self.button.jobsResetBtnSubTitle(selected ? (self.buttonModel.selectedSubTitle ? : self.buttonModel.subTitle) : self.buttonModel.subTitle);
        self.button.jobsResetBtnSubTitleCor(selected ? (self.buttonModel.selectedTitleCor ? : self.buttonModel.subTitleCor) : self.buttonModel.subTitleCor);
        self.button.jobsResetBtnSubTitleFont(selected ? (self.buttonModel.selectedSubTitleFont ? : self.buttonModel.subTitleFont) : self.buttonModel.subTitleFont);

        if(self.buttonModel.attributedTitle || self.buttonModel.selectedAttributedTitle){
            self.button.jobsResetAttributedTitle(selected ? (self.buttonModel.selectedAttributedTitle ? : self.buttonModel.attributedTitle): self.buttonModel.attributedTitle);
        }
        
        if(self.buttonModel.attributedSubTitle || self.buttonModel.selectedAttributedSubTitle){
            self.button.jobsResetAttributedSubtitle(selected ? (self.buttonModel.selectedAttributedSubTitle ? : self.buttonModel.attributedSubTitle) : self.buttonModel.attributedSubTitle);
        }

        self.button.jobsResetBtnImage(selected ? (self.buttonModel.highlightImage ? : self.buttonModel.normalImage) : self.buttonModel.normalImage);
        self.button.jobsResetBtnBgImage(selected ? (self.buttonModel.highlightBackgroundImage ? : self.buttonModel.backgroundImage) : self.buttonModel.backgroundImage);
        self.button.jobsResetBtnBgCor(selected ? (self.buttonModel.selectedBaseBackgroundColor ? : self.buttonModel.baseBackgroundColor) : self.buttonModel.baseBackgroundColor);
    }
    
    if(self.viewModel){
        self.button.jobsResetBtnTitle(selected ? (self.viewModel.selectedTitle ? : self.viewModel.title) : self.viewModel.title);
        self.button.jobsResetBtnTitleCor(selected ? (self.viewModel.selectedTitleCor ? : self.viewModel.titleCor) : self.viewModel.titleCor);
        self.button.jobsResetBtnTitleFont(selected ? (self.viewModel.selectedTitleFont ? : self.viewModel.titleFont) : self.viewModel.titleFont);
        
        self.button.jobsResetBtnSubTitle(selected ? (self.viewModel.selectedSubTitle ? : self.viewModel.subTitle) : self.viewModel.subTitle);
        self.button.jobsResetBtnSubTitleCor(selected ? (self.viewModel.selectedTitleCor ? : self.viewModel.subTitleCor) : self.viewModel.subTitleCor);
        self.button.jobsResetBtnSubTitleFont(selected ? (self.viewModel.selectedSubTitleFont ? : self.viewModel.subTitleFont) : self.viewModel.subTitleFont);
        
        if(self.viewModel.attributedTitle || self.viewModel.selectedAttributedTitle){
            self.button.jobsResetAttributedTitle(selected ? (self.viewModel.selectedAttributedTitle ? : self.viewModel.attributedTitle): self.viewModel.attributedTitle);
        }
        
        if(self.viewModel.attributedSubTitle || self.viewModel.selectedAttributedSubTitle){
            self.button.jobsResetAttributedSubtitle(selected ? (self.viewModel.selectedAttributedSubTitle ? : self.viewModel.attributedSubTitle) : self.viewModel.attributedSubTitle);
        }
        
        self.button.jobsResetBtnImage(selected ? (self.viewModel.highlightImage ? : self.viewModel.normalImage) : self.viewModel.normalImage);
        self.button.jobsResetBtnBgImage(selected ? (self.viewModel.highlightBackgroundImage ? : self.viewModel.backgroundImage) : self.viewModel.backgroundImage);
        self.button.jobsResetBtnBgCor(selected ? (self.viewModel.selectedBaseBackgroundColor ? : self.viewModel.baseBackgroundColor) : self.viewModel.baseBackgroundColor);
    }
}
#pragma mark —— 一些公有方法
-(jobsByIDBlock _Nonnull)makeUp{
    @jobs_weakify(self)
    return ^(id _Nullable model){
        @jobs_strongify(self)
        if(KindOfViewModelCls(model)){
            self.viewModel = model;
            if(self.viewModel.textModel.text.isHTMLString ||
               self.viewModel.subTextModel.text.isHTMLString){
                self.webView.jobsVisible = YES;
            }else{
                self.button.data = model;
            }
        }
        if(KindOfButtonModelCls(model)){
            self.buttonModel = model;
            if(self.buttonModel.title.isHTMLString ||
               self.buttonModel.subTitle.isHTMLString){
                self.webView.jobsVisible = YES;
            }else{
                self.button.data = model;
            }
        }
    };
}
#pragma mark —— 一些私有方法
/// 数据源UIViewModel设置UIButton
-(JobsReturnButtonByViewModelBlock _Nonnull)setBtnByViewModel{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(__kindof UIViewModel *_Nullable viewModel){
        @jobs_strongify(self)
        /// viewModel + textModel
        self.button.selected = viewModel.jobsSelected;
        self.button.enabled = viewModel.jobsEnabled;/// 这个属性为YES，则优先响应Btn。这个属性为NO，则响应UITableViewCell
        self.button.resetByViewModel(viewModel,self.selected)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        /// 背景图
        if(viewModel.normalBgImageURL){
            self.button.imageURL(viewModel.normalBgImageURLString.imageURLPlus.jobsUrl)
                .placeholderImage(viewModel.backgroundImage)
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
        }else self.button.jobsResetBtnBgImage(viewModel.backgroundImage);
        /// 图文间距
        if (@available(iOS 16.0, *)) self.button.jobsResetImagePadding(viewModel.imageTitleSpace);
        /// 图文相对位置关系
        if (@available(iOS 16.0, *)) self.button.jobsResetImagePlacement(viewModel.buttonEdgeInsetsStyle);
        /// 圆切角
        self.button.jobsResetBtnCornerRadiusValue(viewModel.layerCornerRadius);
        return self.button;
    };
}
/// 数据源UIButtonModel设置UIButton
-(JobsReturnButtonByButtonModelBlock _Nonnull)setBtnByButtonModel{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(__kindof UIButtonModel *_Nullable buttonModel){
        @jobs_strongify(self)
        self.button.selected = buttonModel.jobsSelected;
        self.button.enabled = buttonModel.jobsEnabled;
        self.button.resetByButtonModel(buttonModel,self.selected)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        /// 背景图
        if(buttonModel.normalBgImageURL){
            self.button.imageURL(buttonModel.normalBgImageURLString.imageURLPlus.jobsUrl)
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
        }else self.button.jobsResetBtnBgImage(buttonModel.backgroundImage);
        /// 图文间距
        if (@available(iOS 16.0, *)) self.button.jobsResetImagePadding(buttonModel.imagePadding);
        /// 图文相对位置关系
        if (@available(iOS 16.0, *)) self.button.jobsResetImagePlacement(buttonModel.imagePlacement);
        /// 圆切角
        self.button.jobsResetBtnCornerRadiusValue(buttonModel.cornerRadiusValue);
        return self.button;
    };
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    JobsBtnStyleCVCell *cell = JobsRegisterDequeueCollectionViewCell(JobsBtnStyleCVCell);
//    cell.contentView.layer
//        .cornerRadiusBy(JobsWidth(8))
//        .borderWidthBy(JobsWidth(1))
//        .borderColorBy(RGBA_COLOR(255, 225, 144, 1))
//        .masksToBoundsBy(YES);
//    cell.layer
//        .cornerRadiusBy(JobsWidth(8))
//        .borderWidthBy(JobsWidth(1))
//        .borderColorBy(RGBA_COLOR(255, 225, 144, 1))
//        .masksToBoundsBy(YES);
    cell.indexPath = indexPath;
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(id _Nullable model) {
        @jobs_strongify(self)
        self.makeUp(model);
        return self;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)cellSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(106), JobsWidth(30));
    };
}

-(void)setViewModel:(UIViewModel *)viewModel{
    _viewModel = viewModel;
    self.setBtnByViewModel(_viewModel);
}

-(void)setButtonModel:(UIButtonModel *)buttonModel{
    _buttonModel = buttonModel;
    self.setBtnByButtonModel(buttonModel);
}
#pragma mark —— BaseViewProtocol
-(UIViewModel *_Nullable)getViewModel{ return self.viewModel; }
-(UIButtonModel *_Nullable)getButtonModel{ return self.buttonModel; }
#pragma mark —— lazyLoad
-(BaseButton *)button{
    if(!_button){
        @jobs_weakify(self)
        _button = BaseButton.jobsInit()
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if(self.objBlock) self.objBlock(x);
            });
        /// enabled 是 userInteractionEnabled 的子集
        /// enabled = NO ,则不响应：-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event（此方法不要写在分类里面）
        _button.enabled = NO; /// 这个属性为YES，则优先响应Btn。这个属性为NO，则响应 UITableViewCell 协议方法
        _button.userInteractionEnabled = YES;
        self.contentView
            .addSubview(_button)
            .masonryBy(self.masonryBlock);
    }return _button;
}

-(WKWebView *)webView{
    [self->_webView removeFromSuperview];
    self->_webView = nil;
    if(self.viewModel){
        _webView = self.makeWebViewByString(isValue(self.viewModel.textModel.text) ? self.viewModel.textModel.text : self.viewModel.subTextModel.text);
    }
    if(self.buttonModel){
        _webView = self.makeWebViewByString(isValue(self.buttonModel.title) ? self.buttonModel.title : self.buttonModel.subTitle);
    }
    _webView.byBgCor(JobsClearColor);
    _webView.opaque = NO; // 设置不透明为 NO，确保背景透明
    self.contentView
        .addSubview(_webView)
        .masonryBy(self.masonryBlock);
    self.refresh();
    return _webView;
}

-(jobsByMASConstraintMakerBlock _Nullable)masonryBlock{
    if(!_masonryBlock){
        @jobs_weakify(self)
        _masonryBlock = ^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.edges.equalTo(self.contentView);///
            /// 如果这里用self.contentView，在某些情况下，约束会失灵。因为self.contentView的生命周期的缘故，还没有完全展开
        };
    }return _masonryBlock;
}

@end
