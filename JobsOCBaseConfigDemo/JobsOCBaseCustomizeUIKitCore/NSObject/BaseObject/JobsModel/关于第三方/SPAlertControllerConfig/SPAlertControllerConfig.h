//
//  SPAlertControllerConfig.h
//  FM
//
//  Created by Admin on 26/12/2024.
//

#import <Foundation/Foundation.h>
#import "DefineProperty.h"

#if __has_include(<SPAlertController/SPAlertController.h>)
#import <SPAlertController/SPAlertController.h>
#else
#import "SPAlertController.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface SPAlertControllerConfig : NSObject

Prop_assign()NSObject_SPAlertControllerInitType SPAlertControllerInitType;// SPAlertControllerInitType 初始化模式
Prop_copy(nullable)NSString *title;//  标题，没有可传nil，如果传空字符@“”会多处一行空白
Prop_copy(nullable)NSString *message;// 副标题，没有可传nil，如果传空字符@“”会多处一行空白
Prop_strong(nullable)UIView *customAlertView; // 允许传入自定义的View
Prop_strong(nullable)UIView *customHeaderView;// 允许传入自定义的HeaderView
Prop_strong(nullable)UIView *customActionSequenceView;// 允许传入自定义的customActionSequenceView
Prop_assign()SPAlertControllerStyle preferredStyle;// 从单侧弹出(顶/左/底/右)  还是  从中间弹出
Prop_assign()SPAlertAnimationType animationType;// 动画模式
Prop_weak()UIViewController *targetVC;// 作用域,alertBtnActionArr在targetVC的m文件去找对应的方法，没有则向外抛出崩溃
Prop_weak(nullable)id funcInWhere;// 执行方法的位置，它可以是VC、view、也可以是任意NSObject子类。当不传值的时候 funcInWhere == targetVC
Prop_assign()BOOL animated;// 是否动效present
// 核心参数
Prop_strong(nullable)NSArray <NSString *>*alertActionTitleArr;// 按钮名
Prop_strong(nullable)NSArray <NSNumber *>*alertActionStyleArr;// 按钮Style
Prop_strong(nullable)NSArray <NSString *>*alertBtnActionArr;// 按钮触发方法
Prop_strong(nullable)NSArray <NSMutableArray *>*parametersArr;// @【所有的参数形成数据束，一个方法对应一个数据束的形式，包装成方法的第一个参数】

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof SPAlertControllerConfig *_Nonnull jobsMakeSPAlertControllerConfig(jobsBySPAlertControllerConfigBlock _Nonnull block){
    SPAlertControllerConfig *data = SPAlertControllerConfig.alloc.init;
    if (block) block(data);
    return data;
}
