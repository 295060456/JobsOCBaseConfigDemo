//
//  JobsLaunchVC.m
//  FMOnlyH5
//
//  Created by Admin on 3/4/2025.
//

#import "JobsLaunchVC.h"

@interface JobsLaunchVC ()

Prop_strong()UIImageView *launchImageView;

@end

@implementation JobsLaunchVC

-(void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
}
/// new方法触发
- (instancetype)init{
    if (self = [super init]) {
        
    }return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = JobsRedColor;
    self.launchImageView.alpha = 1;
    self.switchBy(2);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}
#pragma mark —— 一些私有方法
-(jobsByCGFloatBlock)switchBy{
    return ^(CGFloat time){
        if(time <= 0) time = 2.0f;
        @jobs_weakify(self)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                     (int64_t)(time * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
//            self.switchToMainVC(FMHomeWebVC.new.navCtrl);
            self.switchToMainVC(AppDelegate.jobsCustomTabBarNavCtrl);
        });
    };
}
#pragma mark —— Lazyload
-(UIImageView *)launchImageView{
    if(!_launchImageView){
        @jobs_weakify(self)
        _launchImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.frame = self.view.bounds;
            imageView.image = @"BSport".img;
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            self.view.addSubview(imageView);
        });
    }return _launchImageView;
}

@end
