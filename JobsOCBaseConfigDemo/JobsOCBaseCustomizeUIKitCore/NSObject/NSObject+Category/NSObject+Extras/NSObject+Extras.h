//
//  NSObject+Extras.h
//  TestDemo
//
//  Created by AaltoChen on 15/10/31.
//  Copyright © 2015年 AaltoChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
#import <objc/runtime.h>
#import <sys/sysctl.h>
#import <mach/mach.h>
#import <ImageIO/CGImageSource.h>

#import "BaseProtocol.h"
#import "UIViewModelProtocol.h"
#import "JobsBlock.h"
#import "MacroDef_Func.h"
#import "MacroDef_SysWarning.h"
#import "FileFolderHandleTool.h"
#import "JobsDefineAllEnumHeader.h"
#import "NSObject+Class.h"

#if __has_include(<WHToast/WHToast.h>)
#import <WHToast/WHToast.h>
#else
#import "WHToast.h"
#endif

#if __has_include(<GKPhotoBrowser/GKPhotoBrowser.h>)
#import <GKPhotoBrowser/GKPhotoBrowser.h>
#else
#import "GKPhotoBrowser.h"
#endif

#if __has_include(<TABAnimated/TABAnimated.h>)
#import <TABAnimated/TABAnimated.h>
#else
#import "TABAnimated.h"
#endif

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#if __has_include(<LYEmptyView/LYEmptyViewHeader.h>)
#import <LYEmptyView/LYEmptyViewHeader.h>
#else
#import "LYEmptyViewHeader.h"
#endif

#if __has_include(<YYImage/YYImage.h>)
#import <YYImage/YYImage.h>
#else
#import "YYImage.h"
#endif

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#import "JobsDropDownListView.h"

#define JobsMutableArray(MutArrInstace) MutArrInstace ? [MutArrInstace removeAllObjects] : (MutArrInstace = NSMutableArray.array);

static inline NSObject *_Nullable idToObject(id _Nullable data){
    if ([data isKindOfClass:NSObject.class]) {
        NSObject *object = (NSObject *)data;
        return object;
    }else return nil;
}

@interface ImageModel : NSObject

@property(nonatomic,strong,nullable)UIImage *image;
@property(nonatomic,strong,nullable)NSDictionary *info;
@property(nonatomic,strong,nullable)NSDictionary *timeDic;

@end

@interface NSNotificationKeyboardModel : NSObject

@property(nonatomic,strong,nullable)NSDictionary *userInfo;
@property(nonatomic,assign)CGRect beginFrame;
@property(nonatomic,assign)CGRect endFrame;
@property(nonatomic,assign)CGFloat keyboardOffsetY;
@property(nonatomic,strong,nonnull)NSString *notificationName;

@end

@interface NSObject (Extras)
<
BaseProtocol
,UIViewModelProtocol
>
#pragma mark —— 宏
/// App 国际化相关系统宏二次封装 + 设置缺省值
+(NSString *_Nullable)localStringWithKey:(nonnull NSString *)key;
+(NSString *_Nullable)localizedString:(nonnull NSString *)key
                            fromTable:(nullable NSString *)tableName;
+(NSString *_Nullable)localizedString:(nonnull NSString *)key
                            fromTable:(nullable NSString *)tableName
                             inBundle:(nullable NSBundle *)bundle;
+(NSString *_Nullable)localizedString:(nonnull NSString *)key
                            fromTable:(nullable NSString *)tableName
                             inBundle:(nullable NSBundle *)bundle
                         defaultValue:(nullable NSString *)defaultValue;
#pragma mark —— ViewController
-(UIViewController *_Nullable)jobsGetCurrentViewController;
-(UIViewController *_Nullable)getCurrentViewController;
-(UIViewController *_Nullable)getCurrentViewControllerFromRootVC:(UIViewController *_Nullable)rootVC;
/// 强制以Push的方式展现页面
/// @param toPushVC 需要进行展现的页面
/// @param requestParams 正向推页面传递的参数
/// 如果想用AppDelegate的自定义TabbarVC：
/// extern AppDelegate *appDelegate;
/// (UIViewController *)appDelegate.tabBarVC;
-(void)forceComingToPushVC:(UIViewController *_Nonnull)toPushVC
             requestParams:(id _Nullable)requestParams;
/// 强制以Present的方式展现页面
/// @param toPresentVC 需要进行展现的页面
/// @param requestParams 正向推页面传递的参数
/// @param completion 完成Present动作以后得动作
-(void)forceComingToPresentVC:(UIViewController *_Nonnull)toPresentVC
                requestParams:(id _Nullable)requestParams
                   completion:(void (^ __nullable)(void))completion;
/// 获取Storyboard里面的单独控制器
-(UIViewController *_Nullable)vcByStoryboardWithName:(NSString *_Nonnull)storyboardWithName
                                    storyboardBundle:(NSBundle *_Nullable)storyboardBundle
                                          identifier:(NSString *_Nonnull)identifier;
-(UIViewController *_Nullable)vcByStoryboardWithName:(NSString *_Nonnull)storyboardWithName
                                    storyboardBundle:(NSBundle *_Nullable)storyboardBundle;
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
-(void)monitorContentOffsetScrollView:(UIScrollView *_Nonnull)scrollView;
#pragma mark —— 功能性的
/// 打印YTKBaseRequest
-(void)checkRequest:(YTKBaseRequest *_Nonnull)request;
/// 判空【是空返回YES】
-(BOOL)nullString;
/// 此功能的必要性：如果外界传入的数组是空，那么拿到的count是0，做-1操作就是-1，直接用for循环就会进入死循环
-(void)jobsSafetyCycleFunc:(int)ceiling
                cycleBlock:(jobsByIntBlock _Nullable)cycleBlock;
-(NSMutableArray <ImageModel *>*_Nonnull)changeGifToImage:(NSData *_Nonnull)gifData;
/**
 
 NSMutableArray <UIViewModel *>*dataMutArr = popupView.valueForKeyBlock(@"dataMutArr");
 [dataMutArr removeAllObjects];
 [dataMutArr addObjectsFromArray:self.createDataMutArr2];
 
 // dataMutArr = self.createDataMutArr2; 这一段无效
 
 */
-(JobsReturnIDByIDBlock _Nonnull)valueForKeyBlock;
/// KVC 的二次封装
-(jobsByKey_ValueBlock _Nonnull)jobsKVC;
-(JobsReturnBOOLByIDBlock _Nonnull)isKindOfClassBlock;
-(JobsReturnBOOLByIDBlock _Nonnull)isMemberOfClassBlock;
-(void)addNotificationObserverWithName:(NSString *_Nonnull)notificationName
                         selectorBlock:(jobsByTwoIDBlock _Nullable)selectorBlock;
+(instancetype _Nonnull)jobsInitWithReuseIdentifier;
-(instancetype _Nonnull)jobsInitWithReuseIdentifierClass:(Class _Nonnull)cls;
/// 查询算法
/// @param data 查询的数据源
/// @param searchStrategy 查询策略
/// @param keywords 关键词
-(NSMutableSet *_Nullable)dimSearchWithData:(id _Nonnull)data
                             searchStrategy:(JobsSearchStrategy)searchStrategy
                                   keywords:(NSString *_Nonnull)keywords;
/// 索取对象obj里面属性名为propertyName的值，如果没有这个属性则查找返回nil
/// @param obj 索取对象
/// @param propertyName 需要查找的属性值
-(id _Nullable)checkTargetObj:(NSObject *_Nullable)obj
                 propertyName:(NSString *_Nullable)propertyName;
/// 版本号比较 版本号的格式：数字中间由点隔开
/// @param versionNumber1 版本号1
/// @param versionNumber2 版本号2
-(CompareRes)versionNumber1:(NSString *_Nonnull)versionNumber1
             versionNumber2:(NSString *_Nonnull)versionNumber2;
/// 给定一个数据源（数组）和 每行需要展示的元素个数，计算行数
/// @param num 每行需要展示的元素个数
-(NSInteger)lineNum:(NSInteger)num;

-(NSInteger)count:(NSUInteger)count
              num:(NSInteger)num;
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
-(CGFloat)scrollOffsetByDirectionXPoint:(CGPoint)point;
/// Y 轴方向的偏移量
-(CGFloat)scrollOffsetByDirectionYPoint:(CGPoint)point;
/// 依据不断地传入的CGPoint *point，系统通过lastPoint来记录上一次的数据，两者进行比较，以此判断滑动的方向
/// @param point 最新的point
-(ScrollDirection)judgementScrollDirectionByPoint:(CGPoint)point;
/// 创建IndexPath坐标
-(NSIndexPath *_Nonnull)myIndexPath:(JobsIndexPath)indexPath;
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
                                       finishBlock:(jobsByIDBlock _Nullable)finishBlock;
/// iOS 获取任意控件在屏幕中的坐标
-(CGRect)getWindowFrameByView:(UIView *_Nonnull)view;
/// 依据View上铆定的internationalizationKEY来全局更改文字以适配国际化
-(void)languageSwitch;
/// 打印请求体
-(void)printRequestMessage:(NSURLSessionDataTask *_Nonnull)task;
/// 判断是否是此版本App的首次启动
-(BOOL)isAppFirstLaunch;
/// 判断是否是App今日的首次启动
-(BOOL)isTodayAppFirstLaunch;
/// 震动特效反馈
-(void)feedbackGenerator;
/// 检测用户是否锁屏：根据屏幕光线来进行判定，而不是系统通知
-(BOOL)didUserPressLockButton;
/// iOS 限制自动锁屏 lockSwitch:YES(关闭自动锁屏)
-(void)autoLockedScreen:(BOOL)lockSwitch;

-(void)savePic:(GKPhotoBrowser *_Nonnull)browser;

-(void)saveImageData:(NSData *_Nonnull)imageData;
/// 将基本数据类型（先统一默认视作浮点数）转化为图片进行显示。使用前提，图片的名字命令为0~9，方便进行映射
/// @param inputData 需要进行转换映射的基本数据类型数据
/// @param bitNum 如果操作对象是浮点数，那么小数点后需要保留的位数
-(nonnull NSMutableArray <UIImage *>*)translateToArr:(CGFloat)inputData
                                   saveBitAfterPoint:(NSInteger)bitNum;
/// 读取本地的plist文件到内存  【 plist ——> NSDictionary * 】
/// @param fileName Plist文件名
-(nullable NSDictionary *)readLocalPlistWithFileName:(nullable NSString *)fileName;
/// 监听程序被杀死前的时刻，进行一些需要异步的操作：磁盘读写、网络请求...
-(void)terminalCheck:(jobsByIDBlock _Nullable)checkBlock;
/// Object转换为NSData
-(NSData *_Nullable)transformToData:(id _Nullable)object;
/// 获取当前设备可用内存
-(double)availableMemory;
/// 获取当前任务所占用内存
-(double)usedMemory;
#pragma mark —— 尺寸
/*
    参考资料：https://blog.csdn.net/www9500net_/article/details/52437987
 */
/// TableViewCell 相对于此TableView的frame【用indexPath】
/// @param tableView 此TableView
/// @param indexPath 用indexPath定位📌TableViewCell
-(CGRect)tbvCellRectInTableView:(UITableView *_Nonnull)tableView
                    atIndexPath:(NSIndexPath *_Nonnull)indexPath;
/// TableViewCell 相对于此TableView的frame【用TableViewCell】❤️
-(CGRect)tableViewCell:(UITableViewCell *_Nonnull)tableViewCell
      frameInTableView:(UITableView *_Nonnull)tableView;
/// TableViewCell 相对于承接此tableView的父视图的frame【用indexPath】
/// @param tableView 此TableView
/// @param tbvSuperview 承接这个TableView的父容器View
/// @param indexPath 用indexPath定位📌TableViewCell
-(CGRect)tableView:(UITableView *_Nonnull)tableView
      tbvSuperview:(UIView *_Nonnull)tbvSuperview
   cellAtIndexPath:(NSIndexPath *_Nonnull)indexPath;
/// TableViewCell 相对于承接此tableView的父视图的frame【用TableViewCell】❤️
-(CGRect)tableView:(UITableView *_Nonnull)tableView
      tbvSuperview:(UIView *_Nonnull)tbvSuperview
     tableViewCell:(UITableViewCell *_Nonnull)tableViewCell;
/// 获取CollectionViewCell在当前collection的位置【用indexPath】
/// @param collectionView 此CollectionView
/// @param indexPath 用indexPath定位📌CollectionViewCell
-(CGRect)frameInCollectionView:(UICollectionView *_Nonnull)collectionView
               cellAtIndexPath:(NSIndexPath *_Nonnull)indexPath;
/// 获取CollectionViewCell在当前collection的位置【用collectionViewCell】❤️
-(CGRect)collectionViewCell:(UICollectionViewCell *_Nonnull)collectionViewCell
      frameInCollectionView:(UICollectionView *_Nonnull)collectionView;
/// 获取CollectionViewCell在当前屏幕的位置【用indexPath】
/// @param cvSuperview 承接这个CollectionView的父容器View
/// @param collectionView  此CollectionView
/// @param indexPath 用indexPath定位📌CollectionViewCell
-(CGRect)frameInCVSuperview:(UIView *_Nonnull)cvSuperview
             collectionView:(UICollectionView *_Nonnull)collectionView
            cellAtIndexPath:(NSIndexPath *_Nonnull)indexPath;
/// 获取CollectionViewCell在当前屏幕的位置【用collectionViewCell】❤️
-(CGRect)frameInCVSuperview:(UIView *_Nonnull)cvSuperview
             collectionView:(UICollectionView *_Nonnull)collectionView
         collectionViewCell:(UICollectionViewCell *_Nonnull)collectionViewCell;
#pragma mark —— 数字
/// 获取任意数字最高位数字
-(NSInteger)getTopDigit:(NSInteger)number;
/// 判断任意给定的一个整型是多少位数
-(NSInteger)bitNum:(NSInteger)number;
/// 判断任意数字是否为小数
-(BOOL)isFloat:(CGFloat)num;
/**
    判断 num1 是否能被 num2 整除
    也就是判断 num2 是否是 num1 的整数倍
    也就是判断 num1 除以 num2 的余数是否是 0
 
    特别指出的是：
    1、除数为零的情况，被判定为不能被整除；
    2、num1 和 num2 必须为 NSNumber* 类型，否则判定为不能够被整除
 */
-(BOOL)judgementExactDivisionByNum1:(NSNumber *_Nonnull)num1
                               num2:(NSNumber *_Nonnull)num2;
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
-(void)keyboard;
/// 键盘 弹出 和 收回 走这个方法
-(void)keyboardWillChangeFrameNotification:(NSNotification *_Nullable)notification;
-(void)keyboardDidChangeFrameNotification:(NSNotification *_Nullable)notification;
-(void)actionkeyboardUpNotificationBlock:(JobsReturnIDByIDBlock _Nullable)keyboardUpNotificationBlock;
-(void)actionkeyboardDownNotificationBlock:(JobsReturnIDByIDBlock _Nullable)keyboardDownNotificationBlock;
#pragma mark —— 刷新
/// 停止刷新【可能还有数据的情况，状态为：MJRefreshStateIdle】
-(void)endRefreshing:(UIScrollView *_Nonnull)targetScrollView;
/// 停止刷新【没有数据的情况，状态为：MJRefreshStateNoMoreData】
-(void)endRefreshingWithNoMoreData:(UIScrollView *_Nonnull)targetScrollView;
/// 停止MJHeader的刷新
-(void)endMJHeaderRefreshing:(UIScrollView *_Nonnull)targetScrollView;
/// 停止MJFooter的刷新【没有数据的情况，状态为：MJRefreshStateNoMoreData】
-(void)endMJFooterRefreshingWithNoMoreData:(UIScrollView *_Nonnull)targetScrollView;
/// 停止MJFooter刷新【可能还有数据的情况，状态为：MJRefreshStateIdle】
-(void)endMJFooterRefreshingWithMoreData:(UIScrollView *_Nonnull)targetScrollView;
/// 根据数据源【数组】是否有值进行判定：占位图 和 mj_footer 的显隐性
-(void)dataSource:(NSArray *_Nonnull)dataSource
      contentView:(UIScrollView *_Nonnull)contentView;

@end
/**
 通知的写法：调用示例
 
 接受通知：
         @jobs_weakify(self)
         [NSNotificationCenter.defaultCenter addObserver:self
                                                selector:selectorBlocks(^id _Nullable(id  _Nullable weakSelf,
                                                                                      id  _Nullable arg) {
             NSNotification *notification = (NSNotification *)arg;
             NSNumber *b = notification.object;
             NSLog(@"SSS = %d",b.boolValue);
             @jobs_strongify(self)
             NSLog(@"通知传递过来的 = %@",notification.object);
             return nil;
         }, nil, self)
                                                    name:LanguageSwitchNotification
                                                  object:nil];
 
 发通知：[NSNotificationCenter.defaultCenter postNotificationName:LanguageSwitchNotification object:@(NO)];
 
 */

/**
 NSInvocation的使用，方法多参数传递 调用示例
 
 -(void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event{
     
     NSString *arg1 = @"a";
     NSString *arg2 = @"b";
     NSString *arg3 = @"c";
     jobsByIDBlock arg4 = ^(id data){
         NSLog(@"嗯，不错");
     };
     
     NSArray *paramarrays = @[arg1,
                         arg2,
                         arg3,
                         arg4];
     
     [NSObject methodName:@"test:withArg2:andArg3:block:"
                   target:self
              paramarrays:paramarrays];
 }
 
 
 - (NSString *)test:(NSString *)arg1
           withArg2:(NSString *)arg2
            andArg3:(NSString *)arg3
              block:(jobsByIDBlock)block{
 
     NSLog(@"%@---%@---%@", arg1, arg2, arg3);
     if (block) {
         block(@"嗯！！");
     }
     return @"gaga";
 }
 
 */
