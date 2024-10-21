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
            NSLog(@"SSS = %d",b.boolValue);
        }
        NSLog(@"通知传递过来的 = %@",notification.object);
    }];
}
/// 【App语言国际化】更改UITabBarItem的标题
-(void)changeTabBarItemTitle:(NSIndexPath *)indexPath{
    id appDelegate = getSysAppDelegate();
    if (!appDelegate) appDelegate = AppDelegate.sharedManager;
    if ([appDelegate isKindOfClass:AppDelegate.class]) {
        AppDelegate *ad = (AppDelegate *)appDelegate;
        [ad refreshTabBarTitle];
    }
}
#pragma mark —— 一些公共设置
/// 创建默认的广告数据源
-(NSMutableArray<FMBannerAdsModel *> *)makeDataMutArr{
    return jobsMakeMutArr(^(__kindof NSMutableArray <FMBannerAdsModel *>*_Nullable data) {
        data.add(jobsMakeBannerAdsModel(^(__kindof FMBannerAdsModel * _Nullable model) {
            model.image = JobsIMG(@"狮子");
        }));
        data.add(jobsMakeBannerAdsModel(^(__kindof FMBannerAdsModel * _Nullable model) {
            model.image = JobsIMG(@"金猪");
        }));
        data.add(jobsMakeBannerAdsModel(^(__kindof FMBannerAdsModel * _Nullable model) {
            model.image = JobsIMG(@"美女荷官");
        }));
        data.add(jobsMakeBannerAdsModel(^(__kindof FMBannerAdsModel * _Nullable model) {
            model.image = JobsIMG(@"棋牌美女");
        }));
        data.add(jobsMakeBannerAdsModel(^(__kindof FMBannerAdsModel * _Nullable model) {
            model.image = JobsIMG(@"篮球运动员");
        }));
        data.add(jobsMakeBannerAdsModel(^(__kindof FMBannerAdsModel * _Nullable model) {
            model.image = JobsIMG(@"捕鱼");
        }));
    });
}
/// 创建个人中心广告默认的数据源
-(NSMutableArray<FMBannerAdsModel *> *)makeSubViewModelMutArr{
    return jobsMakeMutArr(^(__kindof NSMutableArray <FMBannerAdsModel *>*_Nullable data) {
        for (int u = 0; u < 5; u++) {
            data.add(jobsMakeBannerAdsModel(^(__kindof FMBannerAdsModel * _Nullable model) {
                model.image = JobsIMG(@"个人中心广告");
            }));
        }
    });
}
/// 创建公告默认的数据源
-(NSMutableArray<FMBannerAdsModel *> *)makeSubViewModelMutArr2{
    return jobsMakeMutArr(^(__kindof NSMutableArray <FMBannerAdsModel *>*_Nullable data) {
        for (int u = 0; u < 5; u++) {
            data.add(jobsMakeBannerAdsModel(^(__kindof FMBannerAdsModel * _Nullable model) {
                model.text = JobsInternationalization(@"这是本地的测试数据");
            }));
        }
    });
}

-(JobsReturnWMZBannerParamByArrBlock _Nonnull)makeBaseBannerParam{
    @jobs_weakify(self)
    return ^WMZBannerParam *_Nonnull(__kindof NSMutableArray <FMBannerAdsModel *>*_Nullable data){
        WMZBannerParam *bannerParam = BannerParam()
        /// 自定义视图必传
        .wMyCellClassNameSet(JobsBaseCollectionViewCell.class.description)
        /// 只有当首次调用时的数据源有值的时候，这个Block才会执行
        .wMyCellSet(^UICollectionViewCell *(NSIndexPath *indexPath,
                                            UICollectionView *collectionView,
                                            id model,
                                            UIImageView *bgImageView,
                                            NSArray *dataArr) {
            @jobs_strongify(self)
            //自定义视图
            JobsBaseCollectionViewCell *cell = [JobsBaseCollectionViewCell cellWithCollectionView:collectionView forIndexPath:indexPath];
            cell.backgroundColor = cell.contentView.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
            NSString *urlStr = @"";
            if(data.count){
                for (FMBannerAdsModel *model in data) {
                    model.image = data[0].image;
                }
                if(data.count > indexPath.item) urlStr = data[indexPath.item].iosImage;
            }
            cell.backgroundImageView
                .imageURL(urlStr.imageURLPlus.jobsUrl)
                .placeholderImage(data[indexPath.item].image)
                .options(SDWebImageRefreshCached)/// 强制刷新缓存
                .completed(^(UIImage *_Nullable image,
                             NSError *_Nullable error,
                             SDImageCacheType cacheType,
                             NSURL *_Nullable imageURL) {
                    if (error) {
                        NSLog(@"图片加载失败: %@", error);
                        NSLog(@"图片URL: %@-%@",imageURL,urlStr.jobsUrl);
                    } else {
                        NSLog(@"图片加载成功");
                    }
                }).load();
            return cell;
        })
        .wEventClickSet(^(id anyID, NSInteger index) {
            NSLog(@"点击 %@ %ld",anyID,index);
            @jobs_strongify(self)
            FMBannerAdsModel *model = data[index];
            self.adsAction(model);
        })
        .wEventCenterClickSet(^(id anyID,
                                NSInteger index,
                                BOOL isCenter,
                                UICollectionViewCell *cell) {
            NSLog(@"判断居中点击");
        })
        /// 图片铺满
        .wImageFillSet(YES)
        /// 循环滚动
        .wRepeatSet(YES)
        /// 自动滚动时间
        .wAutoScrollSecondSet(5)
        /// 自动滚动
        .wAutoScrollSet(YES)
        /// cell的位置
        .wPositionSet(BannerCellPositionCenter)
        /// 分页按钮的选中的颜色
        .wBannerControlSelectColorSet(JobsWhiteColor)
        /// 分页按钮的未选中的颜色
        .wBannerControlColorSet(JobsLightGrayColor)
        /// 分页按钮的圆角
        .wBannerControlImageRadiusSet(5)
        /// 自定义圆点间距
        .wBannerControlSelectMarginSet(3)
        /// 隐藏分页按钮
        .wHideBannerControlSet(NO)
        /// 能否拖动
        .wCanFingerSlidingSet(YES);
        return bannerParam;
    };
}
/// 广告轮播图的数据源
-(JobsReturnWMZBannerParamByArrBlock)makeADBannerParamBy{
    @jobs_weakify(self)
    return ^WMZBannerParam *_Nonnull(NSMutableArray <FMBannerAdsModel *>* data){
        @jobs_strongify(self)
        WMZBannerParam *bannerParam = self.makeBaseBannerParam(data)
            .wFrameSet(CGRectMake(0,
                                  0,
                                  JobsWidth(148),
                                  JobsWidth(284)));
        /// 第一次创建的时候，如果此数据源没有值，那么后续即便刷新UI也不会显示
        bannerParam.wDataSet(data);
        return bannerParam;
    };
}
/// 广告点击逻辑
-(jobsByIDBlock _Nonnull)adsAction{
    return ^(FMBannerAdsModel *model){
        switch (model.jumpType) {
            /// 指定游戏
            case FMJumpType_DESIGNATED_GAME:{
                
            }break;
            /// 场馆大厅
            case FMJumpType_STADIUM:{
                
            }break;
            /// 活动模块
            case FMJumpType_ACTIVITY:{
                
            }break;
            /// 网站地址
            case FMJumpType_WEBURL:{
                self.jobsOpenURL(model.jumpParameter);
            }break;
            /// 不跳转
            case FMJumpType_NO:{
                
            }break;
                
            default:
                break;
        }
    };
}
/// 公告的数据源
-(JobsReturnWMZBannerParamByArrBlock _Nonnull)makeAnnouncementBannerParamBy{
    @jobs_weakify(self)
    return ^WMZBannerParam *_Nonnull(NSMutableArray <FMBannerAdsModel *>* data){
        @jobs_strongify(self)
        WMZBannerParam *bannerParam = self.makeBaseBannerParam(data)
            .wFrameSet(CGRectMake(0,
                                  0,
                                  JobsWidth(270),
                                  JobsWidth(250)));
        /// 第一次创建的时候，如果此数据源没有值，那么后续即便刷新UI也不会显示
        bannerParam.wDataSet(data);
        return bannerParam;
    };
}
/// 导航返回键的配置
-(UIButtonModel *)makeBackBtnModel{
    @jobs_weakify(self)
    return jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
//        data.backgroundImage = JobsIMG(@"返回");
        data.selected_backgroundImage = JobsIMG(@"返回");
        data.highlightImage = JobsIMG(@"返回");
        data.normalImage = JobsIMG(@"返回");
        data.baseBackgroundColor = JobsClearColor.colorWithAlphaComponent(0);
        data.title = self.viewModel.backBtnTitleModel.text;
        data.font = self.viewModel.backBtnTitleModel.font;
        data.titleCor = JobsBlackColor;
        data.selected_titleCor = JobsBlackColor;
        data.roundingCorners = UIRectCornerAllCorners;
        data.imagePlacement = NSDirectionalRectEdgeLeading;
        data.imagePadding = JobsWidth(5);
    });
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
    };
}
/// 清除用户数据资料
-(jobsByVoidBlock _Nonnull)cleanUserData{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.loginModel = nil;
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
        viewController.comingToPresentVCByRequestParams(JobsAppDoorVC.new,jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.requestParams = @(JobsAppDoorBgType_video);
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
                           appDoorContentType:CurrentPage_login];
    };
}
/// 限制条件：在某些页面（noNeedLoginArr）不调取登录页
-(void)toLoginOrRegisterWithRestricted:(NSArray <Class>*_Nullable)dataArr
                    appDoorContentType:(CurrentPage)appDoorContentType{
    if (dataArr.containsObject(self.class)) return;/// 包含则不触发AppDoor的页面
    self.toLoginOrRegister(appDoorContentType);
}
/// 触发退出登录模块之前，弹窗提示二次确认，确认以后再删除本地用户数据
-(void)popUpViewToLogout{
    [self popupShowScaleWithView:self.logOutPopupView
                  popupParameter:self.popupParameter];
}
#pragma mark —— <AppToolsProtocol> 关于 TabBar
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
-(NSMutableArray <UIViewController *>*)appRootVC{
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
        // 将NSString转换为NSMutableString，以便修改
        NSMutableString *modifiedString = picStr.mutableCopy;
        // 在指定位置插入字符串
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
            }));
            attributedText.addAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                data.value = jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data) {
                    data.lineSpacing = 0;
                    data.alignment = NSTextAlignmentLeft; // 设置对齐方式为左对齐
                    data.lineBreakMode = NSLineBreakByWordWrapping; // 设置换行模式为单词换行
                });
                data.range = NSMakeRange(0, JobsInternationalization(title).length);
            }));
            viewModel.textModel.attributedText = attributedText;
        }
        
        {
            NSMutableAttributedString *attributedText = JobsMutAttributedString(JobsInternationalization(isNull(subTitle) ? @"点击查看" : subTitle));
            attributedText.addFontAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                data.value = UITextModel.new.font;
                data.range = NSMakeRange(0, JobsInternationalization(isNull(subTitle) ? @"点击查看" : subTitle).length);
            }));
            attributedText.addAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                data.value = jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data) {
                    data.lineSpacing = 0;
                    data.alignment = NSTextAlignmentLeft; // 设置对齐方式为左对齐
                    data.lineBreakMode = NSLineBreakByWordWrapping; // 设置换行模式为单词换行
                });
                data.range = NSMakeRange(0, JobsInternationalization(isNull(subTitle) ? @"点击查看" : subTitle).length);
            }));
            viewModel.subTextModel.attributedText = attributedText;
        }

        viewModel.backBtnTitleModel = jobsMakeTextModel(^(__kindof UITextModel * _Nullable data) {
            data.text = JobsInternationalization(@"返回首页");
        });
    });
}

-(UIImage *)defaultHeaderImage{
    return self.isLogin ? JobsIMG(@"default_avatar_white") : JobsIMG(@"未登录默认头像（灰）");
}

-(NSString *)currentLanguage{
    if (currentLanguage().containsString(@"zh-Hans")) {
        return @"简体中文";
    }else if (currentLanguage().containsString(@"en")){
        return @"English";
    }else{
        NSLog(@"%@",currentLanguage());
        return @"其他语言";
    }
}

-(HTTPRequestHeaderLanguageType)currentLanguageType{
    if(currentLanguage().containsString(@"zh-Hans")){
        return HTTPRequestHeaderLanguageCN;
    }else if (currentLanguage().containsString(@"en")){
        return HTTPRequestHeaderLanguageEn;
    }else{
        NSLog(@"%@",currentLanguage());
        return HTTPRequestHeaderLanguageOther;
    }
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
//    [testPopupView actionObjectBlock:^(UIButton *data) {
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
    [popupView actionObjectBlock:^(__kindof UIButton *data) {
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
#pragma mark —— 设备横屏的方向判定
-(BOOL)isLandscapeRight{
    return JobsAppTool.currentInterfaceOrientationMask == UIInterfaceOrientationMaskLandscapeRight;
}

-(BOOL)isLandscapeLeft{
    return JobsAppTool.currentInterfaceOrientationMask == UIInterfaceOrientationMaskLandscapeLeft;
}
#pragma mark —— 通过验证返回YES
-(BOOL)userAndPasswordNotUpTo:(NSString *)value{
    return value.length < 6;
}

-(BOOL)telNotUpTo:(NSString *)value{
    return value.length < 20;
}
/// 用户账号由6-15个字符组成，只能输入字母大小写和数字
-(BOOL)checkUserName:(NSString *)userName{
    return ![self userAndPasswordNotUpTo:userName] && userName.length <= 15 && userName.isAlnum;
}
/// 用户密码由6-15个字符组成，只能输入字母大小写和数字
-(BOOL)checkUserPassword:(NSString *)userPassword{
    return ![self userAndPasswordNotUpTo:userPassword] && userPassword.length <= 15 && userPassword.isAlnum;
}
/// 登录的数据检验
-(BOOL)checkLoginData:(JobsAppDoorModel *)model{
    if ([self checkUserName:model.userName] &&
        [self checkUserPassword:model.password]) {
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
}
/// 注册的数据检验
-(BOOL)checkRegisterData:(JobsAppDoorModel *)model{
    if ([self checkUserName:model.userName] &&
        [self checkUserPassword:model.password] &&
        [self checkUserPassword:model.confirmPassword] &&
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
        }else if ([self checkUserName:model.userName] ||
                  [self checkUserPassword:model.password] ||
                  [self checkUserPassword:model.confirmPassword]){
            self.jobsToastErrMsg(@"The password consists of 6 to 15 characters and can only be letters and numbers");
        }else self.jobsToastErrMsg(@"Please complete the registration information");
    }return NO;
}
/// 电话号码可以最多20位数，超过后无法输入，且电话号码中无法包含特殊字符或者空格
-(BOOL)checkTelNum:(NSString *)telNum{
    return ![telNum isContainsSpecialSymbolsString:nil] &&// 不包含特殊字符
    telNum.length <= 20 &&// 长度小于20位
    telNum.isContainBlank;// 不包含空格
}
#pragma mark —— @property(nonatomic,strong)NSMutableArray<UIViewModel *> *hotLabelDataMutArr;
JobsKey(_hotLabelDataMutArr)
@dynamic hotLabelDataMutArr;
-(NSMutableArray<UIViewModel *> *)hotLabelDataMutArr{
    NSMutableArray<UIViewModel *> *HotLabelDataMutArr = Jobs_getAssociatedObject(_hotLabelDataMutArr);
    if (!HotLabelDataMutArr) {
        HotLabelDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            
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
#pragma mark —— @property(nonatomic,strong)UILabel *separateLab;/// 分割线
JobsKey(_separateLab)
@dynamic separateLab;
-(UILabel *)separateLab{
    UILabel *SeparateLab = Jobs_getAssociatedObject(_separateLab);
    if ([self isKindOfClass:UIViewController.class] && !SeparateLab) {
        SeparateLab = UILabel.new;
        SeparateLab.backgroundColor = HEXCOLOR(0xC4C4C4);
        UIViewController *viewController = (UIViewController *)self;
        [viewController.bgImageView addSubview:SeparateLab];
        [SeparateLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(2), JobsWidth(14)));
            make.centerX.equalTo(viewController.view);
            make.bottom.equalTo(viewController.view).offset(JobsWidth(-64));
        }];
        [self setSeparateLab:SeparateLab];
        Jobs_setAssociatedRETAIN_NONATOMIC(_separateLab, SeparateLab)
    }return SeparateLab;
}

-(void)setSeparateLab:(UILabel *)separateLab{
    Jobs_setAssociatedRETAIN_NONATOMIC(_separateLab, separateLab)
}
#pragma mark —— @property(nonatomic,strong)UIButton *立即注册;
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
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                NSLog(@"联系客服");
                if (self.objectBlock) self.objectBlock(x);
            })
            .onLongPressGesture(^(id data){
                NSLog(@"按钮的长按事件触发");
            });
        UIViewController *viewController = (UIViewController *)self;
        [viewController.bgImageView addSubview:_立即注册];
        [_立即注册 mas_makeConstraints:^(MASConstraintMaker *make) {
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
#pragma mark —— @property(nonatomic,strong)UIButton *联系客服;
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
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                NSLog(@"联系客服");
                if (self.objectBlock) self.objectBlock(x);
            })
            .onLongPressGesture(^(id data){
                NSLog(@"按钮的长按事件触发");
            });
        UIViewController *viewController = (UIViewController *)self;
        [viewController.bgImageView addSubview:_联系客服];
        [_联系客服 mas_makeConstraints:^(MASConstraintMaker *make) {
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
#pragma mark —— @property(nonatomic,strong)NSMutableAttributedString *attributedStringData;
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
#pragma mark —— @property(nonatomic,strong)NSMutableArray <NSString *>*richTextMutArr;
JobsKey(_richTextMutArr)
@dynamic richTextMutArr;
-(NSMutableArray<NSString *> *)richTextMutArr{
    NSMutableArray <NSString *>*RichTextMutArr = Jobs_getAssociatedObject(_richTextMutArr);
    if (!RichTextMutArr) {
        RichTextMutArr = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            data.add(JobsInternationalization(@"如需帮助，请联系"));
            data.add(JobsInternationalization(@"专属客服"));
        });
        [self setRichTextMutArr:RichTextMutArr];
        Jobs_setAssociatedRETAIN_NONATOMIC(_richTextMutArr, RichTextMutArr)
    }return RichTextMutArr;
}

-(void)setRichTextMutArr:(NSMutableArray<NSString *> *)richTextMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_richTextMutArr, richTextMutArr)
}
#pragma mark —— @property(nonatomic,strong)NSMutableArray <JobsRichTextConfig *>*richTextConfigMutArr;
JobsKey(_richTextConfigMutArr)
@dynamic richTextConfigMutArr;
-(NSMutableArray<JobsRichTextConfig *> *)richTextConfigMutArr{
    NSMutableArray <JobsRichTextConfig *>*RichTextMutArr = Jobs_getAssociatedObject(_richTextConfigMutArr);
    if (!RichTextMutArr) {
        @jobs_weakify(self)
        RichTextMutArr = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                data1.font = UIFontWeightRegularSize(12);
                data1.textCor = HEXCOLOR(0x757575);
                data1.targetString = self.richTextMutArr[0];
            }));
            data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                @jobs_strongify(self)
                data1.font = UIFontWeightMediumSize(12);;
                data1.textCor = HEXCOLOR(0xAE8330);
                data1.targetString = self.richTextMutArr[1];
                data1.urlStr = @"click://";
            }));
        });
        [self setRichTextConfigMutArr:RichTextMutArr];
        Jobs_setAssociatedRETAIN_NONATOMIC(_richTextConfigMutArr, RichTextMutArr)
    }return RichTextMutArr;
}

-(void)setRichTextConfigMutArr:(NSMutableArray<JobsRichTextConfig *> *)richTextConfigMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_richTextConfigMutArr, richTextConfigMutArr)
}
#pragma mark —— @property(nonatomic,strong)UITextView *connectionTipsTV;/// 承接富文本:如需幫助，請聯繫專屬客服
JobsKey(_connectionTipsTV)
@dynamic connectionTipsTV;
-(UITextView *)connectionTipsTV{
    UITextView *ConnectionTipsTV = Jobs_getAssociatedObject(_connectionTipsTV);
    if (!ConnectionTipsTV) {
        ConnectionTipsTV = UITextView.new;
        ConnectionTipsTV.userInteractionEnabled = YES;
        ConnectionTipsTV.linkTextAttributes = jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
            [data setValue:self.richTextConfigMutArr[1].textCor forKey:NSForegroundColorAttributeName];/// 链接文字颜色
            [data setValue:JobsLightGrayColor forKey:NSUnderlineColorAttributeName];
            [data setValue:@(NSUnderlinePatternSolid) forKey:NSUnderlineStyleAttributeName];
        });
        
        ConnectionTipsTV.attributedText = self.attributedStringData;//
        [ConnectionTipsTV sizeToFit];
        ConnectionTipsTV.backgroundColor = JobsClearColor;
        ConnectionTipsTV.editable = NO;/// 必须禁止输入，否则点击将会弹出输入键盘
        ConnectionTipsTV.scrollEnabled = NO;/// 可选的，视具体情况而定

        if ([self isKindOfClass:UIViewController.class]) {
            ConnectionTipsTV.delegate = self;
            UIViewController *viewController = (UIViewController *)self;
            [viewController.view addSubview:ConnectionTipsTV];
            [ConnectionTipsTV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(viewController.view);
                make.bottom.equalTo(viewController.view).offset(JobsWidth(-65));
            }];
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_connectionTipsTV, ConnectionTipsTV)
    }return ConnectionTipsTV;
}

-(void)setConnectionTipsTV:(UITextView *)connectionTipsTV{
    Jobs_setAssociatedRETAIN_NONATOMIC(_connectionTipsTV, connectionTipsTV)
}
#pragma mark —— @property(nonatomic,strong)NSMutableArray<NSString *> *jxCategoryViewTitleMutArr;
JobsKey(_jxCategoryViewTitleMutArr)
@dynamic jxCategoryViewTitleMutArr;
-(NSMutableArray <NSString *>*)jxCategoryViewTitleMutArr{
    NSMutableArray *JXCategoryViewTitleMutArr = Jobs_getAssociatedObject(_jxCategoryViewTitleMutArr);
    if (!JXCategoryViewTitleMutArr) {
        JXCategoryViewTitleMutArr = jobsMakeMutArr(^(NSMutableArray <NSString *>*_Nullable data) {
            data.add(JobsInternationalization(@"今日"));
            data.add(JobsInternationalization(@"昨日"));
            data.add(JobsInternationalization(@"近7日"));
            data.add(JobsInternationalization(@"近30日"));
        });
        Jobs_setAssociatedRETAIN_NONATOMIC(_jxCategoryViewTitleMutArr, JXCategoryViewTitleMutArr)
    }return JXCategoryViewTitleMutArr;
}

-(void)setJxCategoryViewTitleMutArr:(NSMutableArray<NSString *> *)jxCategoryViewTitleMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_jxCategoryViewTitleMutArr, jxCategoryViewTitleMutArr)
}
#pragma mark —— @property(nonatomic,strong,nullable)JobsUserModel *loginModel;
JobsKey(_loginModel)
@dynamic loginModel;
-(JobsUserModel *_Nullable)loginModel{
    return self.readUserInfoByUserName(JobsUserModel.class,用户信息);
}

-(void)setLoginModel:(JobsUserModel *_Nullable)loginModel{
    if(loginModel){
        self.jobsSaveUserInfo(loginModel,用户信息);
    }else{
        self.deleteUserInfoByUserName(用户信息);
    }
}

@end
