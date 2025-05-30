//
//  JobsTextViewStyleTBVCell.h
//  FMNormal
//
//  Created by Jobs on 2025/4/28.
//

#import "JobsBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN
/// 将一个TextView整个覆盖到TableViewCell上面
@interface JobsTextViewStyleTBVCell : JobsBaseTableViewCell<UITextViewDelegate>
/// 获取绑定的数据源
-(UIViewModel *)getViewModel;

@end

NS_ASSUME_NONNULL_END
