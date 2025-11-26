//
//  MSMineView2.m
//  MataShop
//
//  Created by Jobs Hi on 9/23/23.
//

#import "MSMineView2.h"

@interface MSMineView2 ()
/// UI
Prop_strong()BaseButton *btn1;
Prop_strong()BaseButton *btn2;

@end

@implementation MSMineView2
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_mineView2OnceToken = 0;
    static_mineView2 = nil;
}

static MSMineView2 *static_mineView2 = nil;
static dispatch_once_t static_mineView2OnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_mineView2OnceToken, ^{
        static_mineView2 = MSMineView2.new;
    });return static_mineView2;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        @jobs_weakify(self)
        [self addNotificationName:语言切换
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
//            @jobs_strongify(self)
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:NSNumber.class]){
                NSNumber *b = notification.object;
                JobsLog(@"SSS = %d",b.boolValue);
            }JobsLog(@"通知传递过来的 = %@",notification.object);
        }];
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.backgroundColor = @"#F0F0EF".cor;
        self.btn1.alpha = 1;
        self.btn2.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(355), JobsWidth(36));
    };
}
#pragma mark —— lazyLoad
-(BaseButton *)btn1{
    @jobs_weakify(self)
    if(!_btn1){
        _btn1 = BaseButton.initByStyleLeft(@"入职Mata".tr,
                                           UIFontWeightRegularSize(14),
                                           JobsBlackColor,
                                           @"入职Mata".img,
                                           JobsWidth(10))
            .bgColorBy(JobsWhiteColor)
            .cornerRadiusValueBy(JobsWidth(8))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        [self addSubview:_btn1];
        [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(105), JobsWidth(16)));
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(JobsWidth(6));
        }];
    }return _btn1;
}

-(UIButton *)btn2{
    if(!_btn2){
        @jobs_weakify(self)
        _btn2 = BaseButton.initByStyle1(@"立即进入".tr,
                                                     UIFontWeightRegularSize(14),
                                                     JobsWhiteColor)
            .bgColorBy(@"#EA2918".cor)
            .cornerRadiusValueBy(JobsWidth(14))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        [self addSubview:_btn2];
        [_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(88), JobsWidth(28)));
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(JobsWidth(-5));
        }];
    }return _btn2;
}

@end
