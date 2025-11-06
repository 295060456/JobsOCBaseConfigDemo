//
//  ASStackLayoutSpec+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/6/25.
//

#import <Foundation/Foundation.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface ASStackLayoutSpec (DSL)
#pragma mark —— 方向 / 间距
-(JobsRetStackLayoutSpecByDirectionBlock _Nonnull)byDirection;
-(JobsRetStackLayoutSpecBySpacingBlock _Nonnull)bySpacing;
#pragma mark —— 语义对齐（推荐优先用这两个）
-(JobsRetStackLayoutSpecByHorizontalAlignmentBlock _Nonnull)byHorizontalAlignment;
-(JobsRetStackLayoutSpecByVerticalAlignmentBlock _Nonnull)byVerticalAlignment;
#pragma mark —— Flex 对齐（底层等价字段）
-(JobsRetStackLayoutSpecByJustifyContentBlock _Nonnull)byJustifyContent;
-(JobsRetStackLayoutSpecByAlignItemsBlock _Nonnull)byAlignItems;
-(JobsRetStackLayoutSpecByFlexWrapBlock _Nonnull)byFlexWrap;
-(JobsRetStackLayoutSpecByAlignContentBlock _Nonnull)byAlignContent;
-(JobsRetStackLayoutSpecByLineSpacingBlock _Nonnull)byLineSpacing;
#pragma mark —— 并发布局开关
-(JobsRetStackLayoutSpecByConcurrentBlock _Nonnull)byConcurrent;
#pragma mark —— children 管理
-(JobsRetStackLayoutSpecByChildrenBlock _Nonnull)byChildren;
-(JobsRetStackLayoutSpecByAppendChildrenBlock _Nonnull)byAppendChildren;
-(JobsRetStackLayoutSpecByAddChildBlock _Nonnull)byAdd;

@end

NS_ASSUME_NONNULL_END
