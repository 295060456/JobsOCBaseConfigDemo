//
//  NSFormatter+Extra.m
//  FM
//
//  Created by User on 9/3/24.
//

#import "NSFormatter+Extra.h"

@implementation NSFormatter (Extra)

-(JobsReturnStringByDateBlock)date{
    @jobs_weakify(self)
    return ^NSString *_Nullable(NSDate *_Nullable date){
        @jobs_strongify(self)
        if(self.isKindOfClass(NSDateFormatter.class)){
            NSDateFormatter *dateFormatter = (NSDateFormatter *)self;
            return [dateFormatter stringFromDate:date];
        }return @"";
    };
}

-(JobsReturnStringByTimeIntervalBlock)time{
    return ^NSString *_Nullable(NSTimeInterval timeInterval){
        NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
        if(self.isKindOfClass(NSDateFormatter.class)){
            NSDateFormatter *dateFormatter = (NSDateFormatter *)self;
            return dateFormatter.date(date);
        }return nil;
    };
}

@end
