//
//  JobsTextView.h
//  DouDong-II
//
//  Created by alan comb on 2021/4/3.
//

#import "JobsBlock.h"
#import "BaseView.h"
#import "UITextView+Extend.h"
#import "UITextView+Placeholder.h"
#import "SZTextView+Extra.h"
#import "DefineConstString.h" /// 常量字符串的定义

#if __has_include(<SZTextView/SZTextView.h>)
#import <SZTextView/SZTextView.h>
#else
#import "SZTextView.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsTextView : BaseView

-(SZTextView *)getTextView;
-(jobsByNSIntegerBlock _Nonnull)updateWordCount;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsTextView *_Nonnull makeJobsTextView(jobsByJobsTextViewBlock _Nonnull block){
    JobsTextView *data = JobsTextView.alloc.init;
    if (block) block(data);
    return data;
}
