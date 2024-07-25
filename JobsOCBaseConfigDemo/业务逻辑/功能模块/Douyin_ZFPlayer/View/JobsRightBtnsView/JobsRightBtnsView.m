//
//  JobsRightBtnsView.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/9/19.
//  Copyright © 2020 MonkeyKingVideo. All rights reserved.
//

#import "JobsRightBtnsView.h"

@interface JobsRightBtnsView ()
/// UI
@property(nonatomic,strong)RBCLikeButton *loveBtn;/// 点赞
@property(nonatomic,strong)UIButton *commentBtn;/// 评论
@property(nonatomic,strong)UIButton *shareBtn;/// 分享
/// Data
@property(nonatomic,strong)NSMutableArray <UIButton *>*masonryViewArr;
@property(nonatomic,assign)BOOL isSelected;

@end

@implementation JobsRightBtnsView
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_rightBtnsViewOnceToken = 0;
    static_rightBtnsView = nil;
}

static JobsRightBtnsView *static_rightBtnsView = nil;
static dispatch_once_t static_rightBtnsViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_rightBtnsViewOnceToken, ^{
        static_rightBtnsView = JobsRightBtnsView.new;
    });return static_rightBtnsView;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {

    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        @jobs_weakify(self)
        JobsAddNotification(self,
                        selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                  id _Nullable arg){
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:NSNumber.class]){
                NSNumber *b = notification.object;
                NSLog(@"SSS = %d",b.boolValue);
            }
            @jobs_strongify(self)
            NSLog(@"通知传递过来的 = %@",notification.object);
            return nil;
        },nil, self),JobsLanguageSwitchNotification,nil);
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        
    }return self;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(50), JobsMainScreen_HEIGHT()/ 4);
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    self.loveBtn.alpha = 1;
    self.commentBtn.alpha = 1;
    self.shareBtn.alpha = 1;
    [self 子视图垂直等间距排列];
}
#pragma mark —— 一些公有方法
-(NSMutableArray <UIButton *>*)getButtonArr{
    return self.masonryViewArr;
}
#pragma mark —— 一些私有方法
/// 垂直方向排列、固定控件高度、控件间隔不定
-(void)子视图垂直等间距排列{
    /// 实现masonry垂直方向固定控件高度方法
    [self.masonryViewArr mas_distributeViewsAlongAxis:MASAxisTypeVertical
                                  withFixedItemLength:[JobsRightBtnsView viewSizeWithModel:nil].width
                                          leadSpacing:0
                                          tailSpacing:0];
    /// 设置array的水平方向的约束
    [self.masonryViewArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.width.mas_equalTo([JobsRightBtnsView viewSizeWithModel:nil].width);
    }];
    [self layoutIfNeeded];
    UIViewModel *vm = UIViewModel.new;
    vm.jobsRect = self.loveBtn.frame;
    NSLog(@"self.loveBtn = %@",self.loveBtn);
    [self.loveBtn richElementsInButtonWithModel:vm];
}
#pragma mark —— Set方法
-(void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    self.loveBtn.selected = _isSelected;
    if (self.loveBtn.selected) {
        //特别重要，花了老子半个小时，mmp.只要改变选择状态都要进行刷新 走这一句
        self.loveBtn.selectedTitle(JobsNonnullString(self.viewModel.textModel.text, JobsInternationalization(@"点赞")));
    }else{
        self.loveBtn.normalTitle(JobsNonnullString(self.viewModel.textModel.text, JobsInternationalization(@"点赞")));
    }
    [self.loveBtn layoutButtonWithEdgeInsetsStyle:NSDirectionalRectEdgeTop
                                     imagePadding:JobsWidth(5)];
}
#pragma mark —— lazyLoad
-(RBCLikeButton *)loveBtn{
    if(!_loveBtn){
        @jobs_weakify(self)
        _loveBtn = [RBCLikeButton.alloc jobsInitBtnByConfiguration:nil
                                                        background:nil
                                        buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                     textAlignment:NSTextAlignmentCenter
                                                  subTextAlignment:NSTextAlignmentCenter
                                                       normalImage:JobsIMG(@"视频未点赞")
                                                    highlightImage:nil
                                                   attributedTitle:nil
                                           selectedAttributedTitle:nil
                                                attributedSubtitle:nil
                                                             title:JobsNonnullString(self.viewModel.textModel.text, JobsInternationalization(@"点赞"))
                                                          subTitle:nil
                                                         titleFont:UIFontWeightRegularSize(12)
                                                      subTitleFont:nil
                                                          titleCor:JobsCor(@"#EA2918")
                                                       subTitleCor:nil
                                                titleLineBreakMode:NSLineBreakByWordWrapping
                                             subtitleLineBreakMode:NSLineBreakByWordWrapping
                                               baseBackgroundColor:JobsClearColor
                                                   backgroundImage:nil
                                                      imagePadding:JobsWidth(5)
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
            NSLog(@"我是点赞");
            x.selected = !x.selected;
            [x.imageView addViewAnimationWithCompletionBlock:^(id data) {
                @jobs_strongify(self)
                self->_loveBtn.tag = MKRightBtnViewBtnType_loveBtn;//写在block外部，此值异常
                if (self.objectBlock) self.objectBlock(self->_loveBtn);
            }];return nil;
        }];
        [self addSubview:_loveBtn];
        [self layoutIfNeeded];
    }
    _loveBtn.jobsResetBtnImage(_loveBtn.selected ? JobsIMG(@"视频未点赞") : JobsIMG(@"视频未点赞"));
    return _loveBtn;
}

-(UIButton *)commentBtn{
    if(!_commentBtn){
        @jobs_weakify(self)
        _commentBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                        background:nil
                                        buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                     textAlignment:NSTextAlignmentCenter
                                                  subTextAlignment:NSTextAlignmentCenter
                                                       normalImage:JobsIMG(@"视频评论")
                                                    highlightImage:nil
                                                   attributedTitle:nil
                                           selectedAttributedTitle:nil
                                                attributedSubtitle:nil
                                                             title:JobsNonnullString(self.viewModel.subTextModel.text, JobsInternationalization(@"评论"))
                                                          subTitle:nil
                                                            titleFont:UIFontWeightRegularSize(12)
                                                      subTitleFont:nil
                                                          titleCor:JobsCor(@"#EA2918")
                                                       subTitleCor:nil
                                                titleLineBreakMode:NSLineBreakByWordWrapping
                                             subtitleLineBreakMode:NSLineBreakByWordWrapping
                                               baseBackgroundColor:JobsClearColor
                                                   backgroundImage:nil
                                                      imagePadding:JobsWidth(5)
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
            NSLog(@"我是评论");
            [x.imageView addViewAnimationWithCompletionBlock:^(id data) {
                @jobs_strongify(self)
                self->_commentBtn.tag = MKRightBtnViewBtnType_commentBtn;//写在block外部，此值异常
                if (self.objectBlock) self.objectBlock(self->_commentBtn);
                
                JobsCommentCoreVC *jobsCommentCoreVC = JobsCommentCoreVC.new;
                JobsPresentationCtrl *presentationController NS_VALID_UNTIL_END_OF_SCOPE;
                presentationController = [JobsPresentationCtrl.alloc initWithPresentedViewController:jobsCommentCoreVC
                                                                            presentingViewController:self.jobsGetCurrentViewController];
                jobsCommentCoreVC.presentUpHeight = JobsWidth(800);
                /// jobsCommentCoreVC.view.backgroundColor = JobsRedColor;
                jobsCommentCoreVC.transitioningDelegate = presentationController;
                
                [self forceComingToPresentVC:jobsCommentCoreVC
                               requestParams:JobsInternationalization(@"")
                                  completion:nil];
                @jobs_weakify(self)
                [jobsCommentCoreVC actionObjectBlock:^(id data) {
                    @jobs_strongify(self)
                    NSLog(@"您点击了评论");
                }];
            }];return nil;
        }];
        [self addSubview:_commentBtn];
        [self layoutIfNeeded];
    }return _commentBtn;
}

-(UIButton *)shareBtn{
    if(!_shareBtn){
        @jobs_weakify(self)
        _shareBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                      background:nil
                                      buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                   textAlignment:NSTextAlignmentCenter
                                                subTextAlignment:NSTextAlignmentCenter
                                                     normalImage:JobsIMG(@"分享")
                                                  highlightImage:nil
                                                 attributedTitle:nil
                                         selectedAttributedTitle:nil
                                              attributedSubtitle:nil
                                                           title:JobsInternationalization(@"分享")
                                                        subTitle:nil
                                                       titleFont:UIFontWeightRegularSize(12)
                                                    subTitleFont:nil
                                                        titleCor:JobsCor(@"#EA2918")
                                                     subTitleCor:nil
                                              titleLineBreakMode:NSLineBreakByWordWrapping
                                           subtitleLineBreakMode:NSLineBreakByWordWrapping
                                             baseBackgroundColor:JobsClearColor
                                                 backgroundImage:nil
                                                    imagePadding:JobsWidth(5)
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
            NSLog(@"我是分享");
            [x.imageView addViewAnimationWithCompletionBlock:^(id data) {
                @jobs_strongify(self)
                self->_shareBtn.tag = MKRightBtnViewBtnType_shareBtn;//写在block外部，此值异常
                
                JobsShareView *shareView = JobsShareView.new;
                [shareView richElementsInViewWithModel:nil];
                [self popupshowSlideWithView:shareView];
                
                if (self.objectBlock) self.objectBlock(self->_shareBtn);
            }];return nil;
        }];
        [self addSubview:_shareBtn];
        [self layoutIfNeeded];
    }return _shareBtn;
}

- (NSMutableArray *)masonryViewArr{
    if (!_masonryViewArr) {
        _masonryViewArr = NSMutableArray.array;
        [_masonryViewArr addObject:self.loveBtn];
        [_masonryViewArr addObject:self.commentBtn];
        [_masonryViewArr addObject:self.shareBtn];
    }return _masonryViewArr;
}

@end
