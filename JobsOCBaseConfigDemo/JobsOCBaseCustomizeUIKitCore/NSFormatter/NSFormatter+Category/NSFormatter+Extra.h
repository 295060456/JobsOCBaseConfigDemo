//
//  NSFormatter+Extra.h
//  FM
//
//  Created by User on 9/3/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSFormatter (Extra)

-(JobsReturnStringByDateBlock)date;
-(JobsReturnStringByTimeIntervalBlock)time;

@end

NS_ASSUME_NONNULL_END
