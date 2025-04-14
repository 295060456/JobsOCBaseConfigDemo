//
//  JobsBtnStyleTBVCell.h
//  FM
//
//  Created by User on 8/11/24.
//

#import "JobsBaseTableViewCell.h"
#import "UIButtonModel.h"
#import "BaseButtonProtocol.h"

NS_ASSUME_NONNULL_BEGIN
/// 将一个按钮整个覆盖到TableViewCell上面，以实现图文混排
/// 同 JobsBtnStyleCVCell
@interface JobsBtnStyleTBVCell : JobsBaseTableViewCell<BaseButtonProtocol>

-(BaseButton *)btn;
/// 获取绑定的数据源
-(UIViewModel *)getViewModel;

@end

NS_ASSUME_NONNULL_END
