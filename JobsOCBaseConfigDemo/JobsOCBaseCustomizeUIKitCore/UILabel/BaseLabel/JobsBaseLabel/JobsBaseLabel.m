//
//  JobsBaseLabel.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/20.
//

#import "JobsBaseLabel.h"

@interface JobsBaseLabel ()
/// UI
@property(nonatomic,strong)UIImageView *bgImageView;
@property(nonatomic,strong)BaseLabel *label;
/// Data
@property(nonatomic,assign)CGRect thisFrame;

@end

@implementation JobsBaseLabel

@synthesize viewModel = _viewModel;

#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_baseLabelOnceToken = 0;
    static_baseLabel = nil;
}

static JobsBaseLabel *static_baseLabel = nil;
static dispatch_once_t static_baseLabelOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_baseLabelOnceToken, ^{
        static_baseLabel = JobsBaseLabel.new;
    });return static_baseLabel;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsClearColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.thisFrame = frame;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— 一些公有方法
-(UIImageView *)getBgImageView{
    return _bgImageView;
}

-(BaseLabel *)getLabel{
    return _label;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model ? : UIViewModel.new;
        MakeDataNull
        self.bgImageView.alpha = 1;
        self.label.alpha = 1;
    };
}
#pragma mark —— lazyLoad
-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        @jobs_weakify(self)
        _bgImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            self.addSubview(imageView);
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
        });
    }return _bgImageView;
}

-(BaseLabel *)label{
    if (!_label) {
        @jobs_weakify(self)
        _label = jobsMakeBaseLabel(^(__kindof BaseLabel * _Nullable label) {
            @jobs_strongify(self)
            self.bgImageView.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
            
            [label actionReturnIDByGestureRecognizerBlock:^id(UIGestureRecognizer *data) {
                NSLog(@"JobsBaseLabel的Tap手势");
                return @1;
            }];
            
            [label actionReturnIDByGestureRecognizerBlock:^id(UIGestureRecognizer *data) {
                NSLog(@"JobsBaseLabel的LongPress手势");
                return @1;
            }];
        });
    }return _label;
}

@end
