//
//  UIButton+TextView.m
//  FM
//
//  Created by Admin on 10/12/2024.
//

#import "UIButton+TextView.h"

@implementation UIButton (TextView)
#pragma mark —— 一些私有方法
-(jobsByTextViewBlock _Nonnull)configTextView{
    @jobs_weakify(self)
    return ^(__kindof UITextView *_Nullable textView){
        @jobs_strongify(self)
        textView.backgroundColor = JobsClearColor;
        textView.delegate = self;
        textView.userInteractionEnabled = YES; /// 需要处理点击事件（比如：链接检测和文本选择）
        textView.editable = NO;/// UITextView 即使是不可编辑的情况下（editable = NO），也会处理点击事件（如链接检测和文本选择）。这会阻止事件向父视图传递。
        textView.scrollEnabled = NO;
        textView.textAlignment = NSTextAlignmentCenter;
        textView.selectable = YES; /// 确保可以选择
        textView.dataDetectorTypes = UIDataDetectorTypeLink; /// 启用链接检测
        self.addSubview(textView);
    };
}
#pragma mark —— UITextViewDelegate
-(nullable UIAction *)textView:(UITextView *)textView
      primaryActionForTextItem:(UITextItem *)textItem
                 defaultAction:(UIAction *)defaultAction API_AVAILABLE(ios(17.0)){
    textItem.textView = textView;
    if(self.objectBlock) self.objectBlock(textItem);
    return defaultAction; /// 默认行为
}
#pragma mark —— @property(nonatomic,strong)BaseTextView *titleTextView;
JobsKey(_titleTextView)
@dynamic titleTextView;
-(BaseTextView *)titleTextView{
    BaseTextView *textView = Jobs_getAssociatedObject(_titleTextView);
    if(!textView){
        @jobs_weakify(self)
        textView = jobsMakeBaseTextView(^(__kindof BaseTextView * _Nullable textView) {
            @jobs_strongify(self)
            textView.frame = self.titleLabel.frame;
            self.configTextView(textView);
          });Jobs_setAssociatedRETAIN_NONATOMIC(_titleTextView, textView);
    }return textView;
}

-(void)setTitleTextView:(UITextView *)titleTextView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_titleTextView, titleTextView)
}
#pragma mark —— @property(nonatomic,strong)UITextView *subtitleTextView;
JobsKey(_subtitleTextView)
@dynamic subtitleTextView;
-(BaseTextView *)subtitleTextView{
    BaseTextView *textView = Jobs_getAssociatedObject(_subtitleTextView);
    if(!textView){
        @jobs_weakify(self)
        textView = jobsMakeBaseTextView(^(__kindof BaseTextView * _Nullable textView) {
            @jobs_strongify(self)
            textView.frame = self.titleLabel.frame;
            self.configTextView(textView);
          });Jobs_setAssociatedRETAIN_NONATOMIC(_subtitleTextView, textView);
    }return textView;
}

-(void)setSubtitleTextView:(UITextView *)subtitleTextView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_subtitleTextView, subtitleTextView)
}

@end
