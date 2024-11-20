//
//  NSDate+Extra.m
//  FM
//
//  Created by User on 9/13/24.
//

#import "NSDate+Extra.h"

@implementation NSDate (Extra)
/// 创建 Date 对象
+(JobsReturnDateByTimeIntervalBlock _Nonnull)dateBy{
    return ^NSDate *_Nullable(NSTimeInterval data){
        return [NSDate dateWithTimeIntervalSince1970:data];
    };
}
/// 将NSDate转化为可视化的时间字符串（年/月/日）
-(JobsReturnStringByDateFormatterBlock _Nonnull)toVisualTime{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSDateFormatter *_Nullable data){
        @jobs_strongify(self)
        if(!data){
            data = jobsMakeDateFormatter(^(__kindof NSDateFormatter *_Nullable data) {
                data.dateFormat = @"yyyy"
                    .add(@"-")
                    .add(@"MM")
                    .add(@"-")
                    .add(@"dd");
            });
        }return [data stringFromDate:self];
    };
}

@end
