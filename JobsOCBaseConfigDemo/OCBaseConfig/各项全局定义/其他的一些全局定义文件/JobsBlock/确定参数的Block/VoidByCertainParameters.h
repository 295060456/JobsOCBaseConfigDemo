//
//  VoidByCertainParameters.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/27.
//

#ifndef VoidByCertainParameters_h
#define VoidByCertainParameters_h
///【 确定入参个数 并且 没有返回值的Block定义】
#pragma mark —— 单形参
typedef void(^jobsByVoidBlock)(void);

typedef void(^jobsByURLBlock)(NSURL *_Nullable data);
typedef void(^jobsByRunLoopBlock)(NSRunLoop *_Nullable data);
typedef void(^jobsByLayoutAttributeBlock)(NSLayoutAttribute data);
typedef void(^jobsByIDBlock)(id _Nullable data);
typedef void(^jobsByDataBlock)(NSData *_Nullable data);
typedef void(^jobsByStringBlock)(NSString *_Nullable data);
typedef void(^jobsByAttributedStringBlock)(NSAttributedString *_Nullable data);
typedef void(^jobsByImageBlock)(UIImage *_Nullable data);
typedef void(^jobsByCorBlock)(UIColor *_Nullable data);
typedef void(^jobsByFontBlock)(UIFont *_Nullable data);
typedef void(^jobsByViewBlock)(__kindof UIView *_Nullable view);
typedef void(^jobsByScrollViewBlock)(UIScrollView *_Nullable data);
typedef void(^jobsByBtnBlock)(__kindof UIButton *_Nullable btn);
typedef void(^jobsByWindowBlock)(__kindof UIWindow *_Nullable data);
typedef void(^jobsByClassAndSaltStrBlock)(Class _Nonnull cls,NSString *_Nullable salt);
typedef void(^jobsByVCBlock)(__kindof UIViewController *_Nullable data);
typedef void(^jobsByVCAndDataBlock)(__kindof UIViewController *_Nullable viewController,id _Nullable data);
typedef void(^jobsByViewAndAnimatedBlock)(__kindof UIView *_Nullable view,BOOL animated);
typedef void(^jobsByView2Block)(__kindof UIView *_Nullable superview,UIView *_Nullable view);
typedef void(^jobsByTableViewCellBlock)(__kindof UITableViewCell *_Nullable data);
typedef void(^jobsByURLSessionDataTaskBlock)(__kindof NSURLSessionDataTask *_Nullable data);
typedef void(^jobsByURLRequestBlock)(__kindof NSURLRequest *_Nullable data);
typedef void(^jobsByButtonConfigurationBlock)(UIButtonConfiguration * _Nullable config);
/// 关于手势
typedef void(^jobsByGestureRecognizerBlock)(__kindof UIGestureRecognizer *_Nullable data);
typedef void(^jobsByPanGestureRecognizerBlock)(__kindof UIPanGestureRecognizer *_Nullable data);
typedef void(^jobsByTapGestureRecognizerBlock)(__kindof UITapGestureRecognizer *_Nullable data);
typedef void(^jobsByLongPressGestureRecognizerBlock)(__kindof UILongPressGestureRecognizer *_Nullable data);
typedef void(^jobsBySwipeGestureRecognizerBlock)(__kindof UISwipeGestureRecognizer *_Nullable data);
typedef void(^jobsByPinchGestureRecognizerBlock)(__kindof UIPinchGestureRecognizer *_Nullable data);
typedef void(^jobsByRotationGestureRecognizerBlock)(__kindof UIRotationGestureRecognizer *_Nullable data);
typedef void(^jobsByScreenEdgePanGestureRecognizerBlock)(__kindof UIScreenEdgePanGestureRecognizer *_Nullable data);

typedef void(^jobsKeyValueBlock)(id <NSCopying>_Nonnull key,id _Nonnull value);

typedef void(^jobsBySELBlock)(SEL _Nullable data);
typedef void(^jobsByClassBlock)(Class _Nonnull cls);
typedef void(^jobsByPointBlock)(CGPoint data);
typedef void(^jobsBySizeBlock)(CGSize data);
typedef void(^jobsByEdgeInsetBlock)(UIEdgeInsets data);
typedef void(^jobsByTextAlignmentBlock)(NSTextAlignment data);
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
#pragma mark —— 多形参
typedef void(^jobsDelegateBlock)(NSString *_Nullable data,jobsByVoidBlock _Nullable block);
typedef void(^jobsByColor_FloatBlock)(UIColor *_Nullable,float borderWidth);
typedef void(^jobsByKey_ValueBlock)(NSString *_Nonnull key,id _Nullable value);

typedef void(^jobsByTwoIDBlock)Jobs_2_Arguments;
typedef void(^jobsByThreeIDBlock)Jobs_3_Arguments;
typedef void(^jobsByFourIDBlock)Jobs_4_Arguments;
typedef void(^jobsByFiveIDBlock)Jobs_5_Arguments;
typedef void(^jobsBySixIDBlock)Jobs_6_Arguments;
typedef void(^jobsBySevenIDBlock)Jobs_7_Arguments;
typedef void(^jobsByEightIDBlock)Jobs_8_Arguments;
typedef void(^jobsByNineIDBlock)Jobs_9_Arguments;
typedef void(^jobsByTenIDBlock)Jobs_10_Arguments;

#endif /* VoidByCertainParameters_h */
