//
//  NSDate+Extra.m
//  FM
//
//  Created by User on 9/13/24.
//

#import "NSDate+Extra.h"

@implementation NSDate (Extra)
/// 将NSDate转化为可视化的时间字符串（年/月/日）
-(NSString *)toVisualTime{
    return [jobsMakeDateFormatter(^(__kindof NSDateFormatter *_Nullable data) {
        data.dateFormat = @"yyyy"
            .add(JobsInternationalization(@"年"))
            .add(@"MM")
            .add(@"月")
            .add(@"dd")
            .add(JobsInternationalization(@"日"));
    }) stringFromDate:self];
}

@end
