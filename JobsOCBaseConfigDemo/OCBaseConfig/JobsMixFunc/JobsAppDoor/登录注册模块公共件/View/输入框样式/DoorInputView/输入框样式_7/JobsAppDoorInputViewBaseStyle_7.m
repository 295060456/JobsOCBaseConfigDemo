//
//  JobsAppDoorInputViewBaseStyle_7.m
//  Casino
//
//  Created by Jobs on 2021/11/24.
//

#import "JobsAppDoorInputViewBaseStyle_7.h"

@interface JobsAppDoorInputViewBaseStyle_7 (){
    JobsDropDownListView *dropDownListView;
}
/// UI
Prop_strong()UIImageView *leftIMGV;
Prop_strong()UIButton *chooseBtn;
/// Data
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;
Prop_strong()NSMutableArray <UIViewModel *>*jobsPageViewDataMutArr;
Prop_strong()UIViewModel *chooseBtnViewModel;
Prop_assign()CGSize chooseBtnSize;

@end

@implementation JobsAppDoorInputViewBaseStyle_7

- (instancetype)init{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.jobsWidth = 1;
            data.layerCor = Cor3;
        }));
    }return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsClearColor;
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.jobsWidth = 1;
            data.layerCor = Cor3;
        }));
    }return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— 一些私有方法
-(void)configTextField{
//    self.magicTextField.leftView;
//    self.magicTextField.leftViewMode;
    self.magicTextField.leftViewOffsetX = self.doorInputViewBaseStyleModel.leftViewOffsetX ? :  JobsWidth(17);
    self.magicTextField.placeholder = self.doorInputViewBaseStyleModel.placeholder;
    self.magicTextField.placeholderColor = self.doorInputViewBaseStyleModel.placeholderColor;
    self.magicTextField.placeholderFont = self.doorInputViewBaseStyleModel.placeholderFont;
    self.magicTextField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft;
    self.magicTextField.placeHolderOffset = self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(20);
    self.magicTextField.keyboardType = self.doorInputViewBaseStyleModel.keyboardType;
    self.magicTextField.keyboardAppearance = self.doorInputViewBaseStyleModel.keyboardAppearance;
    self.magicTextField.returnKeyType = self.doorInputViewBaseStyleModel.returnKeyType;
    self.magicTextField.textColor = self.doorInputViewBaseStyleModel.titleStrCor;
    self.magicTextField.useCustomClearButton = self.doorInputViewBaseStyleModel.useCustomClearButton;
    self.magicTextField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;
    self.magicTextField.rightViewOffsetX = self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8);// 删除按钮的偏移量
    self.magicTextField.requestParams = self.textFieldInputModel;
    self.magicTextField.text_offset = self.doorInputViewBaseStyleModel.offset ? : JobsWidth(1);
    self.magicTextField.animationColor = self.doorInputViewBaseStyleModel.animationColor ? : Cor3;
    self.magicTextField.moveDistance = self.doorInputViewBaseStyleModel.moveDistance ? : JobsWidth(35);
    self.magicTextField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50);
}

-(void)block:(JobsMagicTextField *)textField value:(NSString *)value{
    
    self.textFieldInputModel.resString = value;
    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeholder;

    textField.requestParams = self.textFieldInputModel;
    
    if (self.objBlock) self.objBlock(textField);// 对外统一传出TF
}
#pragma mark —— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return self.doorInputViewBaseStyleModel.keyboardEnable;
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(345), JobsWidth(30));
    };
}

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsAppDoorInputViewBaseStyleModel *_Nullable doorInputViewBaseStyleModel) {
        @jobs_strongify(self)
        self.doorInputViewBaseStyleModel = doorInputViewBaseStyleModel ? : JobsAppDoorInputViewBaseStyleModel.new;
        self.leftIMGV.alpha = 1;
        self.chooseBtn.alpha = 1;
        self.textField.alpha = 1;
        [self configTextField];
    };
}
#pragma mark —— JobsDoorInputViewProtocol
-(void)changeTextFieldAnimationColor:(BOOL)toRegisterBtnSelected{
    self.magicTextField.animationColor = toRegisterBtnSelected ? Cor3 : Cor3;
}

-(JobsMagicTextField *_Nullable)getTextField{
    return self.magicTextField;
}

-(NSString *_Nullable)textFieldValue{
    return self.magicTextField.text;
}
#pragma mark —— lazyLoad
-(UIImageView *)leftIMGV{
    if (!_leftIMGV) {
        @jobs_weakify(self)
        _leftIMGV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.image = self.doorInputViewBaseStyleModel.leftViewIMG;
            [self.addSubview(imageView) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(JobsWidth(17));
                make.centerY.equalTo(self);
                make.size.mas_equalTo(CGSizeMake(JobsWidth(12), JobsWidth(16)));
            }];
        });
    }return _leftIMGV;
}

-(NSMutableArray<UIViewModel *> *)jobsPageViewDataMutArr{
    if (!_jobsPageViewDataMutArr) {
        _jobsPageViewDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <UIViewModel *>* _Nullable arr) {
            arr.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
                data.textModel.text = JobsInternationalization(@"請選擇區號");
                data.textModel.textCor = HEXCOLOR(0xC4C4C4);
                data.bgCor = JobsClearColor;
                data.textModel.font = UIFontWeightRegularSize(16);
            }));
            arr.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
                data.textModel.text = @"+87";
                data.textModel.textCor = HEXCOLOR(0xC4C4C4);
                data.bgCor = JobsClearColor;
                data.textModel.font = UIFontWeightRegularSize(16);
            }));
            arr.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
                data.textModel.text = @"+88";
                data.textModel.textCor = HEXCOLOR(0xC4C4C4);
                data.bgCor = JobsClearColor;
                data.textModel.font = UIFontWeightRegularSize(16);
            }));
        });
    }return _jobsPageViewDataMutArr;
}

-(UIButton *)chooseBtn{
    if (!_chooseBtn) {
        @jobs_weakify(self)
        _chooseBtn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetImagePlacement(NSDirectionalRectEdgeTrailing)
            .jobsResetImagePadding(JobsWidth(8))
            .jobsResetBtnImage(self.chooseBtnViewModel.image)
            .jobsResetBtnBgImage(@"APPLY NOW".img)
            .jobsResetBtnTitleCor(self.chooseBtnViewModel.textModel.textCor)
            .jobsResetBtnTitleFont(self.chooseBtnViewModel.textModel.font)
            .jobsResetBtnTitle(self.chooseBtnViewModel.textModel.text)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                x.selected = !x.selected;
                if (x.selected) {
                    self->dropDownListView = [self motivateFromView:x
                                      jobsDropDownListViewDirection:JobsDropDownListViewDirection_UP
                                                               data:self.jobsPageViewDataMutArr
                                                 motivateViewOffset:0
                                                        finishBlock:^(UIViewModel *data) {
                        JobsLog(@"data = %@",data);
                        JobsLog(@"data = %@",data.data);
                        x.jobsResetBtnTitle(data.textModel.text.add(data.subTextModel.text));
                    }];
                }else self->dropDownListView.dropDownListViewDisappear(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        [self.addSubview(_chooseBtn) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftIMGV.mas_right).offset(JobsWidth(20));
            make.centerY.equalTo(self);
            make.height.mas_equalTo(JobsWidth(16));
#warning 这里需要被修改
//            make.width.mas_equalTo([UIView widthByData:self.jobsPageViewDataMutArr[0]]);
        }];
    }return _chooseBtn;
}

-(UIViewModel *)chooseBtnViewModel{
    if (!_chooseBtnViewModel) {
        @jobs_weakify(self)
        _chooseBtnViewModel = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            @jobs_strongify(self)
            data.textModel.text = JobsInternationalization(@"請選擇區號");
            data.textModel.textCor = HEXCOLOR(0xC4C4C4);
            data.textModel.textLineSpacing = 0;
            data.textModel.font = UIFontWeightRegularSize(14);
            data.bgCor = JobsClearColor;
            data.jobsWidth = self.chooseBtnSize.width;
            data.subTextModel.text = JobsInternationalization(@"");
            data.image = @"向下的箭头".img;
        });
    }return _chooseBtnViewModel;
}
@synthesize magicTextField = _magicTextField;
-(JobsMagicTextField *)magicTextField{
    if (!_magicTextField) {
        @jobs_weakify(self)
        _magicTextField = jobsMakeMagicTextField(^(__kindof JobsMagicTextField * _Nullable textField) {
            @jobs_strongify(self)
            textField.delegate = self;
            [textField jobsTextFieldEventFilterBlock:^BOOL(NSString * _Nullable data) {
                @jobs_strongify(self)
                return self.retBoolByIDBlock ? self.retBoolByIDBlock(data) : YES;
            } subscribeNextBlock:^(NSString * _Nullable x) {
                @jobs_strongify(self)
                JobsLog(@"输入的字符为 = %@",x);
                [self block:self->_magicTextField value:x];
            }];
            [self.addSubview(textField) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(self);
                make.right.equalTo(self).offset(-JobsWidth(17));
                make.left.equalTo(self.chooseBtn.mas_right).offset(JobsWidth(2));
            }];
        });
    }return _magicTextField;
}

@end
