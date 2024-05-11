//
//  JobsAppDoorModel.m
//  Casino
//
//  Created by Jobs on 2021/12/2.
//

#import "JobsAppDoorModel.h"

@implementation JobsAppDoorModel

-(NSString *)userName{
    if (!_userName) {
        _userName = self.readUserNameMutArr[0];
    }return _userName;
}

@end
