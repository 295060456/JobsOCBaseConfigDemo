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
-(void)layoutSubviews{
    [super layoutSubviews];
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    /// 此时，self.button.titleLabel 和 self.button.subtitleLabel 有正确的Frame，可以指导 self.button.titleTextView 和 self.button.subtitleTextView 进行下一步的正常工作
    if(self.viewModel) self.button.resetByViewModel(self.viewModel,self.selected);
    if(self.buttonModel) self.button.resetByButtonModel(self.buttonModel,self.selected);
}
#pragma mark —— 一些共有方法
-(jobsByIDBlock _Nonnull)makeUp{
    @jobs_weakify(self)
    return ^(id _Nullable model){
        @jobs_strongify(self)
        if(KindOfViewModelCls(model)){
            if(self.viewModel.textModel.text.isHTMLString ||
               self.viewModel.subTextModel.text.isHTMLString){
                self.webView.jobsVisible = YES;
            }else{
                self.button.data = model;
            }self.viewModel = model;
        }
        if(KindOfButtonModelCls(model)){
            if(self.buttonModel.title.isHTMLString ||
               self.buttonModel.subTitle.isHTMLString){
                self.webView.jobsVisible = YES;
            }else{
                self.button.data = model;
            }self.buttonModel = model;
        }
    };
}
#pragma mark —— BaseViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    return self.viewModel;
}

-(UIButtonModel *_Nullable)getButtonModel{
    return self.buttonModel;
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    JobsBtnStyleCVCell *cell = JobsRegisterDequeueCollectionViewCell(JobsBtnStyleCVCell);
    // UICollectionViewCell圆切角
//    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
//    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
//    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
//    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;
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
    @jobs_weakify(self)
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
    }else self.button.jobsResetBtnBgImage(viewModel.backgroundImage);
    /// 图文间距
    if (@available(iOS 16.0, *)) self.button.jobsResetImagePadding(viewModel.imageTitleSpace);
    /// 图文相对位置关系
    if (@available(iOS 16.0, *)) self.button.jobsResetImagePlacement(viewModel.buttonEdgeInsetsStyle);
    /// 圆切角
    self.button.jobsResetBtnCornerRadiusValue(viewModel.layerCornerRadius);
}

-(void)setButtonModel:(UIButtonModel *)buttonModel{
    _buttonModel = buttonModel;
    @jobs_weakify(self)
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
}
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
        [self.contentView.addSubview(_button) mas_makeConstraints:self.masonryBlock];
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
    _webView.backgroundColor = JobsClearColor;
    _webView.opaque = NO; // 设置不透明为 NO，确保背景透明
    [self.contentView.addSubview(_webView) mas_makeConstraints:self.masonryBlock];
    self.refresh();
    return _webView;
}

-(jobsByMASConstraintMakerBlock _Nullable)masonryBlock{
    if(!_masonryBlock){
        @jobs_weakify(self)
        _masonryBlock = ^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.edges.equalTo(self);///
            /// 如果这里用self.contentView，在某些情况下，约束会失灵。因为self.contentView的生命周期的缘故，还没有完全展开
        };
    }return _masonryBlock;
}

@end
