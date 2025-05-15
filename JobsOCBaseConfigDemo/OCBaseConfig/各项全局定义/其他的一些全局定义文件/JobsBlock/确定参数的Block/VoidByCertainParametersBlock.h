//
//  VoidByCertainParametersBlock.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/27.
//

#import <QuartzCore/QuartzCore.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import <UserNotifications/UserNotifications.h>
#import <NetworkExtension/NetworkExtension.h>
#import "JobsBlockDef.h"
///【 确定入参个数 并且 没有返回值的Block定义】
#ifndef VoidByCertainParameters_h
#define VoidByCertainParameters_h
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
typedef void(^jobsByVoidBlock)(void);
typedef void(^jobsByIDBlock)(id _Nullable data);
typedef void(^jobsBySELBlock)(SEL _Nullable data);
typedef void(^jobsByClassBlock)(Class _Nonnull cls);
#pragma mark —— 关于错误
typedef void(^jobsByErrorBlock)(NSError *_Nullable error);
typedef void(^jobsByErrBlock)(jobsByErrorBlock _Nullable block);
#pragma mark —— 关于UIControl
typedef void(^jobsByControlBlock)(UIControl *_Nullable ctrl);
#pragma mark —— 关于Layer
typedef void(^jobsByCAShapeLayerBlock)(__kindof CAShapeLayer *_Nullable layer);
typedef void(^jobsByCALayerBlock)(__kindof CALayer *_Nullable layer);
typedef void(^jobsByCATransitionBlock)(__kindof CATransition *_Nullable transition);
#pragma mark —— 关于Animation
typedef void(^jobsByCAKeyframeAnimationBlock)(__kindof CAKeyframeAnimation *_Nullable animation);
typedef void(^jobsByCAGradientLayerBlock)(__kindof CAGradientLayer *_Nullable layer);
typedef void(^jobsByCABasicAnimationBlock)(__kindof CABasicAnimation *_Nullable animation);
#pragma mark —— 关于WKWebView.JS配置
typedef void(^jobsByUserContentControllerBlock)(__kindof WKUserContentController *_Nullable data);
typedef void(^jobsByWKWebViewConfigurationBlock)(__kindof WKWebViewConfiguration *_Nullable config);
typedef void(^WKNavigationDelegateBlock1) (WKNavigationResponsePolicy policy);
typedef void(^WKNavigationDelegateBlock2) (WKNavigationActionPolicy policy);
#pragma mark —— 关于 JavaScript
typedef void(^jobsByJSValueBlock)(JSValue *_Nullable value);
#pragma mark —— 关于View
typedef void(^jobsByViewBlock)(__kindof UIView *_Nullable view);
typedef void(^jobsByPageControlBlock)(UIPageControl *_Nullable pageControl);
typedef void(^jobsByScrollViewBlock)(__kindof UIScrollView *_Nullable scrollView);
typedef void(^jobsByBtnBlock)(__kindof UIButton *_Nullable btn);
typedef void(^jobsByWindowBlock)(__kindof UIWindow *_Nullable window);
typedef void(^jobsByLabelBlock)(__kindof UILabel *_Nullable label);
typedef void(^jobsByPDFViewBlock)(__kindof PDFView *_Nullable view);
typedef void(^jobsByTabBarItemBlock)(__kindof UITabBarItem *_Nullable tabBarItem);
typedef void(^jobsByNavigationItemBlock)(__kindof UINavigationItem *_Nullable navigationItem);
typedef void(^jobsByWKWebViewBlock)(__kindof WKWebView *_Nullable webView);
typedef void(^jobsByJSContextBlock)(__kindof JSContext *_Nullable context);
typedef void(^jobsByProgressViewBlock)(__kindof UIProgressView *_Nullable progressView);
typedef void(^jobsBySwitchBlock)(__kindof UISwitch *_Nullable Switch);
typedef void(^jobsByTableViewBlock)(__kindof UITableView *_Nullable tableView);
typedef void(^jobsByTableViewCellBlock)(__kindof UITableViewCell *_Nullable tableView);
typedef void(^jobsByCollectionViewBlock)(__kindof UICollectionView *_Nullable collectionView);
typedef void(^jobsByCollectionViewCellBlock)(__kindof UICollectionViewCell *_Nullable collectionView);
typedef void(^jobsByTextFieldBlock)(__kindof UITextField *_Nullable textField);
typedef void(^jobsByTextViewBlock)(__kindof UITextView *_Nullable textView);
typedef void(^jobsByImageViewBlock)(__kindof UIImageView *_Nullable imageView);
typedef void(^jobsByStackViewBlock)(__kindof UIStackView *_Nullable stackView);
typedef void(^jobsByCAEmitterCellBlock)(__kindof CAEmitterCell *_Nullable cell);
typedef void(^jobsByCAEmitterLayerBlock)(__kindof CAEmitterLayer *_Nullable layer);
/// 多参数
typedef void(^jobsByViewAndAnimatedBlock)(__kindof UIView *_Nullable view,BOOL animated);
typedef void(^jobsByViewAndDataBlock)(__kindof UIView *_Nullable view,id _Nullable data);
typedef void(^jobsByView2Block)(__kindof UIView *_Nullable superview,UIView *_Nullable view);
#pragma mark —— 关于 控制器
typedef void(^jobsByViewControllerBlock)(__kindof UIViewController *_Nullable viewController);
typedef void(^jobsByMenuControllerBlock)(__kindof UIMenuController *_Nullable menuController);
typedef void(^jobsByImagePickerControllerBlock)(__kindof UIImagePickerController *_Nullable imagePickerController);
#pragma mark —— 关于数据容器
typedef void(^jobsByArrayBlock)(__kindof NSArray <NSObject *>*_Nullable data);
typedef void(^jobsByMutArrayBlock)(__kindof NSMutableArray <NSObject *>*_Nullable arr);
typedef void(^jobsBySetBlock)(__kindof NSSet *_Nullable data);
typedef void(^jobsByMutableSetBlock)(__kindof NSMutableSet <NSObject *>*_Nullable data);
typedef void(^jobsByDictionaryBlock)(__kindof NSDictionary *_Nullable data);
typedef void(^jobsByMutableDictionarycBlock)(__kindof NSMutableDictionary *_Nullable data);
#pragma mark —— 关于（富）文本
typedef void(^jobsByStringBlock)(__kindof NSString *_Nullable data);
typedef void(^jobsByAttributedStringBlock)(__kindof NSAttributedString *_Nullable data);
typedef void(^jobsByMutableParagraphStyleBlock)(NSMutableParagraphStyle *_Nullable data);
typedef void(^jobsByTextAttachmentBlock)(NSTextAttachment *_Nullable data);
typedef void(^jobsByTextAlignmentBlock)(NSTextAlignment data);
#pragma mark —— 关于UI表现力
typedef void(^jobsByLayoutAttributeBlock)(NSLayoutAttribute data);
typedef void(^jobsByImageBlock)(UIImage *_Nullable data);
typedef void(^jobsByCorBlock)(UIColor *_Nullable data);
typedef void(^jobsByFontBlock)(UIFont *_Nullable font);
/// 多参数
typedef void(^jobsByClassAndSaltStrBlock)(Class _Nonnull cls,NSString *_Nullable salt);
typedef void(^jobsByColor_FloatBlock)(UIColor *_Nullable,float borderWidth);
#pragma mark —— 关于UI配置
/// 按钮配置
typedef void(^jobsByButtonConfigurationBlock)(UIButtonConfiguration * _Nullable config);
typedef void(^jobsByBackgroundConfigurationBlock)(UIBackgroundConfiguration * _Nullable config);
/// UICollectionView配置
typedef void(^jobsByCollectionViewFlowLayoutBlock)(UICollectionViewFlowLayout *_Nullable data);
#pragma mark —— URL
typedef void(^jobsByURLBlock)(NSURL *_Nullable url);
typedef void(^jobsByURLRequestBlock)(__kindof NSURLRequest *_Nullable request);
typedef __kindof NSMutableURLRequest *_Nullable(^JobsReturnMutableURLRequestByURLRequestBlock)(__kindof NSURLRequest *_Nullable request);
typedef void(^jobsByMutableURLRequestBlock)(__kindof NSMutableURLRequest *_Nullable request);
typedef void(^jobsByURLSessionTaskBlock)(__kindof NSURLSessionTask *_Nullable SessionTask);
typedef __kindof NSMutableURLRequest *_Nullable(^JobsReturnURLRequestByURLSessionTaskBlock)(__kindof NSURLSessionTask *_Nullable SessionTask);
#pragma mark —— 关于 UIViewController
typedef void(^jobsByVCBlock)(__kindof UIViewController *_Nullable data);
typedef void(^jobsByVCAndDataBlock)(__kindof UIViewController *_Nullable viewController,id _Nullable data);
#pragma mark —— 关于手势
typedef void(^jobsByGestureRecognizerBlock)(__kindof UIGestureRecognizer *_Nullable gesture);
typedef void(^jobsByPanGestureRecognizerBlock)(__kindof UIPanGestureRecognizer *_Nullable gesture);
typedef void(^jobsByTapGestureRecognizerBlock)(__kindof UITapGestureRecognizer *_Nullable gesture);
typedef void(^jobsByLongPressGestureRecognizerBlock)(__kindof UILongPressGestureRecognizer *_Nullable gesture);
typedef void(^jobsBySwipeGestureRecognizerBlock)(__kindof UISwipeGestureRecognizer *_Nullable gesture);
typedef void(^jobsByPinchGestureRecognizerBlock)(__kindof UIPinchGestureRecognizer *_Nullable gesture);
typedef void(^jobsByRotationGestureRecognizerBlock)(__kindof UIRotationGestureRecognizer *_Nullable gesture);
typedef void(^jobsByScreenEdgePanGestureRecognizerBlock)(__kindof UIScreenEdgePanGestureRecognizer *_Nullable gesture);
#pragma mark —— 关于方位
typedef void(^jobsByFrameBlock)(CGRect frame);
typedef void(^jobsByPointBlock)(CGPoint point);
typedef void(^jobsBySizeBlock)(CGSize size);
typedef void(^jobsByEdgeInsetBlock)(UIEdgeInsets insets);
typedef void(^jobsByIndexPathBlock)(NSIndexPath *_Nullable indexPath);
#pragma mark —— 关于数据类型
typedef void(^jobsByNSIntegerBlock)(NSInteger data);
typedef void(^jobsByNSUIntegerBlock)(NSUInteger data);
typedef void(^jobsByCGFloatBlock)(CGFloat data);
typedef void(^jobsByBOOLBlock)(BOOL data);
typedef void(^jobsByIntBlock)(int data);
typedef void(^jobsByUnsignedIntBlock)(unsigned int data);
typedef void(^jobsByFloatBlock)(float data);
typedef void(^jobsByDoubleBlock)(double data);
typedef void(^jobsByCharBlock)(char data);
typedef void(^jobsByUnsignedCharBlock)(unsigned char data);
typedef void(^jobsByShortBlock)(short data);
typedef void(^jobsByUnsignedShortBlock)(unsigned short data);
typedef void(^jobsByLongBlock)(long data);
typedef void(^jobsByUnsignedLongBlock)(unsigned long data);
typedef void(^jobsByUnsignedLongLongBlock)(unsigned long long data);
typedef void(^jobsByUNNotificationPresentationOptionsBlock)(UNNotificationPresentationOptions options);
#pragma mark —— 关于时间
typedef void(^jobsByTimeIntervalBlock)(NSTimeInterval data);
typedef void(^jobsByDateBlock)(NSDate *_Nullable date);
typedef void(^jobsByDateComponentsBlock)(NSDateComponents *_Nullable dateComponents);
typedef void(^jobsByTimerBlock)(NSTimer *_Nullable timer);
typedef void(^jobsByDateFormatterBlock)(__kindof NSDateFormatter *_Nullable dateFormatter);
typedef void(^jobsByNotificationResponseBlock)(UNNotificationResponse *_Nullable response);
#pragma mark —— 其他
typedef void(^jobsByShadowBlock)(__kindof NSShadow *_Nullable shadow);
typedef void(^jobsByLockBlock)(NSLock *_Nullable lock);
typedef void(^jobsByRunLoopBlock)(NSRunLoop *_Nullable runLoop);
typedef void(^jobsByPHFetchOptionsBlock)(PHFetchOptions *_Nullable options);
typedef void(^jobsByPHVideoRequestOptionsBlock)(PHVideoRequestOptions *_Nullable options);
typedef void(^jobsByPHImageRequestOptionsBlock)(PHImageRequestOptions *_Nullable options);
typedef void(^jobsByPHImageManagerBlock)(PHImageManager *_Nullable imageManager);
typedef void(^jobsByDataBlock)(NSData *_Nullable data);
typedef void(^jobsByMutableDataBlock)(__kindof NSMutableData *_Nullable data);
typedef void(^jobsByMutableStringBlock)(__kindof NSMutableString *_Nullable data);
typedef void(^jobsByBezierPathBlock)(__kindof UIBezierPath *_Nullable data);
typedef void(^jobsByNotificationBlock)(NSNotification *_Nullable notification);
typedef void(^jobsByAlertActionBlock)(__kindof UIAlertAction *_Nullable action);
typedef void(^jobsByPasteboardBlock)(__kindof UIPasteboard *_Nullable pasteboard);
typedef void(^jobsByUNUserNotificationCenterBlock)(__kindof UNUserNotificationCenter *_Nullable center);
typedef void(^jobsByUNMutableNotificationContentBlock)(__kindof UNMutableNotificationContent *_Nullable content);
typedef void(^jobsByNEVPNManagerBlock)(__kindof NEVPNManager *_Nullable VPNManager);
typedef void(^jobsByNEVPNProtocolIKEv2Block)(__kindof NEVPNProtocolIKEv2 *_Nullable VPNProtocolIKEv2);
/// 多参数
typedef void(^jobsKeyValueBlock)(Jobs_KeyValueBlock_Arguments);
typedef void(^jobsByKey_ValueBlock)(Jobs_Key_ValueBlock_Arguments);
typedef void(^jobsBySelectorBlock) (Jobs_2_Arguments);
typedef void(^jobsJSCompletionHandlerBlock)(Jobs_JSCompletionHandlerBlock_Arguments);
typedef void(^WKNavigationDelegateBlock3) (Jobs_WKNavigationDelegate_Arguments);
typedef void(^jobsByViewArrayRowsColumnsBlock)(Jobs_ViewArrayRowsColumnsBlock_Arguments);
/// weakSelf 方便使用，用来打破循环引用。使用时需要改成实际类型，否则没有代码提示
/// selector 实际调用的方法
/// arg 事件默认传递的对象，比如`NSNotification`，`UIButton`
typedef void(^jobsByTwoIDBlock) (Jobs_2_Arguments);/// weakSelf、arg
typedef void(^JobsSelectorBlock1) (Jobs_3_Arguments);/// weakSelf、arg、data

#pragma clang diagnostic pop

#endif /* VoidByCertainParameters_h */
