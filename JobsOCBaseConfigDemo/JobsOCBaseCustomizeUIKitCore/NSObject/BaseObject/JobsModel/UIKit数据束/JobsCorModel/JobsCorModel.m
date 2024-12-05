//
//  JobsCorModel.m
//  FM
//
//  Created by Admin on 4/11/2024.
//

#import "JobsCorModel.h"

@implementation JobsCorModel

-(NSString *)corStr{
    if(!_corStr){
        _corStr = [NSString stringWithFormat:@"#%02X%02X%02X",
                   (int)(self.red * 255),
                   (int)(self.green * 255),
                   (int)(self.blue * 255)];
    }return _corStr;
}

@end
