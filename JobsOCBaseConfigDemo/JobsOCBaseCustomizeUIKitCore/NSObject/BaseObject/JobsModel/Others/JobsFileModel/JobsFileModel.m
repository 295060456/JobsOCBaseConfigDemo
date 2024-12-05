//
//  JobsFileModel.m
//  FM
//
//  Created by Admin on 5/12/2024.
//

#import "JobsFileModel.h"

@implementation JobsFileModel

-(NSString *)fileName{
    if(!_fileName){
        _fileName = self.currentDate.toReadableTime(nil);
    }return _fileName;
}

@end
