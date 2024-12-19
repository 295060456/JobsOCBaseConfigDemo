//
//  NSJSONSerialization+Extra.m
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import "NSJSONSerialization+Extra.h"

@implementation NSJSONSerialization (Extra)

+(JobsReturnDicByDataBlock _Nonnull)makeDicByData{
    return ^__kindof NSDictionary *_Nullable(NSData *_Nullable data){
        NSError *err = nil;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        if(err){
            JobsLog(@"err = %@",err.description);
            return nil;
        }return dic;
    };
}

@end
