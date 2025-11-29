//
//  SlideToUnlockDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 11/29/25.
//

#import "SlideToUnlockDemoVC.h"

@interface SlideToUnlockDemoVC ()

Prop_strong()SlideToUnlockView *slideView;

@end

@implementation SlideToUnlockDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsBlueColor;
    self.slideView.byVisible(YES);
}

-(SlideToUnlockView *)slideView{
    if (!_slideView) {
        @jobs_weakify(self)
        _slideView = jobsMakeSlideToUnlockView(^(__kindof SlideToUnlockView * _Nullable view) {
            view.backgroundColor = JobsClearColor;
            view.byOnUnlock(^{
                @jobs_strongify(self)
                NSLog(@"✅ 已滑到最右侧，执行解锁 block");
                self.goBack(nil);
            })
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.center.equalTo(self.view);
                make.width.mas_equalTo(260);
                make.height.mas_equalTo(56);
            });
        });
    }return _slideView;
}

@end
