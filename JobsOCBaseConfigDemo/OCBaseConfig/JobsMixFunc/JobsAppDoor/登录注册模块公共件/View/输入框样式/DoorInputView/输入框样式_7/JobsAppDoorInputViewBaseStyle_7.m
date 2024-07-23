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
@property(nonatomic,strong)JobsMagicTextField *textField;
@property(nonatomic,strong)UIImageView *leftIMGV;
@property(nonatomic,strong)UIButton *chooseBtn;
/// Data
@property(nonatomic,strong)JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*jobsPageViewDataMutArr;
@property(nonatomic,strong)UIViewModel *chooseBtnViewModel;
@property(nonatomic,assign)CGSize chooseBtnSize;

@end

@implementation JobsAppDoorInputViewBaseStyle_7

- (instancetype)init{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        [self layerBorderCor:Cor4 andBorderWidth:1];
    }return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsClearColor;
        [self layerBorderCor:Cor4 andBorderWidth:1];
    }return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— 一些私有方法
-(void)configTextField{
//    _textField.leftView;
//    _textField.leftViewMode;
    _textField.leftViewOffsetX = self.doorInputViewBaseStyleModel.leftViewOffsetX ? :  JobsWidth(17);
    _textField.placeholder = self.doorInputViewBaseStyleModel.placeHolderStr;
    _textField.placeholderColor = self.doorInputViewBaseStyleModel.placeholderColor;
    _textField.placeholderFont = self.doorInputViewBaseStyleModel.placeholderFont;
    _textField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft;
    _textField.placeHolderOffset = self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(20);
    _textField.keyboardType = self.doorInputViewBaseStyleModel.keyboardType;
    _textField.keyboardAppearance = self.doorInputViewBaseStyleModel.keyboardAppearance;
    _textField.returnKeyType = self.doorInputViewBaseStyleModel.returnKeyType;
    _textField.textColor = self.doorInputViewBaseStyleModel.titleStrCor;
    _textField.useCustomClearButton = self.doorInputViewBaseStyleModel.useCustomClearButton;
    _textField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;
    _textField.rightViewOffsetX = self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8);// 删除按钮的偏移量
    _textField.requestParams = self.textFieldInputModel;
    _textField.offset = self.doorInputViewBaseStyleModel.offset ? : JobsWidth(1);
    _textField.animationColor = self.doorInputViewBaseStyleModel.animationColor ? : Cor4;
    _textField.moveDistance = self.doorInputViewBaseStyleModel.moveDistance ? : JobsWidth(35);
    _textField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50);
}

-(void)block:(JobsMagicTextField *)textField
       value:(NSString *)value{
    
    self.textFieldInputModel.resString = value;
    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeHolderStr;

    textField.requestParams = self.textFieldInputModel;
    
    if (self.objectBlock) self.objectBlock(textField);// 对外统一传出TF
}
#pragma mark —— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return self.doorInputViewBaseStyleModel.keyboardEnable;
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(id _Nullable)model{
    return CGSizeMake(JobsWidth(345), JobsWidth(30));
}

-(void)richElementsInViewWithModel:(JobsAppDoorInputViewBaseStyleModel *_Nullable)doorInputViewBaseStyleModel{
    self.doorInputViewBaseStyleModel = doorInputViewBaseStyleModel ? : JobsAppDoorInputViewBaseStyleModel.new;
    self.leftIMGV.alpha = 1;
    self.chooseBtn.alpha = 1;
    self.textField.alpha = 1;
    [self configTextField];
}
#pragma mark —— JobsDoorInputViewProtocol
-(void)changeTextFieldAnimationColor:(BOOL)toRegisterBtnSelected{
    self.textField.animationColor = toRegisterBtnSelected ? Cor4 : Cor4;
}

-(JobsMagicTextField *_Nullable)getTextField{
    return _textField;
}

-(NSString *_Nullable)getTextFieldValue{
    return _textField.text;
}
#pragma mark —— lazyLoad
-(UIImageView *)leftIMGV{
    if (!_leftIMGV) {
        _leftIMGV = UIImageView.new;
        _leftIMGV.image = self.doorInputViewBaseStyleModel.leftViewIMG;
        [self addSubview:_leftIMGV];
        [_leftIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(JobsWidth(17));
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(12), JobsWidth(16)));
        }];
    }return _leftIMGV;
}

-(NSMutableArray<UIViewModel *> *)jobsPageViewDataMutArr{
    if (!_jobsPageViewDataMutArr) {
        _jobsPageViewDataMutArr = NSMutableArray.array;
        
        {
            UIViewModel *jobsPageViewModel = UIViewModel.new;
            jobsPageViewModel.textModel.text = JobsInternationalization(@"請選擇區號");
            jobsPageViewModel.textModel.textCor = HEXCOLOR(0xC4C4C4);
            jobsPageViewModel.bgCor = JobsClearColor;
            jobsPageViewModel.textModel.font = UIFontWeightRegularSize(16);
            [_jobsPageViewDataMutArr addObject:jobsPageViewModel];
        }
        
        {
            UIViewModel *jobsPageViewModel = UIViewModel.new;
            jobsPageViewModel.textModel.text = @"+87";
            jobsPageViewModel.textModel.textCor = HEXCOLOR(0xC4C4C4);
            jobsPageViewModel.bgCor = JobsClearColor;
            jobsPageViewModel.textModel.font = UIFontWeightRegularSize(16);
            [_jobsPageViewDataMutArr addObject:jobsPageViewModel];
        }
        
        {
            UIViewModel *jobsPageViewModel = UIViewModel.new;
            jobsPageViewModel.textModel.text = @"+88";
            jobsPageViewModel.textModel.textCor = HEXCOLOR(0xC4C4C4);
            jobsPageViewModel.bgCor = JobsClearColor;
            jobsPageViewModel.textModel.font = UIFontWeightRegularSize(16);
            [_jobsPageViewDataMutArr addObject:jobsPageViewModel];
        }
        
    }return _jobsPageViewDataMutArr;
}

-(UIButton *)chooseBtn{
    if (!_chooseBtn) {
        _chooseBtn = UIButton.new;
        _chooseBtn.normalImage(self.chooseBtnViewModel.image);
        _chooseBtn.normalTitleColor(self.chooseBtnViewModel.textModel.textCor);
        _chooseBtn.normalTitle(self.chooseBtnViewModel.textModel.text);
        _chooseBtn.titleFont(self.chooseBtnViewModel.textModel.font);
        [self addSubview:_chooseBtn];
        [_chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftIMGV.mas_right).offset(JobsWidth(20));
            make.centerY.equalTo(self);
            make.height.mas_equalTo(JobsWidth(16));
#warning 这里需要被修改
//            make.width.mas_equalTo([UIView widthByData:self.jobsPageViewDataMutArr[0]]);
        }];
        @jobs_weakify(self)
        [_chooseBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (x.selected) {
                @jobs_weakify(self)
                self->dropDownListView = [self motivateFromView:x
                                  jobsDropDownListViewDirection:JobsDropDownListViewDirection_UP
                                                           data:self.jobsPageViewDataMutArr
                                             motivateViewOffset:0
                                                    finishBlock:^(UIViewModel *data) {
                    @jobs_strongify(self)
                    NSLog(@"data = %@",data);
                    NSLog(@"data = %@",data.data);
                    x.normalTitle([data.textModel.text stringByAppendingString:data.subTextModel.text]);
                }];
            }else{
                [self->dropDownListView dropDownListViewDisappear:x];
            }return nil;
        }];
        [_chooseBtn layoutButtonWithEdgeInsetsStyle:NSDirectionalRectEdgeTrailing
                                       imagePadding:JobsWidth(8)];
    }return _chooseBtn;
}

-(UIViewModel *)chooseBtnViewModel{
    if (!_chooseBtnViewModel) {
        _chooseBtnViewModel = UIViewModel.new;
        _chooseBtnViewModel.textModel.text = JobsInternationalization(@"請選擇區號");
        _chooseBtnViewModel.textModel.textCor = HEXCOLOR(0xC4C4C4);
        _chooseBtnViewModel.textModel.textLineSpacing = 0;
        _chooseBtnViewModel.textModel.font = UIFontWeightRegularSize(14);
        _chooseBtnViewModel.bgCor = JobsClearColor;
        _chooseBtnViewModel.jobsWidth = self.chooseBtnSize.width;
        _chooseBtnViewModel.subTextModel.text = JobsInternationalization(@"");
        _chooseBtnViewModel.image = JobsIMG(@"向下的箭头");
    }return _chooseBtnViewModel;
}

-(JobsMagicTextField *)textField{
    if (!_textField) {
        _textField = JobsMagicTextField.new;
        _textField.delegate = self;
        @jobs_weakify(self)
        [_textField jobsTextFieldEventFilterBlock:^BOOL(NSString * _Nullable data) {
            @jobs_strongify(self)
            return self.returnBoolByIDBlock ? self.returnBoolByIDBlock(data) : YES;
        } subscribeNextBlock:^(NSString * _Nullable x) {
            @jobs_strongify(self)
            NSLog(@"输入的字符为 = %@",x);
            [self block:self->_textField
                  value:x];
        }];
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self);
            make.right.equalTo(self).offset(-JobsWidth(17));
            make.left.equalTo(self.chooseBtn.mas_right).offset(JobsWidth(2));
        }];
    }return _textField;
}

@end
