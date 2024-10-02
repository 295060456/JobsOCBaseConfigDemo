//
//  UIViewController+SafeTransition.h
//  Casino
//
//  Created by Jobs on 2022/1/1.
//

#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "BaseProtocol.h"

#if __has_include(<WHToast/WHToast.h>)
#import <WHToast/WHToast.h>
#else
#import "WHToast.h"
#endif

#import "NSObject+WHToast.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsRecordPresentedViewController : NSObject<BaseProtocol>

@property(nonatomic,strong)NSMutableArray <__kindof UIViewController *>*presentedVCMutArr;

@end
/// 防止过多的presented模态推出ViewController
@interface UIViewController (SafeTransition)

@end

NS_ASSUME_NONNULL_END
