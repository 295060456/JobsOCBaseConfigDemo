//
//  LogoContentView.m
//  Shooting
//
//  Created by Jobs on 2020/9/3.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsAppDoorLogoContentView.h"

@interface JobsAppDoorLogoContentView ()

@property(nonatomic,strong)UIImageView *mainImgV;

@end

static dispatch_once_t JobsAppDoorLogoContentViewDispatchOnce;
@implementation JobsAppDoorLogoContentView
#pragma mark - Lifecycle
- (void)dealloc {
    NSLog(@"%@",JobsLocalFunc);
}

-(instancetype)init{
    if (self = [super init]) {
        JobsAppDoorLogoContentViewDispatchOnce = 0;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    dispatch_once(&JobsAppDoorLogoContentViewDispatchOnce, ^{
        self.mainImgV.alpha = 1;
    });
}
#pragma mark —— lazyLoad
-(UIImageView *)mainImgV{
    if (!_mainImgV) {
        _mainImgV = UIImageView.new;
        _mainImgV.image = JobsIMG(@"AppDoorLogo");
        [self addSubview:_mainImgV];
        [_mainImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }return _mainImgV;
}

@end
