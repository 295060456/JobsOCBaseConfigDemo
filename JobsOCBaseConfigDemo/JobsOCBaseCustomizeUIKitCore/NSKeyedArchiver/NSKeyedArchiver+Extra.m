//
//  NSKeyedArchiver+Extra.m
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import "NSKeyedArchiver+Extra.h"

@implementation NSKeyedArchiver (Extra)

+(JobsReturnDataByIDBlock _Nonnull)initByObject{
    return ^__kindof NSData *_Nullable(id _Nullable data){
        return [NSKeyedArchiver archivedDataWithRootObject:data];
    };
}

+(JobsReturnDataByIDBlock _Nonnull)archivedDataByRootObject_NO{
    return ^NSData *_Nullable(id _Nullable data){
        NSError *err = nil;
        NSData *compressedData = [NSKeyedArchiver archivedDataWithRootObject:data
                                                       requiringSecureCoding:NO
                                                                       error:&err];
        if(err){
            return nil;
            JobsLog(@"%@",err.description);
        }return compressedData;
    };
}

+(JobsReturnDataByIDBlock _Nonnull)archivedDataByRootObject_YES{
    return ^NSData *_Nullable(id _Nullable data){
        NSError *err = nil;
        NSData *compressedData = [NSKeyedArchiver archivedDataWithRootObject:data
                                                       requiringSecureCoding:YES
                                                                       error:&err];
        if(err){
            return nil;
            JobsLog(@"%@",err.description);
        }return compressedData;
    };
}

@end
