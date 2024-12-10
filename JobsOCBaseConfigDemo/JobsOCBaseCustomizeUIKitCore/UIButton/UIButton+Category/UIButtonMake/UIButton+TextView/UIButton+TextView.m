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
        textView.editable = NO;
        textView.scrollEnabled = NO;
        textView.textAlignment = NSTextAlignmentCenter;
        self.addSubview(textView);
    };
}
#pragma mark —— @property(nonatomic,strong)UITextView *titleTextView;
JobsKey(_titleTextView)
@dynamic titleTextView;
-(UITextView *)titleTextView{
    UITextView *textView = Jobs_getAssociatedObject(_titleTextView);
    if(!textView){
        @jobs_weakify(self)
        textView = jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
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
-(UITextView *)subtitleTextView{
    UITextView *textView = Jobs_getAssociatedObject(_subtitleTextView);
    if(!textView){
        @jobs_weakify(self)
        textView = jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
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
