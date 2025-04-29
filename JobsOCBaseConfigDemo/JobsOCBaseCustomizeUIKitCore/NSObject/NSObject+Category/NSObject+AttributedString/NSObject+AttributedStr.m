//
//  NSObject+AttributedStr.m
//  FMNormal
//
//  Created by Jobs on 2025/4/29.
//

#import "NSObject+AttributedStr.h"

@implementation NSObject (AttributedStr)

+(__kindof NSDictionary <NSAttributedStringKey,id>*)linkTextAttributes{
    return @{
        NSForegroundColorAttributeName: JobsCor(@"#FFCC00"),
        NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle),
        NSUnderlineColorAttributeName: JobsCor(@"#FFCC00"),
    };
}
/// 超链接的文字以及下划线的颜色设置
-(__kindof NSDictionary <NSAttributedStringKey,id>*)makeLinkTextAttributes{
    return NSObject.linkTextAttributes;
}

@end
