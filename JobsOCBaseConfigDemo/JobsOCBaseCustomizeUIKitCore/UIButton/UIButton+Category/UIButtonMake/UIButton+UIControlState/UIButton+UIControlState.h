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
-(JobsReturnImageByNSUIntegerBlock _Nonnull)imageByState;
-(UIImage *_Nullable)imageByNormalState;
-(UIImage *_Nullable)imageByHighlightedState;
-(UIImage *_Nullable)imageByDisabledState;
-(UIImage *_Nullable)imageBySelectedState;
-(UIImage *_Nullable)imageByFocusedState API_AVAILABLE(ios(9.0));
-(UIImage *_Nullable)imageByApplicationState;
-(UIImage *_Nullable)imageByReservedState;
-(JobsReturnButtonByImageBlock _Nonnull)normalStateImageBy;
-(JobsReturnButtonByImageBlock _Nonnull)highlightedStateImageBy;
-(JobsReturnButtonByImageBlock _Nonnull)disabledStateImageBy;
-(JobsReturnButtonByImageBlock _Nonnull)selectedStateImageBy;
-(JobsReturnButtonByImageBlock _Nonnull)focusedStateImageBy API_AVAILABLE(ios(9.0));
-(JobsReturnButtonByImageBlock _Nonnull)applicationStateImageBy;
-(JobsReturnButtonByImageBlock _Nonnull)reservedStateImageBy;
#pragma mark —— UIButton.backgroundImage
-(JobsReturnImageByNSUIntegerBlock _Nonnull)backgroundImageByState;
-(UIImage *_Nullable)backgroundImageByNormalState;
-(UIImage *_Nullable)backgroundImageByHighlightedState;
-(UIImage *_Nullable)backgroundImageByDisabledState;
-(UIImage *_Nullable)backgroundImageBySelectedState;
-(UIImage *_Nullable)backgroundImageByFocusedState API_AVAILABLE(ios(9.0));
-(UIImage *_Nullable)backgroundImageByApplicationState;
-(UIImage *_Nullable)backgroundImageByReservedState;
-(JobsReturnButtonByImageBlock _Nonnull)normalStateBackgroundImageBy;
-(JobsReturnButtonByImageBlock _Nonnull)highlightedStateBackgroundImageBy;
-(JobsReturnButtonByImageBlock _Nonnull)disabledStateBackgroundImageBy;
-(JobsReturnButtonByImageBlock _Nonnull)selectedStateBackgroundImageBy;
-(JobsReturnButtonByImageBlock _Nonnull)focusedStateBackgroundImageBy API_AVAILABLE(ios(9.0));
-(JobsReturnButtonByImageBlock _Nonnull)applicationStateBackgroundImageBy;
-(JobsReturnButtonByImageBlock _Nonnull)reservedStateBackgroundImageBy;
#pragma mark —— UIButton.titleColor
-(JobsReturnColorByNSUIntegerBlock _Nonnull)titleColorByState;
-(UIColor *_Nullable)titleColorByNormalState;
-(UIColor *_Nullable)titleColorByHighlightedState;
-(UIColor *_Nullable)titleColorByDisabledState;
-(UIColor *_Nullable)titleColorBySelectedState;
-(UIColor *_Nullable)titleColorByFocusedState API_AVAILABLE(ios(9.0));
-(UIColor *_Nullable)titleColorByApplicationState;
-(UIColor *_Nullable)titleColorByReservedState;
-(JobsReturnButtonByColorBlock _Nonnull)normalStateTitleColorBy;
-(JobsReturnButtonByColorBlock _Nonnull)highlightedStateTitleColorBy;
-(JobsReturnButtonByColorBlock _Nonnull)disabledStateTitleColorBy;
-(JobsReturnButtonByColorBlock _Nonnull)selectedStateTitleColorBy;
-(JobsReturnButtonByColorBlock _Nonnull)focusedStateTitleColorBy API_AVAILABLE(ios(9.0));
-(JobsReturnButtonByColorBlock _Nonnull)ApplicationStateTitleColorBy;
-(JobsReturnButtonByColorBlock _Nonnull)reservedStateTitleColorBy;
#pragma mark —— UIButton.subtitleColor
/// TODO
#pragma mark —— UIButton.title
-(JobsReturnStringByUIntegerBlock _Nonnull)titleByState;
-(NSString *_Nullable)titleByNormalState;
-(NSString *_Nullable)titleByHighlightedState;
-(NSString *_Nullable)titleByDisabledState;
-(NSString *_Nullable)titleBySelectedState;
-(NSString *_Nullable)titleByFocusedState API_AVAILABLE(ios(9.0));
-(NSString *_Nullable)titleByApplicationState;
-(NSString *_Nullable)titleByReservedState;
-(JobsReturnButtonByStringBlock _Nonnull)normalStateTitleBy;
-(JobsReturnButtonByStringBlock _Nonnull)highlightedStateTitleBy;
-(JobsReturnButtonByStringBlock _Nonnull)disabledStateTitleBy;
-(JobsReturnButtonByStringBlock _Nonnull)selectedStateTitleBy;
-(JobsReturnButtonByStringBlock _Nonnull)focusedStateTitleBy API_AVAILABLE(ios(9.0));
-(JobsReturnButtonByStringBlock _Nonnull)applicationStateTitleBy;
-(JobsReturnButtonByStringBlock _Nonnull)reservedStateTitleBy;
#pragma mark —— UIButton.subtitle
-(NSAttributedString *_Nullable)attributedSubtitle;
#pragma mark —— UIButton.attributedTitle
-(NSAttributedString *_Nullable)attributedTitle;
-(JobsReturnAttributedStringByNSUIntegerBlock _Nonnull)attributedTitleByState;
-(NSAttributedString *_Nullable)attributedTitleByNormalState;
-(NSAttributedString *_Nullable)attributedTitleByHighlightedState;
-(NSAttributedString *_Nullable)attributedTitleByDisabledState;
-(NSAttributedString *_Nullable)attributedTitleBySelectedState;
-(NSAttributedString *_Nullable)attributedTitleByFocusedState API_AVAILABLE(ios(9.0));
-(NSAttributedString *_Nullable)attributedTitleByApplicationState;
-(NSAttributedString *_Nullable)attributedTitleByReservedState;
-(JobsReturnButtonByAttributedStringBlock _Nonnull)selectedAttributedTitleBy;
-(JobsReturnButtonByAttributedStringBlock _Nonnull)normalStateAttributedTitleBy;
-(JobsReturnButtonByAttributedStringBlock _Nonnull)highlightedStateAttributedTitleBy;
-(JobsReturnButtonByAttributedStringBlock _Nonnull)disabledStateAttributedTitleBy;
-(JobsReturnButtonByAttributedStringBlock _Nonnull)selectedStateAttributedTitleBy;
-(JobsReturnButtonByAttributedStringBlock _Nonnull)focusedStateAttributedTitleBy API_AVAILABLE(ios(9.0));
-(JobsReturnButtonByAttributedStringBlock _Nonnull)applicationStateAttributedTitleBy;
-(JobsReturnButtonByAttributedStringBlock _Nonnull)reservedStateAttributedTitleBy;
#pragma mark —— UIButton.attributedSubtitle
/// TODO
@end

NS_ASSUME_NONNULL_END
