//
//  NSObject+Extras.m
//  TestDemo
//
//  Created by AaltoChen on 15/10/31.
//  Copyright © 2015年 AaltoChen. All rights reserved.
//

#import "NSObject+Extras.h"

@implementation NSObject (Extras)
#pragma mark —— 宏
/// App 国际化相关系统宏二次封装 + 设置缺省值
+(NSString *_Nullable)localStringWithKey:(nonnull NSString *)key{
    return NSLocalizedString(key, nil);
}

+(NSString *_Nullable)localizedString:(nonnull NSString *)key
                            fromTable:(nullable NSString *)tableName{
    return NSLocalizedStringFromTable(key,
                                      tableName,
                                      nil);
}

+(NSString *_Nullable)localizedString:(nonnull NSString *)key
                            fromTable:(nullable NSString *)tableName
                             inBundle:(nullable NSBundle *)bundle{
    return NSLocalizedStringFromTableInBundle(key,
                                              tableName,
                                              bundle ? : NSBundle.mainBundle,
                                              nil);
}

+(NSString *_Nullable)localizedString:(nonnull NSString *)key
                            fromTable:(nullable NSString *)tableName
                             inBundle:(nullable NSBundle *)bundle
                         defaultValue:(nullable NSString *)defaultValue{
    return NSLocalizedStringWithDefaultValue(key,
                                             tableName,
                                             bundle ? : NSBundle.mainBundle,
                                             defaultValue,
                                             nil);
}
#pragma mark —— ViewController
/// 从一个视图（UIView）出发，获取它所在的视图控制器（UIViewController）
-(JobsReturnVCByView _Nonnull)getViewControllerByView{
    return ^(UIView *_Nonnull view) {
        UIResponder *responder = view;
        while (responder) {
            if (KindOfVCCls(responder)) {
                return (UIViewController *)responder;
            }responder = responder.nextResponder;
        }return (UIViewController *)nil;
    };
}
/// 获得当前的控制器。对getCurrentViewController的再次封装
-(__kindof UIViewController *_Nullable)jobsGetCurrentViewControllerWithNavCtrl{
    return JobsNavCtrl(self.jobsGetCurrentViewController);
}
/// 获得当前的控制器。对getCurrentViewController的再次封装
-(__kindof UIViewController *_Nullable)jobsGetCurrentViewController{
    return KindOfVCCls(self) ? (UIViewController *)self : self.getCurrentViewController;
}
/// 获得当前的控制器
-(__kindof UIViewController *_Nullable)getCurrentViewController{
    return self.getCurrentViewControllerByRootVC(NSObject.mainWindow().rootViewController);
}
/// 获得当前控制器的根控制器
-(JobsReturnVCByVC _Nullable)getCurrentViewControllerByRootVC{
    @jobs_weakify(self)
    return ^(UIViewController *_Nonnull rootVC) {
        @jobs_strongify(self)
        UIViewController *currentVC;
        if (rootVC.presentedViewController) {
            /// 视图是被presented出来的
            currentVC = rootVC.presentedViewController;
        }
        if (KindOfTabBarCtrlCls(rootVC)) {
            /// 根视图为UITabBarController
            currentVC = self.getCurrentViewControllerByRootVC([(UITabBarController *)rootVC selectedViewController]);
        } else if (KindOfNavCtrlCls(rootVC)){
            /// 根视图为UINavigationController
            currentVC = self.getCurrentViewControllerByRootVC([(UINavigationController *)rootVC visibleViewController]);
        } else {
            /// 根视图为非导航类
            currentVC = rootVC;
        }return currentVC;
    };
}
/// 强制以Push的方式展现页面
/// @param toPushVC 需要进行展现的页面
/// @param requestParams 正向推页面传递的参数
/// 如果想用AppDelegate的自定义TabbarVC：(UIViewController *)AppDelegate.sharedManager.tabBarVC;
-(void)forceComingToPushVC:(UIViewController *_Nonnull)toPushVC
             requestParams:(id _Nullable)requestParams{
    UIViewController *viewController = self.jobsGetCurrentViewController;
    if (viewController) {
        viewController.comingToPushVCByRequestParams(toPushVC,requestParams);
    }else{
        NSLog(@"%@强制展现页面%@失败,携带的参数%@",viewController,toPushVC,requestParams);
        self.jobsToastErrMsg(JobsInternationalization(@"强制展现页面失败,请检查控制台"));
    }
}
/// 强制以Present的方式展现页面
/// @param toPresentVC 需要进行展现的页面
/// @param requestParams 正向推页面传递的参数
/// @param completion 完成Present动作以后得动作
-(void)forceComingToPresentVC:(UIViewController *_Nonnull)toPresentVC
                requestParams:(id _Nullable)requestParams
                   completion:(void (^ __nullable)(void))completion{
    UIViewController *viewController = KindOfVCCls(self) ? (UIViewController *)self : self.jobsGetCurrentViewController;
    [viewController presentViewController:toPresentVC
                                 animated:YES
                               completion:completion];
}
/// 获取Storyboard里面的单独控制器
-(UIViewController *_Nullable)vcByStoryboardWithName:(NSString *_Nonnull)storyboardWithName
                                    storyboardBundle:(NSBundle *_Nullable)storyboardBundle
                                          identifier:(NSString *_Nonnull)identifier{
    UIStoryboard *story = [UIStoryboard storyboardWithName:storyboardWithName bundle:storyboardBundle];
    return [story instantiateViewControllerWithIdentifier:identifier];
}

-(UIViewController *_Nullable)vcByStoryboardWithName:(NSString *_Nonnull)storyboardWithName
                                    storyboardBundle:(NSBundle *_Nullable)storyboardBundle{
    return [UIStoryboard storyboardWithName:storyboardWithName bundle:nil].instantiateInitialViewController;;
}
#pragma mark —— KVO
/**
 
 在 self里面实现下列方法：实现监听
 -(void)observeValueForKeyPath:(NSString *)keyPath
 ofObject:(id)object
 change:(NSDictionary*)change
 context:(void *)context{
 if ([object isKindOfClass:UIScrollView.class]) {
 UIScrollView *scrollView = (UIScrollView *)object;
 CGPoint point = [((NSValue *)[scrollView valueForKey:@"contentOffset"]) CGPointValue];
 NSLog(@"point.x = %f,point.y = %f",point.x,point.y);
 }
 }
 */
/// 添加监听【针对UIScrollView 的 ContentOffset 属性】
-(void)monitorContentOffsetScrollView:(UIScrollView *_Nonnull)scrollView{
    [scrollView addObserver:self
                 forKeyPath:@"contentOffset"
                    options:NSKeyValueObservingOptionNew
                    context:nil];
}
#pragma mark —— NSNotification
/// 在主线程上带参发通知
-(jobsByKey_ValueBlock _Nonnull)JobsPost{
    return ^(NSString *_Nonnull key,id _Nullable value){
        dispatch_async(dispatch_get_main_queue(), ^{
            [JobsNotificationCenter postNotificationName:key object:value];
        });
    };
}
/// 在主线程上不带参发通知
-(jobsByStringBlock _Nonnull)jobsPost{
    return ^(NSString *_Nonnull key){
        dispatch_async(dispatch_get_main_queue(), ^{
            self.JobsPost(key,@(NO));
        });
    };
}
/// 接收通知
-(void)addNotificationName:(NSString *_Nonnull)notificationName block:(JobsSelectorBlock _Nullable)block{
    @jobs_weakify(self)
    [JobsNotificationCenter addObserver:self
                               selector:[self selectorBlocks:^id _Nullable(id _Nullable weakSelf,
                                                                           id _Nullable arg) {
        @jobs_strongify(self)
        if (block) block(self, arg);
        return nil;
    } selectorName:nil target:self] name:notificationName object:nil];
}
#pragma mark —— 功能性的
-(jobsByVoidBlock _Nonnull)震动特效反馈{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self addObserver:self
               forKeyPath:@"state"
                  options:NSKeyValueObservingOptionNew
                  context:nil];
    };
}
/// 可变数组的方便调用
-(__kindof NSArray *_Nonnull)jobsMakeMutArr:(jobsByMutableArrayBlock _Nonnull)block{
    NSMutableArray *mutableArray = NSMutableArray.array;
    if (block) block(mutableArray);
    return mutableArray;
}
/// 可变集合的方便调用
-(__kindof NSSet *_Nonnull)jobsMakeMutSet:(jobsByMutableSetBlock _Nonnull)block{
    NSMutableSet *mutableSet = NSMutableSet.set;
    if (block) block(mutableSet);
    return mutableSet;
}

-(jobsByVoidBlock _Nonnull)loginOK{
    return ^(){
        self.jobsPost(JobsLoginNotification);
    };
}

-(jobsByVoidBlock _Nonnull)logoutOK{
    return ^(){
        self.jobsPost(JobsLogoutNotification);
    };
}
/**
 注意：有些时候UIApplication.sharedApplication.keyWindow获取到的window有frame，而windowScene.windows.firstObject获取到的window没有frame
 
 在某些情况下，UIApplication.sharedApplication.keyWindow和windowScene.windows.firstObject获取到的窗口可能会表现出不同的行为，其中一个有frame属性，而另一个没有，这可能涉及到应用程序的窗口层次结构和窗口的状态。

 UIApplication.sharedApplication.keyWindow是老的方式来获取主窗口，通常在单窗口应用程序中使用。这个方法返回的窗口通常是一个UIWindow的实例，并且它在应用程序的整个生命周期内都是可用的，因此它通常具有frame属性，用来表示窗口的位置和大小。

 windowScene.windows.firstObject用于在多窗口应用程序中获取主窗口或当前窗口。由于多窗口应用程序具有更复杂的窗口管理，不同的窗口可能处于不同的状态，有些窗口可能在某些情况下没有frame属性。这可能是因为窗口尚未完成初始化或还没有显示在屏幕上。在这种情况下，您可以等到窗口完成初始化并显示后再访问其frame属性。

 总之，要处理多窗口应用程序中窗口的不同状态，您应该确保在访问窗口属性之前进行适当的检查，以确保窗口已经准备好并且具有所需的属性。这可以通过在适当的时机监听窗口的状态变化来实现。
 */
+(JobsReturnWindowByVoidBlock _Nonnull)mainWindow{
    return ^__kindof UIWindow *_Nullable(){
        UIWindow *mainWindowBefore13 = jobsGetMainWindowBefore13().landscape;
        UIWindow *mainWindowAfter13 = jobsGetMainWindowAfter13().landscape;
        UIWindow *resultWindow = UIDevice.currentDevice.systemVersion.floatValue >= 13.0 ? mainWindowAfter13 : mainWindowBefore13;
        
        if(resultWindow) return resultWindow;
        if(mainWindowBefore13) return mainWindowBefore13;
        if(mainWindowAfter13) return mainWindowAfter13;
        return nil;
    };
}
/// 使用指定的图像（UIImage）作为颜色的填充图案。
/// 这个方法的作用是生成一个基于图像的颜色，这个颜色在视图或图层上会以平铺的方式重复显示指定的图像。
-(JobsReturnColorByImageBlock _Nonnull)byPatternImage{
    return ^UIColor *_Nullable(UIImage *_Nonnull image){
        return [UIColor colorWithPatternImage:image];
    };
}
/// 雪花算法
-(NSNumber *_Nonnull)makeSnowflake{
    JobsSnowflake *snowflake = [JobsSnowflake.alloc initWithPublishMillisecond:self.currentUnixTimeStampInMilliseconds
                                                                         IDCID:1
                                                                     machineID:1];
    NSNumber *snowflakeID = snowflake.nextID;
    if (snowflakeID){
        NSLog(@"Generated Snowflake ID: %@", snowflakeID);
    }else{
        NSLog(@"Failed to generate Snowflake ID.");
    }return snowflakeID;
}
/// present
#ifndef JobsPresentationStyle
#define JobsPresentationStyle (UIDevice.currentDevice.systemVersion.doubleValue >= 13.0 ? UIModalPresentationAutomatic : UIModalPresentationFullScreen)
#endif
/// 简洁版强制present展现一个控制器页面【不需要正向传参】
-(jobsByVCBlock _Nullable)comingToPresentVC{
    @jobs_weakify(self)
    return ^(UIViewController *_Nonnull viewController) {
        @jobs_strongify(self)
        [UIViewController comingFromVC:self.jobsGetCurrentViewController
                                  toVC:viewController
                           comingStyle:ComingStyle_PRESENT
                     presentationStyle:JobsPresentationStyle
                         requestParams:nil
              hidesBottomBarWhenPushed:YES
                              animated:YES
                               success:nil];
    };
}
/// 简洁版强制present展现一个控制器页面【需要正向传参】
-(jobsByVCAndDataBlock _Nullable)comingToPresentVCByRequestParams{
    @jobs_weakify(self)
    return ^(UIViewController * _Nullable viewController,id _Nullable requestParams) {
        @jobs_strongify(self)
        [UIViewController comingFromVC:self.jobsGetCurrentViewController
                                  toVC:viewController
                           comingStyle:ComingStyle_PRESENT
                     presentationStyle:JobsPresentationStyle
                         requestParams:requestParams
              hidesBottomBarWhenPushed:YES
                              animated:YES
                               success:nil];
    };
}
#pragma mark —— push
/// 简洁版强制push展现一个控制器页面【不需要正向传参】
-(jobsByVCBlock _Nullable)comingToPushVC{
    @jobs_weakify(self)
    return ^(UIViewController *_Nonnull viewController) {
        @jobs_strongify(self)
        [UIViewController comingFromVC:self.jobsGetCurrentViewController
                                  toVC:viewController
                           comingStyle:ComingStyle_PUSH
                     presentationStyle:JobsPresentationStyle
                         requestParams:nil
              hidesBottomBarWhenPushed:YES
                              animated:YES
                               success:nil];
    };
}
/// 简洁版强制push展现一个控制器页面【需要正向传参】
-(jobsByVCAndDataBlock _Nullable)comingToPushVCByRequestParams{
    @jobs_weakify(self)
    return ^(UIViewController * _Nullable viewController,id _Nullable requestParams) {
        @jobs_strongify(self)
        [UIViewController comingFromVC:self.jobsGetCurrentViewController
                                  toVC:viewController
                           comingStyle:ComingStyle_PUSH
                     presentationStyle:JobsPresentationStyle
                         requestParams:requestParams
              hidesBottomBarWhenPushed:YES
                              animated:YES
                               success:nil];
    };
}
/// 代理检测和回调
-(jobsDelegateBlock _Nullable)jobsDelegate{
    @jobs_weakify(self)
    return ^(NSString *_Nullable data,jobsByVoidBlock block) {
        @jobs_strongify(self)
        if ([self respondsToSelector:NSSelectorFromString(data)]) {
            if(block) block();
        }
    };
}
/// GKNavigationBar 返回按钮点击方法
///【子类需要覆写 】创建返回键的点击事件
-(jobsByBtnBlock _Nonnull)jobsBackBtnClickEvent{
    @jobs_weakify(self)
    return ^(UIButton *_Nullable sender) {
        @jobs_strongify(self)
        if (self.jobsBackBlock) self.jobsBackBlock(sender);
        UIViewController *vc = nil;
        if (KindOfVCCls(self)) {
            vc = (UIViewController *)self;
        }else if (KindOfViewCls(self)){
            UIView *view = (UIView *)self;
            vc = self.getViewControllerByView(view);
        }else return;
        
        switch (self.pushOrPresent) {
            case ComingStyle_PRESENT:{
                [vc dismissViewControllerAnimated:YES completion:nil];
            }break;
            case ComingStyle_PUSH:{
                vc.navigationController ? [vc.navigationController popViewControllerAnimated:YES] : [vc dismissViewControllerAnimated:YES completion:nil];
            }break;
                
            default:
                break;
        }
    };
}
/// 打印YTKBaseRequest
-(jobsByYTKBaseRequestBlock _Nullable)checkRequest{
    return ^(YTKBaseRequest *_Nonnull request) {
        NSLog(@"request.error = %@\n",request.error);
        NSLog(@"request.requestArgument = %@\n",request.requestArgument);
        NSLog(@"request.requestUrl = %@\n",request.requestUrl);
        NSLog(@"request.baseUrl = %@\n",request.baseUrl);
    };
}
/// 此功能的必要性：如果外界传入的数组是空，那么拿到的count是0，做-1操作就是-1，直接用for循环就会进入死循环
-(void)jobsSafetyCycleFunc:(int)ceiling
                cycleBlock:(jobsByIntBlock _Nullable)cycleBlock{
    if (ceiling > 0) {
        for (int i = 0 ; i < ceiling; i++) {
            NSLog(@"Jobs_%d",i);
            if (cycleBlock) cycleBlock(i);
        }
    }
}

-(NSMutableArray <ImageModel *>*_Nonnull)changeGifToImage:(NSData *_Nonnull)gifData{
    /// 通过文件的url来将gif文件读取为图片数据引用
    CFDataRef my_cfdata = CFBridgingRetain(gifData);
    CGImageSourceRef source = CGImageSourceCreateWithData(my_cfdata, NULL);
    /// 获取gif文件里图片的个数
    size_t count = CGImageSourceGetCount(source);
    /// 存放全部图片
    NSMutableArray <ImageModel *>*imageModelArr = NSMutableArray.array;
    /// 遍历
    for (size_t i = 0; i < count; i++) {
        ImageModel *imageModel = ImageModel.new;
        CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
        imageModel.image = [UIImage imageWithCGImage:image];
        CGImageRelease(image);
        //获取图片信息
        imageModel.info = (__bridge NSDictionary*)CGImageSourceCopyPropertiesAtIndex(source, i, NULL);
        imageModel.timeDic = [imageModel.info objectForKey:(__bridge NSString *)kCGImagePropertyGIFDictionary];
        [imageModelArr addObject:imageModel];
    }return imageModelArr;
}
/**
 
 NSMutableArray <UIViewModel *>*dataMutArr = popupView.valueForKey(@"dataMutArr");
 [dataMutArr removeAllObjects];
 [dataMutArr addObjectsFromArray:self.createDataMutArr2];
 
 // dataMutArr = self.createDataMutArr2; 这一段无效
 
 */
- (JobsReturnIDByIDBlock)valueForKey{
    return ^(NSString *key) {
        id value = nil;
        if ([key isKindOfClass:NSString.class] &&
            [self respondsToSelector:NSSelectorFromString(key)]) {
            @try {
                value = [self valueForKey:key];
            }
            @catch (NSException *exception) {
                NSLog(@"Exception: %@", exception);
                value = @"nil"; // or handle the exception as needed
            }
        }return value;
    };
}
/// KVC 的二次封装
-(jobsByKey_ValueBlock _Nonnull)jobsKVC{
    return ^(NSString *_Nonnull key,id _Nullable value) {
        [self setValue:value forKey:key];
    };
}

-(JobsReturnBOOLByIDBlock _Nonnull)isKindOfClass{
    return ^(Class cls) {
        return [self isKindOfClass:cls];
    };
}

-(JobsReturnBOOLByIDBlock _Nonnull)isMemberOfClass{
    return ^(Class cls) {
        return [self isKindOfClass:cls];
    };
}

-(void)addNotificationObserverWithName:(NSString *_Nonnull)notificationName
                         selectorBlock:(jobsByTwoIDBlock _Nullable)selectorBlock{
    [JobsNotificationCenter addObserver:self
                                           selector:[self selectorBlocks:^id _Nullable(id _Nullable weakSelf,
                                                                                       id _Nullable arg) {
        NSNotification *notification = (NSNotification *)arg;
        if([notification.object isKindOfClass:NSNumber.class]){
            NSNumber *b = notification.object;
            NSLog(@"SSS = %d",b.boolValue);
        }
        if (selectorBlock) selectorBlock(weakSelf,arg);
        return nil;
    } selectorName:nil target:self]
                                               name:notificationName
                                             object:nil];
}
/// 不能用于UITableViewHeaderFooterView
+(JobsReturnIDBySaltStrBlock _Nonnull)jobsInitWithReuseIdentifier{
    @jobs_weakify(self)
    return ^(NSString * _Nullable salt) {
        @jobs_strongify(self)
        return [self.class.alloc initWithReuseIdentifier:NSStringFromClass(self.class).add(salt)];
    };
}
/// 不能用于UITableViewHeaderFooterView
-(JobsReturnIDByClsAndSaltStrBlock _Nonnull)jobsInitWithReuseIdentifierClass{
    return ^(Class _Nonnull cls,NSString * _Nullable salt) {
        return [cls.alloc initWithReuseIdentifier:NSStringFromClass(cls).add(salt)];
    };
}
/// 查询算法
/// @param data 查询的数据源
/// @param searchStrategy 查询策略
/// @param keywords 关键词
-(NSMutableSet *_Nullable)dimSearchWithData:(id _Nonnull)data
                             searchStrategy:(JobsSearchStrategy)searchStrategy
                                   keywords:(NSString *_Nonnull)keywords{
    NSMutableSet *__block resMutSet = NSMutableSet.set;
    JobsReturnIDByIDBlock dimSearchBlock = ^(id data){
        for (id obj in data) {// 系统Api提供的基础对象元素
            if ([obj isKindOfClass:NSNumber.class] ||
                [obj isKindOfClass:NSString.class]) {
                if ([obj stringValue].containsString(keywords)) {
                    resMutSet.add(obj);
                }
            }else{// 自定义的对象
                NSObject *customObj = (NSObject *)obj;
                NSMutableArray <NSString *>*propertyList = customObj.printPropertyList;
                for (NSString *str in propertyList) {
                    switch (searchStrategy) {
                        case JobsSearchStrategy_Accurate:{
                            /// 精确查询
                            if ([customObj.valueForKey(str) stringValue].lowercaseString.containsString(keywords.lowercaseString)) {
                                resMutSet.add(customObj);
                            }
                        }break;
                        case JobsSearchStrategy_Fuzzy:{
                            /// 模糊查询
                            if ([customObj.valueForKey(str) stringValue].containsString(keywords)) {
                                resMutSet.add(customObj);
                            }
                        }break;
                        default:
                            break;
                    }
                }
            }
        }return resMutSet;
    };
    
    if ([data isKindOfClass:NSDictionary.class]){
        NSDictionary *dataDic = (NSDictionary *)data;
        [dataDic enumerateKeysAndObjectsUsingBlock:^(id _Nonnull key,
                                                     id _Nonnull obj,
                                                     BOOL *_Nonnull stop) {
            /// Key-Value，value包含关键词则存储对外输出
            if ([[obj stringValue] containsString:keywords]) {
                /// 用Set保证对外输出的唯一性
                resMutSet.add(obj);
            }
        }];
    }else if([data isKindOfClass:NSArray.class] ||
             [data isKindOfClass:NSSet.class]){
        if(dimSearchBlock) resMutSet = dimSearchBlock(data);
    }else{}return resMutSet;
}
/// 索取对象obj里面属性名为propertyName的值，如果没有这个属性则查找返回nil
/// @param obj 索取对象
/// @param propertyName 需要查找的属性值
-(id _Nullable)checkTargetObj:(NSObject *_Nullable)obj
                 propertyName:(NSString *_Nullable)propertyName{
    if ([obj.printPropertyList containsObject:propertyName]) {
        return obj.valueForKey(propertyName);
    }return nil;
}
/// 版本号比较 版本号的格式：数字中间由点隔开
/// @param versionNumber1 版本号1
/// @param versionNumber2 版本号2
-(CompareRes)versionNumber1:(NSString *_Nonnull)versionNumber1
             versionNumber2:(NSString *_Nonnull)versionNumber2{
    NSString *v1 = [versionNumber1 stringByReplacingOccurrencesOfString:@"." withString:JobsInternationalization(@"")];
    NSString *v2 = [versionNumber2 stringByReplacingOccurrencesOfString:@"." withString:JobsInternationalization(@"")];
    if (v1.isPureInt && v2.isPureInt) {
        if (v1.integerValue > v2.integerValue) {
            return CompareRes_MoreThan;
        }else if (v1.integerValue < v2.integerValue){
            return CompareRes_LessThan;
        }else{
            return CompareRes_Equal;
        }
    }else{
        NSLog(@"数据异常，请检查：versionNumber1 = %@,versionNumber2 = %@",versionNumber1,versionNumber2);
        return CompareRes_Error;
    }
}
/// 给定一个数据源（数组）和 每行需要展示的元素个数，计算行数
/// @param num 每行需要展示的元素个数
-(NSInteger)lineNum:(NSInteger)num{
    if ([self isKindOfClass:NSArray.class] || [self isKindOfClass:NSMutableArray.class]) {
        NSArray *arr = (NSArray *)self;
        return [self count:arr.count num:num];
    }else return 0;
}

-(NSInteger)count:(NSUInteger)count
              num:(NSInteger)num{
    return (count + (num - 1)) / num;
}
/**
 ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️
 -(ScrollDirection)judgementScrollDirectionByPoint:(CGPoint)point;
 和
 -(CGFloat)scrollOffsetByDirectionXPoint:(CGPoint)point；
 -(CGFloat)scrollOffsetByDirectionYPoint:(CGPoint)point;
 互斥
 * 因为 全局是用唯一变量lastPoint进行保存和判定
 * 而不断地滚动会不断地对lastPoint这个值进行冲刷
 * 而这两个方法都会依赖同一个lastPoint，所以会出现偏差
 ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️
 */
/// X 轴方向的偏移量
-(CGFloat)scrollOffsetByDirectionXPoint:(CGPoint)point{
    CGFloat f = self.lastPoint.x - point.x;
    self.lastPoint = point;
    return f;
}
/// Y 轴方向的偏移量
-(CGFloat)scrollOffsetByDirectionYPoint:(CGPoint)point{
    CGFloat f = self.lastPoint.y - point.y;
    self.lastPoint = point;
    return f;
}
/// 依据不断地传入的CGPoint *point，系统通过lastPoint来记录上一次的数据，两者进行比较，以此判断滑动的方向
/// @param point 最新的point
-(ScrollDirection)judgementScrollDirectionByPoint:(CGPoint)point{
    ScrollDirection direction = ScrollDirectionNone;
    if (self.lastPoint.x > point.x &&
        self.lastPoint.y == point.y) {
        NSLog(@"👉🏻");
        direction = ScrollDirectionRight;
    }else if (self.lastPoint.x < point.x &&
              self.lastPoint.y == point.y){
        NSLog(@"👈🏻");
        direction = ScrollDirectionLeft;
    }else if (self.lastPoint.x == point.x &&
              self.lastPoint.y > point.y){
        NSLog(@"👇🏻");
        direction = ScrollDirectionDown;
    }else if (self.lastPoint.x == point.x &&
              self.lastPoint.y < point.y){
        NSLog(@"👆🏻");
        direction = ScrollDirectionUp;
    }else if (self.lastPoint.x > point.x &&
              self.lastPoint.y < point.y){
        NSLog(@"👉🏻👆🏻");
        direction = ScrollDirectionRight_UP;
    }else if (self.lastPoint.x < point.x &&
              self.lastPoint.y < point.y){
        NSLog(@"👈🏻👆🏻");
        direction = ScrollDirectionLeft_UP;
    }else if (self.lastPoint.x > point.x &&
              self.lastPoint.y > point.y){
        NSLog(@"👉🏻👇🏻");
        direction = ScrollDirectionRight_Down;
    }else if (self.lastPoint.x < point.x &&
              self.lastPoint.y > point.y){
        NSLog(@"👈🏻👇🏻");
        direction = ScrollDirectionLeft_Down;
    }
    self.lastPoint = point;
    return direction;
}
/// 创建IndexPath坐标
-(NSIndexPath *_Nonnull)myIndexPath:(JobsIndexPath)indexPath{
    if (JobsAvailableSysVersion(6.0)) {
        return JobsIndexPathForItem(indexPath.section, indexPath.rowOrItem);
    }else{
        return JobsIndexPathForRow(indexPath.section, indexPath.rowOrItem);
    }
}
/// 点击任意一个view，下拉弹出与此View等宽，且与下底有一个motivateViewOffset距离的列表【如果应用于可滑动模块，当触发控件滑动的时候，建议对此进行关闭处理】
/// @param motivateFromView 点击的锚点View
/// @param jobsDropDownListViewDirection JobsDropDownListView的方向
/// @param data 列表数据源
/// @param motivateViewOffset 下拉列表和motivateFromView保持一个motivateViewOffset的距离
/// @param finishBlock 点击列表以后的回调数据是UIViewModel类型
-(JobsDropDownListView *_Nullable)motivateFromView:(UIView * _Nonnull)motivateFromView
                     jobsDropDownListViewDirection:(JobsDropDownListViewDirection)jobsDropDownListViewDirection
                                              data:(NSMutableArray <UIViewModel *>* _Nullable)data
                                motivateViewOffset:(CGFloat)motivateViewOffset
                                       finishBlock:(jobsByIDBlock _Nullable)finishBlock{
    
    JobsDropDownListView *dropDownListView = JobsDropDownListView.new;
    dropDownListView.direction = jobsDropDownListViewDirection;
    [dropDownListView actionObjectBlock:^(id data) {
        if ([motivateFromView isKindOfClass:UIButton.class]) {
            UIButton *btn = (UIButton *)motivateFromView;
            btn.selected = !btn.selected;
        }
        
        if (finishBlock) finishBlock(data);
        
        [dropDownListView dropDownListViewDisappear:nil];
    }];
    
    //    dropDownListView.backgroundColor = JobsRedColor;
    CGRect f = [self getWindowFrameByView:motivateFromView];
    if (!data) {
        data = NSMutableArray.array;
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.font = UIFontWeightRegularSize(14);
            viewModel.jobsWidth = f.size.width;
            viewModel.textModel.text = @"111111111";
            viewModel.subTextModel.text = @"eeeeeeeee";
            viewModel.textModel.textLineSpacing = 0;
            [data addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.font = UIFontWeightRegularSize(14);
            viewModel.jobsWidth = f.size.width;
            viewModel.textModel.text = @"222222222";
            viewModel.subTextModel.text = @"wwwwwwwww";
            viewModel.textModel.textLineSpacing = 0;
            [data addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.font = UIFontWeightRegularSize(14);
            viewModel.jobsWidth = f.size.width;
            viewModel.textModel.text = @"333333333";
            viewModel.subTextModel.text = @"sssssssss";
            viewModel.textModel.textLineSpacing = 0;
            [data addObject:viewModel];
        }
    }
    dropDownListView.jobsRichElementsInViewWithModel(data);
    
    if (jobsDropDownListViewDirection) {
        dropDownListView.frame = CGRectMake(f.origin.x,
                                            f.origin.y - motivateViewOffset - data.count * [JobsDropDownListTBVCell cellHeightWithModel:Nil],
                                            f.size.width,
                                            data.count * [JobsDropDownListTBVCell cellHeightWithModel:Nil]);
    }else{
        dropDownListView.frame = CGRectMake(f.origin.x,
                                            f.origin.y + f.size.height + motivateViewOffset,
                                            f.size.width,
                                            data.count * [JobsDropDownListTBVCell cellHeightWithModel:Nil]);
    }
    
    [NSObject.mainWindow() addSubview:dropDownListView];
    return dropDownListView;
}
/// iOS 获取任意控件在屏幕中的坐标
-(CGRect)getWindowFrameByView:(UIView *_Nonnull)view{
    // 将rect由rect所在视图转换到目标视图view中，返回在目标视图view中的rect
    CGRect rect = [view convertRect:view.bounds toView:NSObject.mainWindow()];
    return rect;
    /**
     类似的：
     // 将像素point由point所在视图转换到目标视图view中，返回在目标视图view中的像素值
     - (CGPoint)convertPoint:(CGPoint)point toView:(UIView *)view;
     // 将像素point从view中转换到当前视图中，返回在当前视图中的像素值
     - (CGPoint)convertPoint:(CGPoint)point fromView:(UIView *)view;
     // 将rect由rect所在视图转换到目标视图view中，返回在目标视图view中的rect
     - (CGRect)convertRect:(CGRect)rect toView:(UIView *)view;
     // 将rect从view中转换到当前视图中，返回在当前视图中的rect
     - (CGRect)convertRect:(CGRect)rect fromView:(UIView *)view;
     */
}
/// 依据View上铆定的internationalizationKEY来全局更改文字以适配国际化
-(void)languageSwitch{
    UIView *v = self.getView;
    if (v) {
        for (UIView *view in v.subviews) {
            if (isValue(view.internationalizationKEY)) {
                if ([view isKindOfClass:UILabel.class]) {
                    UILabel *lab = (UILabel *)view;
                    lab.text = JobsInternationalization(view.internationalizationKEY);
                }else if ([view isKindOfClass:UIButton.class]){
                    UIButton *btn = (UIButton *)view;
                    btn.normalTitle(JobsInternationalization(view.internationalizationKEY));
                }else{}
            }
        }
    }
}
/// 打印请求体
-(jobsByURLSessionDataTaskBlock _Nonnull)printURLSessionRequestMessage{
    return ^(__kindof NSURLSessionDataTask *_Nullable task) {
        if (task) {
            self.printRequestMessage(task.originalRequest);
        }else{
            NSLog(@"NSURLSessionDataTask *task 为空,请检查");
        }
    };
}

-(jobsByURLRequestBlock _Nonnull)printRequestMessage{
    return ^(__kindof NSURLRequest *_Nullable data) {
        if (data) {
            // 请求URL
            NSLog(@"请求URL:%@\n",data.URL);
            // 请求方式
            NSLog(@"请求方式:%@\n",data.HTTPMethod);
            // 请求头信息
            NSLog(@"请求头信息:%@\n",data.allHTTPHeaderFields);
            // 请求正文信息
            NSLog(@"请求正文信息:%@\n",[NSString.alloc initWithData:data.HTTPBody encoding:NSUTF8StringEncoding]);
            // 请求响应时间
            NSLog(@"请求响应时间:%@\n",self.currentTimestampString);
            NSLog(@"\n请求URL:%@\n请求方式:%@\n请求头信息:%@\n请求正文信息:%@\n请求响应时间:%@\n",data.URL,data.HTTPMethod,data.allHTTPHeaderFields,[NSString.alloc initWithData:data.HTTPBody encoding:NSUTF8StringEncoding],self.currentTimestampString);
        }else{
            NSLog(@"NSURLRequest *data 为空,请检查");
        }
    };
}
/// 判断是否是此版本App的首次启动
-(BOOL)isAppFirstLaunch{
    BOOL isFirstLaunch = JobsGetUserDefaultBoolForKey(@"AppFirstLaunch");
    if (!isFirstLaunch) {
        JobsSetUserBoolKeyWithBool(@"AppFirstLaunch", YES);
        JobsUserDefaultSynchronize;
    }return !isFirstLaunch;
}
/// 判断是否是App今日的首次启动
-(BOOL)isTodayAppFirstLaunch{
    NSString *recordToday = JobsUserDefaults.valueForKey(@"TodayAppFirstLaunch");
    JobsTimeModel *timeModel = JobsTimeModel.new;
    NSString *today = toStringByLong(timeModel.currentEra).add(@"-")
                                                          .add(toStringByLong(timeModel.currentYear))
                                                          .add(@"-")
                                                          .add(toStringByLong(timeModel.currentMonth))
                                                          .add(@"-")
                                                          .add(toStringByLong(timeModel.currentDay))
                                                          .add(@"-");
    if ([recordToday isEqualToString:today]) {
        NSLog(@"今天已经启动过");
    }else{
        NSLog(@"今天第一次启动");
        JobsSetUserDefaultKeyWithValue(@"TodayAppFirstLaunch", today);
        JobsUserDefaultSynchronize;//
    }return ![recordToday isEqualToString:today];
}
/// 震动特效反馈
-(jobsByVoidBlock _Nonnull)feedbackGenerator{
    return ^() {
        if (@available(iOS 10.0, *)) {
            UIImpactFeedbackGenerator *generator = [UIImpactFeedbackGenerator.alloc initWithStyle:UIImpactFeedbackStyleMedium];
            [generator prepare];
            [generator impactOccurred];
        } else AudioServicesPlaySystemSound(1520);
    };
}
/// 检测用户是否锁屏：根据屏幕光线来进行判定，而不是系统通知
-(JobsReturnBOOLByVoidBlock _Nonnull)didUserPressLockButton{
    return ^BOOL() {
        /// 获取屏幕亮度
        CGFloat oldBrightness = UIScreen.mainScreen.brightness;
        /// 以较小的数量改变屏幕亮度
        UIScreen.mainScreen.brightness = oldBrightness + (oldBrightness <= 0.01 ? (0.01) : (-0.01));
        CGFloat newBrightness = UIScreen.mainScreen.brightness;
        /// 恢复屏幕亮度
        UIScreen.mainScreen.brightness = oldBrightness;
        /// 判断屏幕亮度是否能够被改变
        return oldBrightness != newBrightness;
    };
}
/// iOS 限制自动锁屏 lockSwitch:YES(关闭自动锁屏)
-(jobsByBOOLBlock _Nonnull)autoLockedScreen{
    return ^(BOOL lockSwitch) {
        UIApplication.sharedApplication.idleTimerDisabled = lockSwitch;
    };
}

-(jobsByGKPhotoBrowserBlock _Nonnull)savePic{
    @jobs_weakify(self)
    return ^(GKPhotoBrowser *_Nonnull browser) {
        @jobs_strongify(self)
        if (browser) {
            GKPhoto *photo = browser.photos[browser.currentIndex];
            NSData *imageData = nil;
            if ([photo.image isKindOfClass:SDAnimatedImage.class]) {
                imageData = [(SDAnimatedImage *)photo.image animatedImageData];
            }else if ([photo.image isKindOfClass:YYImage.class]) {
                imageData = [(YYImage *)photo.image animatedImageData];
            }else {
                imageData = photo.image.sd_imageData;
            }
            if (!imageData) return;
            self.saveImageData(imageData);
        }else{
            NSLog(@"GKPhotoBrowser * 为空");
        }
    };
}

-(jobsByDataBlock _Nonnull)saveImageData{
    return ^(NSData *_Nullable imageData) {
        /// OC 是强类型、弱语法的语言，所以这里需要进行过滤判定保证安全性
        if ([imageData isKindOfClass:UIImage.class]){
            imageData = UIImagePNGRepresentation((UIImage *)imageData);
        }
        
        if ([imageData isKindOfClass:NSData.class]) {
            [PHPhotoLibrary.sharedPhotoLibrary performChanges:^{
                if (@available(iOS 9, *)) {
                    PHAssetCreationRequest *request = PHAssetCreationRequest.creationRequestForAsset;
                    [request addResourceWithType:PHAssetResourceTypePhoto
                                            data:imageData
                                         options:nil];
                    request.creationDate = NSDate.date;
                }
            } completionHandler:^(BOOL success,
                                  NSError *error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (success) {
                        NSLog(@"保存照片成功");
                        toast(JobsInternationalization(@"图片保存成功"));
                    } else if (error) {
                        NSLog(@"保存照片出错:%@",error.localizedDescription);
                        toastErr(JobsInternationalization(@"保存保存失败"));
                    }
                });
            }];
        }else return;
    };
}
/// 将基本数据类型（先统一默认视作浮点数）转化为图片进行显示。使用前提，图片的名字命令为0~9，方便进行映射
/// @param inputData 需要进行转换映射的基本数据类型数据
/// @param bitNum 如果操作对象是浮点数，那么小数点后需要保留的位数
-(nonnull NSMutableArray <UIImage *>*)translateToArr:(CGFloat)inputData
                                   saveBitAfterPoint:(NSInteger)bitNum{
    
    if ([self isFloat:inputData] && !bitNum) {
        bitNum = 2;//默认保存小数点后2位
    }

    NSString *format = @"%.".add([NSString stringWithFormat:@"%ldf",bitNum]);
    NSString *str = [NSString stringWithFormat:format,inputData];
    
    NSMutableArray <NSString *>*resultMutArr = NSMutableArray.array;// For test
    NSMutableArray <UIImage *>*resultIMGMutArr = NSMutableArray.array;
    
    NSUInteger len = str.length;
    unichar buffer[len + 1];
    [str getCharacters:buffer
                 range:NSMakeRange(0, len)];
    
    for(int i = 0; i < len; i++) {
        NSLog(@"%C", buffer[i]);
        NSString *temp = [NSString stringWithFormat:@"%C",buffer[i]];
        resultMutArr.add(temp);
        // 数字映射图片
        if ([temp isEqualToString:@"."]) {
            temp = @"小数点";
        }
        resultIMGMutArr.add(JobsIMG(temp));
    }
    NSLog(@"resultMutArr【For Test】 = %@",resultMutArr);
    return resultIMGMutArr;
}
/// 读取本地的plist文件到内存  【 plist ——> NSDictionary * 】
-(JobsReturnDicByStringBlock)readLocalPlistWithFileName{
    /// fileName Plist文件名
    return ^(NSString * _Nullable fileName) {
        NSString *filePath = JobsPathForResource(nil,
                                                fileName,
                                                nil,
                                                @"plist");
        if (FileFolderHandleTool.isExistsAtPath(filePath)) {
            return [NSDictionary.alloc initWithContentsOfFile:filePath];
        }return (NSDictionary *)nil;
    };
}
/// 监听程序被杀死前的时刻，进行一些需要异步的操作：磁盘读写、网络请求...
-(void)terminalCheck:(jobsByIDBlock _Nullable)checkBlock{
    [JobsNotificationCenter addObserver:self
                                           selector:[self selectorBlocks:^id _Nullable(id _Nullable weakSelf,
                                                                                       id _Nullable arg) {
        //进行埋点操作
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            NSLog(@"我只执行一次");
            // 在这里写遗言：最后希望去完成的事情
            if (checkBlock) checkBlock(@1);
            [NSThread sleepForTimeInterval:60];
            NSLog(@"程序被杀死");
        });return nil;
    } selectorName:nil target:self]
                                               name:@"UIApplicationWillTerminateNotification"
                                             object:nil];
}
/// Object转换为NSData
-(NSData *_Nullable)transformToData:(id _Nullable)object{
    if ([object isKindOfClass:NSString.class]) {
        NSString *string = (NSString *)object;
        return [string dataUsingEncoding:NSUTF8StringEncoding];
    }else if ([object isKindOfClass:NSArray.class]){
        NSArray *array = (NSArray *)object;
        NSError *err = nil;
        /*
         *  object 要归档的对象图的根
         *  requiresSecureCoding 一个布尔值，指示是否所有编码对象都必须符合 NSSecureCoding
         *  error 返回时，是编码时发生的错误，或者nil没有发生错误
         */
        if (@available(iOS 11.0, *)) {
            return [NSKeyedArchiver archivedDataWithRootObject:array
                                         requiringSecureCoding:YES
                                                         error:&err];
        }else{
            SuppressWdeprecatedDeclarationsWarning(return [NSKeyedArchiver archivedDataWithRootObject:array]);
        }
    }else if ([object isKindOfClass:NSDictionary.class]){
        NSDictionary *dictionary = (NSDictionary *)object;
        NSError *err = nil;
        return [NSJSONSerialization dataWithJSONObject:dictionary
                                               options:NSJSONWritingPrettyPrinted
                                                 error:&err];
    }else return nil;
}
/// 获取当前设备可用内存
-(double)availableMemory{
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(),
                                               HOST_VM_INFO,
                                               (host_info_t)&vmStats,
                                               &infoCount);
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }return ((vm_page_size * vmStats.free_count)/1024.0)/1024.0;
}
/// 获取当前任务所占用内存
-(double)usedMemory{
    task_basic_info_data_t taskInfo;
    mach_msg_type_number_t infoCount = TASK_BASIC_INFO_COUNT;
    kern_return_t kernReturn = task_info(mach_task_self(),
                                         TASK_BASIC_INFO,
                                         (task_info_t)&taskInfo,
                                         &infoCount);
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }return taskInfo.resident_size/1024.0/1024.0;
}
#pragma mark —— 尺寸
/*
    参考资料：https://blog.csdn.net/www9500net_/article/details/52437987
 */
/// TableViewCell 相对于此TableView的frame【用indexPath】
/// @param tableView 此TableView
/// @param indexPath 用indexPath定位📌TableViewCell
-(CGRect)tbvCellRectInTableView:(UITableView *_Nonnull)tableView
                    atIndexPath:(NSIndexPath *_Nonnull)indexPath{
    return [tableView rectForRowAtIndexPath:indexPath];
}
/// TableViewCell 相对于此TableView的frame【用TableViewCell】❤️
-(CGRect)tableViewCell:(UITableViewCell *_Nonnull)tableViewCell
      frameInTableView:(UITableView *_Nonnull)tableView{
    NSIndexPath *indexPath = [tableView indexPathForCell:tableViewCell];
    return [tableView rectForRowAtIndexPath:indexPath];
}
/// TableViewCell 相对于承接此tableView的父视图的frame【用indexPath】
/// @param tableView 此TableView
/// @param tbvSuperview 承接这个TableView的父容器View
/// @param indexPath 用indexPath定位📌TableViewCell
-(CGRect)tableView:(UITableView *_Nonnull)tableView
      tbvSuperview:(UIView *_Nonnull)tbvSuperview
   cellAtIndexPath:(NSIndexPath *_Nonnull)indexPath{
    CGRect rectInTableView = [self tbvCellRectInTableView:tableView atIndexPath:indexPath];
    return [tableView convertRect:rectInTableView toView:tbvSuperview];
}
/// TableViewCell 相对于承接此tableView的父视图的frame【用TableViewCell】❤️
-(CGRect)tableView:(UITableView *_Nonnull)tableView
      tbvSuperview:(UIView *_Nonnull)tbvSuperview
     tableViewCell:(UITableViewCell *_Nonnull)tableViewCell{
    CGRect rectInTableView = [self tableViewCell:tableViewCell frameInTableView:tableView];
    return [tableView convertRect:rectInTableView toView:tbvSuperview];
}
/// 获取CollectionViewCell在当前collection的位置【用indexPath】
/// @param collectionView 此CollectionView
/// @param indexPath 用indexPath定位📌CollectionViewCell
-(CGRect)frameInCollectionView:(UICollectionView *_Nonnull)collectionView
               cellAtIndexPath:(NSIndexPath *_Nonnull)indexPath{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    return [collectionView convertRect:cell.frame toView:collectionView];
}
/// 获取CollectionViewCell在当前collection的位置【用collectionViewCell】❤️
-(CGRect)collectionViewCell:(UICollectionViewCell *_Nonnull)collectionViewCell
      frameInCollectionView:(UICollectionView *_Nonnull)collectionView{
    return [collectionView convertRect:collectionViewCell.frame toView:collectionView];
}
/// 获取CollectionViewCell在当前屏幕的位置【用indexPath】
/// @param cvSuperview 承接这个CollectionView的父容器View
/// @param collectionView  此CollectionView
/// @param indexPath 用indexPath定位📌CollectionViewCell
-(CGRect)frameInCVSuperview:(UIView *_Nonnull)cvSuperview
             collectionView:(UICollectionView *_Nonnull)collectionView
            cellAtIndexPath:(NSIndexPath *_Nonnull)indexPath{
    CGRect cellInCollection = [self frameInCollectionView:collectionView
                                          cellAtIndexPath:indexPath];
    return [collectionView convertRect:cellInCollection toView:cvSuperview];
}
/// 获取CollectionViewCell在当前屏幕的位置【用collectionViewCell】❤️
-(CGRect)frameInCVSuperview:(UIView *_Nonnull)cvSuperview
             collectionView:(UICollectionView *_Nonnull)collectionView
         collectionViewCell:(UICollectionViewCell *_Nonnull)collectionViewCell{
    CGRect cellInCollection = [self collectionViewCell:collectionViewCell frameInCollectionView:collectionView];
    return [collectionView convertRect:cellInCollection toView:cvSuperview];
}
#pragma mark —— 利用数组和NSValue，存取结构体
/// CGPoint
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                                       addCGPoint:(CGPoint)point{
    mutArr.add([NSValue valueWithCGPoint:point]);
    return mutArr;
}

-(CGPoint)jobsGetPoint:(NSValue *_Nullable)value{
    return value.CGPointValue;
}
/// CGVector
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*  )mutArr
                                      addCGVector:(CGVector)vector{
    mutArr.add([NSValue valueWithCGVector:vector]);
    return mutArr;
}

-(CGVector)jobsGetVector:(NSValue *_Nullable)value{
    return value.CGVectorValue;
}
/// CGSize
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                                        addCGSize:(CGSize)size{
    mutArr.add([NSValue valueWithCGSize:size]);
    return mutArr;
}

-(CGSize)jobsGetSize:(NSValue *_Nullable)value{
    return value.CGSizeValue;
}
/// CGRect
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                                        addCGRect:(CGRect)frame{
    mutArr.add([NSValue valueWithCGRect:frame]);
    return mutArr;
}

-(CGRect)jobsGetFrame:(NSValue *_Nullable)value{
    return value.CGRectValue;
}
/// CGAffineTransform
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                             addCGAffineTransform:(CGAffineTransform)affineTransform{
    mutArr.add([NSValue valueWithCGAffineTransform:affineTransform]);
    return mutArr;
}

-(CGAffineTransform)jobsGetCGAffineTransform:(NSValue *_Nullable)value{
    return value.CGAffineTransformValue;
}
/// UIEdgeInsets
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                                  addUIEdgeInsets:(UIEdgeInsets)edgeInsets{
    mutArr.add([NSValue valueWithUIEdgeInsets:edgeInsets]);
    return mutArr;
}

-(UIEdgeInsets)jobsGetUIEdgeInsets:(NSValue *_Nullable)value{
    return value.UIEdgeInsetsValue;
}
/// NSDirectionalEdgeInsets
-(NSMutableArray <NSValue *>*)jobsMutArr:(NSMutableArray <NSValue *>*)mutArr
              addNSDirectionalEdgeInsets:(NSDirectionalEdgeInsets)directionalEdgeInsets{
    mutArr.add([NSValue valueWithDirectionalEdgeInsets:directionalEdgeInsets]);
    return mutArr;
}

-(NSDirectionalEdgeInsets)jobsGetNSDirectionalEdgeInsets:(NSValue *_Nullable)value{
    return value.directionalEdgeInsetsValue;
}
/// UIOffset
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                                      addUIOffset:(UIOffset)offset{
    mutArr.add([NSValue valueWithUIOffset:offset]);
    return mutArr;
}

-(UIOffset)jobsGetValueWithUIOffset:(NSValue *_Nullable)value{
    return value.UIOffsetValue;
}
#pragma mark —— 数字
/// 获取任意数字最高位数字
-(NSInteger)getTopDigit:(NSInteger)number{
    // makes sure you really get the digit!
    number = labs(number);// abs()
    if (number < 10){
        return number;
    }return [self getTopDigit:((number - (number % 10)) / 10)];
}
/// 判断任意给定的一个整型是多少位数
-(NSInteger)bitNum:(NSInteger)number{
    NSInteger count = 0;
    while(number != 0){
        number /= 10;
        count++;
    }
    printf("数字是 %ld 位数。", (long)count);
    return count;
}
/// 判断任意数字是否为小数
-(BOOL)isFloat:(CGFloat)num{
    return num - (int)num;
}
/**
    判断 num1 是否能被 num2 整除
    也就是判断 num2 是否是 num1 的整数倍
    也就是判断 num1 除以 num2 的余数是否是 0
 
    特别指出的是：
    1、除数为零的情况，被判定为不能被整除；
    2、num1 和 num2 必须为 NSNumber* 类型，否则判定为不能够被整除
 */
-(BOOL)judgementExactDivisionByNum1:(NSNumber *_Nonnull)num1
                               num2:(NSNumber *_Nonnull)num2{
    /// 过滤数据类型
    if (![num1 isKindOfClass:NSNumber.class] || ![num2 isKindOfClass:NSNumber.class]) return NO;
    /// 在数据类型为NSNumber* 的基础上进行讨论和判断
    if (num1 == num2) return YES;
    
    if (num2.floatValue) {
        int a = num2.intValue;
        double s1 = num1.doubleValue;
        int s2 = num1.intValue;
        return s1/a-s2/a <= 0;
    }else return YES;
}
#pragma mark —— 检测当前设备屏幕方向
//https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E6%A8%AA%E5%B1%8FUI%E5%88%87%E6%8D%A2.md/%E6%A8%AA%E5%B1%8FUI%E5%88%87%E6%8D%A2.md
-(CGFloat)jobsMainScreen_HEIGHT{
    return JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape ? JobsMainScreen_WIDTH() : JobsMainScreen_HEIGHT();
}

-(CGFloat)jobsMainScreen_WIDTH{
    return JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape ? JobsMainScreen_HEIGHT() : JobsMainScreen_WIDTH();
}

-(UIView *_Nullable)getView{
    UIView *view = nil;
    if ([self isKindOfClass:UIView.class]) {
        view = (UIView *)self;
    }else if ([self isKindOfClass:UIViewController.class]){
        UIViewController *vc = (UIViewController *)self;
        view = vc.view;
    }return view;
}

-(id _Nullable)getViewByBlock:(JobsReturnIDByComponentTypeAndUIViewBlock _Nullable)block{
    UIView *view = nil;
    if ([self isKindOfClass:UIView.class]) {
        view = (UIView *)self;
        if(block) return block(ComponentTypeView,view);
    }else if ([self isKindOfClass:UIViewController.class]){
        UIViewController *vc = (UIViewController *)self;
        view = vc.view;
        if(block) return block(ComponentTypeViewController,view);
    }else if(block) return block(ComponentTypeUnknown,nil);
    return nil;
}
/// UIInterfaceOrientationMask 检测屏幕方向
-(CGSize)checkScreenOrientation_UIInterfaceOrientationMask:(JobsReturnSizeByUIntegerBlock _Nullable)interfaceOrientationMaskBlock{
    if (interfaceOrientationMaskBlock){
        return interfaceOrientationMaskBlock( JobsAppTool.currentInterfaceOrientationMask);
    }else return CGSizeZero;
//    switch (self.currentInterfaceOrientationMask) {
//        ///【界面】竖屏方向
//        case UIInterfaceOrientationMaskPortrait:{
//            NSLog(@"检测屏幕方向：设备竖直向上，Home 按钮在下方");
////            toast(JobsInternationalization(@"检测屏幕方向：设备竖直向上，Home 按钮在下方"));
//        }break;
//        ///【界面】倒竖屏方向
//        case UIInterfaceOrientationMaskLandscapeLeft:{
//            NSLog(@"检测屏幕方向：设备竖直向下，Home 按钮在上方");
////            toast(JobsInternationalization(@"检测屏幕方向：设备竖直向下，Home 按钮在上方"));
//        }break;
//        ///【界面】左横屏方向
//        case UIInterfaceOrientationMaskLandscapeRight:{
//            NSLog(@"检测屏幕方向：设备水平，Home 按钮在左侧");
////            toast(JobsInternationalization(@"检测屏幕方向：设备水平，Home 按钮在左侧"));
//        }break;
//        ///【界面】右横屏方向
//        case UIInterfaceOrientationMaskPortraitUpsideDown:{
//            NSLog(@"检测屏幕方向：设备水平，Home 按钮在右侧");
////            toast(JobsInternationalization(@"检测屏幕方向：设备水平，Home 按钮在右侧"));
//        }default:
//            break;
//    }
}
/// UIInterfaceOrientation 检测屏幕方向
-(UIInterfaceOrientation)getInterfaceOrientation{
    UIInterfaceOrientation __block currentOrientation = UIInterfaceOrientationUnknown;
    if (@available(iOS 13.0, *)) {
        [self getViewByBlock:^id _Nullable(ComponentType componentType,
                                           UIView * _Nullable data) {
            /// 获取当前窗口场景的界面方向
            currentOrientation = data.window.windowScene.interfaceOrientation;
            return nil;
        }];
    } else {
        SuppressWdeprecatedDeclarationsWarning(currentOrientation = UIApplication.sharedApplication.statusBarOrientation;);
    }return currentOrientation;
}
/// UIInterfaceOrientation 检测屏幕方向
-(CGSize)checkScreenOrientation_UIInterfaceOrientation:(JobsReturnSizeByNSIntegerBlock _Nullable)interfaceOrientationBlock{
    if(self.getInterfaceOrientation == UIInterfaceOrientationUnknown) return CGSizeZero;
    if (interfaceOrientationBlock) return interfaceOrientationBlock(self.getInterfaceOrientation);
    return CGSizeZero;
}
/// DeviceOrientation 检测屏幕方向
-(DeviceOrientation)getDeviceOrientation{
    UIView *view = self.getView;
    return view ? (view.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact ? DeviceOrientationLandscape : DeviceOrientationPortrait)
    :DeviceOrientationUnknown;
}
/// 横屏通知的监听
-(void)横屏通知的监听:(JobsSelectorBlock1)block{
    @jobs_weakify(self)
    [self addNotificationName:UIDeviceOrientationDidChangeNotification
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        @jobs_strongify(self)
        switch (UIDevice.currentDevice.orientation) {
            case UIDeviceOrientationFaceUp:
                NSLog(@"屏幕朝上平躺");
                break;
            case UIDeviceOrientationFaceDown:
                NSLog(@"屏幕朝下平躺");
                break;
            case UIDeviceOrientationUnknown:
                NSLog(@"屏幕未知方向");
                break;
            case UIDeviceOrientationLandscapeLeft:
                NSLog(@"屏幕向左横置");
                 JobsAppTool.currentInterfaceOrientation = UIInterfaceOrientationLandscapeRight;
                 JobsAppTool.currentInterfaceOrientationMask = UIInterfaceOrientationMaskLandscapeRight;
                 JobsAppTool.jobsDeviceOrientation = DeviceOrientationLandscape;
                break;
            case UIDeviceOrientationLandscapeRight:
                NSLog(@"屏幕向右橫置");
                 JobsAppTool.currentInterfaceOrientation = UIInterfaceOrientationLandscapeLeft;
                 JobsAppTool.currentInterfaceOrientationMask = UIInterfaceOrientationMaskLandscapeLeft;
                 JobsAppTool.jobsDeviceOrientation = DeviceOrientationLandscape;
                break;
            case UIDeviceOrientationPortrait:
                NSLog(@"屏幕直立");
                 JobsAppTool.currentInterfaceOrientation = UIInterfaceOrientationPortrait;
                 JobsAppTool.currentInterfaceOrientationMask = UIInterfaceOrientationMaskPortrait;
                 JobsAppTool.jobsDeviceOrientation = DeviceOrientationPortrait;
                break;
            case UIDeviceOrientationPortraitUpsideDown:
                NSLog(@"屏幕直立，上下顛倒");
                 JobsAppTool.currentInterfaceOrientation = UIInterfaceOrientationPortraitUpsideDown;
                 JobsAppTool.currentInterfaceOrientationMask = UIInterfaceOrientationMaskPortraitUpsideDown;
                 JobsAppTool.jobsDeviceOrientation = DeviceOrientationPortrait;
                break;
            default:
                NSLog(@"屏幕方向无法辨识");
                break;
            }
        if(block)block(weakSelf,arg,@( JobsAppTool.jobsDeviceOrientation));
    }];
}
#pragma mark —— 键盘⌨️
/**
 使用方法：
 IQKeyboardManager.sharedManager.enable = NO;
 [self keyboard];
 [self actionNotificationBlock:^id(NSNotificationKeyboardModel *data) {
     @jobs_strongify(self)
     NSLog(@"userInfo = %@",data.userInfo);
     NSLog(@"beginFrame = %@",NSStringFromCGRect(data.beginFrame));
     NSLog(@"endFrame = %@",NSStringFromCGRect(data.endFrame));
     NSLog(@"keyboardOffsetY = %f",data.keyboardOffsetY);
     NSLog(@"notificationName = %@",data.notificationName);
     if (data.notificationName.isEqualToString(@"UIKeyboardWillChangeFrameNotification")) {

         if (data.keyboardOffsetY >= 0) {
             [self.collectionView setContentOffset:CGPointMake(0,self.collectionView.contentOffset.y + data.keyboardOffsetY)
                                          animated:YES];
         }else if(data.keyboardOffsetY < 0){
             [self.collectionView setContentOffset:CGPointMake(0,0)
                                          animated:YES];
         }
         
     }else if (data.notificationName.isEqualToString(@"UIKeyboardDidChangeFrameNotification")){
         NSLog(@"");
     }else{}
     
     return nil;
 }];
 */
/// 加入键盘通知的监听者
-(void)keyboard{
    @jobs_weakify(self)
    /// 键盘的弹出
    [self addNotificationName:UIKeyboardWillChangeFrameNotification
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        @jobs_strongify(self)
        NSNotification *notification = (NSNotification *)arg;
        NSLog(@"通知传递过来的 = %@",notification.object);
        NSNotificationKeyboardModel *notificationKeyboardModel = NSNotificationKeyboardModel.new;
        notificationKeyboardModel.userInfo = notification.userInfo;
        notificationKeyboardModel.beginFrame = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
        notificationKeyboardModel.endFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        notificationKeyboardModel.keyboardOffsetY = notificationKeyboardModel.beginFrame.origin.y - notificationKeyboardModel.endFrame.origin.y;// 正则抬起 ，负值下降
        notificationKeyboardModel.notificationName = UIKeyboardWillChangeFrameNotification;
        NSLog(@"KeyboardOffsetY = %f", notificationKeyboardModel.keyboardOffsetY);
        if (notificationKeyboardModel.keyboardOffsetY > 0) {
            NSLog(@"键盘抬起");
            if (self.keyboardUpNotificationBlock) self.keyboardUpNotificationBlock(notificationKeyboardModel);
        }else if(notificationKeyboardModel.keyboardOffsetY < 0){
            NSLog(@"键盘收回");
            if (self.keyboardDownNotificationBlock) self.keyboardDownNotificationBlock(notificationKeyboardModel);
        }else{
            NSLog(@"键盘");
        }
    }];
    /// 键盘的回收
    [self addNotificationName:UIKeyboardDidChangeFrameNotification
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        @jobs_strongify(self)
        NSNotification *notification = (NSNotification *)arg;
        NSLog(@"通知传递过来的 = %@",notification.object);
    }];
}

-(void)actionkeyboardUpNotificationBlock:(JobsReturnIDByIDBlock _Nullable)keyboardUpNotificationBlock{
    self.keyboardUpNotificationBlock = keyboardUpNotificationBlock;
}

-(void)actionkeyboardDownNotificationBlock:(JobsReturnIDByIDBlock _Nullable)keyboardDownNotificationBlock{
    self.keyboardDownNotificationBlock = keyboardDownNotificationBlock;
}
/// 根据数据源【数组】是否有值进行判定：占位图 和 mj_footer 的显隐性
-(void)dataSource:(NSArray *_Nonnull)dataSource
      contentView:(UIScrollView *_Nonnull)contentView{
    if (dataSource.count) {
        [contentView ly_hideEmptyView];
        contentView.ly_emptyView.alpha = 0;
    }else{
        [contentView ly_showEmptyView];
        contentView.ly_emptyView.alpha = 1;
    }
    contentView.mj_footer.hidden = !dataSource.count;
}
#pragma mark —— @property(nonatomic,assign)CGPoint lastPoint;
JobsKey(_lastPoint)
@dynamic lastPoint;
-(CGPoint)lastPoint{
    CGPoint LastPoint = [Jobs_getAssociatedObject(_lastPoint) CGPointValue];
    return LastPoint;
}

-(void)setLastPoint:(CGPoint)lastPoint{
    Jobs_setAssociatedRETAIN_NONATOMIC(_lastPoint, [NSValue valueWithCGPoint:lastPoint])
}
#pragma mark —— @property(nonatomic,strong)NSIndexPath *indexPath;
JobsKey(_indexPath)
@dynamic indexPath;
-(NSIndexPath *)indexPath{
    return Jobs_getAssociatedObject(_indexPath);
}

-(void)setIndexPath:(NSIndexPath *)indexPath{
    Jobs_setAssociatedRETAIN_NONATOMIC(_indexPath, indexPath)
}
#pragma mark —— @property(nonatomic,assign)NSInteger currentPage;
JobsKey(_currentPage)
@dynamic currentPage;
-(NSInteger)currentPage{
    NSInteger CurrentPage = [Jobs_getAssociatedObject(_currentPage) integerValue];
    if (CurrentPage == 0) {
        CurrentPage = 1;
        Jobs_setAssociatedRETAIN_NONATOMIC(_currentPage, @(CurrentPage))
    }return CurrentPage;
}

-(void)setCurrentPage:(NSInteger)currentPage{
    Jobs_setAssociatedRETAIN_NONATOMIC(_currentPage, @(currentPage))
}
#pragma mark —— @property(nonatomic,assign)NSInteger pageSize;
JobsKey(_pageSize)
@dynamic pageSize;
-(NSInteger)pageSize{
    NSInteger PageSize = [Jobs_getAssociatedObject(_pageSize) integerValue];
    if (PageSize == 0) {
        PageSize = 10;
        Jobs_setAssociatedRETAIN_NONATOMIC(_pageSize, @(PageSize))
    }return PageSize;
}

-(void)setPageSize:(NSInteger)pageSize{
    Jobs_setAssociatedRETAIN_NONATOMIC(_pageSize, @(pageSize))
}
#pragma mark —— @property(nonatomic,assign)NSInteger index;
JobsKey(_index)
@dynamic index;
-(NSInteger)index{
    return [Jobs_getAssociatedObject(_index) integerValue];
}

-(void)setIndex:(NSInteger)index{
    Jobs_setAssociatedRETAIN_NONATOMIC(_index, @(index))
}
#pragma mark —— @property(nonatomic,strong)UIViewModel *viewModel;
JobsKey(_viewModel)
@dynamic viewModel;
-(UIViewModel *)viewModel{
    UIViewModel *ViewModel = Jobs_getAssociatedObject(_viewModel);
    if (!ViewModel) {
        ViewModel = UIViewModel.new;
        Jobs_setAssociatedRETAIN_NONATOMIC(_viewModel, ViewModel)
    }return ViewModel;
}

-(void)setViewModel:(UIViewModel *)viewModel{
    Jobs_setAssociatedRETAIN_NONATOMIC(_viewModel, viewModel)
}
#pragma mark —— @property(nonatomic,strong)NSString *internationalizationKEY;/// 国际化的key
JobsKey(_internationalizationKEY)
@dynamic internationalizationKEY;
-(NSString *)internationalizationKEY{
    NSString *InternationalizationKEY = Jobs_getAssociatedObject(_internationalizationKEY);
    return InternationalizationKEY;
}

-(void)setInternationalizationKEY:(NSString *)internationalizationKEY{
    Jobs_setAssociatedRETAIN_NONATOMIC(_internationalizationKEY, internationalizationKEY)
}
#pragma mark —— @property(nonatomic,copy)JobsReturnIDByIDBlock keyboardUpNotificationBlock;
JobsKey(_keyboardUpNotificationBlock)
@dynamic keyboardUpNotificationBlock;
-(JobsReturnIDByIDBlock)keyboardUpNotificationBlock{
    return Jobs_getAssociatedObject(_keyboardUpNotificationBlock);
}

-(void)setKeyboardUpNotificationBlock:(JobsReturnIDByIDBlock)keyboardUpNotificationBlock{
    Jobs_setAssociatedRETAIN_NONATOMIC(_keyboardUpNotificationBlock, keyboardUpNotificationBlock)
}
#pragma mark —— @property(nonatomic,copy)JobsReturnIDByIDBlock keyboardDownNotificationBlock;
JobsKey(_keyboardDownNotificationBlock)
@dynamic keyboardDownNotificationBlock;
-(JobsReturnIDByIDBlock)keyboardDownNotificationBlock{
    return Jobs_getAssociatedObject(_keyboardDownNotificationBlock);
}

-(void)setKeyboardDownNotificationBlock:(JobsReturnIDByIDBlock)keyboardDownNotificationBlock{
    Jobs_setAssociatedRETAIN_NONATOMIC(_keyboardDownNotificationBlock, keyboardDownNotificationBlock)
}

@end

@implementation ImageModel

@end

@implementation NSNotificationKeyboardModel
/**
 关于键盘弹起：
 1、建议用RAC进行键盘管理，因为过滤字符比如emoji字符会很难处理
    1.1、关注：@implementation UITextField (Extend) -(void)jobsTextFieldEventFilterBlock:(JobsReturnBOOLByIDBlock)filterBlock subscribeNextBlock:(jobsByIDBlock)subscribeNextBlock；
    1.2、RAC 键盘管理当“注册键盘事件”的时候会执行一次RAC键盘监听方法
 2、键盘弹起会执行-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField；
 */
@end
