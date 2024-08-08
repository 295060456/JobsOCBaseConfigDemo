//
//  LinkageMenuView.m
//  LinkageMenu
//
//  Created by 风间 on 2017/3/8.
//  Copyright © 2017年 EmotionV. All rights reserved.
//  github: https://github.com/EmotionV/LinkageMenu

#import "JobsLinkageMenuView.h"

#define FULLVIEW_FOR6 667  //iPhone6(s)高度
#define NAVIGATION_HEIGHT 64  //navigationbar高度
#define TABBAR_HEIGHT 49  //tabbar高度

@interface JobsLinkageMenuView()
/// UI
@property(nonatomic,strong)UIScrollView *menuView;
@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UIView *rightview;
@property(nonatomic,strong)NSMutableArray <__kindof UIButton *>*btnMutArr;
@property(nonatomic,strong)NSArray <__kindof UIView *>*viewArray;
/// Data
@property(nonatomic,assign)NSInteger newChoseTag;  /// 选择的button tag
@property(nonatomic,assign)NSInteger choseTag;  /// 上次选择的button tag
@property(nonatomic,assign)CGFloat btnHeight;  /// button高度，适配不同屏幕
@property(nonatomic,assign)NSInteger DTScrollTag; /// 滚动tag
@property(nonatomic,assign)CGFloat blankHeight;
@property(nonatomic,assign)CGFloat half_blankHeight;
@property(nonatomic,strong)UIButtonModel *btnConfig;
@property(nonatomic,strong)JobsLinkageMenuViewConfig *linkageMenuViewConfig;
@property(nonatomic,assign)CGFloat MENU_WIDTH;/// 左侧菜单栏宽度，默认136
@property(nonatomic,assign)CGFloat BOTTOMVIEW_HEIGHT;/// 滑块高度
@property(nonatomic,assign)CGFloat BOTTOMVIEW_WIDTH;/// 滑块宽度
@property(nonatomic,assign)CGFloat LINEVIEW_WIDTH;/// 分割线宽度
@property(nonatomic,assign)CGFloat ANIMATION_TIME;/// 菜单栏滚动的时间

@end

@implementation JobsLinkageMenuView

-(instancetype)initWithFrame:(CGRect)frame
                   btnConfig:(UIButtonModel *)btnConfig
       linkageMenuViewConfig:(JobsLinkageMenuViewConfig *)linkageMenuViewConfig{
    if (self = [super init]) {
        self.frame = frame;
        self.btnConfig = btnConfig;
        self.viewArray = btnConfig.data;
        if(KindOfClsFromStr(linkageMenuViewConfig, @"JobsLinkageMenuViewConfig")){
            self.linkageMenuViewConfig = linkageMenuViewConfig;
            self.MENU_WIDTH = self.linkageMenuViewConfig.MENU_WIDTH;
            self.BOTTOMVIEW_HEIGHT = self.linkageMenuViewConfig.BOTTOMVIEW_HEIGHT;
            self.BOTTOMVIEW_WIDTH = self.linkageMenuViewConfig.BOTTOMVIEW_WIDTH;
            self.LINEVIEW_WIDTH = self.linkageMenuViewConfig.LINEVIEW_WIDTH;
            self.ANIMATION_TIME = self.linkageMenuViewConfig.ANIMATION_TIME;
        }
    }return self;
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel __kindof *_Nullable)model{
    if (JobsMainScreen_HEIGHT() < FULLVIEW_FOR6) {
        self.btnHeight = 43;
        self.DTScrollTag = 5;
    }else if (JobsMainScreen_HEIGHT() == FULLVIEW_FOR6){
        self.btnHeight = 44;
        self.DTScrollTag = 6;
    }else if (JobsMainScreen_HEIGHT() > FULLVIEW_FOR6){
        self.btnHeight = 42.7;
        self.DTScrollTag = 7;
    }
    
    self.textSize = 14.0;

    self.selectViewColor = JobsWhiteColor;
    self.blankHeight = self.btnHeight - self.BOTTOMVIEW_HEIGHT;
    self.half_blankHeight = (self.btnHeight - self.BOTTOMVIEW_HEIGHT) / 2.0;
    self.choseTag = 1; //默认选中菜单栏第一个
    
    self.rightview.alpha = 1;
    self.menuView.alpha = 1;
    self.lineView.alpha = 1;
    /// 默认显示
    [self choseMenu:self.btnMutArr[0]];
}
#pragma mark —— MenuButton Method
-(void)choseMenu:(UIButton __kindof *)button{
    NSLog(@"%ld==%@",(long)button.tag,button.titleLabel.text);
    int d = 0;
    for (UIButton *btn in self.btnMutArr) {
        btn.jobsResetBtnTitleCor(self.btnConfig.titleCor);
        btn.jobsResetBtnImage(self.btnConfig.normal_images[d]);
        btn.jobsResetBtnBgImage(nil);
//        button.jobsResetBtnTitle(self.btnConfig.normal_titles[d]);
//        btn.jobsResetBtnBgImage(self.btnConfig.normal_backgroundImages[d]);
        d++;
    }
    
    button.jobsResetBtnTitleCor(self.btnConfig.selected_titleCor);
    button.jobsResetBtnImage(nil);
    button.jobsResetBtnBgImage(self.btnConfig.selected_backgroundImages[button.tag - 1]);
    
    self.newChoseTag = button.tag;
    if (self.newChoseTag != self.choseTag) {
        @jobs_weakify(self)
        [UIView animateWithDuration:0.3
                              delay:0
             usingSpringWithDamping:0.8
              initialSpringVelocity:0
                            options:UIViewAnimationOptionAllowUserInteraction
                         animations:^{
            @jobs_strongify(self)
            self.bottomView.frame = CGRectMake((self.MENU_WIDTH - self.BOTTOMVIEW_WIDTH) / 2.0,
                                               button.frame.origin.y + self.half_blankHeight,
                                               self.BOTTOMVIEW_WIDTH,
                                               self.BOTTOMVIEW_HEIGHT);
        } completion:nil];
        
        [self performSelector:selectorBlocks(^id _Nullable(id  _Nullable weakSelf,
                                                           id  _Nullable arg) {
            @jobs_strongify(self)
            UIButton *button = (UIButton *)[self viewWithTag:self.newChoseTag];
            button.normalTitleColor(self.selectTextColor);
            self.choseTag = self.newChoseTag;
            return nil;
        }, nil, self)
                   withObject:nil
                   afterDelay:0.07];
        
        for (UIView *view in self.rightview.subviews) {
            [view removeFromSuperview];
        }

        NSInteger viewtag;
        if (button.tag >= _viewArray.count) {
            viewtag = _viewArray.count - 1;
        }else{
            viewtag = button.tag - 1;
        }
        UIView *rigView = [_viewArray objectAtIndex:viewtag];
        [self.rightview addSubview:rigView];
    }
}
#pragma mark —— Setter Method
-(void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    for (int i = 2; i <= self.btnConfig.normal_titles.count; i++) {
        UIButton *button = [self viewWithTag:i];
        button.normalTitleColor(textColor);
    }
}

-(void)setTextSize:(CGFloat)textSize{
    _textSize = textSize;
    for (int i = 1; i <= self.btnConfig.normal_titles.count; i++) {
        UIButton *button = [self viewWithTag:i];
        button.titleLabel.font = [UIFont systemFontOfSize:textSize];
    }
}
#pragma mark —— LazyLoad
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = UIView.new;
        _lineView.frame = CGRectMake(self.MENU_WIDTH,
                                     0,
                                     self.LINEVIEW_WIDTH,
                                     self.frame.size.height);
        _lineView.backgroundColor = JobsClearColor;
        [self addSubview:_lineView];
    }return _lineView;
}

- (UIView *)rightview{
    if (!_rightview) {
        _rightview = UIView.new;
        
        if(JobsAppTool.currentInterfaceOrientationMask == UIInterfaceOrientationMaskLandscape){
            _rightview.frame = CGRectMake(self.MENU_WIDTH + self.LINEVIEW_WIDTH,
                                          0,
                                          JobsRealWidth(),
                                          JobsRealHeight());
        }else{
            _rightview.frame = CGRectMake(self.MENU_WIDTH + self.LINEVIEW_WIDTH,
                                          NAVIGATION_HEIGHT,
                                          JobsRealWidth() - self.MENU_WIDTH + self.LINEVIEW_WIDTH,
                                          JobsRealHeight());
        }
        
        if (_viewArray.count < self.btnConfig.normal_titles.count) {
            NSLog(@"Please Add More Views");
        }
        for (int i = 0; i < _viewArray.count; i++) {
            UIView *view = [_viewArray objectAtIndex:i];
            view.frame = _rightview.bounds;
        }
        [_rightview addSubview:(UIView *)[_viewArray objectAtIndex:0]];
        
        [self addSubview:_rightview];
    }return _rightview;
}

-(UIView *)bottomView{
    if(!_bottomView){
        _bottomView = UIView.new;
        _bottomView.frame = CGRectMake((self.MENU_WIDTH - self.BOTTOMVIEW_WIDTH) / 2.0,
                                       self.blankHeight + 1.0,
                                       self.BOTTOMVIEW_WIDTH ,
                                       self.BOTTOMVIEW_HEIGHT);

        _bottomView.layer.cornerRadius = self.BOTTOMVIEW_HEIGHT / 2.0;
//        _bottomView.backgroundColor = _selectViewColor;
    }return _bottomView;
}

- (UIScrollView *)menuView{
    if (!_menuView) {
        _menuView = UIScrollView.new;
        _menuView.frame = CGRectMake(0,
                                     0,
                                     self.MENU_WIDTH,
                                     self.frame.size.height);
        _menuView.backgroundColor = JobsClearColor;
        _menuView.scrollsToTop = NO;
        _menuView.showsVerticalScrollIndicator = NO;
        _menuView.contentSize = CGSizeMake(0, self.btnConfig.normal_titles.count * self.btnHeight + self.blankHeight + 5.0);
        [_menuView addSubview:self.bottomView];
        for (int i = 1; i <= self.btnConfig.normal_titles.count; i++) {
            @jobs_weakify(self)
            BaseButton *menuButton = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                                       background:nil
                                                       buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                                    textAlignment:NSTextAlignmentLeft
                                                                 subTextAlignment:NSTextAlignmentCenter
                                                                      normalImage:[self.btnConfig.normal_images objectAtIndex:(i - 1)]
                                                                   highlightImage:nil
                                                                  attributedTitle:nil
                                                          selectedAttributedTitle:nil
                                                               attributedSubtitle:nil
                                                                            title:[self.btnConfig.normal_titles objectAtIndex:(i - 1)]
                                                                         subTitle:nil
                                                                        titleFont:[UIFont systemFontOfSize:self.textSize]
                                                                     subTitleFont:nil
                                                                         titleCor:self.btnConfig.titleCor
                                                                      subTitleCor:nil
                                                               titleLineBreakMode:NSLineBreakByWordWrapping
                                                            subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                              baseBackgroundColor:JobsClearColor
                                                                  backgroundImage:nil
                                                                     imagePadding:self.btnConfig.imagePadding ? : [self.btnConfig.imagePaddings objectAtIndex:(i - 1)].floatValue
                                                                     titlePadding:JobsWidth(10)
                                                                   imagePlacement:self.btnConfig.imagePlacement
                                                       contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                                         contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                                    contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                                cornerRadiusValue:JobsWidth(8)
                                                                  roundingCorners:UIRectCornerAllCorners
                                                             roundingCornersRadii:CGSizeZero
                                                                   layerBorderCor:nil
                                                                      borderWidth:JobsWidth(0)
                                                                    primaryAction:nil
                                                       longPressGestureEventBlock:^(BaseButton *_Nullable weakSelf,
                                                                                    id _Nullable arg) {
                  NSLog(@"按钮的长按事件触发");
              }
                                                                  clickEventBlock:^id(BaseButton *x) {
                  @jobs_strongify(self)
                  [self choseMenu:x];
                  if (self.objectBlock) self.objectBlock(x);
                  return nil;
            }];
            
            menuButton.textLabelFrameResetX = 0;
            
            menuButton.tag = i;
            menuButton.frame = CGRectMake(0,
                                          self.btnHeight * (i - 1) + self.half_blankHeight,
                                          self.MENU_WIDTH,
                                          self.btnHeight);
            self.btnMutArr.jobsAddObject(menuButton);
            [_menuView addSubview:menuButton];
        }
        [self addSubview:_menuView];
    }return _menuView;
}

-(NSMutableArray<__kindof UIButton *> *)btnMutArr{
    if(!_btnMutArr){
        _btnMutArr = NSMutableArray.array;
    }return _btnMutArr;
}
/// 左侧菜单栏宽度，默认136
-(CGFloat)MENU_WIDTH{
    if(!_MENU_WIDTH){
        _MENU_WIDTH = JobsWidth(136);
    }return _MENU_WIDTH;
}
/// 滑块高度
-(CGFloat)BOTTOMVIEW_HEIGHT{
    if(!_BOTTOMVIEW_HEIGHT){
        _BOTTOMVIEW_HEIGHT = JobsWidth(25);
    }return _BOTTOMVIEW_HEIGHT;
}
/// 滑块宽度
-(CGFloat)BOTTOMVIEW_WIDTH{
    if(!_BOTTOMVIEW_WIDTH){
        _BOTTOMVIEW_WIDTH = self.MENU_WIDTH - JobsWidth(10);
    }return _BOTTOMVIEW_WIDTH;
}
/// 分割线宽度
-(CGFloat)LINEVIEW_WIDTH{
    if(!_LINEVIEW_WIDTH){
        _LINEVIEW_WIDTH = JobsWidth(1.0f);
    }return _LINEVIEW_WIDTH;
}
/// 菜单栏滚动的时
-(CGFloat)ANIMATION_TIME{
    if(!_ANIMATION_TIME){
        _ANIMATION_TIME = 0.2f;
    }return _ANIMATION_TIME;
}

@end

@implementation JobsLinkageMenuViewConfig

@end
