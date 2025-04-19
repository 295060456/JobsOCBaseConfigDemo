//
//  IncomeSourceModel.h
//  FM
//
//  Created by User on 9/22/24.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface IncomeSourceModel : BaseModel

Prop_copy()NSString *ID;
Prop_copy()NSString *name;

@end

NS_ASSUME_NONNULL_END
