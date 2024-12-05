//
//  PhilippinesIDTypeModel.h
//  FM
//
//  Created by Admin on 4/12/2024.
//

#import <Foundation/Foundation.h>
#import "DefineProperty.h"
#import "BaseModel.h"

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface PhilippinesIDTypeModel : BaseModel

Prop_assign()NSInteger ID;
Prop_copy()NSString *name;

@end

NS_ASSUME_NONNULL_END
