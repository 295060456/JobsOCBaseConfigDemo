//
//  JobsBtnStyleCVCell.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/16.
//

#import "JobsBtnStyleCVCell.h"

@interface JobsBtnStyleCVCell ()
/// UI
@property(nonatomic,strong)BaseButton *btn;
/// Data

@end

@implementation JobsBtnStyleCVCell
@synthesize viewModel = _viewModel;
@synthesize buttonModel = _buttonModel;
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    /// 内部指定圆切角
//    [self appointCornerCutToCircleByRoundingCorners:UIRectCornerAllCorners
//                                        cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
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
    JobsBtnStyleCVCell *cell = (JobsBtnStyleCVCell *)[collectionView collectionViewCellClass:JobsBtnStyleCVCell.class forIndexPath:indexPath];
    if (!cell) {
        collectionView.registerCollectionViewCellClass(JobsBtnStyleCVCell.class,@"");
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
        
        self.btn.jobsResetImage(self.buttonModel.normalImage);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)cellSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(106), JobsWidth(30));
    };
}
#pragma mark —— 一些私有方法
#pragma mark —— 一些公有方法

#pragma mark —— lazyLoad
-(BaseButton *)btn{
    @jobs_weakify(self)
    if(!_btn){
        _btn = BaseButton.jobsInit();
        [self.contentView addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    NSLog(@"%@",self.buttonModel.normalImageURLString);
    NSLog(@"%@",self.buttonModel.normalImageURL);
    if(self.viewModel){
        _btn.selected = self.viewModel.jobsSelected;
        _btn.enabled = self.viewModel.jobsEnabled;/// 这个属性为YES，则优先响应Btn。这个属性为NO，则响应UICollectionViewCell
        /// 主标题
        _btn.jobsResetBtnTitle(self.viewModel.textModel.text);
        _btn.jobsResetBtnTitleCor(self.viewModel.textModel.textCor);
        [_btn jobsSetBtnTitleFont:self.viewModel.textModel.font ? : UIFontWeightSemiboldSize(12)
                      btnTitleCor:self.viewModel.textModel.textCor ? : JobsBlueColor];
        /// 子标题
        _btn.jobsResetSubTitle(self.viewModel.subTextModel.text);
        [_btn jobsSetBtnSubTitleFont:self.viewModel.subTextModel.font ? : UIFontWeightSemiboldSize(12)
                      btnSubTitleCor:self.viewModel.subTextModel.textCor ? : JobsBlueColor];
        
        [_btn jobsBtnClickEventBlock:self.viewModel.clickEventBlock ? : ^id _Nullable(BaseButton *_Nullable x) {
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
        
        [_btn jobsBtnLongPressGestureEventBlock:self.viewModel.longPressGestureEventBlock ? : ^id(id _Nullable weakSelf,
                                                                                                  id _Nullable arg) {
//            @jobs_strongify(self)
            return nil;
        }];
        /// 按钮图
        if (self.viewModel.normalImageURL) {
            self->_btn
                .imageURL(self.viewModel.normalImageURLString.imageURLPlus.jobsUrl)
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
                }).normalLoad();
        }else{
            _btn.jobsResetImage(self.viewModel.image);
        }
        /// 背景色
        _btn.jobsResetBtnBgCor(self.viewModel.bgCor);
        _btn.backgroundColor = self.viewModel.bgCor;
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
        _btn.enabled = self.buttonModel.enabled;/// 这个属性为YES，则优先响应Btn。这个属性为NO，则响应UICollectionViewCell
        /// 背景色
        _btn.jobsResetBtnBgCor(self.buttonModel.baseBackgroundColor);
//        _btn.backgroundColor = self.buttonModel.baseBackgroundColor;
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
        /// 主标题
        _btn.jobsResetBtnTitle(self.buttonModel.title);
        _btn.jobsResetBtnTitleCor(self.buttonModel.titleCor);
        /// 按钮图
        if (self.buttonModel.normalImageURL) {
            self->_btn
                .imageURL(self.buttonModel.normalImageURLString.imageURLPlus.jobsUrl)
                .placeholderImage(self.buttonModel.normalImage)
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
                }).normalLoad();
        }else{
            _btn.jobsResetImage(self.buttonModel.normalImage);
        }
        /// 子标题
        _btn.jobsResetSubTitle(self.buttonModel.subTitle);
        [_btn jobsSetBtnSubTitleFont:self.buttonModel.subTitleFont ? : UIFontWeightSemiboldSize(12)
                      btnSubTitleCor:self.buttonModel.subTitleCor ? : JobsBlueColor];
        
        [_btn jobsBtnClickEventBlock:self.buttonModel.clickEventBlock ? : ^id _Nullable(BaseButton *_Nullable x) {
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
        
        [_btn jobsBtnLongPressGestureEventBlock:self.buttonModel.longPressGestureEventBlock ? : ^id(id _Nullable weakSelf,
                                                                                                    id _Nullable arg) {
//            @jobs_strongify(self)
            return nil;
        }];
        
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
