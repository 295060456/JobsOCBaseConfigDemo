//
//  NSString+Check.m
//  Casino
//
//  Created by Jobs on 2021/12/29.
//

#import "NSString+Check.h"

@implementation NSString (Check)

/**
 问题：直接其他地方复制过来的中文字进行网页搜索、或者中文字识别排序等情况的，会出现搜索不到的情况。
 解决方法：可能存在复制源里面的文字带了空白url编码%E2%80%8B，空白编码没有宽度，虽然看不到但是会影响结果无法正确匹配对应的中文字。可以把文字重新url编码即可。
 */
-(NSString *)urlProtect{
    if ([self containsString:@"\u200B"]) {
        return [self stringByReplacingOccurrencesOfString:@"\u200B" withString:JobsInternationalization(@"")];
    }else return self;
}

@end
