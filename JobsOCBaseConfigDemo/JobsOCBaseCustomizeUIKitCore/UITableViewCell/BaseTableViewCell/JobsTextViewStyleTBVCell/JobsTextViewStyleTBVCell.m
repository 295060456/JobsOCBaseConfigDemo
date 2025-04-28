//
//  JobsTextViewStyleTBVCell.m
//  FMNormal
//
//  Created by Jobs on 2025/4/28.
//

#import "JobsTextViewStyleTBVCell.h"

@interface JobsTextViewStyleTBVCell ()

@end

@implementation JobsTextViewStyleTBVCell
#pragma mark —— @synthesize UIViewModelProtocol
UIViewModelProtocol_synthesize_part1
UIViewModelProtocol_synthesize_part2
BaseLayerProtocol_synthesize_part3
-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleDefaultWithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsTextViewStyleTBVCell *cell = (JobsTextViewStyleTBVCell *)tableView.tableViewCellClass(JobsTextViewStyleTBVCell.class,@"");
        if (!cell) {
            cell = JobsTextViewStyleTBVCell.initTableViewCellWithStyle(UITableViewCellStyleDefault);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }return cell;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsCellBy{
    @jobs_weakify(self)
    return ^(UIViewModel __kindof *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        self.backgroundColor = self.contentView.backgroundColor = self.viewModel.bgCor;
        self.label.alpha = 1;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(55);
    };
}
#pragma mark —— BaseViewProtocol
/// 获取绑定的数据源
-(UIViewModel *)getViewModel{
    return self.viewModel;
}
//-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
//    [UIMenuController.sharedMenuController update];
//    return YES;
//}
////-(BOOL)textViewShouldEndEditing:(UITextView *)textView;
//-(void)textViewDidBeginEditing:(UITextView *)textView{
////    textView.text = _textData2;
//    JobsLog(@"333");
//}
////-(void)textViewDidEndEditing:(UITextView *)textView;
//-(BOOL)textView:(UITextView *)textView
//shouldChangeTextInRange:(NSRange)range
//replacementText:(NSString *)text{
//    JobsLog(@"21");
//    return YES;
//}
//-(void)textViewDidChange:(UITextView *)textView{
//
//}
//-(void)textViewDidChangeSelection:(UITextView *)textView{
//
//}
//-(nullable UIMenu *)textView:(UITextView *)textView editMenuForTextInRange:(NSRange)range suggestedActions:(NSArray<UIMenuElement *> *)suggestedActions API_AVAILABLE(ios(16.0));
//-(void)textView:(UITextView *)textView willPresentEditMenuWithAnimator:(id<UIEditMenuInteractionAnimating>)animator API_AVAILABLE(ios(16.0)) API_UNAVAILABLE(tvos, watchos);
//-(void)textView:(UITextView *)textView willDismissEditMenuWithAnimator:(id<UIEditMenuInteractionAnimating>)animator API_AVAILABLE(ios(16.0)) API_UNAVAILABLE(tvos, watchos);
//-(nullable UIAction *)textView:(UITextView *)textView primaryActionForTextItem:(UITextItem *)textItem defaultAction:(UIAction *)defaultAction API_AVAILABLE(ios(17.0)) API_UNAVAILABLE(tvos, watchos);
//-(nullable UITextItemMenuConfiguration *)textView:(UITextView *)textView menuConfigurationForTextItem:(UITextItem *)textItem defaultMenu:(UIMenu *)defaultMenu API_AVAILABLE(ios(17.0)) API_UNAVAILABLE(watchos, tvos);
//-(void)textView:(UITextView *)textView textItemMenuWillDisplayForTextItem:(UITextItem *)textItem animator:(id<UIContextMenuInteractionAnimating>)animator API_AVAILABLE(ios(17.0)) API_UNAVAILABLE(watchos, tvos);
//-(void)textView:(UITextView *)textView textItemMenuWillEndForTextItem:(UITextItem *)textItem animator:(id<UIContextMenuInteractionAnimating>)animator API_AVAILABLE(ios(17.0)) API_UNAVAILABLE(watchos, tvos);
//-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction API_DEPRECATED("Replaced by primaryActionForTextItem: and menuConfigurationForTextItem: for additional customization options.", ios(10.0, 17.0), visionos(1.0, 1.0));
//-(BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction API_DEPRECATED("Replaced by primaryActionForTextItem: and menuConfigurationForTextItem: for additional customization options.", ios(10.0, 17.0), visionos(1.0, 1.0));
//-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange API_DEPRECATED_WITH_REPLACEMENT("textView:shouldInteractWithURL:inRange:interaction:", ios(7.0, 10.0)) API_UNAVAILABLE(visionos);
//-(BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange API_DEPRECATED_WITH_REPLACEMENT("textView:shouldInteractWithTextAttachment:inRange:interaction:", ios(7.0, 10.0)) API_UNAVAILABLE(visionos);
#pragma mark —— lazyLoad
@synthesize textView = _textView;
-(__kindof UITextView *)textView{
    if (!_textView) {
        @jobs_weakify(self)
        _textView = jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
            @jobs_strongify(self)
            textView.delegate = self;
            textView.dataDetectorTypes = UIDataDetectorTypeLink; /// 启用链接检测
            textView.editable = NO; /// 禁止编辑。必须 editable = NO 才能点击链接跳转
            textView.selectable = YES; /// 允许选择链接
            /// 富文本的优先级大于普通文本
            if(self.viewModel.attributedTitle){
                textView.attributedText = self.viewModel.attributedTitle;
            }else{
                textView.text = self.viewModel.text;
                textView.lineBreakMode = NSLineBreakByWordWrapping;
                textView.textAlignment = self.viewModel.textAlignment;
                textView.textColor = self.viewModel.textCor;
                textView.font = self.viewModel.font;
            }
            [self.contentView.addSubview(textView) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.contentView);
            }];
        });
    }return _textView;
}

//@synthesize label = _label;
//-(UILabel *)label{
//    if(!_label){
//        @jobs_weakify(self)
//        _label = jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
//            @jobs_strongify(self)
//            /// 富文本的优先级大于普通文本
//            if(self.viewModel.attributedTitle){
//                label.attributedText = self.viewModel.attributedTitle;
//            }else label.text = self.viewModel.text;
//            label.numberOfLines = 0;
//            label.lineBreakMode = NSLineBreakByWordWrapping;
//            label.textAlignment = self.viewModel.textAlignment;
//            label.textColor = self.viewModel.textCor;
//            label.font = self.viewModel.font;
//            [self.contentView.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.edges.equalTo(self.contentView);
//            }];
//        });
//    }return _label;
//}


@end
