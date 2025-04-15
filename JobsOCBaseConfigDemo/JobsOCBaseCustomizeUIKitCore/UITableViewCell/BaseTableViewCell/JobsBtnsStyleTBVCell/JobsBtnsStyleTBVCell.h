//
//  JobsBtnsStyleTBVCell.h
//  MataShop
//
//  Created by Jobs Hi on 10/14/23.
//

#import "JobsBaseTableViewCell.h"
#import "UIButton+UI.h"

NS_ASSUME_NONNULL_BEGIN
/// 左右两边各有一个UIButton
@interface JobsBtnsStyleTBVCell : JobsBaseTableViewCell

-(BaseButton *)leftBtn;
-(BaseButton *)rightBtn;
/// 获取绑定的数据源
-(UIViewModel *)getViewModel;

@end

NS_ASSUME_NONNULL_END
