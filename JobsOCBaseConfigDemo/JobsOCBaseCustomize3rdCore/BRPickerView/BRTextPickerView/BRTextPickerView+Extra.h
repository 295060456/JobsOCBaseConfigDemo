//
//  BRTextPickerView+Extra.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 11/19/25.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

#if __has_include(<BRPickerView/BRPickerView.h>)
#import <BRPickerView/BRPickerView.h>
#else
#import "BRPickerView.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface BRTextPickerView (Extra)

+(JobsReturnBRTextPickerViewByPickerModeBlock _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END
