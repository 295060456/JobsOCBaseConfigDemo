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
    NSMutableArray <Class>*tempDataArr = NSMutableArray.array;
    for (int y = 0; y < AppDelegate.viewCtrlByTabBarCtrlConfigMutArr.count; y++) {
        UIViewController *viewController = AppDelegate.viewCtrlByTabBarCtrlConfigMutArr[y];
        JobsTabBarItemConfig *tabBarItemConfig = AppDelegate.tabBarItemConfigMutArr[y];
        if(tabBarItemConfig.isNotNeedCheckLogin){
            Class cls = viewController.class;
            tempDataArr.add(cls);
        }
    }return tempDataArr;
}
#pragma mark —— BaseProtocol
/// 【通知监听】国际化语言修改UI
/// @param targetView 需要铆定的UI
/// @param aSelector 相关逻辑
+(void)targetView:(UIView *)targetView
languageSwitchNotificationWithSelector:(SEL)aSelector{
    @jobs_weakify(self)
    [self addNotificationName:JobsLanguageSwitchNotification
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        @jobs_strongify(self)
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
    if (!appDelegate) {
        appDelegate = AppDelegate.sharedManager;
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
    viewController.comingToPresentVCByRequestParams(JobsAppDoorVC.new,viewModel);
}
/// 强制登录：没登录（本地用户数据为空）就去登录
-(void)forcedLogin{
    if (!self.isLogin) [self toLogin];
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
    return AppDelegate.tabBarVC.tabBar;
}
/// 跳到首页
-(void)jumpToHome{
    AppDelegate.tabBarVC.selectedIndex = 0;
}
/// JobsTabbarVC 关闭手势
-(jobsByVoidBlock)tabBarClosePan{
    return ^(){
        AppDelegate.tabBarVC.closePan();
    };
}
/// JobsTabbarVC 打开手势
-(jobsByVoidBlock)tabBarOpenPan{
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
        return [self.appRootVC containsObject:(UIViewController *)self];
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
        NSString *modifiedString = [encodePicStr stringByReplacingOccurrencesOfString:PicSalt withString:JobsInternationalization(@"")];
        return modifiedString;
    };
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
        subTextModel.text = JobsInternationalization(isNull(subTitle) ? @"点击查看" : subTitle);
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
        NSMutableAttributedString *attributedText = [NSMutableAttributedString.alloc initWithString:JobsInternationalization(isNull(subTitle) ? @"点击查看" : subTitle)];
        [attributedText addAttribute:NSFontAttributeName
                               value:UITextModel.new.font
                               range:NSMakeRange(0, JobsInternationalization(isNull(subTitle) ? @"点击查看" : subTitle).length)];

        NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
        paragraphStyle.lineSpacing = 0;
        paragraphStyle.alignment = NSTextAlignmentLeft; // 设置对齐方式为左对齐
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping; // 设置换行模式为单词换行
        [attributedText addAttribute:NSParagraphStyleAttributeName
                               value:paragraphStyle
                               range:NSMakeRange(0, JobsInternationalization(isNull(subTitle) ? @"点击查看" : subTitle).length)];
        
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
    if ([currentLanguage() containsString:@"zh-Hans"]) {
        return @"简体中文";
    }else if ([currentLanguage() containsString:@"en"]){
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
//    textModel.text = isNull(string) ? JobsInternationalization(@"登入按钮") : string;
//    viewModel.textModel = textModel;
//    return [self jobsTestPopView:viewModel];
//}
///// 在外层进行调用，[ 需要被展现的视图 popupShowScaleWithView:popupView];
//-(JobsOCBaseConfigTestPopupView *)jobsTestPopView:(UIViewModel *_Nullable)viewModel{
//#ifdef DEBUG
//    JobsOCBaseConfigTestPopupView *testPopupView = JobsOCBaseConfigTestPopupView.sharedInstance;
//    testPopupView.size = [CasinoUpgradePopupView viewSizeWithModel:nil];
//    testPopupView.jobsRichElementsInViewWithModel(viewModel ? : self.testPopViewData);
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
    UIView<BaseViewProtocol> *popupView = popViewClass.class.sharedManager;
    // 这里设置弹出框的尺寸（最好在View内部layoutSubviews里面进行设置，外界设置的话，在某些情况下会出现异常）
    // popupView.size = [popViewClass viewSizeWithModel:nil];
    popupView.jobsRichElementsInViewWithModel(viewModel ? : self.testPopViewData);
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
//    upgradePopupView.jobsRichElementsInViewWithModel(updateData);
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

//-(void)actionForHotLabel:(JobsHotLabelWithSingleLine *)hl{
////    @jobs_weakify(self)
//    [hl actionObjectBlock:^(UIButton *btn) {
////        @jobs_strongify(self)
//        if([btn.requestParams isKindOfClass:CasinoCustomerContactElementModel.class]){
//            CasinoCustomerContactElementModel *customerContactElementModel = (CasinoCustomerContactElementModel *)btn.requestParams;
//
//            switch (customerContactElementModel.customerMark) {
//                case CustomerContactStyle_QQ:{
//                    self.jobsOpenURL(@"mqq://im/chat?chat_type=wpa&uin=".add(customerContactElementModel.customerAccount).add(@"&version=1&src_type=web"));
//                }break;
//                case CustomerContactStyle_Skype:{
//                    self.jobsOpenURL(@"skype://".add(customerContactElementModel.customerAccount).add(@"?chat"));
//                }break;
//                case CustomerContactStyle_Telegram:{
//                    self.jobsOpenURL(@"https://t.me/".add(customerContactElementModel.customerAccount));
//                }break;
//                case CustomerContactStyle_whatsApp:{
//                    self.jobsOpenURL(@"https://wa.me/".add(customerContactElementModel.customerAccount));
//                }break;
//                case CustomerContactStyle_手机号码:{
//                    self.jobsToastMsg(@"打开手机号码未配置");
//                }break;
//                case CustomerContactStyle_onlineURL:{
//                    self.jobsToastMsg(@"打开onlineURL未配置");
//                }break;
//
//                default:
//                    break;
//            }
//        }
//    }];
//}
#pragma mark —— 网络通讯方面的
/// 获取客服联系方式
-(void)getCustomerContact:(jobsByIDBlock _Nullable)block{
//    JobsNetworkingPrepare
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    [JobsNetworkingAPI requestApi:NSObject.customerContactGET.funcName
//                     parameters:nil
//                   successBlock:^(JobsResponseModel *data) {
//        if (block) block(data);
//    } failureBlock:^(id data) {
//        [JobsNetworkingAPI handleError:data];
//    }];
}
/// 银行列表
-(void)getBankcardBanklist:(jobsByIDBlock _Nullable)block{
//    JobsNetworkingPrepare
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    [JobsNetworkingAPI requestApi:NSObject.bankcardBanklistGET.funcName
//                     parameters:nil
//                   successBlock:^(JobsResponseModel *data) {
//        if (block) block(data);
//    } failureBlock:^(id data) {
//        [JobsNetworkingAPI handleError:data];
//    }];
}
/// 获取文件服务器地址
-(void)getDownloadStationGetFileServerUrl:(jobsByIDBlock _Nullable)block{
//    JobsNetworkingPrepare
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    [JobsNetworkingAPI requestApi:NSObject.downloadStationGetFileServerUrlGET.funcName
//                     parameters:nil
//                   successBlock:^(JobsResponseModel *data) {
//        if (block) block(data);
//    } failureBlock:^(id data) {
//        [JobsNetworkingAPI handleError:data];
//    }];
}
/// 检查平台维护开关
-(void)checkPlatformMaintenanceSwitch:(jobsByIDBlock _Nullable)block{
//    JobsNetworkingPrepare
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    @jobs_weakify(self)
//    [JobsNetworkingAPI requestApi:NSObject.platformConfigCheckPlatformMaintenanceSwitchGET.funcName
//                     parameters:nil
//                   successBlock:^(JobsResponseModel *data) {
//        @jobs_strongify(self)
//        if (block) block(data);
//    } failureBlock:^(id data) {
//        [JobsNetworkingAPI handleError:data];
//    }];
}
/// 获取当前用户的基本信息(不包含 余额，打码量，可提现金额,洗码金额)
-(void)getUserInfo:(jobsByIDBlock _Nullable)block{
//    JobsNetworkingPrepare
//
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    [JobsNetworkingAPI requestApi:NSObject.userInfoGET.funcName
//                     parameters:nil
//                   successBlock:^(JobsResponseModel *data) {
//        if (block) block(data);
//    } failureBlock:^(id data) {
//        [JobsNetworkingAPI handleError:data];
//    }];
}
/// 检查人人代开关
-(void)getPlatformConfigCheckPeopleProxySwitch:(jobsByIDBlock _Nullable)block{
//    JobsNetworkingPrepare
//
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    [JobsNetworkingAPI requestApi:NSObject.platformConfigCheckPeopleProxySwitchGET.funcName
//                     parameters:nil
//                   successBlock:^(JobsResponseModel *data) {
//        if (block) block(data);
//    } failureBlock:^(id data) {
//        [JobsNetworkingAPI handleError:data];
//    }];
}
/// 获取当前用户的余额,打码量,可提现金额,洗码金额,分润金额
-(void)getUserGetMoney:(jobsByIDBlock _Nullable)successBlock
          failureBlock:(jobsByIDBlock _Nullable)failureBlock{
//    JobsNetworkingPrepare
//
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    [JobsNetworkingAPI requestApi:NSObject.userGetMoneyGET.funcName
//                     parameters:nil
//                   successBlock:^(JobsResponseModel *data) {
//        if (successBlock) successBlock(data);
//    } failureBlock:^(id data) {
//        if (failureBlock) failureBlock(data);
//        [JobsNetworkingAPI handleError:data];
//    }];
}
/// 查询当前登录用户WM余额
-(void)getWmGetWmBalance:(jobsByIDBlock _Nullable)successBlock
            failureBlock:(jobsByIDBlock _Nullable)failureBlock{
//    JobsNetworkingPrepare
//
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    [JobsNetworkingAPI requestApi:NSObject.wmGetWmBalanceGET.funcName
//                     parameters:nil
//                   successBlock:^(JobsResponseModel *data) {
//        if (successBlock) successBlock(data);
//    } failureBlock:^(id data) {
//        if (failureBlock) failureBlock(data);
//        [JobsNetworkingAPI handleError:data];
//    }];
}
/// iOS最新版本检查
-(void)getDownloadStationGetIosNewestVersion:(jobsByIDBlock _Nullable)block{
//    JobsNetworkingPrepare
//
//    NSDictionary *parameters = @{
//        @"versionNumber":self.appVersion// 版本号
//    };
//
//    RequestTool *config = RequestTool.new;
//    config.languageType = HTTPRequestHeaderLanguageCN;
//    [RequestTool setupPublicParameters:config];
//    [JobsNetworkingAPI requestApi:NSObject.downloadStationGetIosNewestVersionGET.funcName
//                     parameters:parameters
//                   successBlock:^(JobsResponseModel *data) {
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
//        [JobsNetworkingAPI handleError:data];
//    }];
}
/// 公告/活动
-(void)getNoticeNewest:(jobsByIDBlock _Nullable)block{
//    JobsNetworkingPrepare
//
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    [JobsNetworkingAPI requestApi:NSObject.noticeNewestGET.funcName
//                     parameters:nil
//                   successBlock:^(JobsResponseModel *data) {
//        if (block) block(data);
//    } failureBlock:^(id data) {
//        [JobsNetworkingAPI handleError:data];
//    }];
}
/// 获取移动端logo
-(void)getDownloadStationGetLogImageUrlApp:(jobsByIDBlock _Nullable)block{
//    JobsNetworkingPrepare
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
//    [JobsNetworkingAPI requestApi:NSObject.downloadStationGetLogImageUrlAppGET.funcName
//                     parameters:nil
//                   successBlock:^(JobsResponseModel *data) {
//        if (block) block(data);
//    } failureBlock:^(id data) {
//        [JobsNetworkingAPI handleError:data];
//    }];
}
/// 获取用户已绑定银行卡
-(void)withdrawBanklist:(jobsByIDBlock)block{
//    JobsNetworkingPrepare
//
//    RequestTool *config = RequestTool.new;
//    config.languageType = self.currentLanguageType;
//    [RequestTool setupPublicParameters:config];
////    @jobs_weakify(self)
//    [JobsNetworkingAPI requestApi:NSObject.withdrawBanklistGET.funcName
//                     parameters:nil
//                   successBlock:^(JobsResponseModel *data) {
////        @jobs_strongify(self)
//        if (block) block(data);
//    } failureBlock:^(id data) {
//        [JobsNetworkingAPI handleError:data];
//    }];
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
-(BaseButton *)立即注册{
    BaseButton *_立即注册 = Jobs_getAssociatedObject(_立即注册);
    if ([self isKindOfClass:UIViewController.class] && !_立即注册 ) {
        @jobs_weakify(self)
        _立即注册 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                  background:nil
                                  buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                               textAlignment:NSTextAlignmentCenter
                                            subTextAlignment:NSTextAlignmentCenter
                                                 normalImage:nil
                                              highlightImage:nil
                                             attributedTitle:nil
                                     selectedAttributedTitle:nil
                                          attributedSubtitle:nil
                                                       title:JobsInternationalization(@"立即注册")
                                                    subTitle:nil
                                                   titleFont:UIFontWeightRegularSize(14)
                                                subTitleFont:nil
                                                    titleCor:HEXCOLOR(0x757575)
                                                 subTitleCor:nil
                                          titleLineBreakMode:NSLineBreakByWordWrapping
                                       subtitleLineBreakMode:NSLineBreakByWordWrapping
                                         baseBackgroundColor:nil
                                             backgroundImage:nil
                                                imagePadding:JobsWidth(0)
                                                titlePadding:JobsWidth(0)
                                              imagePlacement:NSDirectionalRectEdgeNone
                                  contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                    contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                               contentInsets:jobsSameDirectionalEdgeInsets(0)
                                           cornerRadiusValue:JobsWidth(0)
                                             roundingCorners:UIRectCornerAllCorners
                                        roundingCornersRadii:CGSizeZero
                                              layerBorderCor:nil
                                                 borderWidth:JobsWidth(0)
                                               primaryAction:nil
                                  longPressGestureEventBlock:^id(id _Nullable weakSelf,
                                                                 id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            return nil;
        }
                                             clickEventBlock:^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            NSLog(@"立即注册")
            return nil;
        }];
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
        _联系客服 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                    background:nil
                                  buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                               textAlignment:NSTextAlignmentCenter
                                            subTextAlignment:NSTextAlignmentCenter
                                                 normalImage:nil
                                              highlightImage:nil
                                             attributedTitle:nil
                                     selectedAttributedTitle:nil
                                          attributedSubtitle:nil
                                                       title:JobsInternationalization(@"联系客服")
                                                    subTitle:nil
                                                   titleFont:UIFontWeightRegularSize(14)
                                                subTitleFont:nil
                                                    titleCor:HEXCOLOR(0x757575)
                                                 subTitleCor:nil
                                          titleLineBreakMode:NSLineBreakByWordWrapping
                                       subtitleLineBreakMode:NSLineBreakByWordWrapping
                                         baseBackgroundColor:nil
                                             backgroundImage:nil
                                                imagePadding:JobsWidth(0)
                                                titlePadding:JobsWidth(0)
                                              imagePlacement:NSDirectionalRectEdgeNone
                                  contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                    contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                               contentInsets:jobsSameDirectionalEdgeInsets(0)
                                           cornerRadiusValue:JobsWidth(0)
                                             roundingCorners:UIRectCornerAllCorners
                                        roundingCornersRadii:CGSizeZero
                                              layerBorderCor:nil
                                                 borderWidth:JobsWidth(0)
                                               primaryAction:nil
                                  longPressGestureEventBlock:^id(id _Nullable weakSelf,
                                                                 id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            return nil;
        }
                                             clickEventBlock:^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            NSLog(@"联系客服");
            return nil;
        }];
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
        RichTextMutArr = NSMutableArray.array;
        RichTextMutArr.add(JobsInternationalization(@"如需帮助，请联系"));
        RichTextMutArr.add(JobsInternationalization(@"专属客服"));
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
        RichTextMutArr = NSMutableArray.array;
        
        JobsRichTextConfig *config_01 = JobsRichTextConfig.new;
        config_01.font = UIFontWeightRegularSize(12);
        config_01.textCor = HEXCOLOR(0x757575);
        config_01.targetString = self.richTextMutArr[0];
        [RichTextMutArr addObject:config_01];

        JobsRichTextConfig *config_02 = JobsRichTextConfig.new;
        config_02.font = UIFontWeightMediumSize(12);;
        config_02.textCor = HEXCOLOR(0xAE8330);
        config_02.targetString = self.richTextMutArr[1];
        config_02.urlStr = @"click://";
        [RichTextMutArr addObject:config_02];
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
        ConnectionTipsTV.linkTextAttributes = @{NSForegroundColorAttributeName: self.richTextConfigMutArr[1].textCor,/// 链接文字颜色
                                                 NSUnderlineColorAttributeName: JobsLightGrayColor,
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
        JXCategoryViewTitleMutArr.add(JobsInternationalization(@"今日"));
        JXCategoryViewTitleMutArr.add(JobsInternationalization(@"昨日"));
        JXCategoryViewTitleMutArr.add(JobsInternationalization(@"近7日"));
        JXCategoryViewTitleMutArr.add(JobsInternationalization(@"近30日"));
        Jobs_setAssociatedRETAIN_NONATOMIC(_jxCategoryViewTitleMutArr, JXCategoryViewTitleMutArr)
    }return JXCategoryViewTitleMutArr;
}

-(void)setJxCategoryViewTitleMutArr:(NSMutableArray<NSString *> *)jxCategoryViewTitleMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_jxCategoryViewTitleMutArr, jxCategoryViewTitleMutArr)
}

@end
