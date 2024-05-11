//
//  BaseImageView.m
//  KJBannerViewDemo
//
//  Created by 杨科军 on 2021/2/19.
//  Copyright © 2021 杨科军. All rights reserved.
//

#import "BaseImageView.h"

@interface BaseImageView ()

@end

@implementation BaseImageView

-(instancetype)init{
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
    }return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

@end
