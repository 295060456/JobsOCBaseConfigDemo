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
-(JobsReturnMutableParagraphStyleByCGFloatBlock _Nonnull)byLineSpacing;
-(JobsReturnMutableParagraphStyleByCGFloatBlock _Nonnull)byParagraphSpacing;
-(JobsReturnMutableParagraphStyleByCGFloatBlock _Nonnull)byFirstLineHeadIndent;
-(JobsReturnMutableParagraphStyleByCGFloatBlock _Nonnull)byHeadIndent;
-(JobsReturnMutableParagraphStyleByCGFloatBlock _Nonnull)byTailIndent;
-(JobsReturnMutableParagraphStyleByCGFloatBlock _Nonnull)byMinimumLineHeight;
-(JobsReturnMutableParagraphStyleByCGFloatBlock _Nonnull)byMaximumLineHeight;
-(JobsReturnMutableParagraphStyleByCGFloatBlock _Nonnull)byLineHeightMultiple;
-(JobsReturnMutableParagraphStyleByCGFloatBlock _Nonnull)byParagraphSpacingBefore;
-(JobsReturnMutableParagraphStyleByCGFloatBlock _Nonnull)byDefaultTabInterval;
#pragma mark —— float
-(JobsReturnMutableParagraphStyleByFloatBlock _Nonnull)byHyphenationFactor;
#pragma mark —— BOOL
-(JobsReturnMutableParagraphStyleByBOOLBlock _Nonnull)byAllowsDefaultTighteningForTruncation;
-(JobsReturnMutableParagraphStyleByBOOLBlock _Nonnull)byUsesDefaultHyphenation;
#pragma mark —— Enums
-(JobsReturnMutableParagraphStyleByNSIntegerBlock _Nonnull)byLineBreakMode;
-(JobsReturnMutableParagraphStyleByNSIntegerBlock _Nonnull)byBaseWritingDirection;
-(JobsReturnMutableParagraphStyleByNSUIntegerBlock _Nonnull)byLineBreakStrategy;
#pragma mark —— Arrays
-(JobsReturnMutableParagraphStyleByArrBlock _Nonnull)byTabStops;
-(JobsReturnMutableParagraphStyleByArrBlock _Nonnull)byTextLists;
#pragma mark —— Single object operations
-(JobsReturnMutableParagraphStyleByNSTextTabBlock _Nonnull)byAddTabStop;
-(JobsReturnMutableParagraphStyleByNSTextTabBlock _Nonnull)byRemoveTabStop;
-(JobsReturnMutableParagraphStyleByNSParagraphStyleBlock _Nonnull)bySetParagraphStyle;

@end

NS_ASSUME_NONNULL_END
