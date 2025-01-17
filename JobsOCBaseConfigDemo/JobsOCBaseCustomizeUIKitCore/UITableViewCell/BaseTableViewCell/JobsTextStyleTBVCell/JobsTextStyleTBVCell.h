//
//  JobsTextStyleTBVCell.h
//  FM
//
//  Created by User on 8/11/24.
//

#import "JobsBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN
/// 将一个文本整个覆盖到TableViewCell上面
@interface JobsTextStyleTBVCell : JobsBaseTableViewCell

@property(nonatomic,strong,readonly)UILabel *lab;
/// 获取绑定的数据源
-(UIViewModel *)getViewModel;

@end

NS_ASSUME_NONNULL_END
