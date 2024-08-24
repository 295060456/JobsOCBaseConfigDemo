//
//  JobsCorModel.h
//  FM
//
//  Created by User on 8/23/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsCorModel : NSObject

@property(nonatomic,assign)int red;
@property(nonatomic,assign)int green;
@property(nonatomic,assign)int blue;
@property(nonatomic,assign)CGFloat alpha;
@property(nonatomic,strong)NSString *corStr;/// 十六进制字符串

@end

NS_ASSUME_NONNULL_END
