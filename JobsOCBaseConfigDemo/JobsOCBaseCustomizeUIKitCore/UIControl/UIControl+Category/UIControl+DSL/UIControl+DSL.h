//
//  UIControl+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 11/26/25.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsBlock.h"
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (DSL)

Prop_copy(readonly)JobsRetControlByHandlerBlock onJobsTap;
Prop_copy(readonly)JobsRetControlByHandlerBlock onJobsChange;
Prop_copy(readonly)JobsRetControlByEventsHandlerBlock onJobsEvent;
Prop_copy(readonly)JobsRetControlByBOOLBlock byEnabled;
Prop_copy(readonly)JobsRetControlByBOOLBlock bySelected;
Prop_copy(readonly)JobsRetControlByBOOLBlock byHighlighted;
Prop_copy(readonly)JobsRetControlByAlignBlock byContentAlignment;
Prop_copy(readonly)JobsRetControlByHorizontalAlignBlock byContentHorizontalAlignment;
Prop_copy(readonly)JobsRetControlByVerticalAlignBlock byContentVerticalAlignment;
Prop_copy(readonly)JobsRetControlByTargetActionEventsBlock byAddTarget;
Prop_copy(readonly)JobsRetControlByTargetActionEventsBlock byRemoveTarget;
Prop_copy(readonly)JobsRetControlByEventsBlock bySendActions;
Prop_copy(readonly)JobsRetControlByActionEventsBlock byAddAction API_AVAILABLE(ios(14.0));
Prop_copy(readonly)JobsRetControlByActionEventsBlock byRemoveAction API_AVAILABLE(ios(14.0));
Prop_copy(readonly)JobsRetControlByIdentifierEventsBlock byRemoveActionByIdentifier API_AVAILABLE(ios(14.0));
Prop_copy(readonly)JobsRetControlByEventsIdentifierActionHandlerBlock byOn API_AVAILABLE(ios(14.0));
Prop_copy(readonly)JobsRetControlByVoidBlock byPerformPrimaryAction API_AVAILABLE(ios(17.4));
Prop_copy(readonly)JobsRetControlByBOOLBlock byShowsMenuAsPrimaryAction API_AVAILABLE(ios(14.0));
Prop_copy(readonly)JobsRetControlByBOOLBlock byContextMenuEnabled API_AVAILABLE(ios(14.0));
Prop_copy(readonly)JobsRetControlByStringBlock byToolTip API_AVAILABLE(ios(15.0));
Prop_copy(readonly)JobsRetControlByBOOLBlock bySymbolAnimationEnabled API_AVAILABLE(ios(17.0));

@end

NS_ASSUME_NONNULL_END
