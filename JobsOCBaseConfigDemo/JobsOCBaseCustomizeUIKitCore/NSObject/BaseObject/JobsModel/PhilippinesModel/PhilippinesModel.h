//
//  PhilippinesModel.h
//  FM
//
//  Created by User on 9/13/24.
//

#import <Foundation/Foundation.h>
#import "IncomeSourceModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhilippinesModel : IncomeSourceModel

@property(nonatomic,assign)NSInteger state_id;
@property(nonatomic,copy)NSString *state_name;

@end

NS_ASSUME_NONNULL_END
