//
//  JobsAppDoorInputViewBaseStyle_10.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/15.
//

#import "BaseViewProtocol.h"
#import "JobsDoorInputViewProtocol.h"
#import "NSString+Judgment.h"
#import "MacroDef_String.h"
#import "JobsAppDoorInputViewBaseStyleModel.h"
#import "JobsAppDoorInputViewBaseStyle.h"
#import "ZYTextField.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorInputViewBaseStyle_10 : JobsAppDoorInputViewBaseStyle
/**
 
 * 其实并不建议用init方法,而是期望带参数初始化，比如对应BaseViewProtocol里面的 - (instancetype)initWithSize:(CGSize)thisViewSize
 * 因为本类在大多数情况下是依附于一个父视图执行的，这样可以有效的避免过程值对环境的影响
 * 因为父视图在没有进行展开的时候，子视图是不展开的。那么存在生命周期的过程，会影响布局结果
    
 * 如果以后需要强行禁用init或者new，那么:
 - (instancetype)init NS_UNAVAILABLE;
 - (instancetype)new NS_UNAVAILABLE;
 
 */
@end

NS_ASSUME_NONNULL_END
/**
 
 -(JobsAppDoorInputViewBaseStyle_10 *)inputView{
     if (!_inputView) {
         _inputView = [JobsAppDoorInputViewBaseStyle_10.alloc initWithSize:inputViewSize];
         @jobs_weakify(self)
         [_inputView actionObjectBlock:^(id data) {
             @jobs_strongify(self)
             NSLog(@"%@",data);
             if ([data isKindOfClass:UITextField.class]) {
                 UITextField *textField = (UITextField *)data;
                 if ([textField.requestParams isKindOfClass:JobsAppDoorInputViewTFModel.class]) {
                     JobsAppDoorInputViewTFModel *inputViewTFModel = textField.requestParams;
                     ///【单次最高取款额度 和 今日可用提款额度 的最小值】同 【输入值】进行比较
                     self->OK = inputViewTFModel.resString.floatValue > MIN(self.viewModel.withdrawalsLines.floatValue, self.viewModel.withdrawalsLinesPerTime.floatValue);
                     
                     JobsBaseTableViewCell *cell00 = [self.tableView cellForRowAtIndexPath:[self myIndexPath:(JobsIndexPath){0,0}]];
                     if (self->OK) {
                         cell00.textLabel.text = JobsInternationalization(@"输入金额已超过可取款金额");
                         cell00.detailTextLabel.text = JobsInternationalization(@"");
                         self.tbvCellTipsLab.text = JobsInternationalization(@"");
                     }else{
                         cell00.textLabel.text = self.dataMutArr[0].textModel.text;
                         cell00.detailTextLabel.text = self.viewModel.amount;
                         self.tbvCellTipsLab.text = JobsInternationalization(@"USDT");
                     }
                 }
             }else if ([data isKindOfClass:JobsAppDoorInputViewTFModel.class]){
                 
             }else{
                 
             }
         }];
         [self.contentView addSubview:_inputView];
         [_inputView mas_makeConstraints:^(MASConstraintMaker *make) {
             make.left.equalTo(self.contentView).offset(JobsWidth(16));
             make.size.mas_equalTo(inputViewSize);
             make.top.equalTo(self).offset(JobsWidth(3));
         }];
         _inputView.jobsRichElementsInViewWithModel(配置金额输入框);
         [self layoutIfNeeded];
         [_inputView setBorderWithColor:HEXCOLOR(0xEAEBED)
                            borderWidth:JobsWidth(1)
                             borderType:UIBorderSideTypeBottom];
     }return _inputView;
 }

 -(JobsAppDoorInputViewBaseStyleModel *)配置金额输入框{
     if (!_配置金额输入框) {
         _配置金额输入框 = JobsAppDoorInputViewBaseStyleModel.new;
 //        _配置金额输入框.leftViewIMG = JobsIMG(@"安全");
         _配置金额输入框.textModel.text = JobsInternationalization(@"最大金额");
         _配置金额输入框.placeHolderStr = JobsInternationalization(@"請輸入取款金額");
         _配置金额输入框.placeholderFont = UIFontWeightRegularSize(14);
         _配置金额输入框.isShowDelBtn = YES;
         _配置金额输入框.isShowSecurityBtn = NO;
         _配置金额输入框.returnKeyType = UIReturnKeyDone;
         _配置金额输入框.keyboardAppearance = UIKeyboardAppearanceAlert;
         _配置金额输入框.leftViewMode = UITextFieldViewModeAlways;
         _配置金额输入框.titleStrCor = _配置金额输入框.placeholderColor = HEXCOLOR_ALPHA(0xC4C4C4,1.f);
         _配置金额输入框.keyboardType = UIKeyboardTypeNumberPad;
 //        _配置金额输入框.fieldEditorOffset = JobsWidth(80);
     }return _配置金额输入框;
 }
 
 */
