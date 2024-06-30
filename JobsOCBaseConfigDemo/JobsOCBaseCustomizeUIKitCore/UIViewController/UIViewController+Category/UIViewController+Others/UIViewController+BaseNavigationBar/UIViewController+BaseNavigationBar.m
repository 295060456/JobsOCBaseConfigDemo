//
//  UIViewController+BaseNavigationBar.m
//  UBallLive
//
//  Created by Jobs on 2020/10/21.
//

#import "UIViewController+BaseNavigationBar.h"

@implementation UIViewController (BaseNavigationBar)

- (void)gotoback{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES
                                 completion:nil];
    }
}
#pragma mark —— @property(nonatomic,strong)NavigationBar *navigationBar;
JobsKey(_navigationBar)
@dynamic navigationBar;
-(BaseNavigationBar *)navigationBar{
    BaseNavigationBar *NavBar = Jobs_getAssociatedObject(_navigationBar);
    if (!NavBar) {
        NavBar = BaseNavigationBar.new;
        //优先级:背景图 > 背景色
        NavBar.backgroundColor = self.bgCor;
        [NavBar setBackgroundImage:self.bgImage
                     forBarMetrics:UIBarMetricsDefault];//仅仅是 navigationBar 背景
        NavBar.titleTextAttributes = @{
            NSForegroundColorAttributeName:self.foregroundColorAttributeNameCor,
            NSShadowAttributeName:self.shadow,
            NSFontAttributeName:self.fontAttributeName
        };//设置导航上的title显示样式
        [NavBar setBarTintColor:JobsRedColor];//一般的业务是全局设置，因为一个App里面只有一个主题
        NavBar.tintColor = JobsBlackColor;//系统的组件着色（返回按钮——箭头图标 和 上面的字）
        NavBar.items = @[self.navItem];
        NavBar.translucent = self.isBarTranslucent;
        NavBar.hidden = self.isHiddenNavigationBar;
        [self.view addSubview:NavBar];
        [NavBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self.view);
            make.height.mas_offset(self.jobsNavigationBarHeight);
        }];
        Jobs_setAssociatedRETAIN_NONATOMIC(_navigationBar, NavBar)
    }return NavBar;
}

-(void)setNavigationBar:(BaseNavigationBar *)navigationBar{
    Jobs_setAssociatedRETAIN_NONATOMIC(_navigationBar, navigationBar)
}
#pragma mark —— @property(nonatomic,strong)UIBarButtonItem *leftBarButtonItem_back;
JobsKey(_leftBarButtonItem_back)
@dynamic leftBarButtonItem_back;
-(UIBarButtonItem *)leftBarButtonItem_back{
    UIBarButtonItem *LeftBarButtonItem_back = Jobs_getAssociatedObject(_leftBarButtonItem_back);
    if (!LeftBarButtonItem_back) {
        if(self.navigationController.viewControllers.count > 1){
            NSString *imageName = self.gk_backStyle == GKNavigationBarBackStyleBlack ? @"btn_back_black" : @"btn_back_white";
            UIImage *backImage = JobsBuddleIMG(nil,
                                            @"Frameworks/GKNavigationBar.framework/GKNavigationBar",
                                            nil,
                                            imageName);
            LeftBarButtonItem_back = [UIBarButtonItem.alloc initWithImage:[backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(gotoback)];
            
            [self setLeftBarButtonItem_back:LeftBarButtonItem_back];
        }
    }return LeftBarButtonItem_back;
}

- (void)setLeftBarButtonItem_back:(UIBarButtonItem *)leftBarButtonItem_back{
    Jobs_setAssociatedRETAIN_NONATOMIC(_leftBarButtonItem_back, leftBarButtonItem_back)
}
#pragma mark —— @property(nonatomic,strong)UIColor *bgCor;
JobsKey(_bgCor)
@dynamic bgCor;
-(UIColor *)bgCor{
    UIColor *BgCor = Jobs_getAssociatedObject(_bgCor);
    if (!BgCor) {
        BgCor = JobsLightGrayColor;
        Jobs_setAssociatedRETAIN_NONATOMIC(_bgCor, BgCor)
    }return BgCor;
}

-(void)setBgCor:(UIColor *)bgCor{
    Jobs_setAssociatedRETAIN_NONATOMIC(_bgCor, bgCor)
}
#pragma mark —— @property(nonatomic,assign)CGFloat jobsNavigationBarHeight;
JobsKey(_jobsNavigationBarHeight)
@dynamic jobsNavigationBarHeight;
-(CGFloat)jobsNavigationBarHeight{
    CGFloat jobsNavigationBarHeight = [Jobs_getAssociatedObject(_jobsNavigationBarHeight) floatValue];
    if (jobsNavigationBarHeight == 0) {
        jobsNavigationBarHeight = JobsNavigationBarAndStatusBarHeight(nil);
        Jobs_setAssociatedRETAIN_NONATOMIC(_jobsNavigationBarHeight, @(jobsNavigationBarHeight));
    }return jobsNavigationBarHeight;
}

-(void)setJobsNavigationBarHeight:(CGFloat)jobsNavigationBarHeight{
    Jobs_setAssociatedRETAIN_NONATOMIC(_jobsNavigationBarHeight, @(jobsNavigationBarHeight));
}
#pragma mark —— @property(nonatomic,assign)BOOL isHiddenNavigationBar
JobsKey(_isHiddenNavigationBar)
@dynamic isHiddenNavigationBar;
-(BOOL)isHiddenNavigationBar{//默认不显示
    return [Jobs_getAssociatedObject(_isHiddenNavigationBar) boolValue];
}

-(void)setIsHiddenNavigationBar:(BOOL)isHiddenNavigationBar{
    [self.navigationController setNavigationBarHidden:isHiddenNavigationBar animated:true];
    Jobs_setAssociatedRETAIN_NONATOMIC(_isHiddenNavigationBar, @(isHiddenNavigationBar))
}
#pragma mark —— @property(nonatomic,assign)BOOL isBarTranslucent;
JobsKey(_isBarTranslucent)
@dynamic isBarTranslucent;
-(BOOL)isBarTranslucent{//默认
    return [Jobs_getAssociatedObject(_isBarTranslucent) boolValue];
}

-(void)setIsBarTranslucent:(BOOL)isBarTranslucent{
    Jobs_setAssociatedRETAIN_NONATOMIC(_isBarTranslucent, @(isBarTranslucent))
}
#pragma mark —— @property(nonatomic,strong)NSShadow *shadow;
JobsKey(_shadow)
@dynamic shadow;
-(NSShadow *)shadow{
    NSShadow *Shadow = Jobs_getAssociatedObject(_shadow);
    if (!Shadow) {
        Shadow = NSShadow.new;
        Shadow.shadowColor = self.shadowCor;
        Shadow.shadowOffset = CGSizeZero;
        Jobs_setAssociatedRETAIN_NONATOMIC(_shadow, Shadow)
    }return Shadow;
}

-(void)setShadow:(NSShadow *)shadow{
    Jobs_setAssociatedRETAIN_NONATOMIC(_shadow, shadow)
}
#pragma mark —— @property(nonatomic,strong)UINavigationItem *navItem;
JobsKey(_navItem)
@dynamic navItem;
-(UINavigationItem *)navItem{
    UINavigationItem *NavItem = Jobs_getAssociatedObject(_navItem);
    if (!NavItem) {
        NavItem = UINavigationItem.new;
        NavItem.title = self.title;
        NavItem.leftBarButtonItem = self.leftBarButtonItem_back;
        Jobs_setAssociatedRETAIN_NONATOMIC(_navItem, NavItem)
    }return NavItem;
}

-(void)setNavItem:(UINavigationItem *)navItem{
    Jobs_setAssociatedRETAIN_NONATOMIC(_navItem, navItem)
}
#pragma mark —— @property(nonatomic,strong)UIColor *foregroundColorAttributeNameCor;
JobsKey(_foregroundColorAttributeNameCor)
@dynamic foregroundColorAttributeNameCor;
-(UIColor *)foregroundColorAttributeNameCor{
    UIColor *ForegroundColorAttributeNameCor = Jobs_getAssociatedObject(_foregroundColorAttributeNameCor);
    if (!ForegroundColorAttributeNameCor) {
        ForegroundColorAttributeNameCor = JobsGreenColor;
        Jobs_setAssociatedRETAIN_NONATOMIC(_foregroundColorAttributeNameCor, ForegroundColorAttributeNameCor)
    }return ForegroundColorAttributeNameCor;
}

-(void)setForegroundColorAttributeNameCor:(UIColor *)foregroundColorAttributeNameCor{
    Jobs_setAssociatedRETAIN_NONATOMIC(_foregroundColorAttributeNameCor, foregroundColorAttributeNameCor)
}
#pragma mark —— @property(nonatomic,strong)UIFont *fontAttributeName;
JobsKey(_fontAttributeName)
@dynamic fontAttributeName;
-(UIFont *)fontAttributeName{
    UIFont *FontAttributeName = Jobs_getAssociatedObject(_fontAttributeName);
    if (!FontAttributeName) {
        FontAttributeName = JobsFontRegular(18);
        Jobs_setAssociatedRETAIN_NONATOMIC(_fontAttributeName, FontAttributeName)
    }return FontAttributeName;
}

-(void)setFontAttributeName:(UIFont *)fontAttributeName{
    Jobs_setAssociatedRETAIN_NONATOMIC(_fontAttributeName, fontAttributeName)
}
#pragma mark —— @property(nonatomic,strong)UIColor *tintColor;
JobsKey(_tintColor)
@dynamic tintColor;
-(UIColor *)tintColor{
    UIColor *TintColor = Jobs_getAssociatedObject(_tintColor);
    if (!TintColor) {
        TintColor = JobsGreenColor;
        Jobs_setAssociatedRETAIN_NONATOMIC(_tintColor, TintColor)
    }return TintColor;
}

-(void)setTintColor:(UIColor *)tintColor{
    Jobs_setAssociatedRETAIN_NONATOMIC(_tintColor, tintColor)
}
#pragma mark —— @property(nonatomic,strong)UIColor *barTintColor;
JobsKey(_barTintColor)
@dynamic barTintColor;
-(UIColor *)barTintColor{
    UIColor *BarTintColor = Jobs_getAssociatedObject(_barTintColor);
    if (!BarTintColor) {
        BarTintColor = JobsGreenColor;
        Jobs_setAssociatedRETAIN_NONATOMIC(_barTintColor, BarTintColor)
    }return BarTintColor;
}

-(void)setBarTintColor:(UIColor *)barTintColor{
    Jobs_setAssociatedRETAIN_NONATOMIC(_barTintColor, barTintColor)
}
#pragma mark —— @property(nonatomic,strong)NSString *title;
JobsKey(_title)
@dynamic title;
-(NSString *)title{
    return Jobs_getAssociatedObject(_title);
}

-(void)setTitle:(NSString *)title{
    Jobs_setAssociatedRETAIN_NONATOMIC(_title, title)
}
#pragma mark —— @property(nonatomic,strong)UIColor *shadowCor;
JobsKey(_shadowCor)
@dynamic shadowCor;
-(UIColor *)shadowCor{
    UIColor *ShadowCor = Jobs_getAssociatedObject(_shadowCor);
    if (!ShadowCor) {
        ShadowCor = RGBA_COLOR(0,
                              0,
                              0,
                              0.8);
        Jobs_setAssociatedRETAIN_NONATOMIC(_shadowCor, ShadowCor)
    }return ShadowCor;
}

-(void)setShadowCor:(UIColor *)shadowCor{
    Jobs_setAssociatedRETAIN_NONATOMIC(_shadowCor, shadowCor)
}

@end
