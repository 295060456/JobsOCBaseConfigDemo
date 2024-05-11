//
//  JobsTextView.h
//  DouDong-II
//
//  Created by alan comb on 2021/4/3.
//

#import "BaseView.h"
#import "UITextView+Extend.h"

#if __has_include(<SZTextView/SZTextView.h>)
#import <SZTextView/SZTextView.h>
#else
#import "SZTextView.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsTextView : BaseView

-(SZTextView *)getTextView;
-(void)updateWordCount:(NSInteger)count;

@end

NS_ASSUME_NONNULL_END
