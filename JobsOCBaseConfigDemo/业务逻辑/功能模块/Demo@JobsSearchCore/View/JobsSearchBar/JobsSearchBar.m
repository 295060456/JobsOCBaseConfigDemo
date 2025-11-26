//
//  JobsSearchBar.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "JobsSearchBar.h"

@interface JobsSearchBar ()
/// UI
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
        self.cancelBtn.alpha = 1;
        self.textField.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(60));
    };
}
#pragma mark —— 一些私有化方法
/// TODO
#pragma mark —— lazyLoad
-(BaseButton *)cancelBtn{
    if (!_cancelBtn) {
        @jobs_weakify(self)
        _cancelBtn = BaseButton.jobsInit()
            .bgColorBy(JobsLightGrayColor)
            .jobsResetBtnTitleCor(HEXCOLOR(0x0F81FE))
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(@"取消".tr)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                [self.textField resignFirstResponder];
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.size.mas_equalTo(CGSizeMake(JobsWidth(50), JobsWidth(30)));
                make.centerY.equalTo(self);
                make.right.equalTo(self);
            });
    }return _cancelBtn;
}
@synthesize textField = _textField;
-(ZYTextField *)textField{
    if (!_textField) {
        @jobs_weakify(self)
        CGFloat TextFieldWidth = self.mj_w - JobsWidth(80);
        _textField = jobsMakeZYTextField(^(ZYTextField *_Nullable textField) {
            textField
                .byPlaceholder(@"请输入搜索内容".tr)
                .byDelegate(self)
                .byLeftView(jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
                    imageView.byImage(@"放大镜".img);
                }))
                .byTextCor(JobsPurpleColor)
                .byInputAccessoryView(JobsAdNoticeView
                                      .BySize(JobsAdNoticeView.viewSizeByModel(nil))
                                      .JobsRichViewByModel2(nil)
                                      .JobsBlock1(^(id _Nullable data) {

                                      }))
                .byLeftViewMode(UITextFieldViewModeAlways)
                .byKeyboardAppearance(UIKeyboardAppearanceAlert)
                .byReturnKeyType(UIReturnKeySearch)
                .byPlaceHolderAlignment(NSTextAlignmentCenter)
                .byLeftViewOffsetX(JobsWidth(5))
                .byRightViewOffsetX(JobsWidth(3))
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.centerY.equalTo(self);
                    make.left.equalTo(self);
                    make.right.equalTo(self.cancelBtn.mas_left);
                    make.height.mas_equalTo(self.mj_h - JobsWidth(15));
                })
                .byBgColor(HEXCOLOR(0xFFFFFF))
                .setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable model) {
                    model.jobsWidth = .05f;
                    model.layerCor = JobsBlueColor;
                    model.cornerRadiusValue = JobsWidth(8);
            }));
        });
        /// 不能写在 jobsMakeZYTextField 里面，否则会崩溃
        [[_textField.rac_textSignal filter:^BOOL(NSString *_Nullable value) {
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
    }return _textField;
}

@end
