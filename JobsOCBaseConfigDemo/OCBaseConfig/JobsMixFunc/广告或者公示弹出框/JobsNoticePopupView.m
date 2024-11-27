//
//  NoticePopupView.m
//  UBallLive
//
//  Created by Jobs on 2020/10/26.
//

#import "JobsNoticePopupView.h"

@interface JobsNoticePopupView ()

@property(nonatomic,strong)UIImageView *imageView;

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

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView.image = JobsIMG(@"登录弹窗");

            {
                imageView.numberOfTouchesRequired = 1;
                imageView.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
                imageView.minimumPressDuration = 0.1;
                imageView.numberOfTouchesRequired = 1;
                imageView.allowableMovement = 1;
                imageView.userInteractionEnabled = YES;
                imageView.target = self;
                @jobs_weakify(self)
                imageView.tapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                                        UITapGestureRecognizer *_Nullable arg) {
                    @jobs_strongify(self)
                    NSLog(@"%@",self.noticePopupView);
                    [self.noticePopupView tf_hide:nil];
                    return nil;
                }];
                imageView.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
            }
            
            self.addSubview(imageView);
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
        });
    }return _imageView;
}

@end
