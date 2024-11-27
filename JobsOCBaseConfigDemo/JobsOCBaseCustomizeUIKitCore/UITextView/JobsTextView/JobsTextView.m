//
//  JobsTextView.m
//  DouDong-II
//
//  Created by alan comb on 2021/4/3.
//

#import "JobsTextView.h"

@interface JobsTextView()
/// UI
@property(nonatomic,strong)SZTextView *textView;
@property(nonatomic,strong)UILabel *countLabel;
/// Data
@property(nonatomic,strong)UITextModel *textModel;

@end

@implementation JobsTextView
@synthesize textModel = _textModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_textViewOnceToken = 0;
    static_textView = nil;
}

static JobsTextView *static_textView = nil;
static dispatch_once_t static_textViewOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_textViewOnceToken, ^{
        static_textView = JobsTextView.new;
    });return static_textView;
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
            }
            NSLog(@"通知传递过来的 = %@",notification.object);
        }];
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
//    /// 内部指定圆切角
//    [self appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
//                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UITextModel *_Nullable model) {
        @jobs_strongify(self)
        if([model isKindOfClass:UITextModel.class]){
            self.textModel = (UITextModel *)model;
            [self updateWordCount:0];
            self.countLabel.alpha = 1;
            self.textView.alpha = 1;
        }
    };
}
#pragma mark —— 一些公有方法
-(SZTextView *)getTextView{
    return _textView;
}

-(void)updateWordCount:(NSInteger)count{
    if(count) self.textModel.curWordCount = count;
    self.countLabel.text = [NSString stringWithFormat:@"%ld/%ld", self.textModel.curWordCount, self.textModel.maxWordCount];
    self.countLabel.makeLabelByShowingType(UILabelShowingType_03);
}
#pragma mark —— lazyLoad
-(SZTextView *)textView{
    if (!_textView) {
        _textView = SZTextView.new;
        _textView.backgroundColor = JobsCor(@"#FEF4F3");
        _textView.editable = YES;
        [self addSubview:_textView];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(JobsWidth(5));
            make.left.equalTo(self).offset(JobsWidth(10));
            make.right.equalTo(self).offset(JobsWidth(-10));
            make.bottom.equalTo(self.countLabel.mas_top);
        }];
        @jobs_weakify(self)
        /// 这里的x是整个textView目前的所有字符串的值
        [_textView jobsTextViewSubscribeNextBlock:^(NSString * _Nullable x) {
            @jobs_strongify(self)
            /// 超过直接截取
            if(x.length > self.textModel.maxWordCount) {
                x = [x substringToIndex:self.textModel.maxWordCount];
                self.jobsToastMsg(JobsInternationalization(@"最多只能输入").add(toStringByLong(self.textModel.maxWordCount).add(@"个字")));
            }
            self.textView.text = x;
            self.textModel.curWordCount = x.length;
            [self updateWordCount:0];
            /// 向外回调目前的textView的字符串
            if (self.objectBlock) self.objectBlock(x);
        }];
    }
    _textView.text = self.textModel.text;
    _textView.textColor = self.textModel.textCor;
    _textView.placeholderTextColor = self.textModel.placeholderColor;
    _textView.placeholder = self.textModel.placeholder;
    return _textView;
}

- (UILabel *)countLabel{
    if (!_countLabel) {
        @jobs_weakify(self)
        _countLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.textColor = JobsWhiteColor;
            label.textAlignment = NSTextAlignmentCenter;
            label.font = UIFontWeightBoldSize(12);
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(JobsWidth(17));
                make.bottom.mas_equalTo(-JobsWidth(8));
                make.right.equalTo(self).offset(-JobsWidth(5));
            }];
        });
    }return _countLabel;
}

@end
