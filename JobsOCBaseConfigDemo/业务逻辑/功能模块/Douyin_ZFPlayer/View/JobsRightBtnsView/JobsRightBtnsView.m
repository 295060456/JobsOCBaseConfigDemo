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
@property(nonatomic,strong)BaseButton *commentBtn;/// 评论
@property(nonatomic,strong)BaseButton *shareBtn;/// 分享
/// Data
@property(nonatomic,strong)NSMutableArray <__kindof UIButton *>*masonryViewArr;
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
+(instancetype)sharedManager{
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
        [self addNotificationName:语言切换
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            @jobs_strongify(self)
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:NSNumber.class]){
                NSNumber *b = notification.object;
                NSLog(@"SSS = %d",b.boolValue);
            }NSLog(@"通知传递过来的 = %@",notification.object);
        }];
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
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(50), JobsMainScreen_HEIGHT()/ 4);
    };
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        self.loveBtn.alpha = 1;
        self.commentBtn.alpha = 1;
        self.shareBtn.alpha = 1;
        [self 子视图垂直等间距排列];
    };
}
#pragma mark —— 一些公有方法
-(NSMutableArray <UIButton *>*)getButtonArr{
    return self.masonryViewArr;
}
#pragma mark —— 一些私有方法
/// 垂直方向排列、固定控件高度、控件间隔不定
-(void)子视图垂直等间距排列{
    /// 实现masonry垂直方向固定控件高度方法
    self.masonryViewArr.installByMasonryModel2(jobsMakeMasonryModel(^(__kindof MasonryModel * _Nullable data) {
        data.axisType = MASAxisTypeVertical;
        data.fixedItemLength = JobsRightBtnsView.viewSizeByModel(nil).width;
        data.leadSpacing = JobsWidth(0);
        data.tailSpacing = JobsWidth(0);
    })).installByMasonryBlock(^(MASConstraintMaker *_Nonnull make){/// 设置array的水平方向的约束
        make.centerX.equalTo(self);
        make.width.mas_equalTo(JobsRightBtnsView.viewSizeByModel(nil).width);
    });
    [self layoutIfNeeded];
    @jobs_weakify(self)
    self.loveBtn.richButtonByModel(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
        @jobs_strongify(self)
        data.jobsRect = self.loveBtn.frame;
    }));
}
#pragma mark —— Set方法
-(void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    self.loveBtn.selected = _isSelected;
    self.loveBtn.jobsResetBtnTitle(self.viewModel.textModel.text.replace(JobsInternationalization(@"点赞")));
    self.loveBtn.jobsResetImagePlacement_Padding(NSDirectionalRectEdgeTop,JobsWidth(5));
}
#pragma mark —— lazyLoad
-(RBCLikeButton *)loveBtn{
    if(!_loveBtn){
        @jobs_weakify(self)
        _loveBtn = RBCLikeButton.initByStyleTop(self.viewModel.textModel.text.replace(JobsInternationalization(@"点赞")),
                                                UIFontWeightRegularSize(12),
                                                JobsCor(@"#EA2918"),
                                                JobsIMG(@"视频未点赞"),
                                                NSDirectionalRectEdgeNone,
                                                JobsWidth(5))
            .bgColor(JobsClearColor.colorWithAlphaComponent(0))
            .onClick(^(UIButton *x){
                NSLog(@"我是点赞");
                x.selected = !x.selected;
                @jobs_weakify(x)
                [x.imageView addViewAnimationWithCompletionBlock:^(id data) {
                    @jobs_strongify(self)
                    @jobs_strongify(x)
                    x.tag = MKRightBtnViewBtnType_loveBtn;//写在block外部，此值异常
                    if (self.objectBlock) self.objectBlock(x);
                }];
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        [self addSubview:_loveBtn];
        [self layoutIfNeeded];
    }
    _loveBtn.jobsResetBtnImage(_loveBtn.selected ? JobsIMG(@"视频未点赞") : JobsIMG(@"视频未点赞"));
    return _loveBtn;
}

-(BaseButton *)commentBtn{
    if(!_commentBtn){
        @jobs_weakify(self)
        _commentBtn = BaseButton.initByStyleTop(self.viewModel.textModel.text.replace(JobsInternationalization(@"评论")),
                                                UIFontWeightRegularSize(12),
                                                JobsCor(@"#EA2918"),
                                                JobsIMG(@"视频评论"),
                                                NSDirectionalRectEdgeNone,
                                                JobsWidth(5))
            .bgColor(JobsClearColor.colorWithAlphaComponent(0))
            .onClick(^(UIButton *x){
                NSLog(@"我是评论");
                @jobs_weakify(x)
                [x.imageView addViewAnimationWithCompletionBlock:^(id data) {
                    @jobs_strongify(x)
                    @jobs_strongify(self)
                    x.tag = MKRightBtnViewBtnType_commentBtn;//写在block外部，此值异常
                    if (self.objectBlock) self.objectBlock(x);
                    
                    JobsCommentCoreVC *jobsCommentCoreVC = JobsCommentCoreVC.new;
                    JobsPresentationCtrl *presentationController NS_VALID_UNTIL_END_OF_SCOPE;
                    presentationController = [JobsPresentationCtrl.alloc initWithPresentedViewController:jobsCommentCoreVC
                                                                                presentingViewController:self.jobsGetCurrentViewController];
                    jobsCommentCoreVC.presentUpHeight = JobsWidth(800);
                    /// jobsCommentCoreVC.view.backgroundColor = JobsRedColor;
                    jobsCommentCoreVC.transitioningDelegate = presentationController;
                    
                    [self forceComingToPushVC:jobsCommentCoreVC requestParams:JobsInternationalization(@"")];
                    [jobsCommentCoreVC actionObjectBlock:^(id data) {
                        NSLog(@"您点击了评论");
                    }];
                }];
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        [self addSubview:_commentBtn];
        [self layoutIfNeeded];
    }return _commentBtn;
}

-(BaseButton *)shareBtn{
    if(!_shareBtn){
        @jobs_weakify(self)
        _shareBtn = RBCLikeButton.initByStyleTop(self.viewModel.textModel.text.replace(JobsInternationalization(@"分享")),
                                                 UIFontWeightRegularSize(12),
                                                 JobsCor(@"#EA2918"),
                                                 JobsIMG(@"分享"),
                                                 NSDirectionalRectEdgeNone,
                                                 JobsWidth(5))
            .bgColor(JobsClearColor.colorWithAlphaComponent(0))
            .onClick(^(UIButton *x){
                NSLog(@"我是分享");
                @jobs_weakify(x)
                [x.imageView addViewAnimationWithCompletionBlock:^(id data) {
                    @jobs_strongify(x)
                    @jobs_strongify(self)
                    x.tag = MKRightBtnViewBtnType_shareBtn;//写在block外部，此值异常
                    JobsShareView *shareView = JobsShareView.new;
                    shareView.jobsRichViewByModel(nil);
                    self.popupShowSlideWithView(shareView);
                    if (self.objectBlock) self.objectBlock(x);
                }];
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        [self addSubview:_shareBtn];
        [self layoutIfNeeded];
    }return _shareBtn;
}

-(NSMutableArray<__kindof UIButton *> *)masonryViewArr{
    if (!_masonryViewArr) {
        @jobs_weakify(self)
        _masonryViewArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            data.add(self.loveBtn);
            data.add(self.commentBtn);
            data.add(self.shareBtn);
        });
    }return _masonryViewArr;
}

@end
