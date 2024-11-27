//
//  JobsPostDelView.m
//  DouDong-II
//
//  Created by Jobs on 2021/1/1.
//

#import "JobsPostDelView.h"

@interface JobsPostDelView ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UIImageView *imageView;
/// Data

@end

@implementation JobsPostDelView
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_postDelViewOnceToken = 0;
    static_postDelView = nil;
}

static JobsPostDelView *static_postDelView = nil;
static dispatch_once_t static_postDelViewOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_postDelViewOnceToken, ^{
        static_postDelView = JobsPostDelView.new;
    });return static_postDelView;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        @jobs_weakify(self)
        [self addNotificationName:语言切换
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            @jobs_strongify(self)
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:NSNumber.class]){
                NSNumber *b = notification.object;
                NSLog(@"SSS = %d",b.boolValue);
            }NSLog(@"通知传递过来的 = %@",notification.object);
        }];
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    /// 内部指定圆切角
//    [self appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
//                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(NSNumber *_Nullable model) {
        @jobs_strongify(self)
        self.backgroundColor = JobsRedColor;
        self.imageView.highlighted = model;
        self.imageView.image = model.boolValue ? JobsIMG(@"hx_photo_edit_trash_open") : JobsIMG(@"hx_photo_edit_trash_close");
        self.titleLab.text = model.boolValue ? JobsInternationalization(@"松手即可删除") : JobsInternationalization(@"拖动到此处删除");
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(),JobsBottomSafeAreaHeight() + JobsWidth(50));
    };
}
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGRectByIDBlock _Nonnull)viewFrameByModel{
    return ^CGRect(id _Nullable data){
        return CGRectMake(0,
                          JobsMainScreen_HEIGHT(),
                          JobsPostDelView.viewSizeByModel(nil).width,
                          JobsPostDelView.viewSizeByModel(nil).height);
    };
}
#pragma mark —— lazyLoad
-(UIImageView *)imageView{
    if (!_imageView) {
        @jobs_weakify(self)
        _imageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.image = JobsIMG(@"hx_photo_edit_trash_close");
            self.addSubview(imageView);
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(20), JobsWidth(20)));
                make.centerX.equalTo(self);
                make.top.equalTo(self).offset(JobsWidth(5));
            }];
        });
    }return _imageView;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.backgroundColor = JobsRedColor;
            label.text = JobsInternationalization(@"拖动到此处删除");
            label.textColor = JobsWhiteColor;
            label.textAlignment = NSTextAlignmentCenter;
            [label sizeToFit];
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.imageView.mas_bottom).offset(JobsWidth(5));
                make.centerX.equalTo(self);
            }];
        });
    }return _titleLab;
}

@end
