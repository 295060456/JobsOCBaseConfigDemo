//
//  BRStringPickerView+Extra.m
//  FM
//
//  Created by Admin on 26/11/2024.
//

#import "BRStringPickerView+Extra.h"

@implementation BRStringPickerView (Extra)

+(JobsReturnBRStringPickerViewByPickerModeBlock _Nonnull)initBy{
    return ^BRStringPickerView *_Nonnull(BRStringPickerMode mode){
        return [BRStringPickerView.alloc initWithPickerMode:mode];
    };
}

@end
