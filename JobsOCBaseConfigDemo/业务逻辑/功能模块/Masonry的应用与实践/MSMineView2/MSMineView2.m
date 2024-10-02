//
//  MSMineView2.m
//  MataShop
//
//  Created by Jobs Hi on 9/23/23.
//

#import "MSMineView2.h"

@interface MSMineView2 ()
/// UI
@property(nonatomic,strong)BaseButton *btn1;
@property(nonatomic,strong)BaseButton *btn2;

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
        self.backgroundColor = JobsCor(@"#F0F0EF");
        self.btn1.alpha = 1;
        self.btn2.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(355), JobsWidth(36));
    };
}
#pragma mark —— lazyLoad
-(BaseButton *)btn1{
    @jobs_weakify(self)
    if(!_btn1){
        _btn1 = BaseButton.initByStyleLeft(JobsInternationalization(@"入职Mata"),
                                           UIFontWeightRegularSize(14),
                                           JobsBlackColor,
                                           JobsIMG(@"入职Mata"),
                                           NSDirectionalRectEdgeNone,
                                           JobsWidth(10))
            .bgColor(JobsWhiteColor)
            .cornerRadiusValue(JobsWidth(8))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
            }).onLongPressGesture(^(id data){
                NSLog(@"");
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
        _btn2 = BaseButton.initByStyle1(JobsInternationalization(@"立即进入"),
                                                     UIFontWeightRegularSize(14),
                                                     JobsWhiteColor)
            .bgColor(JobsCor(@"#EA2918"))
            .cornerRadiusValue(JobsWidth(14))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
            }).onLongPressGesture(^(id data){
                NSLog(@"");
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
