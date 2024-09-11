//
//  JobsDebugVC.h
//  FM
//
//  Created by User on 9/9/24.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "UIViewModel.h"

#ifndef VC_LIFE_CYCLE_ENUM_DEFINED
#define VC_LIFE_CYCLE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, UIViewControllerLifeCycle) {
    VCLifeCycle_loadView = 0,
    VCLifeCycle_viewDidLoad,
    VCLifeCycle_viewWillAppear,
    VCLifeCycle_viewDidAppear,
    VCLifeCycle_viewWillDisappear,
    VCLifeCycle_viewDidDisappear,
    VCLifeCycle_viewWillLayoutSubviews,
    VCLifeCycle_viewDidLayoutSubviews
};
#endif /* VC_LIFE_CYCLE_ENUM_DEFINED */

NS_ASSUME_NONNULL_BEGIN

@interface JobsDebugVC : UIViewController

@end

NS_ASSUME_NONNULL_END
