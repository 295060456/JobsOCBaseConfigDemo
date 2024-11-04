//
//  JobsCorModel.h
//  FM
//
//  Created by Admin on 4/11/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsCorModel : NSObject

@property(nonatomic,assign)CGFloat red;
@property(nonatomic,assign)CGFloat green;
@property(nonatomic,assign)CGFloat blue;
@property(nonatomic,assign)CGFloat alpha;
@property(nonatomic,copy)NSString *corStr;/// 十六进制字符串

@end

NS_ASSUME_NONNULL_END
