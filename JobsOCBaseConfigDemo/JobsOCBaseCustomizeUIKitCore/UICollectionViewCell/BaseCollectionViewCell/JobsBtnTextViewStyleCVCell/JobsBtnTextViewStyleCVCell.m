//
//  JobsBtnTextViewStyleCVCell.m
//  FMNormal
//
//  Created by Jobs on 2025/5/1.
//

#import "JobsBtnTextViewStyleCVCell.h"

@interface JobsBtnTextViewStyleCVCell ()

@end

@implementation JobsBtnTextViewStyleCVCell
/// UIViewModelProtocol
UIViewModelProtocol_synthesize_part1
UIViewModelProtocol_synthesize_part2
/// BaseLayerProtocol
BaseLayerProtocol_synthesize_part3
/// BaseViewProtocol
BaseViewProtocol_synthesize
/// AppToolsProtocol
AppToolsProtocol_synthesize
-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    JobsBtnTextViewStyleCVCell *cell = JobsRegisterDequeueCollectionViewCell(JobsBtnTextViewStyleCVCell);
    // UICollectionViewCell圆切角
//    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
//    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
//    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
//    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;
    cell.indexPath = indexPath;
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        if([data isKindOfClass:UIViewModel.class]) {
            self.viewModel = data;
            self.button.bgColorBy(self.viewModel.bgCor)
                .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
                .jobsResetImagePadding(self.viewModel.imagePadding)
                .jobsResetBtnImage(self.viewModel.image)
                .jobsResetBtnBgImage(self.viewModel.bgImage)
                .jobsResetBtnTitleCor(self.viewModel.titleCor)
                .jobsResetBtnTitleFont(self.viewModel.titleFont)
                .jobsResetBtnTitle(self.viewModel.title ? : @"");
            /// 富文本的优先级大于普通文本
            if(self.viewModel.attributedTitle){
                self.textView.attributedText = self.viewModel.attributedTitle;
            }else{
                self.textView.text = self.viewModel.text;
                self.textView.textAlignment = self.viewModel.textAlignment;
                self.textView.textColor = self.viewModel.textCor;
                self.textView.font = self.viewModel.font;
            }if(!self.viewModel.selectedImage_) self.viewModel.selectedImage_ = self.viewModel.image;
        }
        if([data isKindOfClass:UIButtonModel.class]) {
            self.buttonModel = data;
            self.button.bgColorBy(self.buttonModel.baseBackgroundColor)
                .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
                .jobsResetImagePadding(self.buttonModel.imagePadding)
                .jobsResetBtnImage(self.buttonModel.normalImage)
                .jobsResetBtnBgImage(self.buttonModel.backgroundImage)
                .jobsResetBtnTitleCor(self.buttonModel.titleCor)
                .jobsResetBtnTitleFont(self.buttonModel.titleFont)
                .jobsResetBtnTitle(self.buttonModel.title ? : @"");
            /// 富文本的优先级大于普通文本
            if(self.buttonModel.attributedTitle){
                self.textView.attributedText = self.buttonModel.attributedTitle;
            }else{
                self.textView.text = self.buttonModel.title;
                self.textView.textAlignment = self.buttonModel.textAlignment;
                /// 从 iOS 16 起，UITextView 使用新的文本渲染系统，会使用 UITextLayoutFragmentView。
                /// 它默认在某些情况下会将内容垂直居中，比如文本少、没有足够内容填满 UITextView 的高度时。
                /// 所以一下操作就是在关闭这个新特性
                [self.textView switchs];
                self.textView.textColor = self.buttonModel.titleCor;
                self.textView.font = self.buttonModel.titleFont;
            }if(!self.buttonModel.highlightImage) self.buttonModel.highlightImage = self.buttonModel.normalImage;
        } return self;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(55);
    };
}
#pragma mark —— UITextViewDelegate
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
//    [textView setContentOffset:CGPointZero animated:NO];
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
-(__kindof UIButton *)button{
    if(!_button){
        @jobs_weakify(self)
        _button = self.contentView.addSubview(UIButton.jobsInit()
                                              .bgColorBy(JobsWhiteColor)
                                              .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
                                              .jobsResetImagePadding(1)
                                              .onClickBy(^(UIButton *x){
                                                  @jobs_strongify(self)
                                                  x.selected = !x.selected;
                                                  if(self.objBlock) self.objBlock(x);
                                                  if(self.viewModel){
                                                      if(self.viewModel.selectedImage_) x.jobsResetBtnImage(x.selected ? self.viewModel.selectedImage_ : self.viewModel.image);
                                                  }
                                                  if(self.buttonModel){
                                                      if(self.buttonModel.normalImage) x.jobsResetBtnImage(x.selected ? self.buttonModel.highlightImage : self.buttonModel.normalImage);
                                                  }
                                              }).onLongPressGestureBy(^(id data){
                                                  JobsLog(@"");
                                              })).masonryBy(^(MASConstraintMaker *make) {
                                                  make.size.mas_equalTo(CGSizeMake(JobsWidth(20), JobsWidth(20)));
                                                  make.left.equalTo(self.contentView).offset(JobsWidth(13));
                                                  make.top.equalTo(self.contentView);
                                              });
    }return _button;
}
/// 如果需要用其他的自定义的TextView，继承此类并重写-(JobsReturnCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy;
-(__kindof BaseTextView *)textView{
    if (!_textView) {
        @jobs_weakify(self)
        _textView = self.contentView.addSubview(jobsMakeBaseTextView(^(__kindof BaseTextView * _Nullable textView) {
            @jobs_strongify(self)
            textView.delegate = self;
            textView.scrollEnabled = NO;
            textView.dataDetectorTypes = UIDataDetectorTypeLink; /// 启用链接检测
            textView.editable = NO; /// 禁止编辑。必须 editable = NO 才能点击链接跳转
            textView.selectable = YES; /// 允许选择链接
            textView.linkTextAttributes = self.makeLinkTextAttributes;
        })).masonryBy(self.masonryBlock);
    }return _textView;
}

-(__kindof SZTextView *)szTextView{
    if (!_szTextView) {
        @jobs_weakify(self)
        _szTextView = self.contentView.addSubview(jobsMakeSZTextView(^(SZTextView * _Nonnull textView) {
            @jobs_strongify(self)
            textView.delegate = self;
            textView.textColor = JobsBlackColor;
            textView.backgroundColor = JobsCor(@"#F9F9F9");
            textView.returnKeyType = UIReturnKeyDefault;
            textView.keyboardAppearance = UIKeyboardAppearanceDefault;
            textView.keyboardType = UIKeyboardTypeNumberPad;
            textView.placeholder = JobsInternationalization(@"请输入充值金额");
            textView.font = UIFontWeightMediumSize(18);
            textView.placeholderFont = textView.font;
            textView.placeholderColor = JobsCor(@"#AAAAAA");
            [textView jobsTextViewFilterBlock:^BOOL(id  _Nullable data) {
//                @jobs_strongify(self)
                return YES;
            } subscribeNextBlock:^(id _Nullable x) {
//                @jobs_strongify(self)
            }];
        })).masonryBy(self.masonryBlock);
    }return _textView;
}

-(__kindof JobsTextView *)jobsTextView{
    if(!_jobsTextView){
        @jobs_weakify(self)
        _jobsTextView = self.contentView.addSubview(makeJobsTextView(^(__kindof JobsTextView * _Nullable textView) {
            @jobs_strongify(self)
            textView.szTextView.delegate = self;
            textView.szTextView.textColor = JobsBlackColor;
            textView.backgroundColor = JobsCor(@"#F9F9F9");
            textView.returnKeyType = UIReturnKeyDefault;
            textView.keyboardAppearance = UIKeyboardAppearanceDefault;
            textView.keyboardType = UIKeyboardTypeNumberPad;
            textView.placeholder = JobsInternationalization(@"请输入充值金额");
            textView.font = UIFontWeightMediumSize(18);
            textView.placeholderFont = textView.font;
            textView.placeholderColor = JobsCor(@"#AAAAAA");
            [textView.szTextView jobsTextViewFilterBlock:^BOOL(id _Nullable data) {
//                @jobs_strongify(self)
                return YES;
            } subscribeNextBlock:^(id _Nullable x) {
//                @jobs_strongify(self)
            }];
        })).masonryBy(self.masonryBlock);
    }return _jobsTextView;
}

-(jobsByMASConstraintMakerBlock _Nullable)masonryBlock{
    @jobs_weakify(self)
    return ^(MASConstraintMaker *_Nonnull make){
        @jobs_strongify(self)
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.button.mas_right).offset(JobsWidth(10));
        make.right.bottom.equalTo(self.contentView);
    };
}

@end
