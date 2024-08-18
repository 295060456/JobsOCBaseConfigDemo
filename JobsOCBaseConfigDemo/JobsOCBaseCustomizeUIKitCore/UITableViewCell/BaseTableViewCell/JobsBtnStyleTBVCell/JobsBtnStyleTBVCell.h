//
//  JobsBtnStyleTBVCell.h
//  FM
//
//  Created by User on 8/11/24.
//

#import "JobsBaseTableViewCell.h"
#import "UIButtonModel.h"

NS_ASSUME_NONNULL_BEGIN
/// 将一个按钮整个覆盖到TableViewCell上面，以实现图文混排
@interface JobsBtnStyleTBVCell : JobsBaseTableViewCell

-(BaseButton *)btn;
/// 获取绑定的数据源
-(UIViewModel *)getViewModel;

@end

NS_ASSUME_NONNULL_END
