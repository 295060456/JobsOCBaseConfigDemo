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
-(JobsReturnButtonByImageBlock _Nonnull)normalStateImage;
-(JobsReturnButtonByImageBlock _Nonnull)highlightedStateImage;
-(JobsReturnButtonByImageBlock _Nonnull)disabledStateImage;
-(JobsReturnButtonByImageBlock _Nonnull)selectedStateImage;
-(JobsReturnButtonByImageBlock _Nonnull)focusedStateImage API_AVAILABLE(ios(9.0));
-(JobsReturnButtonByImageBlock _Nonnull)applicationStateImage;
-(JobsReturnButtonByImageBlock _Nonnull)reservedStateImage;
#pragma mark —— UIButton.backgroundImage
-(JobsReturnImageByNSUIntegerBlock _Nonnull)backgroundImageByState;
-(UIImage *_Nullable)backgroundImageByNormalState;
-(UIImage *_Nullable)backgroundImageByHighlightedState;
-(UIImage *_Nullable)backgroundImageByDisabledState;
-(UIImage *_Nullable)backgroundImageBySelectedState;
-(UIImage *_Nullable)backgroundImageByFocusedState API_AVAILABLE(ios(9.0));
-(UIImage *_Nullable)backgroundImageByApplicationState;
-(UIImage *_Nullable)backgroundImageByReservedState;
-(JobsReturnButtonByImageBlock _Nonnull)normalStateBackgroundImage;
-(JobsReturnButtonByImageBlock _Nonnull)highlightedStateBackgroundImage;
-(JobsReturnButtonByImageBlock _Nonnull)disabledStateBackgroundImage;
-(JobsReturnButtonByImageBlock _Nonnull)selectedStateBackgroundImage;
-(JobsReturnButtonByImageBlock _Nonnull)focusedStateBackgroundImage API_AVAILABLE(ios(9.0));
-(JobsReturnButtonByImageBlock _Nonnull)applicationStateBackgroundImage;
-(JobsReturnButtonByImageBlock _Nonnull)reservedStateBackgroundImage;
#pragma mark —— UIButton.titleColor
-(JobsReturnColorByNSUIntegerBlock _Nonnull)titleColorByState;
-(UIColor *_Nullable)titleColorByNormalState;
-(UIColor *_Nullable)titleColorByHighlightedState;
-(UIColor *_Nullable)titleColorByDisabledState;
-(UIColor *_Nullable)titleColorBySelectedState;
-(UIColor *_Nullable)titleColorByFocusedState API_AVAILABLE(ios(9.0));
-(UIColor *_Nullable)titleColorByApplicationState;
-(UIColor *_Nullable)titleColorByReservedState;
-(JobsReturnButtonByColorBlock _Nonnull)normalStateTitleColor;
-(JobsReturnButtonByColorBlock _Nonnull)highlightedStateTitleColor;
-(JobsReturnButtonByColorBlock _Nonnull)disabledStateTitleColor;
-(JobsReturnButtonByColorBlock _Nonnull)selectedStateTitleColor;
-(JobsReturnButtonByColorBlock _Nonnull)focusedStateTitleColor API_AVAILABLE(ios(9.0));
-(JobsReturnButtonByColorBlock _Nonnull)ApplicationStateTitleColor;
-(JobsReturnButtonByColorBlock _Nonnull)reservedStateTitleColor;
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
-(JobsReturnButtonByStringBlock _Nonnull)normalStateTitle;
-(JobsReturnButtonByStringBlock _Nonnull)highlightedStateTitle;
-(JobsReturnButtonByStringBlock _Nonnull)disabledStateTitle;
-(JobsReturnButtonByStringBlock _Nonnull)selectedStateTitle;
-(JobsReturnButtonByStringBlock _Nonnull)focusedStateTitle API_AVAILABLE(ios(9.0));
-(JobsReturnButtonByStringBlock _Nonnull)applicationStateTitle;
-(JobsReturnButtonByStringBlock _Nonnull)reservedStateTitle;
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
-(JobsReturnButtonByAttributedStringBlock _Nonnull)selectedAttributedTitle;
-(JobsReturnButtonByAttributedStringBlock _Nonnull)normalStateAttributedTitle;
-(JobsReturnButtonByAttributedStringBlock _Nonnull)highlightedStateAttributedTitle;
-(JobsReturnButtonByAttributedStringBlock _Nonnull)disabledStateAttributedTitle;
-(JobsReturnButtonByAttributedStringBlock _Nonnull)selectedStateAttributedTitle;
-(JobsReturnButtonByAttributedStringBlock _Nonnull)focusedStateAttributedTitle API_AVAILABLE(ios(9.0));
-(JobsReturnButtonByAttributedStringBlock _Nonnull)applicationStateAttributedTitle;
-(JobsReturnButtonByAttributedStringBlock _Nonnull)reservedStateAttributedTitle;
#pragma mark —— UIButton.attributedSubtitle
/// TODO
@end

NS_ASSUME_NONNULL_END
