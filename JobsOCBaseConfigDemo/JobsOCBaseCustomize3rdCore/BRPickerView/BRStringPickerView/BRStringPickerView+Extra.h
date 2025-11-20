//
//  BRStringPickerView+Extra.h
//  FM
//
//  Created by Admin on 26/11/2024.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

#if __has_include(<BRPickerView/BRPickerView.h>)
#import <BRPickerView/BRPickerView.h>
#else
#import "BRPickerView.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// Use 'BRTextPickerView' instead.
@interface BRStringPickerView (Extra)

+(JobsReturnBRStringPickerViewByPickerModeBlock _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END
