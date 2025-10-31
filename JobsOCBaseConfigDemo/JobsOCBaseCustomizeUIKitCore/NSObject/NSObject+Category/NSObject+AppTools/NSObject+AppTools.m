//
//  NSObject+AppTools.m
//  DouYin
//
//  Created by Jobs on 2021/4/6.
//

#import "NSObject+AppTools.h"

@implementation NSObject (AppTools)
#pragma mark —— 一些私有化方法
-(NSMutableArray <Class>*_Nullable)makeDataArr{
    NSMutableArray <Class>*tempDataArr = jobsMakeMutArr(^(__kindof NSMutableArray <Class>*_Nullable data) {
        for (int y = 0; y < AppDelegate.viewCtrlByTabBarCtrlConfigMutArr.count; y++) {
            UIViewController *viewController = AppDelegate.viewCtrlByTabBarCtrlConfigMutArr[y];
            JobsTabBarItemConfig *tabBarItemConfig = AppDelegate.tabBarItemConfigMutArr[y];
            if(tabBarItemConfig.isNotNeedCheckLogin){
                Class cls = viewController.class;
                data.add(cls);
            }
        }
    });return tempDataArr;
}
#pragma mark —— BaseProtocol
/// 【通知监听】国际化语言修改UI
/// @param targetView 需要铆定的UI
/// @param aSelector 相关逻辑
+(void)targetView:(UIView *)targetView
languageSwitchNotificationWithSelector:(SEL)aSelector{
    [self addNotificationName:语言切换
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        NSNotification *notification = (NSNotification *)arg;
        if([notification.object isKindOfClass:NSNumber.class]){
            NSNumber *b = notification.object;
            JobsLog(@"SSS = %d",b.boolValue);
        }JobsLog(@"通知传递过来的 = %@",notification.object);
    }];
}
/// 【App语言国际化】更改UITabBarItem的标题
-(jobsByIndexPathBlock _Nonnull)changeTabBarItemTitleBy{
    return ^(NSIndexPath *_Nullable indexPath){
        id appDelegate = getSysAppDelegate();
        if (!appDelegate) appDelegate = AppDelegate.sharedManager;
        if ([appDelegate isKindOfClass:AppDelegate.class]) {
            AppDelegate *ad = (AppDelegate *)appDelegate;
            [ad refreshTabBarTitle];
        }
    };
}
#pragma mark —— 测试调试专用
/// 查询当下的本地登录数据
-(jobsByVoidBlock _Nullable)checkLoginData{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        JobsUserModel *doorModel= self.readUserInfoByUserName(JobsUserModel.class,用户信息);
        JobsLog(@"Token = %@",doorModel.token);
        if(isValue(self.doorModel.expireTime)){
            JobsLog(@"当前时间为:%@, Token过期时间为:%@", NSDate.date, self.doorModel.expireTime.chinaTime(nil));
        }
    };
}
/// 调试 scrollView
-(jobsByScrollViewBlock _Nonnull)checkScrollView{
    return ^(__kindof UIScrollView *_Nullable scrollView){
        NSLog(@"contentSize: %@", NSStringFromCGSize(scrollView.contentSize));
        NSLog(@"bounds.size: %@", NSStringFromCGSize(scrollView.bounds.size));
        NSLog(@"scrollEnabled: %@", scrollView.scrollEnabled ? @"YES" : @"NO");
        NSLog(@"userInteractionEnabled: %@", scrollView.userInteractionEnabled ? @"YES" : @"NO");
        NSLog(@"panGestureRecognizer.enabled: %@", scrollView.panGestureRecognizer.enabled ? @"YES" : @"NO");
        NSLog(@"subviews: %@", scrollView.subviews);
        NSLog(@":");
    };
}
#pragma mark —— 计算UICollectionView.ContentSize
/// 计算 UICollectionView 所需的完整 contentSize（不滚动情况下能完全展示所有 cell）
/// - Parameters:
///   - itemCount: UICollectionViewCell的个数
///   - itemsPerLine: 每行（或每列）展示的 cell 个数，垂直滚动时代表每行个数，水平滚动时代表每列个数
///   - cellSize: 每个 UICollectionViewCell 的尺寸（CGSize）
///   - lineSpacing: 行间距（垂直方向间隔）
///   - interItemSpacing: 列间距（水平方向间隔）
///   - direction: UICollectionView 的滚动方向
-(CGSize)jobsCollectionViewContentSizeByItemCount:(NSUInteger)itemCount
                                     itemsPerLine:(NSUInteger)itemsPerLine
                                         cellSize:(CGSize)cellSize
                                      lineSpacing:(CGFloat)lineSpacing
                                 interItemSpacing:(CGFloat)interItemSpacing
                                        direction:(UICollectionViewScrollDirection)direction{
    if (itemCount == 0 || itemsPerLine == 0) return CGSizeZero;
    switch (direction) {
        case UICollectionViewScrollDirectionVertical: {
            NSUInteger rows = (itemCount + itemsPerLine - 1) / itemsPerLine;
            CGFloat height = cellSize.height * rows + lineSpacing * (rows - 1);
            CGFloat width = cellSize.width * itemsPerLine + interItemSpacing * (itemsPerLine - 1);
            return CGSizeMake(width, height);
        }
        case UICollectionViewScrollDirectionHorizontal: {
            NSUInteger columns = (itemCount + itemsPerLine - 1) / itemsPerLine;
            CGFloat width = cellSize.width * columns + interItemSpacing * (columns - 1);
            CGFloat height = cellSize.height * itemsPerLine + lineSpacing * (itemsPerLine - 1);
            return CGSizeMake(width, height);
        }default:return CGSizeZero;
    }
}
#pragma mark —— 一些公共设置
/// 设置返回按钮的文字、返回按钮的行为（默认导航栏标题（图片）为 BLuckyRedLogo）
-(JobsReturnNavBarConfigByStringAndActionBlock _Nullable)makeNavByTitleImageAndAction{
    return ^JobsNavBarConfig *_Nullable(NSString *_Nullable string,
                                        JobsReturnIDByIDBlock _Nullable backActionBlock){
        return jobsMakeNavBarConfig(^(__kindof JobsNavBarConfig * _Nullable config) {
            config.viewModel = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.Alpha = 1;
                viewModel.navBgCor = JobsClearColor;
                viewModel.navBgImage = @"".img;
                viewModel.titleImage = @"BLuckyRedLogo".img; /// 配置中间的标题为图片
            });
            config.backBtn = BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable buttonModel) {
                // @jobs_strongify(self)
                buttonModel.normalImage = @"全局返回箭头".img;
                buttonModel.highlightImage = @"全局返回箭头".img;
                buttonModel.title = string;
                buttonModel.titleFont = bayonRegular(18);
                buttonModel.titleCor = JobsCor(@"#E20808");
                buttonModel.imagePlacement = NSDirectionalRectEdgeLeading;
                buttonModel.textAlignment = NSTextAlignmentCenter;
                buttonModel.subTextAlignment = NSTextAlignmentCenter;
                buttonModel.baseBackgroundColor = JobsClearColor;
                buttonModel.imagePadding = JobsWidth(5);
                buttonModel.clickEventBlock = backActionBlock;
                buttonModel.longPressGestureEventBlock = ^id(__kindof UIButton *_Nullable x){
                    // @jobs_strongify(self)
                    return nil;
                };
            }));
        });
    };
}
/// 设置导航栏标题（文字）、返回按钮的文字、返回按钮的行为
-(JobsReturnNavBarConfigByStringsAndActionBlock _Nullable)makeNavByTitlesAndAction{
    return ^JobsNavBarConfig *_Nullable(NSString *_Nullable title,
                                        NSString *_Nullable backTitle,
                                        JobsReturnIDByIDBlock _Nullable backActionBlock){
        return jobsMakeNavBarConfig(^(__kindof JobsNavBarConfig * _Nullable config) {
            config.viewModel = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.Alpha = 1;
                viewModel.navBgCor = JobsClearColor;
                viewModel.textModel.text = title;
                viewModel.textModel.font = bayonRegular(JobsWidth(18));
                viewModel.navBgImage = @"".img;
            });
            config.backBtn = BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable buttonModel) {
                // @jobs_strongify(self)
                buttonModel.normalImage = @"全局返回箭头".img;
                buttonModel.highlightImage = @"全局返回箭头".img;
                buttonModel.title = backTitle;
                buttonModel.titleFont = bayonRegular(18);
                buttonModel.titleCor = JobsCor(@"#E20808");
                buttonModel.imagePlacement = NSDirectionalRectEdgeLeading;
                buttonModel.textAlignment = NSTextAlignmentCenter;
                buttonModel.subTextAlignment = NSTextAlignmentCenter;
                buttonModel.baseBackgroundColor = JobsClearColor;
                buttonModel.imagePadding = JobsWidth(5);
                buttonModel.clickEventBlock = backActionBlock;
                buttonModel.longPressGestureEventBlock = ^id(__kindof UIButton *_Nullable x){
                    // @jobs_strongify(self)
                    return nil;
                };
            }));
        });
    };
}
/// 设置返回按钮的文字（默认退回上一个页面）
-(JobsReturnNavBarConfigByStringBlock _Nullable)makeNav0ByTitle{
    @jobs_weakify(self)
    return ^JobsNavBarConfig *_Nullable(NSString *_Nullable string){
        @jobs_strongify(self)
        return self.makeNavByTitleImageAndAction(string,^id(__kindof UIButton *_Nullable x){
            @jobs_strongify(self)
            x.selected = !x.selected;
            /// 退回上一个页面
            self.backViewControllerCore((__kindof UIViewController *)self);
            return nil;
        });
    };
}
/// 设置返回按钮的文字（默认退回TabBar0）
-(JobsReturnNavBarConfigByStringBlock _Nullable)makeNav1ByTitle{
    @jobs_weakify(self)
    return ^JobsNavBarConfig *_Nullable(NSString *_Nullable string){
        @jobs_strongify(self)
        return self.makeNavByTitleImageAndAction(string,^id(__kindof UIButton *_Nullable x){
            @jobs_strongify(self)
            x.selected = !x.selected;
            /// 退回TabBar0
            self.backTo(0);
            return nil;
        });
    };
}
/// 设置导航栏标题、返回按钮文字、返回按钮的行为
-(JobsReturnNavBarConfigByStringsBlock _Nullable)makeNav2ByTitle{
    @jobs_weakify(self)
    return ^JobsNavBarConfig *_Nullable(NSString *_Nullable title,NSString *_Nullable backBtnTitle){
        @jobs_strongify(self)
        return self.makeNavByTitlesAndAction(title,backBtnTitle,^id(__kindof UIButton *_Nullable x){
            @jobs_strongify(self)
            x.selected = !x.selected;
            self.backTo(0);
            return nil;
        });
    };
}

-(JobsReturnNavBarConfigByStringsBlock _Nullable)makeNav3ByTitle{
    @jobs_weakify(self)
    return ^JobsNavBarConfig *_Nullable(NSString *_Nullable title,NSString *_Nullable backBtnTitle){
        @jobs_strongify(self)
        return self.makeNavByTitlesAndAction(title,backBtnTitle,^id(__kindof UIButton *_Nullable x){
            @jobs_strongify(self)
            x.selected = !x.selected;
            /// 退回上一个页面
            self.backViewControllerCore((__kindof UIViewController *)self);
            return nil;
        });
    };
}

-(jobsByVoidBlock _Nonnull)唤起人工客服{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.jobsOpenURL(@"https://direct.lc.chat/18866559/");
    };
}

-(jobsByVoidBlock _Nonnull)唤起Telegram{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.jobsOpenURL(@"https://t.me/bsports_ph");
    };
}

-(jobsByVoidBlock _Nonnull)唤起FaceBook{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.jobsOpenURL(@"https://www.facebook.com/profile.php?id=61569306594235");
    };
}
/// 选择电话号码区位
-(__kindof UIButton *)zoneCodeBtnByBlock:(jobsByIDBlock _Nonnull)block{
    return BaseButton.initByStyle1(@"+".add(@"63"),
                                   JobsFontRegular(JobsWidth(16)),
                                   JobsWhiteColor)
    .onClickBy(^(UIButton *x){
        if (block) block(x);
    }).bySize(CGSizeMake(JobsWidth(50), JobsWidth(30)))
        .rightBorderColor(JobsWhiteColor)
        .rightBorderWidth(1);
}
/// 配置弹窗数据
-(JobsReturnViewModelByStringBlock _Nonnull)configPopUpDataBy{
    return ^__kindof UIViewModel *_Nullable(NSString *_Nullable data){
        return jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.text = data;
            viewModel.font = UIFontWeightRegularSize(JobsWidth(16));
            viewModel.textCor = JobsCor(@"#5D5D5D");
            viewModel.selectedTextCor = JobsWhiteColor;
            viewModel.bgSelectedCor = JobsCor(@"#5D5D5D");
            viewModel.bgCor = JobsCor(@"#1F1F1F");
            viewModel.textAlignment = NSTextAlignmentCenter;
        });
    };
}
/// 适配各种机型的开屏图片
-(NSString * _Nullable)imageNameOrURLString{
    NSString *imgNameOrUrlStr = @"";
    switch (iPhScrPx()) {
        case iPhScrPxType_4_4S:{// 屏幕分辨率(px) = 640 * 960
            imgNameOrUrlStr = @"640x960.png";
        }break;
        case iPhScrPxType_5_5C_5S_SE:{// 屏幕分辨率(px) = 640 * 1136
            imgNameOrUrlStr = @"640x1136.png";
        }break;
        case iPhScrPxType_6_6S_7_8_SE2:{// 屏幕分辨率(px) = 750 * 1334
            imgNameOrUrlStr = @"750x1334.png";
        }break;
        case iPhScrPxType_6_6S_7_8Plus:{// 屏幕分辨率(px) = 1242 * 2208
            imgNameOrUrlStr = @"1242x2208.png";
        }break;
        case iPhScrPxType_X_XS_11Pro:{// 屏幕分辨率(px) = 1125 * 2436
            imgNameOrUrlStr = @"1125x2436.png";
        }break;
        case iPhScrPxType_Xr_11:{// 屏幕分辨率(px) = 828 * 1792
            imgNameOrUrlStr = @"828x1792.png";
        }break;
        case iPhScrPxType_XSMax_11ProMax:{// 屏幕分辨率(px) = 1242 * 2688
            imgNameOrUrlStr = @"1242x2688.png";
        }break;
        case iPhScrPxType_12mini:{// 屏幕分辨率(px) = 1125 * 2436
            imgNameOrUrlStr = @"1125x2436.png";
        }break;
        case iPhScrPxType_12_12Pro:{// 屏幕分辨率(px) = 1170 * 2532
            imgNameOrUrlStr = @"1170x2532.png";
        }break;
        case iPhScrPxType_12ProMax:{// 屏幕分辨率(px) = 1284 * 2778
            imgNameOrUrlStr = @"1284x2778.png";
        }break;
        case iPhScrPxType_13mini:{// 屏幕分辨率(px) = 1125 * 2436
            imgNameOrUrlStr = @"1125x2436.png";
        }break;
        case iPhScrPxType_13_13Pro:{// 屏幕分辨率(px) = 1170 * 2532
            imgNameOrUrlStr = @"1170x2532.png";
        }break;
        case iPhScrPxType_13ProMax:{// 屏幕分辨率(px) = 1284 * 2778
            imgNameOrUrlStr = @"1284x2778.png";
        }break;
        case iPhScrPxType_14:{// 屏幕分辨率(px) = 1125 * 2436
            imgNameOrUrlStr = @"1125x2436.png";
        }break;
        case iPhScrPxType_14Plus:{// 屏幕分辨率(px) = 1284 * 2778
            imgNameOrUrlStr = @"1284x2778.png";
        }break;
        case iPhScrPxType_14Pro:{// 屏幕分辨率(px) = 1179 * 2556
            imgNameOrUrlStr = @"1179x2556.png";
        }break;
        case iPhScrPxType_14ProMax:{// 屏幕分辨率(px) = 1290 * 2796
            imgNameOrUrlStr = @"1290x2796.png";
        }break;
            
        default:{
            imgNameOrUrlStr = @"启动页SLOGAN.png";
        }break;
    }return imgNameOrUrlStr;
}
/// 适配各种机型的开屏视频
-(NSString * _Nullable)videoNameOrURLString{
    NSString *imgNameOrUrlStr = @"";
    switch (iPhScrPx()) {
        case iPhScrPxType_4_4S:{// 屏幕分辨率(px) = 640 * 960
            imgNameOrUrlStr = @"非iph_X.mp4";
        }break;
        case iPhScrPxType_5_5C_5S_SE:{// 屏幕分辨率(px) = 640 * 1136
            imgNameOrUrlStr = @"非iph_X.mp4";
        }break;
        case iPhScrPxType_6_6S_7_8_SE2:{// 屏幕分辨率(px) = 750 * 1334
            imgNameOrUrlStr = @"非iph_X.mp4";
        }break;
        case iPhScrPxType_6_6S_7_8Plus:{// 屏幕分辨率(px) = 1242 * 2208
            imgNameOrUrlStr = @"非iph_X.mp4";
        }break;
        case iPhScrPxType_X_XS_11Pro:{// 屏幕分辨率(px) = 1125 * 2436
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_Xr_11:{// 屏幕分辨率(px) = 828 * 1792
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_XSMax_11ProMax:{// 屏幕分辨率(px) = 1242 * 2688
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_12mini:{// 屏幕分辨率(px) = 1125 * 2436
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_12_12Pro:{// 屏幕分辨率(px) = 1170 * 2532
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_12ProMax:{// 屏幕分辨率(px) = 1284 * 2778
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_13mini:{// 屏幕分辨率(px) = 1125 * 2436
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_13_13Pro:{// 屏幕分辨率(px) = 1170 * 2532
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_13ProMax:{// 屏幕分辨率(px) = 1284 * 2778
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_14:{// 屏幕分辨率(px) = 1125 * 2436
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_14Plus:{// 屏幕分辨率(px) = 1284 * 2778
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_14Pro:{// 屏幕分辨率(px) = 1179 * 2556
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_14ProMax:{// 屏幕分辨率(px) = 1290 * 2796
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
            
        default:{
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
    }return imgNameOrUrlStr;
}
/// 检查当前IP是否为菲律宾IP
-(void)checkIfIPInPhilippinesByBlock:(jobsByBOOLBlock _Nonnull)block{
    [[NSURLSession.sharedSession dataTaskWithURL:@"https://ipapi.co/json/".jobsUrl
                               completionHandler:^(NSData *_Nullable data,
                                                   NSURLResponse *_Nullable response,
                                                   NSError *_Nullable error) {
        if (error) {
            JobsLog(@"请求失败：%@", error.localizedDescription);
            return;
        }
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:0
                                                               error:&jsonError];
        if (jsonError) {
            JobsLog(@"JSON解析失败：%@", jsonError.localizedDescription);
            return;
        }
        /// 从响应数据中获取国家代码
        NSString *countryCode = json[@"country"];
        if(block) block(countryCode.isEqualToString(@"PH"));
    }] resume];
}
/// 数据组装
-(JobsReturnViewModelByDecorationModelBlock _Nonnull)makeDatas{
    @jobs_weakify(self)
    return ^UIViewModel *_Nullable(JobsDecorationModel *_Nullable model){
        @jobs_strongify(self)
        UIViewModel *viewModel = [self configViewModelWithAttributeTitle:model.title
                                                       attributeSubTitle:model.subTitle];
        viewModel.cls = model.cls;
        viewModel.requestParams = model.requestParams;
        return viewModel;
    };
}
/// 默认文本段落样式（两端对齐）
-(NSMutableParagraphStyle *)defaultParagraphStyle{
    return jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data) {
        data.alignment = NSTextAlignmentJustified;/// 两端对齐
        data.paragraphSpacing = 0;/// 段距，取值 float
        data.paragraphSpacingBefore = 0;/// 段首空间，取值 float
        data.firstLineHeadIndent = 0.0;/// 首行缩进，取值 float
        data.headIndent = 0.0;/// 整体缩进(首行除外)，取值 float
        data.lineSpacing = 0;/// 行距，取值 float
    });
}
/// 默认文本段落样式（左端对齐）
-(NSMutableParagraphStyle *)defaultParagraphStyle2{
    return jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data) {
        data.alignment = NSTextAlignmentLeft;/// 左端对齐
        data.paragraphSpacing = 0;/// 段距，取值 float
        data.paragraphSpacingBefore = 0;/// 段首空间，取值 float
        data.firstLineHeadIndent = 0.0;/// 首行缩进，取值 float
        data.headIndent = 0.0;/// 整体缩进(首行除外)，取值 float
        data.lineSpacing = 0;/// 行距，取值 float
    });
}
/// Terms Of Use
-(void)makeTermsOfUseByBlock:(jobsByIDBlock _Nonnull)block{
    ShowView(FMTermsOfUseView
             .BySize(FMTermsOfUseView.viewSizeByModel(nil))
             .JobsRichViewByModel2(nil)
             .JobsBlock1(^(id _Nullable data) {
                 if(block) block(data);
             }));
}
/// 联系我们.按钮
-(__kindof UIButton *_Nullable)makeContactBtn{
    @jobs_weakify(self)
    return BaseButton.initByBackgroundImage(@"联系我们".img)
        .onClickBy(^(UIButton *x){
            @jobs_strongify(self)
            if (self.objBlock) self.objBlock(x);
            self.comingToPushVC(MyCollectionVC.new);
            toast(@"联系我们");
        }).onLongPressGestureBy(^(id data){
            JobsLog(@"");
        });
}
/// 关闭.按钮
-(__kindof UIButton *_Nullable)makeCloseBtnByActionBlock:(jobsByVoidBlock _Nullable)actionBlock{
    @jobs_weakify(self)
    return BaseButton.initByBackgroundImage(@"关闭按钮（灰色）".img)
        .onClickBy(^(UIButton *x){
            @jobs_strongify(self)
            if (self.objBlock) self.objBlock(x);
            if(actionBlock) actionBlock();
            if (KindOfViewCls(self)) {
                UIView *view = (UIView *)self;
                [view tf_hide:nil];
            }
        }).onLongPressGestureBy(^(id data){
            JobsLog(@"");
        });
}
/// 控制CustomTabBar的显隐
-(jobsByBOOLBlock _Nonnull)showCustomTabBar{
    return ^(BOOL data){
        CustomTabBar.jobsVisible = data;
    };
}
/// 创建JobsCustomTabBar（单例模式）
static JobsCustomTabBar *sharedCustomTabBar = nil;
+(JobsReturnCustomTabBarByViewBlock _Nonnull)makeCustomTabBarBy{
    return ^JobsCustomTabBar *_Nullable(__kindof UIView *_Nullable view){
        if(!sharedCustomTabBar){
            sharedCustomTabBar = jobsMakeCustomTabBar(^(__kindof JobsCustomTabBar *_Nullable customTabBar) {
                customTabBar.backgroundColor = JobsClearColor;
//                customTabBar.backgroundColor = JobsRedColor;
                customTabBar.configMasonryBy(view);
            });
        }return sharedCustomTabBar;
    };
}
/// 导航返回键的配置
-(UIButtonModel *)makeBackBtnModel{
    @jobs_weakify(self)
    return jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
//        data.backgroundImage = @"返回".img
        data.highlightBackgroundImage = @"返回".img;
        data.highlightImage = @"返回".img;
        data.normalImage = @"返回".img;
        data.baseBackgroundColor = JobsClearColor.colorWithAlphaComponentBy(0);
        data.title = self.viewModel.backBtnTitleModel.text;
        data.font = self.viewModel.backBtnTitleModel.font;
        data.titleCor = JobsBlackColor;
        data.selectedTitleCor = JobsBlackColor;
        data.roundingCorners = UIRectCornerAllCorners;
        data.imagePlacement = NSDirectionalRectEdgeLeading;
        data.imagePadding = JobsWidth(5);
    });
}
/// 发通知：登录成功
-(jobsByVoidBlock _Nonnull)loginOK{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.jobsPost(登录成功);
    };
}
/// 发通知：退出登录成功
-(jobsByVoidBlock _Nonnull)logoutOK{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.jobsPost(退出登录成功);
    };
}
#pragma mark —— <AppToolsProtocol> 关于注册登录
/// Token过期应该做的事情
-(jobsByVoidBlock _Nonnull)tokenExpire{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.cleanUserData(); /// 清除用户数据资料
        JobsPostNotification(退出登录成功, @(YES));
        self.toLogin();
        toast(@"Token 已经过期，请重新登录");
    };
}
/// 退出登录应该做的事情
-(jobsByVoidBlock _Nonnull)logout{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.cleanUserData();
        JobsPostNotification(退出登录成功, @(YES));
        toast(JobsInternationalization(@"退出登录成功"));
        self.popToRootVCBy(YES);
    };
}
/// 清除用户数据资料
-(jobsByVoidBlock _Nonnull)cleanUserData{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.doorModel = nil;
#ifdef DEBUG
        toast(@"Token过期，自动清除本地用户数据");
#endif
    };
}
/// 去登录？去注册？
-(jobsByNSIntegerBlock _Nonnull)toLoginOrRegister{
    return ^(CurrentPage appDoorContentType){
        // 登录页 不推出 登录页
        UIViewController *viewController = self.getCurrentViewController;
        if ([viewController isKindOfClass:JobsAppDoorVC.class]) return;
        // 首页没有展现的时候，不推出登录页
        //    extern BOOL CasinoHomeVC_viewDidAppear;
        //    if(!CasinoHomeVC_viewDidAppear) return;
        viewController.comingToPresentVCByRequestParams(JobsAppDoorVC.new,
                                                        jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.requestParams = @(JobsAppDoorBgType_Video);
        }));
    };
}
/// 强制登录：没登录（本地用户数据为空）就去登录
-(jobsByVoidBlock _Nonnull)forcedLogin{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if (!self.isLogin) self.toLogin();
    };
}
/// 去登录：有限制makeDataArr
-(jobsByVoidBlock _Nonnull)toLogin{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self toLoginOrRegisterWithRestricted:self.makeDataArr
                           appDoorContentType:CurrentPage_Login];
    };
}
/// 限制条件：在某些页面（noNeedLoginArr）不调取登录页
-(void)toLoginOrRegisterWithRestricted:(__kindof NSArray <Class>*_Nullable)dataArr
                    appDoorContentType:(CurrentPage)appDoorContentType{
    if (dataArr.containsObject(self.class)) return;/// 包含则不触发AppDoor的页面
    self.toLoginOrRegister(appDoorContentType);
}
/// 触发退出登录模块之前，弹窗提示二次确认，确认以后再删除本地用户数据
-(void)popUpViewToLogout{
    [self popupShowScaleWithView:self.logOutPopupView popupParameter:self.popupParameter];
}
#pragma mark —— <AppToolsProtocol> 关于 TabBar
/// 切换Tab
-(jobsByNSIntegerBlock _Nonnull)backTo{
    return ^(NSInteger data){
        [AppDelegate button:AppDelegate.tabBarItemMutArr[data] index:data];
    };
}
/// 控制TabBar的显隐（在TabBarController的条件下）
-(jobsByBOOLBlock _Nonnull)showTabBar{
    return ^(BOOL data){
        AppDelegate.jobsCustomTabBarVC.customTabBar.jobsVisible = data;
    };
}
/// TabBar
-(UITabBar *)getTabBar{
    return AppDelegate.tabBarVC.tabBar;
}
/// 跳到首页
-(void)jumpToHome{
    AppDelegate.tabBarVC.selectedIndex = 0;
}
/// JobsTabbarVC 关闭手势
-(jobsByVoidBlock _Nonnull)tabBarClosePan{
    return ^(){
        AppDelegate.tabBarVC.closePan();
    };
}
/// JobsTabbarVC 打开手势
-(jobsByVoidBlock _Nonnull)tabBarOpenPan{
    return ^(){
        AppDelegate.tabBarVC.openPan();
    };
}
/// 获取Tabbar管理的，不含导航的根控制器
-(NSMutableArray <__kindof UIViewController *>*)appRootVC{
    return AppDelegate.viewCtrlMutArr;
}
/// 当前对象是否是 Tabbar管理的，不含导航的根控制器
-(BOOL)isRootVC{
    if ([self isKindOfClass:UIViewController.class]) {
        return self.appRootVC.containsObject((UIViewController *)self);
    }else return NO;
}
#pragma mark —— 关于图片编解码
/// 图片base64编码，再固定50字符的位置加入固定盐。盐码（盐需大写、长度 16位）：RRU4JZTV5WZXPCVZ
/// 编码
-(JobsReturnStringByStringBlock _Nonnull)encodePicStr{
    return ^(NSString * _Nullable picStr) {
        /// 将NSString转换为NSMutableString，以便修改
        NSMutableString *modifiedString = picStr.mutableCopy;
        /// 在指定位置插入字符串
        [modifiedString insertString:PicSalt atIndex:50];
        return modifiedString;
    };
}
/// 解码
-(JobsReturnStringByStringBlock _Nonnull)decodePicStr{
    return ^(NSString * _Nullable encodePicStr) {
        // 删除字符串
        return [encodePicStr stringByReplacingOccurrencesOfString:PicSalt withString:@""];
    };
}
#pragma mark —— <AppToolsProtocol> 其他
/// 根据 x 和 y 的绝对值判断主方向
-(JobsReturnStringByCGPointBlock _Nonnull)directionByTranslation{
    return ^__kindof NSString *_Nullable(CGPoint translation){
        if (fabs(translation.x) > fabs(translation.y)) {
            return translation.x > 0 ? @"右滑" : @"左滑";/// 水平方向
        } else {
            return translation.y > 0 ? @"下滑" : @"上滑";/// 垂直方向
        }
    };
}

-(JobsReturnNSIntegerByPointBlock _Nonnull)directionByPoint{
    return ^MoveDirection(CGPoint translation){
        if (fabs(translation.x) > fabs(translation.y)) {
            return translation.x > 0 ? MoveDirection_horizont_right : MoveDirection_horizont_left;/// 水平方向
        } else {
            return translation.y > 0 ? MoveDirection_vertical_down : MoveDirection_vertical_up;/// 垂直方向
        }
    };
}
/// 设置普通文本
-(UIViewModel *)configViewModelWithTitle:(NSString *_Nullable)title
                                subTitle:(NSString *_Nullable)subTitle{
    return jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
        viewModel.textModel = jobsMakeTextModel(^(__kindof UITextModel * _Nullable textModel) {
            textModel.text = JobsInternationalization(title);
        });
        
        viewModel.subTextModel = jobsMakeTextModel(^(__kindof UITextModel * _Nullable textModel) {
            textModel.text = JobsInternationalization(isNull(subTitle) ? @"点击查看" : subTitle);
        });
        
        viewModel.backBtnTitleModel = jobsMakeTextModel(^(__kindof UITextModel * _Nullable textModel) {
            textModel.text = JobsInternationalization(@"返回首页");
        });
    });
}
/// 带段落配置的文本
-(UIViewModel *)configViewModelWithAttributeTitle:(NSString *_Nullable)title
                                attributeSubTitle:(NSString *_Nullable)subTitle{
    return jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
        {
            NSMutableAttributedString *attributedText = JobsMutAttributedString(JobsInternationalization(title));
            attributedText.addFontAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                data.value = UITextModel.new.font;
                data.range = NSMakeRange(0, JobsInternationalization(title).length);
            }))
            .addAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                data.value = jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data) {
                    data.lineSpacing = 0;
                    data.alignment = NSTextAlignmentLeft; // 设置对齐方式为左对齐
                    data.lineBreakMode = NSLineBreakByWordWrapping; // 设置换行模式为单词换行
                });
                data.range = NSMakeRange(0, JobsInternationalization(title).length);
            }));
            viewModel.textModel.attributedTitle = attributedText;
        }
        
        {
            NSMutableAttributedString *attributedText = JobsMutAttributedString(JobsInternationalization(isNull(subTitle) ? @"点击查看" : subTitle));
            attributedText.addFontAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                data.value = UITextModel.new.font;
                data.range = NSMakeRange(0, JobsInternationalization(isNull(subTitle) ? @"点击查看" : subTitle).length);
            }))
            .addAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                data.value = jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data) {
                    data.lineSpacing = 0;
                    data.alignment = NSTextAlignmentLeft; // 设置对齐方式为左对齐
                    data.lineBreakMode = NSLineBreakByWordWrapping; // 设置换行模式为单词换行
                });
                data.range = NSMakeRange(0, JobsInternationalization(isNull(subTitle) ? @"点击查看" : subTitle).length);
            }));
            viewModel.subTextModel.attributedTitle = attributedText;
        }
        
        viewModel.backBtnTitleModel = jobsMakeTextModel(^(__kindof UITextModel * _Nullable data) {
            data.text = JobsInternationalization(@"返回首页");
        });
    });
}
/// （在登陆与否的情况下）默认的用户头像
-(UIImage *)defaultHeaderImage{
    return self.isLogin ? @"default_avatar_white".img : @"未登录默认头像（灰）".img;
}
/// 字符串当前语言环境
-(NSString *)currentLanguage{
    if (currentLanguage().containsString(简体中文)) {
        return @"简体中文";
    }else if (currentLanguage().containsString(英文_不带区域组合)){
        return @"English";
    }else{
        JobsLog(@"%@",currentLanguage());
        return @"其他语言";
    }
}
/// 首页的假数据
-(NSMutableArray <__kindof UIButtonModel *>*)gameDataMutArr{
    return jobsMakeMutArr(^(__kindof NSMutableArray <UIButtonModel *>* _Nullable data) {
        data.add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
            model.title = JobsInternationalization(@"HOT Games");
            model.subTitle = JobsInternationalization(@"");
            model.titleCor = JobsCor(@"#3D3D3D");
            model.titleFont = bayonRegular(JobsWidth(10));
            model.backgroundImage = @"首页切换游戏种类按钮背景图（未选择）".img;
            model.highlightBackgroundImage = @"首页切换游戏种类按钮背景图（已选择）".img;
            model.highlightImage = @"HOT Games".img;
            model.normalImage = @"HOT Games".img;
            model.imagePlacement = NSDirectionalRectEdgeTop;
            model.baseBackgroundColor = JobsClearColor;
        })).add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
            model.title = JobsInternationalization(@"SPORTS");
            model.subTitle = JobsInternationalization(@"");
            model.titleCor = JobsCor(@"#3D3D3D");
            model.titleFont = bayonRegular(JobsWidth(10));
            model.backgroundImage = @"首页切换游戏种类按钮背景图（未选择）".img;
            model.highlightBackgroundImage = @"首页切换游戏种类按钮背景图（已选择）".img;
            model.highlightImage = @"SPORTS".img;
            model.normalImage = @"SPORTS".img;
            model.imagePlacement = NSDirectionalRectEdgeTop;
            model.baseBackgroundColor = JobsClearColor;
        })).add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
            model.title = JobsInternationalization(@"SLOT GAMES");
            model.subTitle = JobsInternationalization(@"");
            model.titleCor = JobsCor(@"#3D3D3D");
            model.titleFont = bayonRegular(JobsWidth(10));
            model.backgroundImage = @"首页切换游戏种类按钮背景图（未选择）".img;
            model.highlightBackgroundImage = @"首页切换游戏种类按钮背景图（已选择）".img;
            model.highlightImage = @"SLOT GAMES".img;
            model.normalImage = @"SLOT GAMES".img;
            model.imagePlacement = NSDirectionalRectEdgeTop;
            model.baseBackgroundColor = JobsClearColor;
        })).add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
            model.title = JobsInternationalization(@"LIVE GAMES");
            model.subTitle = JobsInternationalization(@"");
            model.titleCor = JobsCor(@"#3D3D3D");
            model.titleFont = bayonRegular(JobsWidth(10));
            model.backgroundImage = @"首页切换游戏种类按钮背景图（未选择）".img;
            model.highlightBackgroundImage = @"首页切换游戏种类按钮背景图（已选择）".img;
            model.highlightImage = @"LIVE GAMES".img;
            model.normalImage = @"LIVE GAMES".img;
            model.imagePlacement = NSDirectionalRectEdgeTop;
            model.baseBackgroundColor = JobsClearColor;
        })).add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
            model.title = JobsInternationalization(@"TABLE GAMES");
            model.subTitle = JobsInternationalization(@"");
            model.titleCor = JobsCor(@"#3D3D3D");
            model.titleFont = bayonRegular(JobsWidth(10));
            model.backgroundImage = @"首页切换游戏种类按钮背景图（未选择）".img;
            model.highlightBackgroundImage = @"首页切换游戏种类按钮背景图（已选择）".img;
            model.highlightImage = @"TABLE GAMES".img;
            model.normalImage = @"TABLE GAMES".img;
            model.imagePlacement = NSDirectionalRectEdgeTop;
            model.baseBackgroundColor = JobsClearColor;
        }));
    });
}
/// 收藏的假数据 @"PG".img;@"点赞".img;
-(NSMutableArray <__kindof UIViewModel *>*)favDataMutArr{
    return jobsMakeMutArr(^(__kindof NSMutableArray<UIViewModel *> * _Nullable arr) {
        arr.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.bgImage = @"FlementalLinkFire".img;
            data.imageUrl = @"https://zh.wikipedia.org/wiki/File:Jiang_Zemin_2002.jpg".jobsUrl;
            data.image = @"点赞".img;
            data.text = JobsInternationalization(@"FlementalLinkFire");
        })).add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.bgImage = @"DragonSoar".img;
            data.imageUrl = @"https://zh.wikipedia.org/wiki/File:Deng_Xiaoping_at_the_arrival_ceremony_for_the_Vice_Premier_of_China_(cropped).jpg".jobsUrl;
            data.image = @"点赞".img;
            data.text = JobsInternationalization(@"DragonSoar");
        })).add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.bgImage = @"StreetFighter".img;
            data.imageUrl = @"https://zh.wikipedia.org/wiki/File:Zhu_Rongji_in_2000.jpg".jobsUrl;
            data.image = @"点赞".img;
            data.text = JobsInternationalization(@"ELEMENTAL LINK");
        }));
    });
}

-(HTTPRequestHeaderLanguageType)currentLanguageType{
    if(currentLanguage().containsString(简体中文)){
        return HTTPRequestHeaderLanguageCN;
    }else if (currentLanguage().containsString(英文_不带区域组合)){
        return HTTPRequestHeaderLanguageEn;
    }else{
        JobsLog(@"%@",currentLanguage());
        return HTTPRequestHeaderLanguageOther;
    }
}
#pragma mark —— Loading动画
-(jobsByViewBlock _Nonnull)showLoadingIndicatorBy{
    @jobs_weakify(self)
    return ^(__kindof UIView *_Nullable view){
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            self.loadingIndicator.center = view.center;
            view.addSubview(self.loadingIndicator);
            self.loadingIndicator.byVisible(1);
            [self.loadingIndicator startAnimating];
        });
    };
}

-(jobsByVoidBlock _Nonnull)hideLoadingIndicator{
    @jobs_weakify(self)
    return ^(){
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            self.loadingIndicator.byVisible(0);
            [self.loadingIndicator stopAnimating];
        });
    };
}
#pragma mark —— 弹出框。为了防止业务层的变化，弹出框定义在NSObject层
/// Debug模式下的弹出框 及其相关的数据封装
-(UIViewModel *)testPopViewData{
    return jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
        viewModel.textModel = jobsMakeTextModel(^(__kindof UITextModel * _Nullable textModel) {
            textModel.text = JobsInternationalization(@"主标题");
        });
        viewModel.subTextModel = jobsMakeTextModel(^(__kindof UITextModel * _Nullable textModel) {
            textModel.text = JobsInternationalization(@"副标题");
        });
    });
}
/// 测试和业务密切相关的弹窗 ：在外层进行调用，[ 需要被展现的视图 popupWithView:popupView];
/// @param popViewClass 被测试的弹窗视图
/// @param viewModel 此视图所绑定的数据。传nil则使用testPopViewData的数据、传UIViewModel.new则使用popViewClass预埋的数据
-(UIView<BaseViewProtocol> *)jobsPopView:(Class<BaseViewProtocol> _Nullable)popViewClass
                               viewModel:(UIViewModel *_Nullable)viewModel{
    // 将方法内的变量进行单例化,避免重复创建
    UIView<BaseViewProtocol> *popupView = popViewClass.class.SharedInstance();
    // 这里设置弹出框的尺寸（最好在View内部layoutSubviews里面进行设置，外界设置的话，在某些情况下会出现异常）
    // popupView.size = popViewClass.viewSizeByModel(nil);
    popupView.jobsRichViewByModel(Jobs3TO(viewModel, self.testPopViewData));
    @jobs_weakify(popupView)
    [popupView actionObjBlock:^(__kindof UIButton *data) {
        @jobs_strongify(popupView)
        if([data.titleForNormalState isKindOfClass:NSString.class]){
            if (data.titleForNormalState.isEqualToString(JobsInternationalization(@"取消"))) {

            }else if (data.titleForNormalState.isEqualToString(JobsInternationalization(@"确认"))){
                
            }else{}
        }
        [popupView tf_hide:^{
            popViewClass.class.DestroySingleton();
        }];
    }];return popupView;
}
/// Debug模式下的弹出框 及其相关的数据封装。在外层进行调用，[ 需要被展现的视图 popupShowScaleWithView:popupView];
//-(JobsOCBaseConfigTestPopupView *)JobsTestPopView:(NSString *)string{
//    UIViewModel *viewModel = UIViewModel.new;
//    UITextModel *textModel = UITextModel.new;
//    textModel.text = isNull(string) ? JobsInternationalization(@"登入按钮") : string;
//    viewModel.textModel = textModel;
//    return [self jobsTestPopView:viewModel];
//}
/// 在外层进行调用，[ 需要被展现的视图 popupShowScaleWithView:popupView];
//-(JobsOCBaseConfigTestPopupView *)jobsTestPopView:(UIViewModel *_Nullable)viewModel{
//#ifdef DEBUG
//    JobsOCBaseConfigTestPopupView *testPopupView = JobsOCBaseConfigTestPopupView.sharedManager;
//    testPopupView.size = CasinoUpgradePopupView.viewSizeByModel(nil);
//    testPopupView.jobsRichViewByModel(viewModel ? : self.testPopViewData);
//    @jobs_weakify(popupView)
//    [testPopupView actionObjBlock:^(UIButton *data) {
//        @jobs_strongify(popupView)
//        if ([[data titleForNormalState] isEqualToString:JobsInternationalization(@"Cancel")]) {
//
//        }else if ([[data titleForNormalState] isEqualToString:JobsInternationalization(@"Sure")]){
//
//        }else{}
//        [testPopupView tf_hide];
//        [JobsOCBaseConfigTestPopupView destroySingleton];
//    }];return testPopupView;
//#endif
//}
#pragma mark —— 设备横屏的方向判定
-(BOOL)isLandscapeRight{
    return JobsAppTool.currentInterfaceOrientationMask == UIInterfaceOrientationMaskLandscapeRight;
}

-(BOOL)isLandscapeLeft{
    return JobsAppTool.currentInterfaceOrientationMask == UIInterfaceOrientationMaskLandscapeLeft;
}
#pragma mark —— 通过验证返回YES
-(JobsReturnBOOLByStringBlock _Nonnull)userAndPasswordNotUpTo{
    return ^BOOL(NSString *_Nullable data){
        return data.length < 6;
    };
}

-(JobsReturnBOOLByStringBlock _Nonnull)telNotUpTo{
    return ^BOOL(NSString *_Nullable data){
        return data.length < 20;
    };
}
/// 用户账号由6-15个字符组成，只能输入字母大小写和数字
-(JobsReturnBOOLByStringBlock _Nonnull)checkUserName{
    @jobs_weakify(self)
    return ^BOOL(NSString *_Nullable userName){
        @jobs_strongify(self)
        return !self.userAndPasswordNotUpTo(userName) && userName.length <= 15 && userName.isAlnum;
    };
}
/// 用户密码由6-15个字符组成，只能输入字母大小写和数字
-(JobsReturnBOOLByStringBlock _Nonnull)checkUserPassword{
    @jobs_weakify(self)
    return ^BOOL(NSString *_Nullable userPassword){
        @jobs_strongify(self)
        return !self.userAndPasswordNotUpTo(userPassword) && userPassword.length <= 15 && userPassword.isAlnum;
    };
}
/// 登录的数据检验
-(JobsReturnBOOLByAppDoorModelBlock _Nonnull)checkLoginDataBy{
    @jobs_weakify(self)
    return ^BOOL(__kindof JobsAppDoorModel *_Nullable model){
        @jobs_strongify(self)
        if (self.checkUserName(model.userName) &&
            self.checkUserPassword(model.password)) {
            return YES;
        }else{
            if (isNull(model.userName) &&
                isNull(model.password)) {
                self.jobsToastErrMsg(JobsInternationalization(@"Please complete the login information"));
            }else if (isValue(model.userName) &&
                      isNull(model.password)){
                self.jobsToastErrMsg(JobsInternationalization(@"Please enter your password"));
            }else if (isNull(model.userName) &&
                      isValue(model.password)){
                self.jobsToastErrMsg(JobsInternationalization(@"Please enter a user name"));
            }else{
                self.jobsToastErrMsg(JobsInternationalization(@"The password consists of 6 to 15 characters and can only be letters and numbers"));
            }return NO;
        }
    };
}
/// 注册的数据检验
-(JobsReturnBOOLByAppDoorModelBlock _Nonnull)checkRegisterData{
    @jobs_weakify(self)
    return ^BOOL(__kindof JobsAppDoorModel *_Nullable model){
        @jobs_strongify(self)
        if (self.checkUserName(model.userName) &&
            self.checkUserPassword(model.password) &&
            self.checkUserPassword(model.confirmPassword) &&
            isValue(model.verificationCode) &&
            isValue(model.tel)) {
            return YES;
        }else{
            if (isNull(model.userName) &&
                isValue(model.password) &&
                isValue(model.confirmPassword) &&
                isValue(model.tel) &&
                isValue(model.verificationCode)){
                self.jobsToastErrMsg(@"Please enter a user name");
            }else if (isValue(model.userName) &&
                      isNull(model.password) &&
                      isValue(model.confirmPassword) &&
                      isValue(model.tel) &&
                      !isValue(model.verificationCode)){
                self.jobsToastErrMsg(@"Please enter your password");
            }else if (isValue(model.userName) &&
                      isValue(model.password) &&
                      isNull(model.confirmPassword) &&
                      isValue(model.tel) &&
                      isValue(model.verificationCode)){
                self.jobsToastErrMsg(@"Please confirm your password");
            }else if (isValue(model.userName) &&
                      isValue(model.password) &&
                      isValue(model.confirmPassword) &&
                      isNull(model.tel) &&
                      isValue(model.verificationCode)){
                self.jobsToastErrMsg(@"Please enter your mobile phone number");
            }else if (isValue(model.userName) &&
                      isValue(model.password) &&
                      isValue(model.confirmPassword) &&
                      isValue(model.tel) &&
                      isNull(model.verificationCode)){
                self.jobsToastErrMsg(@"Please enter the verification code");
            }else if (self.checkUserName(model.userName) ||
                      self.checkUserPassword(model.password) ||
                      self.checkUserPassword(model.confirmPassword)){
                self.jobsToastErrMsg(@"The password consists of 6 to 15 characters and can only be letters and numbers");
            }else self.jobsToastErrMsg(@"Please complete the registration information");
        }return NO;
    };
}
/// 电话号码可以最多20位数，超过后无法输入，且电话号码中无法包含特殊字符或者空格
-(JobsReturnBOOLByStringBlock _Nonnull)checkTelNum{
    return ^BOOL(NSString *_Nullable telNum){
        return !telNum.isContainsSpecialSymbolsString(nil) &&/// 不包含特殊字符
        telNum.length <= 20 &&/// 长度小于20位
        telNum.isContainBlank;/// 不包含空格
    };
}
#pragma mark —— Prop_strong()NSMutableArray<__kindof UIViewModel *> *hotLabelDataMutArr;
JobsKey(_hotLabelDataMutArr)
@dynamic hotLabelDataMutArr;
-(NSMutableArray<__kindof UIViewModel *> *)hotLabelDataMutArr{
    NSMutableArray<__kindof UIViewModel *> *HotLabelDataMutArr = Jobs_getAssociatedObject(_hotLabelDataMutArr);
    if (!HotLabelDataMutArr) {
        HotLabelDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIViewModel *>* _Nullable data) {
            
        });

//        for (CasinoCustomerContactElementModel *element in self.customerContactModel.customerList) {
//            UIViewModel *vm = UIViewModel.new;
//
//            vm.requestParams = element;
//            vm.bgImageURLString = JobsInternationalization(@"");//[This.BaseUrl stringByAppendingString:element.appIconUrl];
//            vm.textModel.text = JobsInternationalization(@"");
//            vm.jobsSize = CGSizeMake(JobsWidth(46), JobsWidth(46));
//            vm.offsetXForEach = JobsWidth(46);
//            vm.offsetYForEach = JobsWidth(46);
//            [HotLabelDataMutArr addObject:vm];
//        }

        Jobs_setAssociatedRETAIN_NONATOMIC(_hotLabelDataMutArr, HotLabelDataMutArr)
    }return HotLabelDataMutArr;
}

-(void)setHotLabelDataMutArr:(NSMutableArray<UIViewModel *> *)hotLabelDataMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_hotLabelDataMutArr, hotLabelDataMutArr)
}
#pragma mark —— Prop_strong()UILabel *separateLab;/// 分割线
JobsKey(_separateLab)
@dynamic separateLab;
-(UILabel *)separateLab{
    UILabel *SeparateLab = Jobs_getAssociatedObject(_separateLab);
    if ([self isKindOfClass:UIViewController.class] && !SeparateLab) {
        @jobs_weakify(self)
        Jobs_setAssociatedRETAIN_NONATOMIC(_separateLab, jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.backgroundColor = HEXCOLOR(0xC4C4C4);
            UIViewController *viewController = (UIViewController *)self;
            [viewController.bgImageView.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(2), JobsWidth(14)));
                make.centerX.equalTo(viewController.view);
                make.bottom.equalTo(viewController.view).offset(JobsWidth(-64));
            }];[self setSeparateLab:label];
        }))
    }return SeparateLab;
}

-(void)setSeparateLab:(UILabel *)separateLab{
    Jobs_setAssociatedRETAIN_NONATOMIC(_separateLab, separateLab)
}
#pragma mark —— Prop_strong()UIButton *立即注册;
JobsKey(__立即注册)
@dynamic 立即注册;
-(BaseButton *)立即注册{
    BaseButton *_立即注册 = Jobs_getAssociatedObject(_立即注册);
    if ([self isKindOfClass:UIViewController.class] && !_立即注册 ) {
        @jobs_weakify(self)
        _立即注册 = BaseButton
            .initByStyle1(JobsInternationalization(@"立即注册"),
                          UIFontWeightRegularSize(14),
                          HEXCOLOR(0x757575))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                JobsLog(@"联系客服");
                if (self.objBlock) self.objBlock(x);
            })
            .onLongPressGestureBy(^(id data){
                JobsLog(@"按钮的长按事件触发");
            });
        UIViewController *viewController = (UIViewController *)self;
        [viewController.bgImageView.addSubview(_立即注册) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(14));
            make.bottom.equalTo(viewController.view).offset(JobsWidth(-64));
            make.left.equalTo(self.separateLab.mas_right).offset(JobsWidth(24));
        }];
        _立即注册.makeBtnTitleByShowingType(UILabelShowingType_03);
        Jobs_setAssociatedRETAIN_NONATOMIC(__立即注册, _立即注册);
    }return _立即注册;
}

-(void)set立即注册:(UIButton *)立即注册{
    Jobs_setAssociatedRETAIN_NONATOMIC(__立即注册, 立即注册);
}
#pragma mark —— Prop_strong()UIButton *联系客服;
JobsKey(__联系客服)
@dynamic 联系客服;
-(BaseButton *)联系客服{
    BaseButton *_联系客服 = Jobs_getAssociatedObject(__联系客服);
    if ([self isKindOfClass:UIViewController.class] && !_联系客服) {
        @jobs_weakify(self)
        _联系客服 = BaseButton
            .initByStyle1(JobsInternationalization(@"联系客服"),
                          UIFontWeightRegularSize(14),
                          HEXCOLOR(0x757575))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                JobsLog(@"联系客服");
                if (self.objBlock) self.objBlock(x);
            })
            .onLongPressGestureBy(^(id data){
                JobsLog(@"按钮的长按事件触发");
            });
        UIViewController *viewController = (UIViewController *)self;
        [viewController.bgImageView.addSubview(_联系客服) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(14));
            make.bottom.equalTo(viewController.view).offset(JobsWidth(-64));
            make.right.equalTo(viewController.separateLab.mas_left).offset(JobsWidth(-24));
        }];
        _联系客服.makeBtnTitleByShowingType(UILabelShowingType_03);
        Jobs_setAssociatedRETAIN_NONATOMIC(__联系客服, _联系客服)
    }return _联系客服;
}

-(void)set联系客服:(BaseButton *)联系客服{
    Jobs_setAssociatedRETAIN_NONATOMIC(__联系客服, 联系客服)
}
#pragma mark —— Prop_strong()NSMutableAttributedString *attributedStringData;
JobsKey(_attributedStringData)
@dynamic attributedStringData;
-(NSMutableAttributedString *)attributedStringData{
    NSMutableAttributedString *AttributedStringData = Jobs_getAssociatedObject(_attributedStringData);
    if (!AttributedStringData) {
        AttributedStringData = self.richTextWithDataConfigMutArr(self.richTextConfigMutArr);
        Jobs_setAssociatedRETAIN_NONATOMIC(_attributedStringData, AttributedStringData)
    }return AttributedStringData;
}

-(void)setAttributedStringData:(NSMutableAttributedString *)attributedStringData{
    Jobs_setAssociatedRETAIN_NONATOMIC(_attributedStringData, attributedStringData)
}
#pragma mark —— Prop_strong()NSMutableArray <NSString *>*richTextMutArr;
JobsKey(_richTextMutArr)
@dynamic richTextMutArr;
-(NSMutableArray<NSString *> *)richTextMutArr{
    NSMutableArray <NSString *>*RichTextMutArr = Jobs_getAssociatedObject(_richTextMutArr);
    if (!RichTextMutArr) {
        RichTextMutArr = jobsMakeMutArr(^(NSMutableArray <NSString *>*_Nullable data) {
            data.add(JobsInternationalization(@"如需帮助，请联系"))
            .add(JobsInternationalization(@"专属客服"));
        });[self setRichTextMutArr:RichTextMutArr];
        Jobs_setAssociatedRETAIN_NONATOMIC(_richTextMutArr, RichTextMutArr)
    }return RichTextMutArr;
}

-(void)setRichTextMutArr:(NSMutableArray<NSString *> *)richTextMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_richTextMutArr, richTextMutArr)
}
#pragma mark —— Prop_strong()NSMutableArray <JobsRichTextConfig *>*richTextConfigMutArr;
JobsKey(_richTextConfigMutArr)
@dynamic richTextConfigMutArr;
-(NSMutableArray<JobsRichTextConfig *> *)richTextConfigMutArr{
    NSMutableArray <JobsRichTextConfig *>*RichTextMutArr = Jobs_getAssociatedObject(_richTextConfigMutArr);
    if (!RichTextMutArr) {
        @jobs_weakify(self)
        RichTextMutArr = jobsMakeMutArr(^(NSMutableArray <JobsRichTextConfig *>* _Nullable data) {
            data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                @jobs_strongify(self)
                data1.font = UIFontWeightRegularSize(12);
                data1.textCor = HEXCOLOR(0x757575);
                data1.targetString = self.richTextMutArr[0];
            }))
            .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                @jobs_strongify(self)
                data1.font = UIFontWeightMediumSize(12);;
                data1.textCor = HEXCOLOR(0xAE8330);
                data1.targetString = self.richTextMutArr[1];
                data1.urlStr = @"click://";
            }));
        });[self setRichTextConfigMutArr:RichTextMutArr];
        Jobs_setAssociatedRETAIN_NONATOMIC(_richTextConfigMutArr, RichTextMutArr)
    }return RichTextMutArr;
}

-(void)setRichTextConfigMutArr:(NSMutableArray<JobsRichTextConfig *> *)richTextConfigMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_richTextConfigMutArr, richTextConfigMutArr)
}
#pragma mark —— Prop_strong()UITextView *connectionTipsTV;/// 承接富文本:如需幫助，請聯繫專屬客服
JobsKey(_connectionTipsTV)
@dynamic connectionTipsTV;
-(UITextView *)connectionTipsTV{
    UITextView *ConnectionTipsTV = Jobs_getAssociatedObject(_connectionTipsTV);
    if (!ConnectionTipsTV) {
        @jobs_weakify(self)
        Jobs_setAssociatedRETAIN_NONATOMIC(_connectionTipsTV, jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
            textView.userInteractionEnabled = YES;
            textView.linkTextAttributes = jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
                @jobs_strongify(self)
                [data setValue:self.richTextConfigMutArr[1].textCor forKey:NSForegroundColorAttributeName];/// 链接文字颜色
                [data setValue:JobsLightGrayColor forKey:NSUnderlineColorAttributeName];
                [data setValue:@(NSUnderlinePatternSolid) forKey:NSUnderlineStyleAttributeName];
            });
            
            textView.attributedText = self.attributedStringData;//
            [textView sizeToFit];
            textView.backgroundColor = JobsClearColor;
            textView.editable = NO;/// 必须禁止输入，否则点击将会弹出输入键盘
            textView.scrollEnabled = NO;/// 可选的，视具体情况而定

            if ([self isKindOfClass:UIViewController.class]) {
                textView.delegate = self;
                UIViewController *viewController = (UIViewController *)self;
                [viewController.view.addSubview(textView) mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(viewController.view);
                    make.bottom.equalTo(viewController.view).offset(JobsWidth(-65));
                }];
            }
        }))
    }return ConnectionTipsTV;
}

-(void)setConnectionTipsTV:(UITextView *)connectionTipsTV{
    Jobs_setAssociatedRETAIN_NONATOMIC(_connectionTipsTV, connectionTipsTV)
}
#pragma mark —— Prop_strong()NSMutableArray<NSString *> *jxCategoryViewTitleMutArr;
JobsKey(_jxCategoryViewTitleMutArr)
@dynamic jxCategoryViewTitleMutArr;
-(NSMutableArray <NSString *>*)jxCategoryViewTitleMutArr{
    NSMutableArray *JXCategoryViewTitleMutArr = Jobs_getAssociatedObject(_jxCategoryViewTitleMutArr);
    if (!JXCategoryViewTitleMutArr) {
        JXCategoryViewTitleMutArr = jobsMakeMutArr(^(NSMutableArray <NSString *>*_Nullable data) {
            data.add(JobsInternationalization(@"今日"))
            .add(JobsInternationalization(@"昨日"))
            .add(JobsInternationalization(@"近7日"))
            .add(JobsInternationalization(@"近30日"));
        });
        Jobs_setAssociatedRETAIN_NONATOMIC(_jxCategoryViewTitleMutArr, JXCategoryViewTitleMutArr)
    }return JXCategoryViewTitleMutArr;
}

-(void)setJxCategoryViewTitleMutArr:(NSMutableArray<NSString *> *)jxCategoryViewTitleMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_jxCategoryViewTitleMutArr, jxCategoryViewTitleMutArr)
}
#pragma mark —— @property(nonatomic,strong,nullable)JobsUserModel *doorModel;
JobsKey(_loginModel)
@dynamic doorModel;
-(JobsUserModel *_Nullable)doorModel{
    return self.readUserInfoByUserName(JobsUserModel.class,用户信息);
}

-(void)setLoginModel:(JobsUserModel *_Nullable)doorModel{
    if(doorModel){
        self.jobsSaveUserInfo(doorModel,用户信息);
    }else{
        self.deleteUserInfoByUserName(用户信息);
    }
}
#pragma mark —— Prop_strong(nullable)__kindof UIActivityIndicatorView *loadingIndicator;
JobsKey(_loadingIndicator)
@dynamic loadingIndicator;
-(__kindof UIActivityIndicatorView *)loadingIndicator{
    UIActivityIndicatorView *view = Jobs_getAssociatedObject(_loadingIndicator);
    if (!view) {
        view = [UIActivityIndicatorView.alloc initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
        view.color = JobsGrayColor;
        Jobs_setAssociatedRETAIN_NONATOMIC(_loadingIndicator, view)
    }return view;
}

-(void)setActivityIndicatorView:(__kindof UIActivityIndicatorView *)loadingIndicator{
    Jobs_setAssociatedRETAIN_NONATOMIC(_loadingIndicator, loadingIndicator)
}

@end
