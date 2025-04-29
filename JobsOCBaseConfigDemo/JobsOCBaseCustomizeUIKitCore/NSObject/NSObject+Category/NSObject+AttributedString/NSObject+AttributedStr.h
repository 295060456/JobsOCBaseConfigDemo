//
//  NSObject+AttributedStr.h
//  FMNormal
//
//  Created by Jobs on 2025/4/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (AttributedStr)
/// 超链接的文字以及下划线的颜色设置
+(__kindof NSDictionary <NSAttributedStringKey,id>*)linkTextAttributes;
-(__kindof NSDictionary <NSAttributedStringKey,id>*)makeLinkTextAttributes;

@end

NS_ASSUME_NONNULL_END
