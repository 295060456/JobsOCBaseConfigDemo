//
//  NoticePopupView.m
//  UBallLive
//
//  Created by Jobs on 2020/10/26.
//

#import "JobsNoticePopupView.h"

@interface JobsNoticePopupView ()

@end

@implementation JobsNoticePopupView

-(instancetype)init{
    if (self = [super init]) {
        
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
//外层数据渲染
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model ? : UIViewModel.new;
        MakeDataNull
        self.imageView.alpha = 1;
    };
}
@synthesize imageView = _imageView;
-(UIImageView *)imageView{
    if (!_imageView) {
        @jobs_weakify(self)
        _imageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.image = @"登录弹窗".img;

            {
                imageView.numberOfTouchesRequired = 1;
                imageView.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
                imageView.minimumPressDuration = 0.1;
                imageView.numberOfTouchesRequired = 1;
                imageView.allowableMovement = 1;
                imageView.userInteractionEnabled = YES;
                imageView.weak_target = self;
                imageView.tapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                                        UITapGestureRecognizer *_Nullable arg) {
                    return nil;
                }];
                imageView.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
            }
            [self.addSubview(imageView) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
        });
    }return _imageView;
}

@end
