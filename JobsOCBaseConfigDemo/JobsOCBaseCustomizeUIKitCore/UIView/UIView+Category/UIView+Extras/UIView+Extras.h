//
//  UIView+Extras.h
//  MJRefreshExample
//
//  Created by Aalto on 14-5-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsDefineAllEnumHeader.h"
#import "BaseViewProtocol.h"
#import "JobsBlock.h"
#import "MacroDef_App.h"
#import "MacroDef_Size.h"
#import "MacroDef_Cor.h"
#import "MacroDef_Func.h"
#import "MacroDef_Sys.h"
#import "MacroDef_Notification.h"
#import "NSObject+Extras.h"
#import "NSObject+GKPhotoBrowser.h"
#import "NSObject+DynamicInvoke.h"
#import "UIView+Measure.h"
#import "UIButton+UI.h"
#import "UIBarButtonItem+Extra.h"
///  "Passing address of non-local object to __autoreleasing parameter for write-back" 警告的原因是 Objective-C 对指针操作的内存管理有一套特殊的机制，特别是涉及 __autoreleasing、__strong 等修饰符时。
///  当你传递一个对象的指针（比如 UIView **）时，编译器可能会将这个指针的参数视为 __autoreleasing。而你试图传递一个本地对象的地址给 __autoreleasing 参数时，就会触发这个警告。简而言之，Objective-C 认为这样操作可能会引发内存管理上的问题。
///  要解决这个问题，首先可以强制指定参数为 __strong 以避免自动推导为 __autoreleasing
///  如果你希望在函数内部能够修改外部变量的值，你可以使用指针的指针（UIView **），传递变量的地址来改变原变量的值。
///  destroyView(&view);
NS_INLINE void destroyView(__strong __kindof UIView *_Nonnull *_Nonnull view) {
    [*view removeFromSuperview];
    *view = nil;
}
/// 在 Objective-C 中，无法直接通过函数参数隐式传递对象的地址。
/// 如果希望在函数调用时自动传递对象的地址，只能通过宏来实现。
#ifndef DestroyView
#define DestroyView(view) destroyView(&(view))
#endif /* DestroyView */

@interface UIView (Extras)<BaseViewProtocol>
@property(nonatomic,assign)BOOL jobsVisible;
#pragma mark —— 打印
-(jobsByStringBlock _Nonnull)jobsLogFrame;
-(jobsByStringBlock _Nonnull)jobsLogPoint;
-(jobsByStringBlock _Nonnull)jobsLogSize;
#pragma mark —— 键盘事件
/// 监听键盘事件
-(void)monitorKeyboardAction;
#pragma mark —— 截屏
/*
 1、将图片存本地相册 UIImageWriteToSavedPhotosAlbum
 2、iOS安全 —— 录屏、截屏判断
    2.1、UIApplicationUserDidTakeScreenshotNotification iOS7+ 截屏事件通知
    2.2、UIScreenCapturedDidChangeNotification 判断是否在录屏状态 而当录屏状态改变时，UIKit会发送录屏通知
 */
/// 获取屏幕截图
-(UIImage *_Nullable)screenShot;
/// 获取启动页的截图
-(UIImage *_Nullable)lanuchScreenShot;
/// 获取某个view 上的截图
-(UIImage *_Nullable)viewShots;
/// 获取某个scrollview 上的截图
-(UIImage *_Nullable)scrollViewShot;
/// 截图
-(JobsReturnImageByViewBlock _Nonnull)rendImage;
/// 获取某个 范围内的 截图
-(JobsReturnImageByCGRectBlock _Nonnull)innerViewShotAtFrame;
#pragma mark —— 描边
/// 调用方式：view.leftBorderColor(color).leftBorderWidth(borderType);
-(JobsReturnViewByCorBlock _Nonnull)leftBorderColor;
/// 调用方式：view.rightBorderColor(color).rightBorderWidth(borderType);
-(JobsReturnViewByCorBlock _Nonnull)rightBorderColor;
/// 调用方式：view.topBorderColor(color).topBorderWidth(borderType);
-(JobsReturnViewByCorBlock _Nonnull)topBorderColor;
/// 调用方式：view.bottomBorderColor(color).bottomBorderWidth(borderType);
-(JobsReturnViewByCorBlock _Nonnull)bottomBorderColor;
/// 调用方式：view.leftBorderColor(color).leftBorderWidth(borderType);
-(JobsReturnViewByFloatBlock _Nonnull)leftBorderWidth;
/// 调用方式：view.rightBorderColor(color).rightBorderWidth(borderType);
-(JobsReturnViewByFloatBlock _Nonnull)rightBorderWidth;
/// 调用方式：view.topBorderColor(color).topBorderWidth(borderType);
-(JobsReturnViewByFloatBlock _Nonnull)topBorderWidth;
/// 调用方式：view.bottomBorderColor(color).bottomBorderWidth(borderType);
-(JobsReturnViewByFloatBlock _Nonnull)bottomBorderWidth;
/// 描边：统一设置Layer的线宽+颜色+圆切角（一定切角）
-(JobsReturnViewByLocationModelBlock _Nonnull)setLayerBy;
/// 描边：统一设置Layer的线宽+颜色+圆切角（不一定切角）
-(JobsReturnViewByLocationModelBlock _Nonnull)layerBy;
/// 指定描边 【在使用这个方法的一个前提是被描边的view刷新后存在frame】
/// @param color 作用颜色
/// @param borderWidth 线宽
/// @param borderType 作用方向
-(void)setBorderWithColor:(UIColor *_Nullable)color
              borderWidth:(CGFloat)borderWidth
               borderType:(UIBorderSideType)borderType;
/// 调用方式：view.layerByBorderCor(JobsCor(@"#FFD8D8")).layerByBorderWidth(1);
-(JobsReturnViewByCorBlock _Nonnull)layerByBorderCor;
/// 调用方式：view.layerByBorderCor(JobsCor(@"#FFD8D8")).layerByBorderWidth(1);
-(JobsReturnViewByFloatBlock _Nonnull)layerByBorderWidth;
#pragma mark —— 切角
/// 切整个View的4个角为统一的切角参数
-(JobsReturnViewByFloatBlock _Nonnull)cornerCutToCircleWithCornerRadius;
/// 调用方式：view.appointCorners(UIRectCornerTopLeft | UIRectCornerBottomRight).cornerRadii(CGSizeMake(10, 10));
-(JobsReturnViewByNSUIntegerBlock _Nonnull)appointCorners;
/// 调用方式：view.appointCorners(UIRectCornerTopLeft | UIRectCornerBottomRight).cornerRadii(CGSizeMake(10, 10));
-(JobsReturnViewBySizeBlock _Nonnull)cornerRadii;
/// 指定圆切角
/// ⚠️这种写法存在一定的弊端：如果在某个View上添加子View，并对这个View使用如下方法的圆切角，则这个View上的子视图不可见⚠️
-(void)appointCornerCutToCircleByRoundingCorners:(UIRectCorner)corners
                                     cornerRadii:(CGSize)cornerRadii;
#pragma mark —— 其他
-(JobsReturnViewByGestureRecognizer _Nonnull)addGesture;
-(JobsReturnBarButtonItemByVoidBlock _Nonnull)barButtonItem;
-(JobsReturnViewByViewBlock _Nonnull)addSubview;
-(JobsReturnViewByViewBlock _Nonnull)sendSubviewToBack;
-(JobsReturnViewByVoidBlock _Nonnull)remove;
/// 针对数据源是UIImage  *的GKPhotoBrowser
-(void)viewTapGRSavePicsWithImageDataMutArr:(NSMutableArray <UIImage *>*_Nonnull)imageDataMutArr
                                atIndexPath:(NSIndexPath *_Nonnull)indexPath
                                   byTarget:(id _Nonnull)target;
/// 针对数据源是NSURL  *的GKPhotoBrowser
-(void)viewTapGRSavePicsWithImageUrlMutArr:(NSMutableArray <NSURL *>*_Nonnull)imageUrlMutArr
                               atIndexPath:(NSIndexPath *_Nonnull)indexPath
                                  byTarget:(id _Nonnull)target;
/// 针对数据源是NSString  *的GKPhotoBrowser
-(void)viewTapGRSavePicsWithImageUrlStrMutArr:(NSMutableArray <NSString *>*_Nonnull)imageUrlStrMutArr
                                  atIndexPath:(NSIndexPath *_Nonnull)indexPath
                                     byTarget:(id _Nonnull)target;
/// 对GKPhotoBrowser保存图片的基础设置
-(jobsByIDBlock _Nonnull)viewTapGRSavePicsBaseConfigByTarget;
/// popView取消按钮常规处理方法
-(jobsByIDBlock _Nonnull)cancelBtnActionForPopView;
/// 顺时针旋转radians度【依据中心点进行旋转】
-(void)transformByRadians:(CGFloat)radians;
/// 顺时针旋转degrees弧度【依据中心点进行旋转】
-(void)transformByDegrees:(CGFloat)degrees;
-(UIImage *_Nullable)getImage;
/// iOS 阴影效果 添加了shadowPath后消除了离屏渲染问题 。特别提示：不能存在 -(void)drawRect:(CGRect)rect 或者在-(void)drawRect:(CGRect)rect里面写，否则无效
/// @param targetShadowview 需要作用阴影效果的View
/// @param superview 该阴影效果的View的父View
/// @param ShadowDirection 阴影朝向
/// @param offsetX 贝塞尔曲线X轴偏移量
/// @param offsetY 贝塞尔曲线Y轴偏移量
/// @param cornerRadius 圆切角参数，传0表示不切
/// @param shadowOffset  阴影偏移量
/// @param shadowOpacity 阴影的不透明度,取值范围在0~1
/// @param layerShadowColor 阴影颜色
/// @param layerShadowRadius  模糊计算的半径
+(void)makeTargetShadowview:(__kindof UIView *__nonnull)targetShadowview
                  superView:(__kindof UIView *__nullable)superview
            shadowDirection:(ShadowDirection)ShadowDirection
          shadowWithOffsetX:(CGFloat)offsetX
                    offsetY:(CGFloat)offsetY
               cornerRadius:(CGFloat)cornerRadius
               shadowOffset:(CGSize)shadowOffset
              shadowOpacity:(CGFloat)shadowOpacity
           layerShadowColor:(UIColor *__nullable)layerShadowColor
          layerShadowRadius:(CGFloat)layerShadowRadius;

@end
/**
 // 最外层的UI-描边
 _textField_phone.layerByBorderCor(JobsCor(@"#FFC700")).layerByBorderWidth(1);
 // 最外层的UI-切全角
 _textField_phone.cornerCutToCircleWithCornerRadius(JobsWidth(8));
 
 */
