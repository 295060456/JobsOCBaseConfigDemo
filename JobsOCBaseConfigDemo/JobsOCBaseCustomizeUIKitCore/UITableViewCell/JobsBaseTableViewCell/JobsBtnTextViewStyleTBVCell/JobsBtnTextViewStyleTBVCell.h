//
//  JobsBtnTextViewStyleTBVCell.h
//  FMNormal
//
//  Created by Jobs on 2025/4/28.
//

#import "JobsBaseTableViewCell.h"
#import "BaseTextView.h"
#import "JobsTextView.h"

#if __has_include(<SZTextView/SZTextView.h>)
#import <SZTextView/SZTextView.h>
#else
#import "SZTextView.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 包含一个按钮 和 一个TextView（用于承接富文本及其点击事件）
@interface JobsBtnTextViewStyleTBVCell : JobsBaseTableViewCell<UITextViewDelegate>

@end

NS_ASSUME_NONNULL_END
