//
//  NSObject+HTML.h
//  FM
//
//  Created by Admin on 19/12/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (HTML)
/// HTML 必要标签
- (__kindof NSMutableArray<NSString *> *)requiredHTMLTags;
/// HTML 标签
-(__kindof NSArray <__kindof NSString *>*)htmlTags;

@end

NS_ASSUME_NONNULL_END
