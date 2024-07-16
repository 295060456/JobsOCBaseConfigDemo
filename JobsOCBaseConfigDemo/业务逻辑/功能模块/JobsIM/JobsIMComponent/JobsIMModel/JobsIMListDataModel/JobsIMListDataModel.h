//
//  JobsIMListDataModel.h
//  JobsIM
//
//  Created by Jobs on 2020/11/17.
//

#import <Foundation/Foundation.h>
#import "UIImage+YBGIF.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsIMListDataModel : NSObject

@property(nonatomic,copy)NSString *usernameStr;
@property(nonatomic,copy)NSString *contentStr;
@property(nonatomic,copy)NSString *timeStr;
@property(nonatomic,strong)UIImage *userHeaderIMG;

@end

NS_ASSUME_NONNULL_END
