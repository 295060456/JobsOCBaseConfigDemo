//
//  NSRegularExpression+Extra.m
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import "NSRegularExpression+Extra.h"

@implementation NSRegularExpression (Extra)

+(JobsRetRegularExpressionByStringBlock _Nonnull)byString{
    return ^__kindof NSRegularExpression *_Nullable(NSString *_Nullable data){
        NSError *err = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:data
                                                                               options:0
                                                                                 error:&err];
        if(err){
            JobsLog(@"err = %@",err.description);
            return nil;
        }return regex;
    };
}

@end
