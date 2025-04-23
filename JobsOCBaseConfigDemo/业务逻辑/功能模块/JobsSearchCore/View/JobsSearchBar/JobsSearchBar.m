//
//  JobsSearchBar.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "JobsSearchBar.h"

@interface JobsSearchBar ()
/// UI
Prop_strong()ZYTextField *textField;
Prop_strong()BaseButton *cancelBtn;

@end

@implementation JobsSearchBar

- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsClearColor.colorWithAlphaComponentBy(0);
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
        @jobs_weakify(self)
        _textField = jobsMakeZYTextField(^(ZYTextField * _Nullable textField) {
            textField.placeholder = JobsInternationalization(@"请输入搜索内容");
            textField.delegate = self;
            textField.leftView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
                imageView.image = JobsIMG(@"放大镜");
            });
            textField.textColor = JobsPurpleColor;
            textField.inputAccessoryView = JobsAdNoticeView
                .BySize(JobsAdNoticeView.viewSizeByModel(nil))
                .JobsRichViewByModel2(nil)
                .JobsBlock1(^(id  _Nullable data) {
                    
                });
            textField.leftViewMode = UITextFieldViewModeAlways;
            textField.backgroundColor = HEXCOLOR(0xFFFFFF);
            textField.keyboardAppearance = UIKeyboardAppearanceAlert;
            textField.returnKeyType = UIReturnKeySearch;
            textField.placeHolderAlignment = NSTextAlignmentCenter;
            textField.leftViewOffsetX = JobsWidth(5);
            textField.text_offset = JobsWidth(3);
            CGFloat TextFieldWidth = self.mj_w - JobsWidth(80);
            [self.addSubview(textField) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(TextFieldWidth,self.mj_h - JobsWidth(15)));
                make.centerY.equalTo(self);
                make.left.equalTo(self);
            }];
            [[textField.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
                @jobs_strongify(self)
                if (isValue(self.textField.text)) {
                    self.cancelBtn.alpha = 1;
                    self.textField.width = TextFieldWidth - (self.cancelBtn.sizer.width + JobsWidth(5));
                }return isValue(value);
            }] subscribeNext:^(NSString * _Nullable x) {
                @jobs_strongify(self)
                JobsLog(@"输入的字符为 = %@",x);
                if (self.objBlock) self.objBlock(x);
            }];
            textField.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable model) {
                model.jobsWidth = .05f;
                model.layerCor = JobsBlueColor;
                model.cornerRadiusValue = JobsWidth(8);
            }));
        });
    }return _textField;
}

-(BaseButton *)cancelBtn{
    if (!_cancelBtn) {
        @jobs_weakify(self)
        _cancelBtn = BaseButton.jobsInit()
            .bgColorBy(JobsLightGrayColor)
            .jobsResetBtnTitleCor(HEXCOLOR(0x0F81FE))
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(JobsInternationalization(@"取消"))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
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

@end
