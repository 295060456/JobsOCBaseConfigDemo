//
//  NSMutableParagraphStyle+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/3/25.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableParagraphStyle (DSL)
#pragma mark —— CGFloat
-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byLineSpacing;
-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byParagraphSpacing;
-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byFirstLineHeadIndent;
-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byHeadIndent;
-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byTailIndent;
-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byMinimumLineHeight;
-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byMaximumLineHeight;
-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byLineHeightMultiple;
-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byParagraphSpacingBefore;
-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byDefaultTabInterval;
#pragma mark —— float
-(JobsRetMutableParagraphStyleByFloatBlock _Nonnull)byHyphenationFactor;
#pragma mark —— BOOL
-(JobsRetMutableParagraphStyleByBOOLBlock _Nonnull)byAllowsDefaultTighteningForTruncation;
-(JobsRetMutableParagraphStyleByBOOLBlock _Nonnull)byUsesDefaultHyphenation;
#pragma mark —— Enums
-(JobsRetMutableParagraphStyleByNSIntegerBlock _Nonnull)byLineBreakMode;
-(JobsRetMutableParagraphStyleByNSIntegerBlock _Nonnull)byBaseWritingDirection;
-(JobsRetMutableParagraphStyleByNSUIntegerBlock _Nonnull)byLineBreakStrategy;
#pragma mark —— Arrays
-(JobsRetMutableParagraphStyleByArrBlock _Nonnull)byTabStops;
-(JobsRetMutableParagraphStyleByArrBlock _Nonnull)byTextLists;
#pragma mark —— Single object operations
-(JobsRetMutableParagraphStyleByNSTextTabBlock _Nonnull)byAddTabStop;
-(JobsRetMutableParagraphStyleByNSTextTabBlock _Nonnull)byRemoveTabStop;
-(JobsRetMutableParagraphStyleByNSParagraphStyleBlock _Nonnull)bySetParagraphStyle;

@end

NS_ASSUME_NONNULL_END
