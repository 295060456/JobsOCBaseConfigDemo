//
//  NSKeyedArchiver+Extra.m
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import "NSKeyedArchiver+Extra.h"

@implementation NSKeyedArchiver (Extra)

+(JobsReturnDataByIDBlock _Nonnull)archivedDataByRootObject{
    return ^NSData *_Nullable(id _Nullable data){
        NSError *err = nil;
        NSData *compressedData = [NSKeyedArchiver archivedDataWithRootObject:data
                                                       requiringSecureCoding:NO
                                                                       error:&err];
        if(err){
            return nil;
            NSLog(@"%@",err.description);
        }return compressedData;
    };
}

@end
