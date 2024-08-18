//
//  JobsSearchBar.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "JobsSearchBar.h"

@interface JobsSearchBar ()
/// UI
@property(nonatomic,strong)ZYTextField *textField;
@property(nonatomic,strong)UIButton *cancelBtn;
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)JobsAdNoticeView *adNoticeView;

@end

@implementation JobsSearchBar

- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = HEXCOLOR(0xF9F9F9);
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock)jobsRichElementsInViewWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.textField.alpha = 1;
    //    self.cancelBtn.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(id _Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(60));
}
#pragma mark —— JobsDoorInputViewProtocol
-(UITextField *_Nullable)getTextField{
    return _textField;
}
#pragma mark —— 一些私有化方法

#pragma mark —— lazyLoad
-(ZYTextField *)textField{
    if (!_textField) {
        _textField = ZYTextField.new;
        _textField.placeholder = @"请输入搜索内容";
        _textField.delegate = self;
        _textField.leftView = self.imgView;
        _textField.textColor = JobsPurpleColor;
        _textField.inputAccessoryView = self.adNoticeView;
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.backgroundColor = HEXCOLOR(0xFFFFFF);
        _textField.keyboardAppearance = UIKeyboardAppearanceAlert;
        _textField.returnKeyType = UIReturnKeySearch;
        _textField.placeHolderAlignment = NSTextAlignmentCenter;
        _textField.leftViewOffsetX = JobsWidth(5);
        _textField.offset = JobsWidth(3);
        [self addSubview:_textField];
        _textField.frame = CGRectMake(10,
                               10,
                               JobsMainScreen_WIDTH() - 20,
                               self.mj_h - 20);
        _textField.x = JobsWidth(10);
        _textField.y = JobsWidth(10);
        CGFloat TextFieldWidth = JobsMainScreen_WIDTH() - JobsWidth(20);
        _textField.size = CGSizeMake(TextFieldWidth,
                                     self.mj_h - JobsWidth(30));
        @jobs_weakify(self)
        [[_textField.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
            @jobs_strongify(self)
            if (!self.textField.text.nullString) {
                self.cancelBtn.alpha = 1;
                self.textField.width = TextFieldWidth - (self.cancelBtn.size.width + JobsWidth(5));
            }return !value.nullString;
        }] subscribeNext:^(NSString * _Nullable x) {
            @jobs_strongify(self)
            NSLog(@"输入的字符为 = %@",x);
            if (self.objectBlock) self.objectBlock(x);
        }];
        
//        [_textField actionNSIntegerBlock:^(UITextFieldFocusType data) {
//            NSLog(@"%ld",(long)data);
//            if (self.NSIntegerBlock) self.NSIntegerBlock(data);
//        }];
        
        _textField.cornerCutToCircleWithCornerRadius(JobsWidth(8));
        [_textField layerBorderCor:JobsBlueColor andBorderWidth:.05f];
        
    }return _textField;
}

-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = UIButton.new;
        _cancelBtn.backgroundColor = JobsLightGrayColor;
        _cancelBtn.normalTitle(JobsInternationalization(@"取消"));
        _cancelBtn.titleFont(UIFontWeightRegularSize(12));
        _cancelBtn.normalTitleColor(HEXCOLOR(0x0F81FE));
//        [_cancelBtn buttonAutoWidthByFont]; // 无效
        [self addSubview:_cancelBtn];
        _cancelBtn.size = CGSizeMake(JobsWidth(50), JobsWidth(30));
        _cancelBtn.x = JobsMainScreen_WIDTH() - _cancelBtn.size.width - JobsWidth(5);
        _cancelBtn.centerY = self.textField.centerY;
        [_cancelBtn layerBorderCor:JobsWhiteColor andBorderWidth:1];
        _cancelBtn.cornerCutToCircleWithCornerRadius(8);
        @jobs_weakify(self)
        [_cancelBtn jobsBtnClickEventBlock:^id(id data) {
            @jobs_strongify(self)
            [self.textField resignFirstResponder];
            return nil;
        }];
    }return _cancelBtn;
}

-(UIImageView *)imgView{
    if (!_imgView) {
        _imgView = UIImageView.new;
        _imgView.image = JobsIMG(@"放大镜");
    }return _imgView;
}

-(JobsAdNoticeView *)adNoticeView{
    if (!_adNoticeView) {
        _adNoticeView = JobsAdNoticeView.new;
        _adNoticeView.size = [JobsAdNoticeView viewSizeWithModel:nil];
        _adNoticeView.jobsRichElementsInViewWithModel(nil);
    }return _adNoticeView;
}

@end
