//
//  CtrlClipboardCueVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import "CtrlClipboardCueVC.h"

@interface CtrlClipboardCueVC ()
/// UI
@property(nonatomic,strong)BaseLabel *label;
@property(nonatomic,strong)BaseTextView *textView;
/// Data
@property(nonatomic,strong)NSString *textData1;/// 页面上显示的数据
@property(nonatomic,strong)NSString *textData2;/// 来自于剪切板存储的数据

@end

@implementation CtrlClipboardCueVC

- (void)dealloc{
    JobsRemoveNotification(self);
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.bgImage = JobsIMG(@"新首页的底图");
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsRandomColor;
    self.makeNavByAlpha(1);
//    [self.bgImageView removeFromSuperview];
    self.label.alpha = 1;
    self.textView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.updateStatusBarCor(JobsOrangeColor);/// 在具体子类实现，不要写在父类。父类只做提示
    IQKeyboardManager.sharedManager.enable = NO;
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    /self.restoreStatusBarCor(nil);
    IQKeyboardManager.sharedManager.enable = YES;
    UIPasteboard.generalPasteboard.string = JobsInternationalization(@"");
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
#pragma mark —— UITextViewDelegate
//-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
//    [UIMenuController.sharedMenuController update];
//    return YES;
//}
////-(BOOL)textViewShouldEndEditing:(UITextView *)textView;
//-(void)textViewDidBeginEditing:(UITextView *)textView{
////    textView.text = _textData2;
//    NSLog(@"333");
//}
////-(void)textViewDidEndEditing:(UITextView *)textView;
//-(BOOL)textView:(UITextView *)textView 
//shouldChangeTextInRange:(NSRange)range
//replacementText:(NSString *)text{
//    NSLog(@"21");
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
-(BaseLabel *)label{
    if(!_label){
        _label = BaseLabel.new;
        _label.backgroundColor = JobsLightGrayColor;
        _label.text = JobsInternationalization(@"请点击复制：").add(self.textData1);
        _label.textColor = JobsRedColor;
        _label.font = UIFontSystemFontOfSize(20);
        _label.textAlignment = NSTextAlignmentCenter;
        _label.longPressGR.enabled = YES;
        _label.tapGR.enabled = YES;
        @jobs_weakify(self)
        [_label actionReturnIDByGestureRecognizerBlock:^id _Nullable(UIGestureRecognizer * _Nullable data) {
            if(data.state == UIGestureRecognizerStateBegan){
                @jobs_strongify(self)
                [self becomeFirstResponder];
                self->_textData2 = self.textData1;
                [self->_label makeMenuCtrl:self->_textData2];
            }return nil;
        }];
        [self.view addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(10));
            make.centerX.equalTo(self.view);
            make.height.mas_equalTo(@80);
        }];
        _label.cornerCutToCircleWithCornerRadius(JobsWidth(8));
        _label.makeLabelByShowingType(UILabelShowingType_03);
    }return _label;
}

-(BaseTextView *)textView{
    if (!_textView) {
        _textView = BaseTextView.new;
        _textView.backgroundColor = JobsLightTextColor;
        _textView.placeholder = JobsInternationalization(@"请粘贴！！！");
        _textView.textColor = JobsBlackColor;
        _textView.delegate = self;
        _textView.font = UIFontSystemFontOfSize(14);
        [self.view addSubview:_textView];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(JobsWidth(10));
            make.right.equalTo(self.view).offset(JobsWidth(-10));
            make.top.equalTo(self.label.mas_bottom).offset(JobsWidth(10));
            make.bottom.equalTo(self.view).offset(JobsWidth(-20));
        }];
        [_textView layerBorderCor:JobsLightGrayColor andBorderWidth:.5f];
    }return _textView;
}

-(NSString *)textData1{
    if(!_textData1){
        _textData1 = JobsInternationalization(@"财神到，四季发财！！！！");
    }return _textData1;
}

@end
