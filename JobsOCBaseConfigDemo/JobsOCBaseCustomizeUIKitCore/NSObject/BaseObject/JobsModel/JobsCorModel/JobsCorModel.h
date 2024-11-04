//
//  JobsCorModel.h
//  FM
//
//  Created by Admin on 4/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsCorModel : NSObject

@property(nonatomic,assign)CGFloat red;
@property(nonatomic,assign)CGFloat green;
@property(nonatomic,assign)CGFloat blue;
@property(nonatomic,assign)CGFloat alpha;

@property(nonatomic,assign)CGFloat hue;
@property(nonatomic,assign)CGFloat saturation;
@property(nonatomic,assign)CGFloat brightness;

@property(nonatomic,copy)NSString *corStr;/// 十六进制字符串

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsCorModel *_Nonnull jobsMakeCorModel(jobsByCorModelBlock _Nonnull block){
    JobsCorModel *data = JobsCorModel.alloc.init;
    if (block) block(data);
    return data;
}
