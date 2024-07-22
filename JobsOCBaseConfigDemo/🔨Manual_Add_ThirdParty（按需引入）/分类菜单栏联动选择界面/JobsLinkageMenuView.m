//
//  LinkageMenuView.m
//  LinkageMenu
//
//  Created by 风间 on 2017/3/8.
//  Copyright © 2017年 EmotionV. All rights reserved.
//  github: https://github.com/EmotionV/LinkageMenu

#import "JobsLinkageMenuView.h"
#define MENU_WIDTH 100  //左侧菜单栏宽度，默认100
#define BOTTOMVIEW_HEIGHT 25  //滑块高度
#define BOTTOMVIEW_WIDTH (MENU_WIDTH - 10)  //滑块宽度
#define LINEVIEW_WIDTH 1.0  //分割线宽度
#define ANIMATION_TIME 0.2  //菜单栏滚动的时间

#define FULLVIEW_FOR6 667  //iPhone6(s)高度
#define NAVIGATION_HEIGHT 64  //navigationbar高度
#define TABBAR_HEIGHT 49  //tabbar高度

@interface JobsLinkageMenuView()

@property(nonatomic,strong)UIScrollView *menuView;
@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UIView *rightview;

@end

@implementation JobsLinkageMenuView{
    NSArray *menuArray;
    NSArray *viewArray;
    NSInteger titlesCount; //菜单总数
    NSInteger newChoseTag;  //选择的button tag
    NSInteger choseTag;  //上次选择的button tag
    CGFloat btnHeight;  //button高度，适配不同屏幕
    NSInteger DTScrollTag; //滚动tag
    CGFloat blankHeight;
    CGFloat half_blankHeight;
}
#pragma mark - Init Method
- (instancetype)initWithFrame:(CGRect)frame
                     withMenu:(NSArray *)menu
                     andViews:(NSArray *)views{
    if (self = [super init]) {
        if (JobsMainScreen_HEIGHT() < FULLVIEW_FOR6) {
            btnHeight = 43;
            DTScrollTag = 5;
        }else if (JobsMainScreen_HEIGHT() == FULLVIEW_FOR6){
            btnHeight = 44;
            DTScrollTag = 6;
        }else if (JobsMainScreen_HEIGHT() > FULLVIEW_FOR6){
            btnHeight = 42.7;
            DTScrollTag = 7;
        }
        //Default Menu Style
        _textSize = 14.0;
        _textColor = [UIColor blackColor];
        _selectTextColor = [UIColor whiteColor];
        _selectViewColor = [UIColor blackColor];
        
        menuArray = menu;
        viewArray = views;
        titlesCount = menuArray.count;
        blankHeight = btnHeight - BOTTOMVIEW_HEIGHT;
        half_blankHeight = (btnHeight - BOTTOMVIEW_HEIGHT) / 2.0;
        choseTag = 1; //默认选中菜单栏第一个
        
        self.frame = frame;

        self.rightview.alpha = 1;
        self.menuView.alpha = 1;
        self.lineView.alpha = 1;
    }return self;
}
#pragma mark - MenuButton Method
-(void)choseMenu:(UIButton *)button{
    NSLog(@"%ld==%@",(long)button.tag,button.titleLabel.text);
    newChoseTag = button.tag;
    if (newChoseTag != choseTag) {
        UIButton *lastButton = (UIButton *)[self viewWithTag:choseTag];
        button.normalTitleColor = _textColor;
        CGFloat scroHeight = self.menuView.contentSize.height - JobsMainScreen_HEIGHT() + TABBAR_HEIGHT;
        @jobs_weakify(self)
        [UIView animateWithDuration:0.3
                              delay:0
             usingSpringWithDamping:0.8
              initialSpringVelocity:0
                            options:UIViewAnimationOptionAllowUserInteraction
                         animations:^{
            @jobs_strongify(self)
            self.bottomView.frame = CGRectMake((MENU_WIDTH - BOTTOMVIEW_WIDTH) / 2.0,
                                               button.frame.origin.y + self->half_blankHeight,
                                               BOTTOMVIEW_WIDTH,
                                               BOTTOMVIEW_HEIGHT);
        } completion:nil];
        [self performSelector:selectorBlocks(^id _Nullable(id  _Nullable weakSelf,
                                                           id  _Nullable arg) {
            @jobs_strongify(self)
            UIButton *button = (UIButton *)[self viewWithTag:self->newChoseTag];
            button.normalTitleColor = self.selectTextColor;
            self->choseTag = self->newChoseTag;
            return nil;
        }, nil, self)
                   withObject:nil
                   afterDelay:0.07];
        
        for (UIView *view in [self.rightview subviews]) {
            [view removeFromSuperview];
        }

        NSInteger viewtag;
        if (button.tag >= viewArray.count) {
            viewtag = viewArray.count - 1;
        }else{
            viewtag = button.tag - 1;
        }
        UIView *rigView = [viewArray objectAtIndex:viewtag];
        [self.rightview addSubview:rigView];
    }
}
#pragma mark —— Setter Method
-(void)setSelectViewColor:(UIColor *)selectViewColor{
    _selectTextColor = selectViewColor;
    _bottomView.backgroundColor = _selectViewColor;
}

-(void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    for (int i = 2; i <= menuArray.count; i++) {
        UIButton *button = [self viewWithTag:i];
        button.normalTitleColor = textColor;
    }
}

-(void)setSelectTextColor:(UIColor *)selectTextColor{
    _selectTextColor = selectTextColor;
    UIButton *button = [self viewWithTag:1];
    button.normalTitleColor = _selectTextColor;
}

-(void)setTextSize:(CGFloat)textSize{
    _textSize = textSize;
    for (int i = 1; i <= menuArray.count; i++) {
        UIButton *button = [self viewWithTag:i];
        button.titleLabel.font = [UIFont systemFontOfSize:textSize];
    }
}
#pragma mark —— LazyLoad
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = UIView.new;
        _lineView.frame = CGRectMake(MENU_WIDTH,
                                     0,
                                     LINEVIEW_WIDTH,
                                     self.frame.size.height);
        _lineView.backgroundColor = JobsLightGrayColor;
        [self addSubview:_lineView];
    }return _lineView;
}

- (UIView *)rightview{
    if (!_rightview) {
        _rightview = UIView.new;

        if(JobsAppTool.currentInterfaceOrientationMask == UIInterfaceOrientationMaskLandscape){
            _rightview.frame = CGRectMake(0,
                                          0,
                                          JobsMainScreen_HEIGHT(),
                                          JobsMainScreen_WIDTH());
        }else{
            _rightview.frame = CGRectMake(MENU_WIDTH + LINEVIEW_WIDTH,
                                          NAVIGATION_HEIGHT,
                                          JobsMainScreen_WIDTH() - MENU_WIDTH + LINEVIEW_WIDTH,
                                          JobsMainScreen_HEIGHT());
        }
        
        if (viewArray.count < menuArray.count) {
            NSLog(@"Please Add More Views");
        }
        for (int i = 0; i < viewArray.count; i++) {
            UIView *view = [viewArray objectAtIndex:i];
            view.frame = _rightview.bounds;
        }
        [_rightview addSubview:(UIView *)[viewArray objectAtIndex:0]];
        
        [self addSubview:_rightview];
    }return _rightview;
}

-(UIView *)bottomView{
    if(!_bottomView){
        _bottomView = UIView.new;
        _bottomView.frame = CGRectMake((MENU_WIDTH - BOTTOMVIEW_WIDTH) / 2.0,
                                       blankHeight + 1.0,
                                       BOTTOMVIEW_WIDTH ,
                                       BOTTOMVIEW_HEIGHT);

        _bottomView.layer.cornerRadius = BOTTOMVIEW_HEIGHT / 2.0;
        _bottomView.backgroundColor = _selectViewColor;
    }return _bottomView;
}

- (UIScrollView *)menuView{
    if (!_menuView) {
        _menuView = UIScrollView.new;
        _menuView.frame = CGRectMake(0,
                                     0,
                                     MENU_WIDTH,
                                     self.frame.size.height);
        _menuView.backgroundColor = JobsRedColor;
        _menuView.scrollsToTop = NO;
        _menuView.showsVerticalScrollIndicator = NO;
        _menuView.contentSize = CGSizeMake(0, titlesCount * btnHeight + blankHeight + 5.0);
        [_menuView addSubview:self.bottomView];
        for (int i = 1; i <= menuArray.count; i++) {
            @jobs_weakify(self)
            UIButton *menuButton = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                                     background:nil
                                                                 titleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                                  textAlignment:NSTextAlignmentCenter
                                                               subTextAlignment:NSTextAlignmentCenter
                                                                    normalImage:nil
                                                                 highlightImage:nil
                                                                attributedTitle:nil
                                                        selectedAttributedTitle:nil
                                                             attributedSubtitle:nil
                                                                          title:[menuArray objectAtIndex:(i - 1)]
                                                                       subTitle:nil
                                                                      titleFont:[UIFont systemFontOfSize:_textSize]
                                                                   subTitleFont:nil
                                                                       titleCor:JobsCor(@"#333333")
                                                                    subTitleCor:nil
                                                             titleLineBreakMode:NSLineBreakByWordWrapping
                                                          subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                            baseBackgroundColor:UIColor.clearColor
                                                                backgroundImage:nil
                                                                   imagePadding:JobsWidth(0)
                                                                   titlePadding:JobsWidth(10)
                                                                 imagePlacement:NSDirectionalRectEdgeNone
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
                x.jobsResetBtnTitleCor(JobsYellowColor);
                return nil;
            }];
            menuButton.tag = i;
            menuButton.frame = CGRectMake(0,
                                          btnHeight * (i - 1) + half_blankHeight + 10.0,
                                          MENU_WIDTH,
                                          btnHeight);
            menuButton.normalTitleColor = i == 1 ? JobsWhiteColor : JobsBlackColor;
            [_menuView addSubview:menuButton];
        }
        [self addSubview:_menuView];
    }return _menuView;
}

@end
