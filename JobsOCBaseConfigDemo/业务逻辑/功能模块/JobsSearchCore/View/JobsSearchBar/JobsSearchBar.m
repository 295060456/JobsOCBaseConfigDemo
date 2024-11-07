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
@property(nonatomic,strong)BaseButton *cancelBtn;
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)JobsAdNoticeView *adNoticeView;

@end

@implementation JobsSearchBar

- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.textField.alpha = 1;
        self.cancelBtn.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(60));
    };
}
#pragma mark —— 一些私有化方法

#pragma mark —— lazyLoad
-(ZYTextField *)textField{
    if (!_textField) {
        _textField = ZYTextField.new;
        _textField.placeholder = JobsInternationalization(@"请输入搜索内容");
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
        CGFloat TextFieldWidth = self.mj_w - JobsWidth(80);
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(TextFieldWidth,self.mj_h - JobsWidth(15)));
            make.centerY.equalTo(self);
            make.left.equalTo(self);
        }];
        @jobs_weakify(self)
        [[_textField.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
            @jobs_strongify(self)
            if (isValue(self.textField.text)) {
                self.cancelBtn.alpha = 1;
                self.textField.width = TextFieldWidth - (self.cancelBtn.sizer.width + JobsWidth(5));
            }return isValue(value);
        }] subscribeNext:^(NSString * _Nullable x) {
            @jobs_strongify(self)
            NSLog(@"输入的字符为 = %@",x);
            if (self.objectBlock) self.objectBlock(x);
        }];
        _textField.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable model) {
            model.jobsWidth = .05f;
            model.layerCor = JobsBlueColor;
            model.cornerRadius = JobsWidth(8);
        }));
    }return _textField;
}

-(BaseButton *)cancelBtn{
    if (!_cancelBtn) {
        @jobs_weakify(self)
        _cancelBtn = BaseButton.jobsInit()
            .bgColor(JobsLightGrayColor)
            .jobsResetBtnTitleCor(HEXCOLOR(0x0F81FE))
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(JobsInternationalization(@"取消"))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        [self addSubview:_cancelBtn];
        [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(50), JobsWidth(30)));
            make.centerY.equalTo(self.textField);
//            make.right.equalTo(self);
            make.left.equalTo(self.textField.mas_right).offset(JobsWidth(5));
        }];
        [_cancelBtn jobsBtnClickEventBlock:^id(id data) {
            @jobs_strongify(self)
            [self.textField resignFirstResponder];
            return nil;
        }];
    }return _cancelBtn;
}

-(UIImageView *)imgView{
    if (!_imgView) {
        _imgView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView.image = JobsIMG(@"放大镜");
        });
    }return _imgView;
}

-(JobsAdNoticeView *)adNoticeView{
    if (!_adNoticeView) {
        _adNoticeView = JobsAdNoticeView.new;
        _adNoticeView.sizer = JobsAdNoticeView.viewSizeByModel(nil);
        _adNoticeView.jobsRichViewByModel(nil);
    }return _adNoticeView;
}

@end
