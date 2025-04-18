//
//  UIViewController+Extra.h
//  FM_Normal
//
//  Created by Jobs on 2025/4/18.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Extra)

-(JobsReturnVCByVCBlock _Nonnull)addChildViewController;

@end

NS_ASSUME_NONNULL_END
