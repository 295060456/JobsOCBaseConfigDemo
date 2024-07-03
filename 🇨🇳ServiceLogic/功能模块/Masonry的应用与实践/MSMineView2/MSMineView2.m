//
//  MSMineView2.m
//  MataShop
//
//  Created by Jobs Hi on 9/23/23.
//

#import "MSMineView2.h"

@interface MSMineView2 ()
/// UI
@property(nonatomic,strong)UIButton *btn1;
@property(nonatomic,strong)UIButton *btn2;
/// Data
@property(nonatomic,strong)UIButtonConfiguration *btnConfig;

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
+(instancetype)sharedInstance{
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
        @jobs_weakify(self)
        JobsAddNotification(self,
                        selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                  id _Nullable arg){
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:NSNumber.class]){
                NSNumber *b = notification.object;
                NSLog(@"SSS = %d",b.boolValue);
            }
            @jobs_strongify(self)
            NSLog(@"通知传递过来的 = %@",notification.object);
            [self languageSwitchNotification:notification];
            return nil;
        },nil, self),LanguageSwitchNotification,nil);
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
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.backgroundColor = JobsCor(@"#F0F0EF");
    self.btn1.alpha = 1;
    self.btn2.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(355), JobsWidth(36));
}
#pragma mark —— lazyLoad
-(UIButtonConfiguration *)btnConfig{
    if(!_btnConfig){
        _btnConfig = UIButtonConfiguration.plainButtonConfiguration;
        {// 图片
            _btnConfig.image = JobsIMG(@"入职Mata"); // 替换为你的图像名称
            _btnConfig.imagePlacement = NSDirectionalRectEdgeLeading;// 这里将图像放置在标题的前面
            _btnConfig.imagePadding = 10;// 设置图像与标题之间的间距
        }
        
        {// 一般的文字
            _btnConfig.title = JobsInternationalization(@"入职Mata");
            _btnConfig.subtitle = @"";
            _btnConfig.baseForegroundColor = UIColor.blackColor;// 前景颜色（= 文字颜色）
        }
        
        {// 富文本
            // 设置按钮标题的文本属性
            _btnConfig.titleTextAttributesTransformer = ^NSDictionary<NSAttributedStringKey, id> *(NSDictionary<NSAttributedStringKey, id> *textAttributes) {
                NSMutableDictionary<NSAttributedStringKey, id> *newTextAttributes = textAttributes.mutableCopy;
                [newTextAttributes addEntriesFromDictionary:@{
                    NSFontAttributeName:UIFontWeightRegularSize(14), // 替换为你想要的字体和大小
                    NSForegroundColorAttributeName: UIColor.blackColor // 替换为你想要的文本颜色
                }];
                return newTextAttributes.copy;
            };
            _btnConfig.attributedTitle = [NSAttributedString.alloc initWithString:JobsInternationalization(@"入职Mata") attributes:@{NSForegroundColorAttributeName:UIColor.blackColor}];
        }
        
        {// 其他
            _btnConfig.baseBackgroundColor = UIColor.whiteColor;// 背景颜色
            _btnConfig.contentInsets = NSDirectionalEdgeInsetsMake(0, 0, 0, 0); // 内边距
        }
    }return _btnConfig;
}

-(UIButton *)btn1{
    if(!_btn1){
        if(self.deviceSystemVersion.floatValue >= 15.0){
            _btn1 = [UIButton buttonWithConfiguration:self.btnConfig primaryAction:nil];
        }else{
            _btn1 = UIButton.new;
            _btn1.normalImage = JobsIMG(@"入职Mata");
            _btn1.titleFont = UIFontWeightRegularSize(14);
            _btn1.normalTitle = JobsInternationalization(@"入职Mata");
            _btn1.normalTitleColor = JobsBlackColor;
        }
        // 添加按钮到视图中
        [self addSubview:_btn1];
        [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(105), JobsWidth(16)));
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(JobsWidth(6));
        }];
        if(self.deviceSystemVersion.floatValue < 15.0){
            [_btn1 layoutButtonWithEdgeInsetsStyle:NSDirectionalRectEdgeLeading 
                                      imagePadding:JobsWidth(8)];
        }
    }return _btn1;
}

-(UIButton *)btn2{
    if(!_btn2){
        _btn2 = UIButton.new;
        _btn2.titleFont = UIFontWeightRegularSize(14);
        _btn2.normalTitle = JobsInternationalization(@"立即进入");
        _btn2.normalTitleColor = JobsWhiteColor;
        _btn2.backgroundColor = JobsCor(@"#EA2918");
        [self addSubview:_btn2];
        [_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(88), JobsWidth(28)));
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(JobsWidth(-5));
        }];
        [_btn2 cornerCutToCircleWithCornerRadius:JobsWidth(14)];
        @jobs_weakify(self)
        [_btn2 jobsBtnClickEventBlock:^id(id data) {
            @jobs_strongify(self)
            return nil;
        }];
    }return _btn2;
}

@end
