//
//  JobsDecorationModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Admin on 20/11/2024.
//

#import "JobsDecorationModel.h"

@implementation JobsDecorationModel
/// 主标题
-(NSString *)title{
    if(!_title){
        _title = @"";
    }return _title;
}
/// 副标题
-(NSString *)subTitle{
    if (!_subTitle) {
        _subTitle = @"";
    }return _subTitle;
}

@end
