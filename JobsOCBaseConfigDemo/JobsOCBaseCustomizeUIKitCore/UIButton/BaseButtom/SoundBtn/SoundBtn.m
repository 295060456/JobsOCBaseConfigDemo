//
//  SoundBtn.m
//  JinXian Finance
//
//  Created by Jobs on 2017/6/6.
//  Copyright © 2017年 Jobs. All rights reserved.
//

#import "SoundBtn.h"

@interface SoundBtn (){

}

@end

@implementation SoundBtn

-(instancetype)init{
    if (self = [super init]) {
        self.uxy_acceptEventInterval = 0.5f;
    }return self;
}

- (void)touchesBegan:(NSSet *)touches
           withEvent:(UIEvent*)event{
    [NSObject playSoundEffect:@"Sound"
                          type:@"wav"];
    [super touchesBegan:touches
              withEvent:event];
}

@end
