//
//  NSData+Other.m
//  JobsOCBaseConfig
//
//  Created by admin on 6/5/24.
//

#import "NSData+Other.h"

@implementation NSData (Other)
/// 解压缩字符串
-(NSString *)decompressToStr{
    NSData *data = [NSKeyedUnarchiver unarchivedObjectOfClass:NSData.class
                                                     fromData:self
                                                        error:nil];
    NSString *string = [NSString.alloc initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}

@end
