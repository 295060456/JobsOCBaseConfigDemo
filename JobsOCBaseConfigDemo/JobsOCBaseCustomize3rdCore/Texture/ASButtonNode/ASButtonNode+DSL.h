//
//  ASButtonNode+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/6/25.
//

#import <Foundation/Foundation.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "ASButtonNode.h"
#import "JobsBlock.h"
#import "DefineProperty.h"
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN
/// ASButtonNode 链式 DSL（节选：标题/图片/边距/圆角/事件）
@interface ASButtonNode (DSL)

-(JobsRetButtonNodeByTitleConfigBlock _Nonnull)byTitle;
-(JobsRetButtonNodeImageByConfigBlock _Nonnull)byImage;
-(JobsRetButtonNodeByHitTestSlopBlock _Nonnull)byContentEdgeInsets;
-(JobsRetButtonNodeByBackgroundColorsBlock _Nonnull)byBackgroundColor;
-(JobsRetButtonNodeByCornerRadiusBlock _Nonnull)byCornerRadius;
-(JobsRetButtonNodeByHitTestSlopBlock _Nonnull)byHitTestSlop;
/// 短按（点击）封装
-(JobsRetButtonNodeByOnClickBlock _Nonnull)onClickBy;
/// 长按封装（默认 & 自定义）
-(JobsRetButtonNodeByOnLongPressBlock _Nonnull)onLongPressGestureBy;
-(JobsRetButtonNodeByOnLongPressWithTimeBlock _Nonnull)onLongPressGestureWith;

@end

NS_ASSUME_NONNULL_END
