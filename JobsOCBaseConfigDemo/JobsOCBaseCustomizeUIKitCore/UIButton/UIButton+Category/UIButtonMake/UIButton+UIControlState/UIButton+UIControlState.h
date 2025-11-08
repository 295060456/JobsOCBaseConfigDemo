//
//  UIButton+UIControlState.h
//  FM
//
//  Created by Admin on 10/12/2024.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (UIControlState)
#pragma mark —— UIButton.image
-(JobsRetImageByNSUIntegerBlock _Nonnull)imageByState;
-(UIImage *_Nullable)imageByNormalState;
-(UIImage *_Nullable)imageByHighlightedState;
-(UIImage *_Nullable)imageByDisabledState;
-(UIImage *_Nullable)imageBySelectedState;
-(UIImage *_Nullable)imageByFocusedState API_AVAILABLE(ios(9.0));
-(UIImage *_Nullable)imageByApplicationState;
-(UIImage *_Nullable)imageByReservedState;
-(JobsRetBtnByImageBlock _Nonnull)normalStateImageBy;
-(JobsRetBtnByImageBlock _Nonnull)highlightedStateImageBy;
-(JobsRetBtnByImageBlock _Nonnull)disabledStateImageBy;
-(JobsRetBtnByImageBlock _Nonnull)selectedStateImageBy;
-(JobsRetBtnByImageBlock _Nonnull)focusedStateImageBy API_AVAILABLE(ios(9.0));
-(JobsRetBtnByImageBlock _Nonnull)applicationStateImageBy;
-(JobsRetBtnByImageBlock _Nonnull)reservedStateImageBy;
#pragma mark —— UIButton.backgroundImage
-(JobsRetImageByNSUIntegerBlock _Nonnull)backgroundImageByState;
-(UIImage *_Nullable)backgroundImageByNormalState;
-(UIImage *_Nullable)backgroundImageByHighlightedState;
-(UIImage *_Nullable)backgroundImageByDisabledState;
-(UIImage *_Nullable)backgroundImageBySelectedState;
-(UIImage *_Nullable)backgroundImageByFocusedState API_AVAILABLE(ios(9.0));
-(UIImage *_Nullable)backgroundImageByApplicationState;
-(UIImage *_Nullable)backgroundImageByReservedState;
-(JobsRetBtnByImageBlock _Nonnull)normalStateBackgroundImageBy;
-(JobsRetBtnByImageBlock _Nonnull)highlightedStateBackgroundImageBy;
-(JobsRetBtnByImageBlock _Nonnull)disabledStateBackgroundImageBy;
-(JobsRetBtnByImageBlock _Nonnull)selectedStateBackgroundImageBy;
-(JobsRetBtnByImageBlock _Nonnull)focusedStateBackgroundImageBy API_AVAILABLE(ios(9.0));
-(JobsRetBtnByImageBlock _Nonnull)applicationStateBackgroundImageBy;
-(JobsRetBtnByImageBlock _Nonnull)reservedStateBackgroundImageBy;
#pragma mark —— UIButton.titleColor
-(JobsRetCorByNSUIntegerBlock _Nonnull)titleColorByState;
-(UIColor *_Nullable)titleColorByNormalState;
-(UIColor *_Nullable)titleColorByHighlightedState;
-(UIColor *_Nullable)titleColorByDisabledState;
-(UIColor *_Nullable)titleColorBySelectedState;
-(UIColor *_Nullable)titleColorByFocusedState API_AVAILABLE(ios(9.0));
-(UIColor *_Nullable)titleColorByApplicationState;
-(UIColor *_Nullable)titleColorByReservedState;
-(JobsRetBtnByCorBlock _Nonnull)normalStateTitleColorBy;
-(JobsRetBtnByCorBlock _Nonnull)highlightedStateTitleColorBy;
-(JobsRetBtnByCorBlock _Nonnull)disabledStateTitleColorBy;
-(JobsRetBtnByCorBlock _Nonnull)selectedStateTitleColorBy;
-(JobsRetBtnByCorBlock _Nonnull)focusedStateTitleColorBy API_AVAILABLE(ios(9.0));
-(JobsRetBtnByCorBlock _Nonnull)ApplicationStateTitleColorBy;
-(JobsRetBtnByCorBlock _Nonnull)reservedStateTitleColorBy;
#pragma mark —— UIButton.subtitleColor
/// TODO
#pragma mark —— UIButton.title
-(JobsRetStringByUIntegerBlock _Nonnull)titleByState;
-(NSString *_Nullable)titleByNormalState;
-(NSString *_Nullable)titleByHighlightedState;
-(NSString *_Nullable)titleByDisabledState;
-(NSString *_Nullable)titleBySelectedState;
-(NSString *_Nullable)titleByFocusedState API_AVAILABLE(ios(9.0));
-(NSString *_Nullable)titleByApplicationState;
-(NSString *_Nullable)titleByReservedState;
-(JobsRetBtnByStringBlock _Nonnull)normalStateTitleBy;
-(JobsRetBtnByStringBlock _Nonnull)highlightedStateTitleBy;
-(JobsRetBtnByStringBlock _Nonnull)disabledStateTitleBy;
-(JobsRetBtnByStringBlock _Nonnull)selectedStateTitleBy;
-(JobsRetBtnByStringBlock _Nonnull)focusedStateTitleBy API_AVAILABLE(ios(9.0));
-(JobsRetBtnByStringBlock _Nonnull)applicationStateTitleBy;
-(JobsRetBtnByStringBlock _Nonnull)reservedStateTitleBy;
#pragma mark —— UIButton.subtitle
-(NSAttributedString *_Nullable)attributedSubtitle;
#pragma mark —— UIButton.attributedTitle
-(NSAttributedString *_Nullable)attributedTitle;
-(JobsRetAttributedStringByNSUIntegerBlock _Nonnull)attributedTitleByState;
-(NSAttributedString *_Nullable)attributedTitleByNormalState;
-(NSAttributedString *_Nullable)attributedTitleByHighlightedState;
-(NSAttributedString *_Nullable)attributedTitleByDisabledState;
-(NSAttributedString *_Nullable)attributedTitleBySelectedState;
-(NSAttributedString *_Nullable)attributedTitleByFocusedState API_AVAILABLE(ios(9.0));
-(NSAttributedString *_Nullable)attributedTitleByApplicationState;
-(NSAttributedString *_Nullable)attributedTitleByReservedState;
-(JobsRetBtnByAttributedStringBlock _Nonnull)selectedAttributedTitleBy;
-(JobsRetBtnByAttributedStringBlock _Nonnull)normalStateAttributedTitleBy;
-(JobsRetBtnByAttributedStringBlock _Nonnull)highlightedStateAttributedTitleBy;
-(JobsRetBtnByAttributedStringBlock _Nonnull)disabledStateAttributedTitleBy;
-(JobsRetBtnByAttributedStringBlock _Nonnull)selectedStateAttributedTitleBy;
-(JobsRetBtnByAttributedStringBlock _Nonnull)focusedStateAttributedTitleBy API_AVAILABLE(ios(9.0));
-(JobsRetBtnByAttributedStringBlock _Nonnull)applicationStateAttributedTitleBy;
-(JobsRetBtnByAttributedStringBlock _Nonnull)reservedStateAttributedTitleBy;
#pragma mark —— UIButton.attributedSubtitle
/// TODO
@end

NS_ASSUME_NONNULL_END
