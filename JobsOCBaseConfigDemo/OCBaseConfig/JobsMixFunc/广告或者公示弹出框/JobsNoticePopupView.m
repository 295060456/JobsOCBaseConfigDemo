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
-(void)richElementsInViewWithModel:(id _Nullable)model{
    self.viewModel = model ? : UIViewModel.new;
    MakeDataNull
    self.imageView.alpha = 1;
}

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = UIImageView.new;
        _imageView.image = JobsIMG(@"登录弹窗");

        {
            _imageView.numberOfTouchesRequired = 1;
            _imageView.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
            _imageView.minimumPressDuration = 0.1;
            _imageView.numberOfTouchesRequired = 1;
            _imageView.allowableMovement = 1;
            _imageView.userInteractionEnabled = YES;
            _imageView.target = self;
            @jobs_weakify(self)
            _imageView.tapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                                     UITapGestureRecognizer *_Nullable arg) {
                @jobs_strongify(self)
                NSLog(@"%@",NSObject.makeNoticePopupView);
                [NSObject.makeNoticePopupView tf_hide];
                return nil;
            }];
            _imageView.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
        }
        
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }return _imageView;
}

@end
