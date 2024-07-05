//
//  NSObject+AppTools.m
//  DouYin
//
//  Created by Jobs on 2021/4/6.
//

#import "NSObject+AppTools.h"

@implementation NSObject (AppTools)
#pragma mark —— 一些私有化方法
/// noNeedLoginArr
-(NSMutableArray <Class>*_Nullable)makeDataArr{
    extern AppDelegate *appDelegate;
    NSMutableArray <Class>*tempDataArr = NSMutableArray.array;
    
    for (UIViewController *viewController in appDelegate.tabBarVC.childVCMutArr) {
        NSUInteger index = [appDelegate.tabBarVC.childVCMutArr indexOfObject:viewController];
        
        if ([appDelegate.tabBarVC.noNeedLoginArr containsObject:@(index)]) {
            Class cls = viewController.class;
            [tempDataArr addObject:cls];
        }
    }
//    [tempDataArr addObject:appDelegate.tabBarVC.class];
    return tempDataArr;
}
#pragma mark —— BaseProtocol
/// 【通知监听】国际化语言修改UI
/// @param targetView 需要铆定的UI
/// @param aSelector 相关逻辑
+(void)targetView:(UIView *)targetView
languageSwitchNotificationWithSelector:(SEL)aSelector{
    @jobs_weakify(self)
    JobsAddNotification(targetView,
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
    },nil, self),LanguageSwitchNotification,nil);
}
/// 【App语言国际化】更改UITabBarItem的标题
-(void)changeTabBarItemTitle:(NSIndexPath *)indexPath{
    id appDelegate = getSysAppDelegate();
    if (!appDelegate) {
        extern AppDelegate *appDelegate;
    }
    if ([appDelegate isKindOfClass:AppDelegate.class]) {
        AppDelegate *ad = (AppDelegate *)appDelegate;
        [ad refreshTabBarTitle];
    }
}
#pragma mark —— <AppToolsProtocol> 关于注册登录
/// 去登录？去注册？
-(void)toLoginOrRegister:(CurrentPage)appDoorContentType{
    
    // 登录页 不推出 登录页
    UIViewController *viewController = self.getCurrentViewController;
    if ([viewController isKindOfClass:JobsAppDoorVC.class]) return;
    
    // 首页没有展现的时候，不推出登录页
//    extern BOOL CasinoHomeVC_viewDidAppear;
//    if(!CasinoHomeVC_viewDidAppear) return;
    
    UIViewModel *viewModel = UIViewModel.new;
    viewModel.requestParams = @(JobsAppDoorBgType_video);
    [viewController comingToPresentVC:JobsAppDoorVC.new
                        requestParams:viewModel];
}
/// 强制登录：没登录（本地用户数据为空）就去登录
-(void)forcedLogin{
    if (!self.isLogin) {
        [self toLogin];
    }
}
/// 去登录：有限制makeDataArr
-(void)toLogin{
    [self toLoginOrRegisterWithRestricted:self.makeDataArr
                       appDoorContentType:CurrentPage_login];
}
/// 限制条件：在某些页面（noNeedLoginArr）不调取登录页
-(void)toLoginOrRegisterWithRestricted:(NSArray <Class>*_Nullable)dataArr
                    appDoorContentType:(CurrentPage)appDoorContentType{
    if ([dataArr containsObject:self.class]) return;/// 包含则不触发AppDoor的页面
    [self toLoginOrRegister:appDoorContentType];
}
/// 触发退出登录模块之前，弹窗提示二次确认，确认以后再删除本地用户数据
-(void)popUpViewToLogout{
    [self popupShowScaleWithView:self.logOutPopupView
                  popupParameter:self.popupParameter];
}
#pragma mark —— <AppToolsProtocol> 关于 TabBar
/// TabBar
-(UITabBar *)getTabBar{
    extern AppDelegate *appDelegate;
    return appDelegate.tabBarVC.tabBar;
}
/// 跳到首页
-(void)jumpToHome{
    extern AppDelegate *appDelegate;
    appDelegate.tabBarVC.selectedIndex = 0;
}
/// JobsTabbarVC 关闭手势
-(void)tabBarClosePan{
    AppDelegate *appDelegate = getSysAppDelegate();
    [appDelegate.tabBarVC closePan];
}
/// JobsTabbarVC 打开手势
-(void)tabBarOpenPan{
    AppDelegate *appDelegate = getSysAppDelegate();
    [appDelegate.tabBarVC openPan];
}
/// 获取Tabbar管理的，不含导航的根控制器
-(NSMutableArray <UIViewController *>*)appRootVC{
    AppDelegate *appDelegate = getSysAppDelegate();
    return appDelegate.getAppRootVC;
}
/// 当前对象是否是 Tabbar管理的，不含导航的根控制器
-(BOOL)isRootVC{
    if ([self isKindOfClass:UIViewController.class]) {
        return [self.appRootVC containsObject:(UIViewController *)self];
    }else return NO;
}
#pragma mark —— 关于图片编解码
/// 图片base64编码，再固定50字符的位置加入固定盐。盐码（盐需大写、长度 16位）：RRU4JZTV5WZXPCVZ
/// 编码
-(NSString *)encodePicStr:(NSString *)picStr{
    // 将NSString转换为NSMutableString，以便修改
    NSMutableString *modifiedString = picStr.mutableCopy;
    // 在指定位置插入字符串
    [modifiedString insertString:PicSalt atIndex:50];
    return modifiedString;
}
/// 解码
-(NSString *)decodePicStr:(NSString *)encodePicStr{
    // 删除字符串
    NSString *modifiedString = [encodePicStr stringByReplacingOccurrencesOfString:PicSalt withString:JobsInternationalization(@"")];
    return modifiedString;
}
#pragma mark —— <AppToolsProtocol> 其他
/// 设置普通文本
-(UIViewModel *)configViewModelWithTitle:(NSString *_Nullable)title
                                subTitle:(NSString *_Nullable)subTitle{
    UIViewModel *viewModel = UIViewModel.new;
    
    {
        UITextModel *textModel = UITextModel.new;
        textModel.text = JobsInternationalization(title);
        viewModel.textModel = textModel;
        
        UITextModel *subTextModel = UITextModel.new;
        subTextModel.text = JobsInternationalization([NSString isNullString:subTitle] ? @"点击查看" : subTitle);
        viewModel.subTextModel = subTextModel;
        
        UITextModel *backBtnTitleModel = UITextModel.new;
        backBtnTitleModel.text = JobsInternationalization(@"返回首页");
        viewModel.backBtnTitleModel = backBtnTitleModel;
    }return viewModel;
}
/// 带段落配置的文本
-(UIViewModel *)configViewModelWithAttributeTitle:(NSString *_Nullable)title
                                attributeSubTitle:(NSString *_Nullable)subTitle{
    UIViewModel *viewModel = UIViewModel.new;
    
    {
        NSMutableAttributedString *attributedText = [NSMutableAttributedString.alloc initWithString:JobsInternationalization(title)];
        [attributedText addAttribute:NSFontAttributeName
                               value:UITextModel.new.font
                               range:NSMakeRange(0, JobsInternationalization(title).length)];

        NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
        paragraphStyle.lineSpacing = 0;
        paragraphStyle.alignment = NSTextAlignmentLeft; // 设置对齐方式为左对齐
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping; // 设置换行模式为单词换行
        [attributedText addAttribute:NSParagraphStyleAttributeName
                               value:paragraphStyle
                               range:NSMakeRange(0, JobsInternationalization(title).length)];
        
        viewModel.textModel.attributedText = attributedText;
    }
    
    {
        NSMutableAttributedString *attributedText = [NSMutableAttributedString.alloc initWithString:JobsInternationalization([NSString isNullString:subTitle] ? @"点击查看" : subTitle)];
        [attributedText addAttribute:NSFontAttributeName
                               value:UITextModel.new.font
                               range:NSMakeRange(0, JobsInternationalization([NSString isNullString:subTitle] ? @"点击查看" : subTitle).length)];

        NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
        paragraphStyle.lineSpacing = 0;
        paragraphStyle.alignment = NSTextAlignmentLeft; // 设置对齐方式为左对齐
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping; // 设置换行模式为单词换行
        [attributedText addAttribute:NSParagraphStyleAttributeName
                               value:paragraphStyle
                               range:NSMakeRange(0, JobsInternationalization([NSString isNullString:subTitle] ? @"点击查看" : subTitle).length)];
        
        viewModel.subTextModel.attributedText = attributedText;
    }

    {
        UITextModel *backBtnTitleModel = UITextModel.new;
        backBtnTitleModel.text = JobsInternationalization(@"返回首页");
        viewModel.backBtnTitleModel = backBtnTitleModel;
    }
    
    return viewModel;
}

-(UIImage *)defaultHeaderImage{
    return self.isLogin ? JobsIMG(@"default_avatar_white") : JobsIMG(@"未登录默认头像（灰）");
}

-(NSString *)currentLanguage{
    if ([NSBundle.currentLanguage containsString:@"zh-Hans"]) {
        return @"简体中文";
    }else if ([NSBundle.currentLanguage containsString:@"en"]){
        return @"English";
    }else{
        NSLog(@"%@",NSBundle.currentLanguage);
        return @"其他语言";
    }
}

-(HTTPRequestHeaderLanguageType)currentLanguageType{
    if(NSBundle.currentLanguage.containsString(@"zh-Hans")){
        return HTTPRequestHeaderLanguageCN;
    }else if (NSBundle.currentLanguage.containsString(@"en")){
        return HTTPRequestHeaderLanguageEn;
    }else{
        NSLog(@"%@",NSBundle.currentLanguage);
        return HTTPRequestHeaderLanguageOther;
    }
}
#pragma mark —— 弹出框。为了防止业务层的变化，弹出框定义在NSObject层
/// Debug模式下的弹出框 及其相关的数据封装
-(UIViewModel *)testPopViewData{
    UIViewModel *viewModel = UIViewModel.new;
    
    {
        UITextModel *textModel = UITextModel.new;
        textModel.text = JobsInternationalization(@"主标题");
        viewModel.textModel = textModel;
    }
    
    {
        UITextModel *textModel = UITextModel.new;
        textModel.text = JobsInternationalization(@"副标题");
        viewModel.subTextModel = textModel;
    }
    return viewModel;
}
///// Debug模式下的弹出框 及其相关的数据封装。在外层进行调用，[ 需要被展现的视图 popupShowScaleWithView:popupView];
//-(JobsOCBaseConfigTestPopupView *)JobsTestPopView:(NSString *)string{
//    UIViewModel *viewModel = UIViewModel.new;
//    UITextModel *textModel = UITextModel.new;
//    textModel.text = [NSString isNullString:string] ? JobsInternationalization(@"登入按钮") : string;
//    viewModel.textModel = textModel;
//    return [self jobsTestPopView:viewModel];
//}
///// 在外层进行调用，[ 需要被展现的视图 popupShowScaleWithView:popupView];
//-(JobsOCBaseConfigTestPopupView *)jobsTestPopView:(UIViewModel *_Nullable)viewModel{
//
//#ifdef DEBUG
//    JobsOCBaseConfigTestPopupView *testPopupView = JobsOCBaseConfigTestPopupView.sharedInstance;
//    testPopupView.size = [CasinoUpgradePopupView viewSizeWithModel:nil];
//    [testPopupView richElementsInViewWithModel:viewModel ? : self.testPopViewData];
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
    UIView<BaseViewProtocol> *popupView = popViewClass.class.sharedInstance;
    // 这里设置弹出框的尺寸（最好在View内部layoutSubviews里面进行设置，外界设置的话，在某些情况下会出现异常）
    // popupView.size = [popViewClass viewSizeWithModel:nil];
    [popupView richElementsInViewWithModel:viewModel ? : self.testPopViewData];
    @jobs_weakify(popupView)
    [popupView actionObjectBlock:^(UIButton *data) {
        @jobs_strongify(popupView)
        if([data.titleForNormalState isKindOfClass:NSString.class]){
            if (data.titleForNormalState.isEqualToString(JobsInternationalization(@"取消"))) {

            }else if (data.titleForNormalState.isEqualToString(JobsInternationalization(@"确认"))){
                
            }else{}
        }
        [popupView tf_hide];
        [popViewClass.class destroySingleton];
    }];return popupView;
}
/// App 升级弹窗：在根控制器下实现，做到覆盖全局的统一
-(void)appUpdateWithData:(CasinoGetiOSNewestVersionModel *_Nonnull)updateData
               sureBlock:(jobsByIDBlock _Nullable)sureBlock
             cancelBlock:(jobsByIDBlock _Nullable)cancelBlock{
//    CasinoUpgradePopupView *upgradePopupView = CasinoUpgradePopupView.new;
//    upgradePopupView.size = [CasinoUpgradePopupView viewSizeWithModel:nil];
//    [upgradePopupView richElementsInViewWithModel:updateData];
//
//    [upgradePopupView actionObjectBlock:^(UIButton *data) {
//        if ([[data titleForNormalState] isEqualToString:JobsInternationalization(@"Cancel")]) {
//            if (cancelBlock) cancelBlock(@1);
//        }else if ([[data titleForNormalState] isEqualToString:JobsInternationalization(@"Sure")]){
//            if (sureBlock) sureBlock(@1);
//        }else{}
//        [upgradePopupView tf_hide];
//    }];
//
//    [self popupWithView:upgradePopupView];
}

-(void)actionForHotLabel:(JobsHotLabelWithSingleLine *)hl{
//    @jobs_weakify(self)
//    [hl actionObjectBlock:^(UIButton *btn) {
////        @jobs_strongify(self)
//        if([btn.requestParams isKindOfClass:CasinoCustomerContactElementModel.class]){
//            CasinoCustomerContactElementModel *customerContactElementModel = (CasinoCustomerContactElementModel *)btn.requestParams;
//
//            switch (customerContactElementModel.customerMark) {
//                case CustomerContactStyle_QQ:{
//                    [NSObject openURL:[NSString stringWithFormat:@"mqq://im/chat?chat_type=wpa&uin=%@&version=1&src_type=web",customerContactElementModel.customerAccount]];
//                }break;
//                case CustomerContactStyle_Skype:{
//                    [NSObject openURL:[NSString stringWithFormat:@"skype://%@?chat",customerContactElementModel.customerAccount]];
//                }break;
//                case CustomerContactStyle_Telegram:{
//                    [NSObject openURL:[NSString stringWithFormat:@"https://t.me/%@",customerContactElementModel.customerAccount]];
//                }break;
//                case CustomerContactStyle_whatsApp:{
//                    [NSObject openURL:[NSString stringWithFormat:@"https://wa.me/%@",customerContactElementModel.customerAccount]];
//                }break;
//                case CustomerContactStyle_手机号码:{
////                            [NSObject openURL:JobsInternationalization(@"")];
//                    [WHToast jobsToastMsg:@"打开手机号码未配置"];
//                }break;
//                case CustomerContactStyle_onlineURL:{
////                            [NSObject openURL:JobsInternationalization(@"")];
//                    [WHToast jobsToastMsg:@"打开onlineURL未配置"];
//                }break;
//
//                default:
//                    break;
//            }
//        }
//    }];
}
#pragma mark —— 网络通讯方面的
/// 获取客服联系方式
-(void)getCustomerContact:(jobsByIDBlock _Nullable)block{
//    DDNetworkingPrepare
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    [DDNetworkingAPI requestApi:NSObject.customerContactGET.funcName
//                     parameters:nil
//                   successBlock:^(DDResponseModel *data) {
//        if (block) block(data);
//    } failureBlock:^(id data) {
//        [DDNetworkingAPI handleError:data];
//    }];
}
/// 银行列表
-(void)getBankcardBanklist:(jobsByIDBlock _Nullable)block{
//    DDNetworkingPrepare
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    [DDNetworkingAPI requestApi:NSObject.bankcardBanklistGET.funcName
//                     parameters:nil
//                   successBlock:^(DDResponseModel *data) {
//        if (block) block(data);
//    } failureBlock:^(id data) {
//        [DDNetworkingAPI handleError:data];
//    }];
}
/// 获取文件服务器地址
-(void)getDownloadStationGetFileServerUrl:(jobsByIDBlock _Nullable)block{
//    DDNetworkingPrepare
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    [DDNetworkingAPI requestApi:NSObject.downloadStationGetFileServerUrlGET.funcName
//                     parameters:nil
//                   successBlock:^(DDResponseModel *data) {
//        if (block) block(data);
//    } failureBlock:^(id data) {
//        [DDNetworkingAPI handleError:data];
//    }];
}
/// 检查平台维护开关
-(void)checkPlatformMaintenanceSwitch:(jobsByIDBlock _Nullable)block{
//    DDNetworkingPrepare
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    @jobs_weakify(self)
//    [DDNetworkingAPI requestApi:NSObject.platformConfigCheckPlatformMaintenanceSwitchGET.funcName
//                     parameters:nil
//                   successBlock:^(DDResponseModel *data) {
//        @jobs_strongify(self)
//        if (block) block(data);
//    } failureBlock:^(id data) {
//        [DDNetworkingAPI handleError:data];
//    }];
}
/// 获取当前用户的基本信息(不包含 余额，打码量，可提现金额,洗码金额)
-(void)getUserInfo:(jobsByIDBlock _Nullable)block{
//    DDNetworkingPrepare
//
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    [DDNetworkingAPI requestApi:NSObject.userInfoGET.funcName
//                     parameters:nil
//                   successBlock:^(DDResponseModel *data) {
//        if (block) block(data);
//    } failureBlock:^(id data) {
//        [DDNetworkingAPI handleError:data];
//    }];
}
/// 检查人人代开关
-(void)getPlatformConfigCheckPeopleProxySwitch:(jobsByIDBlock _Nullable)block{
//    DDNetworkingPrepare
//
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    [DDNetworkingAPI requestApi:NSObject.platformConfigCheckPeopleProxySwitchGET.funcName
//                     parameters:nil
//                   successBlock:^(DDResponseModel *data) {
//        if (block) block(data);
//    } failureBlock:^(id data) {
//        [DDNetworkingAPI handleError:data];
//    }];
}
/// 获取当前用户的余额,打码量,可提现金额,洗码金额,分润金额
-(void)getUserGetMoney:(jobsByIDBlock _Nullable)successBlock
          failureBlock:(jobsByIDBlock _Nullable)failureBlock{
//    DDNetworkingPrepare
//
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    [DDNetworkingAPI requestApi:NSObject.userGetMoneyGET.funcName
//                     parameters:nil
//                   successBlock:^(DDResponseModel *data) {
//        if (successBlock) successBlock(data);
//    } failureBlock:^(id data) {
//        if (failureBlock) failureBlock(data);
//        [DDNetworkingAPI handleError:data];
//    }];
}
/// 查询当前登录用户WM余额
-(void)getWmGetWmBalance:(jobsByIDBlock _Nullable)successBlock
            failureBlock:(jobsByIDBlock _Nullable)failureBlock{
//    DDNetworkingPrepare
//
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    [DDNetworkingAPI requestApi:NSObject.wmGetWmBalanceGET.funcName
//                     parameters:nil
//                   successBlock:^(DDResponseModel *data) {
//        if (successBlock) successBlock(data);
//    } failureBlock:^(id data) {
//        if (failureBlock) failureBlock(data);
//        [DDNetworkingAPI handleError:data];
//    }];
}
/// iOS最新版本检查
-(void)getDownloadStationGetIosNewestVersion:(jobsByIDBlock _Nullable)block{
//    DDNetworkingPrepare
//
//    NSDictionary *parameters = @{
//        @"versionNumber":self.appVersion// 版本号
//    };
//
//    RequestTool *config = RequestTool.new;
//    config.languageType = HTTPRequestHeaderLanguageCN;
//    [RequestTool setupPublicParameters:config];
//    [DDNetworkingAPI requestApi:NSObject.downloadStationGetIosNewestVersionGET.funcName
//                     parameters:parameters
//                   successBlock:^(DDResponseModel *data) {
//
//        NSMutableArray <CasinoGetiOSNewestVersionModel *>*tags = [CasinoGetiOSNewestVersionModel mj_objectArrayWithKeyValuesArray:data.data];
//
//        CasinoGetiOSNewestVersionModel *iOSNewestVersionModel = nil;
//        NSString *temp = self.appVersion;
//        for (CasinoGetiOSNewestVersionModel *model in tags) {
//            if (model.isForced == ForcedUpdate_YES) {// 优先强制更新，强制更新有且只有一个，遇到了直接跳开
//                iOSNewestVersionModel = model;
//                break;
//            }else{// 📌定位弱更新里面最新鲜的那个
//                CompareRes compareRes = [self versionNumber1:temp versionNumber2:model.versionNumber];
//                if (compareRes == CompareRes_LessThan){
//                    temp = model.versionNumber;
//                    iOSNewestVersionModel = model;
//                }
//            }
//        }
//        if (block) block(iOSNewestVersionModel);
//    } failureBlock:^(id data) {
//        [DDNetworkingAPI handleError:data];
//    }];
}
/// 公告/活动
-(void)getNoticeNewest:(jobsByIDBlock _Nullable)block{
//    DDNetworkingPrepare
//
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    [DDNetworkingAPI requestApi:NSObject.noticeNewestGET.funcName
//                     parameters:nil
//                   successBlock:^(DDResponseModel *data) {
//        if (block) block(data);
//    } failureBlock:^(id data) {
//        [DDNetworkingAPI handleError:data];
//    }];
}
/// 获取移动端logo
-(void)getDownloadStationGetLogImageUrlApp:(jobsByIDBlock _Nullable)block{
//    DDNetworkingPrepare
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    [DDNetworkingAPI requestApi:NSObject.downloadStationGetLogImageUrlAppGET.funcName
//                     parameters:nil
//                   successBlock:^(DDResponseModel *data) {
//        if (block) block(data);
//    } failureBlock:^(id data) {
//        [DDNetworkingAPI handleError:data];
//    }];
}
/// 获取用户已绑定银行卡
-(void)withdrawBanklist:(jobsByIDBlock)block{
//    DDNetworkingPrepare
//
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
////    @jobs_weakify(self)
//    [DDNetworkingAPI requestApi:NSObject.withdrawBanklistGET.funcName
//                     parameters:nil
//                   successBlock:^(DDResponseModel *data) {
////        @jobs_strongify(self)
//        if (block) block(data);
//    } failureBlock:^(id data) {
//        [DDNetworkingAPI handleError:data];
//    }];
}
#pragma mark —— @property(nonatomic,strong)NSMutableArray<UIViewModel *> *hotLabelDataMutArr;
JobsKey(_hotLabelDataMutArr)
@dynamic hotLabelDataMutArr;
-(NSMutableArray<UIViewModel *> *)hotLabelDataMutArr{
    NSMutableArray<UIViewModel *> *HotLabelDataMutArr = Jobs_getAssociatedObject(_hotLabelDataMutArr);
    if (!HotLabelDataMutArr) {
        HotLabelDataMutArr = NSMutableArray.array;

//        for (CasinoCustomerContactElementModel *element in self.customerContactModel.customerList) {
//            UIViewModel *vm = UIViewModel.new;
//
//            vm.requestParams = element;
//            vm.bgImageURLString = JobsInternationalization(@"");//[self.BaseUrl stringByAppendingString:element.appIconUrl];
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
-(UIButton *)立即注册{
    UIButton *_立即注册 = Jobs_getAssociatedObject(_立即注册);
    if ([self isKindOfClass:UIViewController.class] && !_立即注册 ) {
        _立即注册 = UIButton.new;
        _立即注册.normalTitle = JobsInternationalization(@"立即注册");
        _立即注册.normalTitleColor = HEXCOLOR(0x757575);
        _立即注册.titleFont = UIFontWeightRegularSize(14);
        UIViewController *viewController = (UIViewController *)self;
        [viewController.bgImageView addSubview:_立即注册];
        [_立即注册 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(14));
            make.bottom.equalTo(viewController.view).offset(JobsWidth(-64));
            make.left.equalTo(self.separateLab.mas_right).offset(JobsWidth(24));
        }];
        @jobs_weakify(self)
        [_立即注册 jobsBtnClickEventBlock:^id(id data) {
            @jobs_strongify(self)
            NSLog(@"立即注册")
//            [self JobsTestPopView:@"立即注册"];
            return nil;
        }];
        [_立即注册 makeBtnLabelByShowingType:UILabelShowingType_03];
        Jobs_setAssociatedRETAIN_NONATOMIC(__立即注册, _立即注册);
    }return _立即注册;
}

-(void)set立即注册:(UIButton *)立即注册{
    Jobs_setAssociatedRETAIN_NONATOMIC(__立即注册, 立即注册);
}
#pragma mark —— @property(nonatomic,strong)UIButton *联系客服;
JobsKey(__联系客服)
@dynamic 联系客服;
-(UIButton *)联系客服{
    UIButton *_联系客服 = Jobs_getAssociatedObject(__联系客服);
    if ([self isKindOfClass:UIViewController.class] && !_联系客服) {
        _联系客服 = UIButton.new;
        _联系客服.normalTitle = JobsInternationalization(@"联系客服");
        _联系客服.normalTitleColor = HEXCOLOR(0x757575);
        _联系客服.titleFont = UIFontWeightRegularSize(14);
        UIViewController *viewController = (UIViewController *)self;
        [viewController.bgImageView addSubview:_联系客服];
        [_联系客服 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(14));
            make.bottom.equalTo(viewController.view).offset(JobsWidth(-64));
            make.right.equalTo(viewController.separateLab.mas_left).offset(JobsWidth(-24));
        }];
        @jobs_weakify(self)
        [_联系客服 jobsBtnClickEventBlock:^id(id data) {
            @jobs_strongify(self)
            NSLog(@"联系客服");
//            [self JobsTestPopView:@"联系客服"];
            return nil;
        }];
        [_联系客服 makeBtnLabelByShowingType:UILabelShowingType_03];
        Jobs_setAssociatedRETAIN_NONATOMIC(__联系客服, _联系客服)
    }return _联系客服;
}

-(void)set联系客服:(UIButton *)联系客服{
    Jobs_setAssociatedRETAIN_NONATOMIC(__联系客服, 联系客服)
}
#pragma mark —— @property(nonatomic,strong)NSMutableAttributedString *attributedStringData;
JobsKey(_attributedStringData)
@dynamic attributedStringData;
-(NSMutableAttributedString *)attributedStringData{
    NSMutableAttributedString *AttributedStringData = Jobs_getAssociatedObject(_attributedStringData);
    if (!AttributedStringData) {
        AttributedStringData = [self richTextWithDataConfigMutArr:self.richTextConfigMutArr];
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
        RichTextMutArr = NSMutableArray.array;
        [RichTextMutArr addObject:JobsInternationalization(@"如需帮助，请联系")];
        [RichTextMutArr addObject:JobsInternationalization(@"专属客服")];
        [self setRichTextMutArr:RichTextMutArr];
        Jobs_setAssociatedRETAIN_NONATOMIC(_richTextMutArr, RichTextMutArr)
    }return RichTextMutArr;
}

-(void)setRichTextMutArr:(NSMutableArray<NSString *> *)richTextMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_richTextMutArr, richTextMutArr)
}
#pragma mark —— @property(nonatomic,strong)NSMutableArray <RichTextConfig *>*richTextConfigMutArr;
JobsKey(_richTextConfigMutArr)
@dynamic richTextConfigMutArr;
-(NSMutableArray<RichTextConfig *> *)richTextConfigMutArr{
    NSMutableArray <RichTextConfig *>*RichTextMutArr = Jobs_getAssociatedObject(_richTextConfigMutArr);
    if (!RichTextMutArr) {
        RichTextMutArr = NSMutableArray.array;
        
        RichTextConfig *config_01 = RichTextConfig.new;
        config_01.font = UIFontWeightRegularSize(12);
        config_01.textCor = HEXCOLOR(0x757575);
        config_01.targetString = self.richTextMutArr[0];
        [RichTextMutArr addObject:config_01];

        RichTextConfig *config_02 = RichTextConfig.new;
        config_02.font = UIFontWeightMediumSize(12);;
        config_02.textCor = HEXCOLOR(0xAE8330);
        config_02.targetString = self.richTextMutArr[1];
        config_02.urlStr = @"click://";
        [RichTextMutArr addObject:config_02];
        [self setRichTextConfigMutArr:RichTextMutArr];
        
        Jobs_setAssociatedRETAIN_NONATOMIC(_richTextConfigMutArr, RichTextMutArr)
    }return RichTextMutArr;
}

-(void)setRichTextConfigMutArr:(NSMutableArray<RichTextConfig *> *)richTextConfigMutArr{
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
        ConnectionTipsTV.linkTextAttributes = @{NSForegroundColorAttributeName: self.richTextConfigMutArr[1].textCor,/// 链接文字颜色
                                                 NSUnderlineColorAttributeName: UIColor.lightGrayColor,
                                                 NSUnderlineStyleAttributeName: @(NSUnderlinePatternSolid)};
        
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
-(NSMutableArray<NSString *> *)jxCategoryViewTitleMutArr{
    NSMutableArray *JXCategoryViewTitleMutArr = Jobs_getAssociatedObject(_jxCategoryViewTitleMutArr);
    if (!JXCategoryViewTitleMutArr) {
        JXCategoryViewTitleMutArr = NSMutableArray.array;
        [JXCategoryViewTitleMutArr addObject:JobsInternationalization(@"今日")];
        [JXCategoryViewTitleMutArr addObject:JobsInternationalization(@"昨日")];
        [JXCategoryViewTitleMutArr addObject:JobsInternationalization(@"近7日")];
        [JXCategoryViewTitleMutArr addObject:JobsInternationalization(@"近30日")];
    
        Jobs_setAssociatedRETAIN_NONATOMIC(_jxCategoryViewTitleMutArr, JXCategoryViewTitleMutArr)
    }return JXCategoryViewTitleMutArr;
}

-(void)setJxCategoryViewTitleMutArr:(NSMutableArray<NSString *> *)jxCategoryViewTitleMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_jxCategoryViewTitleMutArr, jxCategoryViewTitleMutArr)
}

@end

