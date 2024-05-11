//
//  JobsIMChatInfoModel.m
//  JobsIM
//
//  Created by Jobs on 2020/11/10.
//

#import "JobsIMChatInfoModel.h"

@implementation JobsIMChatInfoModel

-(NSString *)identification{
    if (!_identification) {
        _identification = @"我是我自己";
    }return _identification;
}

@end
