//
//  NSFormatter+Extra.m
//  FM
//
//  Created by User on 9/3/24.
//

#import "NSFormatter+Extra.h"

@implementation NSFormatter (Extra)

-(JobsReturnStringByDateBlock _Nonnull)date{
    @jobs_weakify(self)
    return ^NSString *_Nullable(NSDate *_Nullable date){
        @jobs_strongify(self)
        if(self){
            if(self.isKindOfClass(NSDateFormatter.class)){
                NSDateFormatter *dateFormatter = (NSDateFormatter *)self;
                return [dateFormatter stringFromDate:date];
            }
        }return @"";
    };
}

-(JobsReturnStringByTimeIntervalBlock _Nonnull)time{
    @jobs_weakify(self)
    return ^NSString *_Nullable(NSTimeInterval timeInterval){
        @jobs_strongify(self)
        if(self){
            if(self.isKindOfClass(NSDateFormatter.class)){
                NSDateFormatter *dateFormatter = (NSDateFormatter *)self;
                NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
                return dateFormatter.date(date);
            }
        }return nil;
    };
}

@end
