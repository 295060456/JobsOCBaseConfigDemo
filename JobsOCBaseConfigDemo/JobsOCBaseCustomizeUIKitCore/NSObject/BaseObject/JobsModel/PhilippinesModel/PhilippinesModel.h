//
//  PhilippinesModel.h
//  FM
//
//  Created by User on 9/13/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhilippinesModel : NSObject

@property(nonatomic,copy)NSString *ID;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSInteger state_id;
@property(nonatomic,copy)NSString *state_name;

@end

NS_ASSUME_NONNULL_END
