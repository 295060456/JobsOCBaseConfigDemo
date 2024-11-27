//
//  BRStringPickerView+Extra.h
//  FM
//
//  Created by Admin on 26/11/2024.
//

#if __has_include(<BRPickerView/BRPickerView.h>)
#import <BRPickerView/BRPickerView.h>
#else
#import "BRPickerView.h"
#endif

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface BRStringPickerView (Extra)

+(JobsReturnBRStringPickerViewByPickerModeBlock _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END
