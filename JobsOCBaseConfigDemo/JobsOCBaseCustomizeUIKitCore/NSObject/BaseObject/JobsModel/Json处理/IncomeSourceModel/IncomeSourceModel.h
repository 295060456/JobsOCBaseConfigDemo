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

@property(nonatomic,copy)NSString *ID;
@property(nonatomic,copy)NSString *name;

@end

NS_ASSUME_NONNULL_END
