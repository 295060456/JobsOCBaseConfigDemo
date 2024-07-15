//
//  JobsAppDoorInputViewBaseStyle.m
//  My_BaseProj
//
//  Created by Jobs on 2020/12/4.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsAppDoorInputViewBaseStyle.h"

@implementation JobsAppDoorInputViewTFModel

-(NSString *)PlaceHolder{
    if (!_PlaceHolder) {
        _PlaceHolder = JobsInternationalization(@"");
    }return _PlaceHolder;
}

-(NSString *)resString{
    if (!_resString) {
        _resString = JobsInternationalization(@"");
    }return _resString;
}

@end

@interface JobsAppDoorInputViewBaseStyle ()
@end

@implementation JobsAppDoorInputViewBaseStyle

-(JobsAppDoorInputViewTFModel *)textFieldInputModel{
    if (!_textFieldInputModel) {
        _textFieldInputModel = JobsAppDoorInputViewTFModel.new;
        _textFieldInputModel.resString = JobsInternationalization(@"");
        _textFieldInputModel.PlaceHolder = self.getTextField.placeholder;
    }return _textFieldInputModel;
}

@end


