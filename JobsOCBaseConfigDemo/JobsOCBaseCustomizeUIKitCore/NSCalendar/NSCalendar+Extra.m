//
//  NSCalendar+Extra.m
//  FM
//
//  Created by Admin on 26/11/2024.
//

#import "NSCalendar+Extra.h"

@implementation NSCalendar (Extra)

+(JobsReturnCalendarByCalendarIdentifierBlock _Nonnull)initBy{
    return ^__kindof NSCalendar *_Nullable(NSCalendarIdentifier _Nullable data){
        return [NSCalendar calendarWithIdentifier:data];
    };
}

@end
