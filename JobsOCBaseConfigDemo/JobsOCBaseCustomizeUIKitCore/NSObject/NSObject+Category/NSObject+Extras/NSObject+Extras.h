//
//  NSObject+Extras.h
//  TestDemo
//
//  Created by AaltoChen on 15/10/31.
//  Copyright © 2015年 AaltoChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#import <Photos/Photos.h>
#import <objc/runtime.h>
#import <sys/sysctl.h>
#import <mach/mach.h>
#import <ImageIO/CGImageSource.h>

#import "NSObject+Class.h"
#import "NSObject+Algorithm.h"
#import "NSData+Other.h"
#import "NSURL+Others.h"
#import "NSString+NSUserDefaults.h"

#import "BaseProtocol.h"
#import "AppToolsProtocol.h"
#import "BaseViewControllerProtocol.h"

#import "JobsBlock.h"
#import "MacroDef_Func.h"
#import "MacroDef_SysWarning.h"

#import "FileFolderHandleTool.h"
#import "JobsDefineAllEnumHeader.h" /// 此文件用来存储记录全局的一些枚举
#import "JobsAppTools.h"
#import "JobsSnowflake.h"
#import "JobsModel.h"
#import "JobsDropDownListView.h"

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

#if __has_include(<YYImage/YYImage.h>)
#import <YYImage/YYImage.h>
#else
#import "YYImage.h"
#endif

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#ifndef MainWindow
#define MainWindow NSObject.mainWindow()
#endif /* MainWindow */

NS_INLINE NSObject *_Nullable idToObject(id _Nullable data){
    if ([data isKindOfClass:NSObject.class]) {
        NSObject *object = (NSObject *)data;
        return object;
    }else return nil;
}

@interface NSObject (Extras)
<
AppToolsProtocol
,BaseProtocol
,BaseViewControllerProtocol
>
#pragma mark —— 系统类单例的二次封装
/// NSBundle
+(NSBundle *_Nullable)mainBundle;
-(NSBundle *_Nullable)mainBundle;
/// NSLocale
+(NSLocale *_Nullable)currentLocale;
-(NSLocale *_Nullable)currentLocale;
+(NSLocale *_Nullable)systemLocale;
-(NSLocale *_Nullable)systemLocale;
+(NSLocale *_Nullable)autoupdatingCurrentLocale API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
-(NSLocale *_Nullable)autoupdatingCurrentLocale API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
/// UIDevice
+(UIDevice *_Nullable)currentDevice;
-(UIDevice *_Nullable)currentDevice;

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
/// 从一个视图（UIView）出发，获取它所在的视图控制器（UIViewController）
-(JobsReturnVCByViewBlock _Nonnull)getViewControllerByView;
/// 获得当前的控制器。对getCurrentViewController的再次封装
-(__kindof UIViewController *_Nullable)jobsGetCurrentViewControllerWithNavCtrl;
/// 获得当前的控制器。对getCurrentViewController的再次封装
-(__kindof UIViewController *_Nullable)jobsGetCurrentViewController;
/// 获得当前的控制器
-(__kindof UIViewController *_Nullable)getCurrentViewController;
/// 获得当前控制器的根控制器
-(JobsReturnVCByVCBlock _Nonnull)getCurrentViewControllerByRootVC;
/// 强制以Push的方式展现页面
/// @param toPushVC 需要进行展现的页面
/// @param requestParams 正向推页面传递的参数
/// 如果想用AppDelegate的自定义TabbarVC：(UIViewController *)AppDelegate.sharedManager.tabBarVC;
-(void)forceComingToPushVC:(UIViewController *_Nonnull)toPushVC
             requestParams:(id _Nullable)requestParams;
/// 强制以Present的方式展现页面
/// @param toPresentVC 需要进行展现的页面
/// @param requestParams 正向推页面传递的参数
/// @param completion 完成Present动作以后得动作
-(void)forceComingToPresentVC:(UIViewController *_Nonnull)toPresentVC
                requestParams:(id _Nullable)requestParams
                   completion:(jobsByVoidBlock _Nonnull)completion;
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
/// runtime方法交换
+(void)exchangeMethodForClass:(NSString *)className
                  originalSel:(SEL)originalSelector
                  swizzledSel:(SEL)swizzledSelector;
/// UIAlertController + UIAlertAction
/// UIAlertController 的标题和消息属性仅支持简单的字符串 (NSString) 类型，而不直接支持富文本 (NSAttributedString)
-(JobsReturnAlertControllerByAlertModelBlock _Nonnull)makeAlertControllerByAlertModel;
/// 将 NSTimeInterval 按照 NSDateFormatter 转换输出成人类可读的时间
-(JobsReturnStringByTimeModelBlock _Nonnull)toReadableTimeBy;
/// baseURL：指定 HTML 内容的基本 URL，可以用于解析相对路径
/// data：包含 HTML 内容的字符串
-(JobsReturnWKWebViewByStringBlock _Nonnull)makeWebViewByString;
/// 解析网络URL数据
-(JobsReturnWKWebViewByURLBlock _Nonnull)makeWebViewByURL;
/// 在导航栏堆栈里面，是否存在同样类型的控制器
-(JobsReturnBOOLByViewControllerBlock _Nonnull)isSameVCBy;
/// 根控制器 => 导航控制器（普通控制器）
-(JobsReturnVCByVCBlock _Nonnull)rootViewControllerBy;
/// 依据传入的普通控制器，创建导航控制器
+(JobsReturnNavCtrByVCBlock _Nonnull)makeNavigationControllerBy;
/// 可以组合使用
-(SDWebImageOptions)makeSDWebImageOptions;
-(URLManagerModel *_Nonnull)url:(NSString *_Nonnull)url funcName:(NSString *_Nonnull)funcName;
/// 获取m文件的属性
-(JobsReturnIDByStringBlock _Nonnull)getObjByName;
-(JobsReturnDataByDictionaryBlock _Nonnull)JSONWritingPrettyPrinted;
-(JobsReturnIDByDataBlock _Nonnull)JSONReadingMutableContainers;
-(JobsReturnIDByDataBlock _Nonnull)JSONkNilOptions;
-(JobsReturnDataByStringBlock _Nonnull)initByContentsOfFile;
-(JobsReturnBOOLByIDBlock _Nonnull)isEqual;
-(JobsReturnIDByStringBlock _Nonnull)dataByKey;
/// UICollectionViewFlowLayout
-(__kindof UICollectionViewFlowLayout *_Nonnull)verticalLayout;
-(__kindof UICollectionViewFlowLayout *_Nonnull)horizontalLayout;
/// JSON对象转NSData
-(JobsReturnDataByIDBlock _Nonnull)dataByJSONObject;
-(jobsByVoidBlock _Nonnull)震动特效反馈;
/**
 注意：有些时候UIApplication.sharedApplication.keyWindow获取到的window有frame，而windowScene.windows.firstObject获取到的window没有frame
 
 在某些情况下，UIApplication.sharedApplication.keyWindow和windowScene.windows.firstObject获取到的窗口可能会表现出不同的行为，其中一个有frame属性，而另一个没有，这可能涉及到应用程序的窗口层次结构和窗口的状态。

 UIApplication.sharedApplication.keyWindow是老的方式来获取主窗口，通常在单窗口应用程序中使用。这个方法返回的窗口通常是一个UIWindow的实例，并且它在应用程序的整个生命周期内都是可用的，因此它通常具有frame属性，用来表示窗口的位置和大小。

 windowScene.windows.firstObject用于在多窗口应用程序中获取主窗口或当前窗口。由于多窗口应用程序具有更复杂的窗口管理，不同的窗口可能处于不同的状态，有些窗口可能在某些情况下没有frame属性。这可能是因为窗口尚未完成初始化或还没有显示在屏幕上。在这种情况下，您可以等到窗口完成初始化并显示后再访问其frame属性。

 总之，要处理多窗口应用程序中窗口的不同状态，您应该确保在访问窗口属性之前进行适当的检查，以确保窗口已经准备好并且具有所需的属性。这可以通过在适当的时机监听窗口的状态变化来实现。
 */
+(JobsReturnWindowByVoidBlock _Nonnull)mainWindow;
/// 使用指定的图像（UIImage）作为颜色的填充图案。
/// 这个方法的作用是生成一个基于图像的颜色，这个颜色在视图或图层上会以平铺的方式重复显示指定的图像。
-(JobsReturnColorByImageBlock _Nonnull)byPatternImage;
/// present
/// 简洁版强制present展现一个控制器页面【不需要正向传参】
-(jobsByVCBlock _Nonnull)comingToPresentVC;
/// 简洁版强制present展现一个控制器页面【需要正向传参】
-(jobsByVCAndDataBlock _Nonnull)comingToPresentVCByRequestParams;
/// pop
/// pop到根控制器
-(jobsByBOOLBlock _Nonnull)popToRootVCBy;
/// pop到上一个控制器
-(jobsByBOOLBlock _Nonnull)popToPreviousVCBy;
/// push
/// 简洁版强制push展现一个控制器页面【不需要正向传参】
-(jobsByVCBlock _Nonnull)comingToPushVC;
/// 简洁版强制push展现一个控制器页面【需要正向传参】
-(jobsByVCAndDataBlock _Nonnull)comingToPushVCByRequestParams;
/// 代理检测和回调
-(jobsDelegateBlock _Nonnull)jobsDelegate;
/// GKNavigationBar 返回按钮点击方法
///【子类需要覆写 】创建返回键的点击事件
-(jobsByBtnBlock _Nonnull)jobsBackBtnClickEvent;
/// 打印YTKBaseRequest
-(jobsByYTKBaseRequestBlock _Nonnull)checkRequest;
/// 此功能的必要性：如果外界传入的数组是空，那么拿到的count是0，做-1操作就是-1，直接用for循环就会进入死循环
-(void)jobsSafetyCycleFunc:(int)ceiling cycleBlock:(jobsByIntBlock _Nullable)cycleBlock;
-(NSMutableArray <JobsImageModel *>*_Nonnull)changeGifToImage:(NSData *_Nonnull)gifData;
/**
 
 NSMutableArray <UIViewModel *>*dataMutArr = popupView.valueForKey(@"dataMutArr");
 [dataMutArr removeAllObjects];
 [dataMutArr addObjectsFromArray:self.createDataMutArr2];
 
 // dataMutArr = self.createDataMutArr2; 这一段无效
 
 */
-(JobsReturnIDByIDBlock _Nonnull)valueForKey;
/// KVC 的二次封装
-(jobsByKey_ValueBlock _Nonnull)jobsKVC;
-(jobsByKeyValueModelBlock _Nonnull)jobsKVCBy;
-(JobsReturnBOOLByIDBlock _Nonnull)isKindOfClass;
-(JobsReturnBOOLByIDBlock _Nonnull)isMemberOfClass;
-(void)addCheckerByName:(NSString *_Nonnull)notificationName
          selectorBlock:(jobsByTwoIDBlock _Nullable)selectorBlock;
+(JobsReturnIDByStringBlock _Nonnull)initByReuseId;
+(JobsReturnIDBySaltStrBlock _Nonnull)jobsInitWithReuseIdentifier;/// 不能用于UITableViewHeaderFooterView
-(JobsReturnIDByClsAndSaltStrBlock _Nonnull)jobsInitWithReuseIdentifierClass;/// 不能用于UITableViewHeaderFooterView
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
-(JobsReturnByNSIntegerBlock _Nonnull)lineNumBy;
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
-(JobsReturnByCGPointBlock _Nonnull)scrollOffsetByDirectionXPoint;
/// Y 轴方向的偏移量
-(JobsReturnByCGPointBlock _Nonnull)scrollOffsetByDirectionYPoint;
/// 依据不断地传入的CGPoint *point，系统通过lastPoint来记录上一次的数据，两者进行比较，以此判断滑动的方向
-(JobsReturnNSIntegerByPointBlock _Nonnull)judgementScrollDirectionByPoint;
/// 创建IndexPath坐标
-(JobsReturnIndexPathByXYBlock _Nonnull)indexPathBy;
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
-(JobsReturnRectByViewBlock _Nonnull)getWindowFrameByView;
/// 依据View上铆定的internationalizationKEY来全局更改文字以适配国际化
-(void)languageSwitch;
/// 打印请求体
-(JobsReturnURLRequestByURLSessionTaskBlock _Nullable)printURLSessionRequestMessage;
/// 打印URLRequest
-(JobsReturnMutableURLRequestByURLRequestBlock _Nullable)printRequestMessage;
/// 判断是否是此版本App的首次启动
-(BOOL)isAppFirstLaunch;
/// 判断是否是App今日的首次启动
-(BOOL)isTodayAppFirstLaunch;
/// 震动特效反馈
-(jobsByVoidBlock _Nonnull)feedbackGenerator;
/// 检测用户是否锁屏：根据屏幕光线来进行判定，而不是系统通知
-(JobsReturnBOOLByVoidBlock _Nonnull)didUserPressLockButton;
/// iOS 限制自动锁屏 lockSwitch:YES(关闭自动锁屏)
-(jobsByBOOLBlock _Nonnull)autoLockedScreen;

-(jobsByGKPhotoBrowserBlock _Nonnull)savePic;

-(jobsByDataBlock _Nonnull)saveImageData;
/// 将基本数据类型（先统一默认视作浮点数）转化为图片进行显示。使用前提，图片的名字命令为0~9，方便进行映射
/// @param inputData 需要进行转换映射的基本数据类型数据
/// @param bitNum 如果操作对象是浮点数，那么小数点后需要保留的位数
-(nonnull NSMutableArray <UIImage *>*)translateToArr:(CGFloat)inputData
                                   saveBitAfterPoint:(NSInteger)bitNum;
/// 读取本地的plist文件到内存  【 plist ——> NSDictionary * 】
-(JobsReturnDicByStringBlock _Nonnull)readLocalPlistWithFileName;
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
-(CGRect)tableView:(__kindof UITableView *_Nonnull)tableView
      tbvSuperview:(__kindof UIView *_Nonnull)tbvSuperview
   cellAtIndexPath:(NSIndexPath *_Nonnull)indexPath;
/// TableViewCell 相对于承接此tableView的父视图的frame【用TableViewCell】❤️
-(CGRect)tableView:(__kindof UITableView *_Nonnull)tableView
      tbvSuperview:(__kindof UIView *_Nonnull)tbvSuperview
     tableViewCell:(__kindof UITableViewCell *_Nonnull)tableViewCell;
/// 获取CollectionViewCell在当前collection的位置【用indexPath】
/// @param collectionView 此CollectionView
/// @param indexPath 用indexPath定位📌CollectionViewCell
-(CGRect)frameInCollectionView:(__kindof UICollectionView *_Nonnull)collectionView
               cellAtIndexPath:(NSIndexPath *_Nonnull)indexPath;
/// 获取CollectionViewCell在当前collection的位置【用collectionViewCell】❤️
-(CGRect)collectionViewCell:(__kindof UICollectionViewCell *_Nonnull)collectionViewCell
      frameInCollectionView:(__kindof UICollectionView *_Nonnull)collectionView;
/// 获取CollectionViewCell在当前屏幕的位置【用indexPath】
/// @param cvSuperview 承接这个CollectionView的父容器View
/// @param collectionView  此CollectionView
/// @param indexPath 用indexPath定位📌CollectionViewCell
-(CGRect)frameInCVSuperview:(__kindof UIView *_Nonnull)cvSuperview
             collectionView:(__kindof UICollectionView *_Nonnull)collectionView
            cellAtIndexPath:(NSIndexPath *_Nonnull)indexPath;
/// 获取CollectionViewCell在当前屏幕的位置【用collectionViewCell】❤️
-(CGRect)frameInCVSuperview:(__kindof UIView *_Nonnull)cvSuperview
             collectionView:(__kindof UICollectionView *_Nonnull)collectionView
         collectionViewCell:(__kindof UICollectionViewCell *_Nonnull)collectionViewCell;
#pragma mark —— 利用数组和NSValue，存取结构体
/// CGPoint
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                                       addCGPoint:(CGPoint)point;

-(CGPoint)jobsGetPoint:(NSValue *_Nullable)value;
/// CGVector
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                                      addCGVector:(CGVector)vector;

-(CGVector)jobsGetVector:(NSValue *_Nullable)value;
/// CGSize
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                                        addCGSize:(CGSize)size;

-(CGSize)jobsGetSize:(NSValue *_Nullable)value;
/// CGRect
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                                        addCGRect:(CGRect)frame;

-(CGRect)jobsGetFrame:(NSValue *_Nullable)value;
/// CGAffineTransform
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                             addCGAffineTransform:(CGAffineTransform)affineTransform;

-(CGAffineTransform)jobsGetCGAffineTransform:(NSValue *_Nullable)value;
/// UIEdgeInsets
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                                  addUIEdgeInsets:(UIEdgeInsets)edgeInsets;

-(UIEdgeInsets)jobsGetUIEdgeInsets:(NSValue *_Nullable)value;
/// NSDirectionalEdgeInsets
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                       addNSDirectionalEdgeInsets:(NSDirectionalEdgeInsets)directionalEdgeInsets;

-(NSDirectionalEdgeInsets)jobsGetNSDirectionalEdgeInsets:(NSValue *_Nullable)value;
/// UIOffset
-(NSMutableArray <NSValue *>*_Nullable)jobsMutArr:(NSMutableArray <NSValue *>*_Nullable)mutArr
                                      addUIOffset:(UIOffset)offset;

-(UIOffset)jobsGetValueWithUIOffset:(NSValue *_Nullable)value;
#pragma mark —— 数字
/// 获取任意数字最高位数字
-(JobsReturnByNSIntegerBlock _Nonnull)topDigit;
#pragma mark —— 检测当前设备屏幕方向
/// https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E6%A8%AA%E5%B1%8FUI%E5%88%87%E6%8D%A2.md/%E6%A8%AA%E5%B1%8FUI%E5%88%87%E6%8D%A2.md
-(CGFloat)jobsMainScreen_HEIGHT;
-(CGFloat)jobsMainScreen_WIDTH;
-(__kindof UIView *_Nullable)getView;
-(id _Nullable)getViewByBlock:(JobsReturnIDByComponentTypeAndUIViewBlock _Nullable)block;
/// UIInterfaceOrientationMask 检测屏幕方向
-(CGSize)checkScreenOrientation_UIInterfaceOrientationMask:(JobsReturnSizeByUIntegerBlock _Nullable)interfaceOrientationMaskBlock;
/// UIInterfaceOrientation 检测屏幕方向
-(UIInterfaceOrientation)getInterfaceOrientation;
/// UIInterfaceOrientation 检测屏幕方向
-(CGSize)checkScreenOrientation_UIInterfaceOrientation:(JobsReturnSizeByNSIntegerBlock _Nullable)interfaceOrientationBlock;
/// DeviceOrientation 检测屏幕方向
-(DeviceOrientation)getDeviceOrientation;
/// 横屏通知的监听
-(void)横屏通知的监听:(JobsSelectorBlock1 _Nullable)block;
#pragma mark —— 键盘⌨️
/**
 使用方法：
 IQKeyboardManager.sharedManager.enable = NO;
 [self keyboardByUpBlock:^(NSNotificationKeyboardModel * _Nullable data) {
     NSLog(@"");
 } downBlock:^(NSNotificationKeyboardModel * _Nullable data) {
     NSLog(@"");
 }];
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
-(void)keyboardByUpBlock:(jobsByNSNotificationKeyboardModelBlock _Nullable)upBlock
               downBlock:(jobsByNSNotificationKeyboardModelBlock _Nullable)downBlock;

@end
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
