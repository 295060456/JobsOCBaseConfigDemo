//
//  BRTextPickerView+Extra.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 11/19/25.
//

#import "BRTextPickerView+Extra.h"

@implementation BRTextPickerView (Extra)

+(JobsReturnBRTextPickerViewByPickerModeBlock _Nonnull)initBy{
    return ^BRTextPickerView *_Nonnull(BRTextPickerMode mode){
        return [BRTextPickerView.alloc initWithPickerMode:mode];
    };
}

@end
