//
//  VoidByCertainParameters.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/27.
//

#ifndef VoidByCertainParameters_h
#define VoidByCertainParameters_h

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"

///【 确定入参个数 并且 没有返回值的Block定义】
typedef void(^jobsByVoidBlock)(void);
typedef void(^jobsByIDBlock)(id _Nullable data);
typedef void(^jobsBySELBlock)(SEL _Nullable data);
typedef void(^jobsByClassBlock)(Class _Nonnull cls);
/// 多参数
typedef void(^jobsKeyValueBlock)(id <NSCopying>_Nonnull key,id _Nonnull value);
typedef void(^jobsByKey_ValueBlock)(NSString *_Nonnull key,id _Nullable value);
typedef void(^jobsBySelectorBlock)(id _Nullable weakSelf,id _Nullable arg);
typedef void(^jobsDelegateBlock)(NSString *_Nullable data,jobsByVoidBlock _Nullable block);
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
#import <QuartzCore/QuartzCore.h>
typedef void(^jobsByCAKeyframeAnimationBlock)(__kindof CAKeyframeAnimation *_Nullable animation);
typedef void(^jobsByCAGradientLayerBlock)(__kindof CAGradientLayer *_Nullable layer);
typedef void(^jobsByCABasicAnimationBlock)(__kindof CABasicAnimation *_Nullable animation);
#pragma mark —— 关于View
typedef void(^jobsByViewBlock)(__kindof UIView *_Nullable view);
typedef void(^jobsByScrollViewBlock)(__kindof UIScrollView *_Nullable scrollView);
typedef void(^jobsByBtnBlock)(__kindof UIButton *_Nullable btn);
typedef void(^jobsByWindowBlock)(__kindof UIWindow *_Nullable data);
typedef void(^jobsByLabelBlock)(__kindof UILabel *_Nullable label);
typedef void(^jobsByWKWebViewBlock)(__kindof WKWebView *_Nullable webView);
#import <JavaScriptCore/JavaScriptCore.h>
typedef void(^jobsByJSContextBlock)(__kindof JSContext *_Nullable context);
typedef void(^jobsByProgressViewBlock)(__kindof UIProgressView *_Nullable progressView);
typedef void(^jobsBySwitchBlock)(__kindof UISwitch *_Nullable Switch);
typedef void(^jobsByTableViewBlock)(__kindof UITableView *_Nullable tableView);
typedef void(^jobsByCollectionViewBlock)(__kindof UICollectionView *_Nullable collectionView);
typedef void(^jobsByTextFieldBlock)(__kindof UITextField *_Nullable textField);
typedef void(^jobsByTextViewBlock)(__kindof UITextView *_Nullable textView);
typedef void(^jobsByImageViewBlock)(__kindof UIImageView *_Nullable imageView);
typedef void(^jobsByCAEmitterCellBlock)(__kindof CAEmitterCell *_Nullable cell);
typedef void(^jobsByCAEmitterLayerBlock)(__kindof CAEmitterLayer *_Nullable layer);
/// 多参数
typedef void(^jobsByViewAndAnimatedBlock)(__kindof UIView *_Nullable view,BOOL animated);
typedef void(^jobsByViewAndDataBlock)(__kindof UIView *_Nullable view,id _Nullable data);
typedef void(^jobsByView2Block)(__kindof UIView *_Nullable superview,UIView *_Nullable view);
#pragma mark —— 关于 控制器
typedef void(^jobsByMenuControllerBlock)(__kindof UIMenuController *_Nullable menuController);
#pragma mark —— 关于数据容器
typedef void(^jobsByArrayBlock)(__kindof NSArray *_Nullable data);
typedef void(^jobsByMutArrayBlock)(__kindof NSMutableArray *_Nullable arr);
typedef void(^jobsBySetBlock)(__kindof NSSet *_Nullable data);
typedef void(^jobsByMutableSetBlock)(__kindof NSMutableSet *_Nullable data);
typedef void(^jobsByDictionaryBlock)(__kindof NSDictionary *_Nullable data);
typedef void(^jobsByMutableDictionarycBlock)(__kindof NSMutableDictionary *_Nullable data);
#pragma mark —— 关于（富）文本
typedef void(^jobsByStringBlock)(NSString *_Nullable data);
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
/// WKWebView配置
typedef void(^jobsByWKWebViewConfigurationBlock)(WKWebViewConfiguration * _Nullable config);
/// 按钮配置
typedef void(^jobsByButtonConfigurationBlock)(UIButtonConfiguration * _Nullable config);
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
typedef void(^jobsByPanGestureRecognizerBlock)(__kindof UIPanGestureRecognizer *_Nullable data);
typedef void(^jobsByTapGestureRecognizerBlock)(__kindof UITapGestureRecognizer *_Nullable data);
typedef void(^jobsByLongPressGestureRecognizerBlock)(__kindof UILongPressGestureRecognizer *_Nullable data);
typedef void(^jobsBySwipeGestureRecognizerBlock)(__kindof UISwipeGestureRecognizer *_Nullable data);
typedef void(^jobsByPinchGestureRecognizerBlock)(__kindof UIPinchGestureRecognizer *_Nullable data);
typedef void(^jobsByRotationGestureRecognizerBlock)(__kindof UIRotationGestureRecognizer *_Nullable data);
typedef void(^jobsByScreenEdgePanGestureRecognizerBlock)(__kindof UIScreenEdgePanGestureRecognizer *_Nullable data);
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
#pragma mark —— 手势
typedef void(^jobsByGestureRecognizer)(__kindof UIGestureRecognizer *_Nullable data);
typedef void(^jobsByTapGestureBlock)(UITapGestureRecognizer *_Nullable gesture);
typedef void(^jobsByLongPressGestureBlock)(UILongPressGestureRecognizer *_Nullable gesture);
typedef void(^jobsBySwipeGestureBlock)(UISwipeGestureRecognizer *_Nullable gesture);
typedef void(^jobsByPanGestureBlock)(UIPanGestureRecognizer *_Nullable gesture);
typedef void(^jobsByPinchGestureBlock)(UIPinchGestureRecognizer *_Nullable gesture);
typedef void(^jobsByRotationGestureBlock)(UIRotationGestureRecognizer *_Nullable gesture);
#pragma mark —— 其他
typedef void(^jobsByRunLoopBlock)(NSRunLoop *_Nullable data);
typedef void(^jobsByDataBlock)(NSData *_Nullable data);
typedef void(^jobsByBezierPathBlock)(__kindof UIBezierPath *_Nullable data);
typedef void(^jobsByNotificationBlock)(NSNotification *_Nullable notification);
#import <UserNotifications/UserNotifications.h>
typedef void(^jobsByUNUserNotificationCenterBlock)(__kindof UNUserNotificationCenter *_Nullable center);
typedef void(^jobsByUNMutableNotificationContentBlock)(__kindof UNMutableNotificationContent *_Nullable content);
typedef void(^jobsByAlertActionBlock)(__kindof UIAlertAction *_Nullable action);
typedef void(^jobsByPasteboardBlock)(__kindof UIPasteboard *_Nullable pasteboard);

typedef void(^jobsByTwoIDBlock)Jobs_2_Arguments;
typedef void(^jobsByThreeIDBlock)Jobs_3_Arguments;
typedef void(^jobsByFourIDBlock)Jobs_4_Arguments;
typedef void(^jobsByFiveIDBlock)Jobs_5_Arguments;
typedef void(^jobsBySixIDBlock)Jobs_6_Arguments;
typedef void(^jobsBySevenIDBlock)Jobs_7_Arguments;
typedef void(^jobsByEightIDBlock)Jobs_8_Arguments;
typedef void(^jobsByNineIDBlock)Jobs_9_Arguments;
typedef void(^jobsByTenIDBlock)Jobs_10_Arguments;
/// weakSelf 方便使用，用来打破循环引用。使用时需要改成实际类型，否则没有代码提示
/// selector 实际调用的方法
/// arg 事件默认传递的对象，比如`NSNotification`，`UIButton`
typedef void(^_Nullable JobsSelectorBlock)(id _Nullable weakSelf,
                                           id _Nullable arg);
typedef void(^_Nullable JobsSelectorBlock1)(id _Nullable weakSelf,
                                            id _Nullable arg,
                                            id _Nullable data);
#pragma clang diagnostic pop

#endif /* VoidByCertainParameters_h */
