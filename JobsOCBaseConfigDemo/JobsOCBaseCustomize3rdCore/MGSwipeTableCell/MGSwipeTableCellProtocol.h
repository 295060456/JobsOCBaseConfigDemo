//
//  MGSwipeTableCellProtocol.h
//  FMNormal
//
//  Created by Jobs on 2025/5/19.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MGSwipeTableCellProtocol <NSObject>
@optional
-(JobsReturnMGSwipeTableCellByDelegateBlock _Nonnull)byDelegate;
-(JobsReturnMGSwipeTableCellByBOOLBlock _Nonnull)byAllowsMultipleSwipe;
-(JobsReturnMGSwipeTableCellByBOOLBlock _Nonnull)byShowChatUserName;

@end

NS_ASSUME_NONNULL_END
