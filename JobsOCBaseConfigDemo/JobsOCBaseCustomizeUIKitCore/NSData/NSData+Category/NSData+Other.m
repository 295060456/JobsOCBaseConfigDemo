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
    NSError *error;
    NSString *string = @"";
    NSData *data = [NSKeyedUnarchiver unarchivedObjectOfClass:NSData.class
                                                     fromData:self
                                                        error:&error];
    if(error) NSLog(@"%@",error.description);
    if(data) string = data.stringByUTF8Encoding;
    return string;
}

-(NSString *)stringByUTF8Encoding{
    return [NSString.alloc initWithData:self encoding:NSUTF8StringEncoding];
}

@end
