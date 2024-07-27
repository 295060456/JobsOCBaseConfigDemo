//
//  JobsNavBar.h
//  FM
//
//  Created by User on 7/24/24.
//

#import "BaseImageView.h"
#import "BaseButton.h"
#import "JobsNavBarConfig.h"

#ifndef JobsNavBar_typedef
#define JobsNavBar_typedef
typedef void(^JobsNavBarBackBtnClickAction)(UIButton *_Nullable data);
typedef void(^JobsNavBarCloseBtnClickAction)(UIButton * _Nullable data);
#endif /* JobsNavBar_typedef */

NS_ASSUME_NONNULL_BEGIN

@interface JobsNavBar : BaseImageView
/// Data
@property(nonatomic,strong)JobsNavBarConfig *navBarConfig;
// 左中右三个控件
-(BaseButton *)getBackBtn;
-(UILabel *)getTitleLab;
-(BaseButton *)getCloseBtn;
// 返回按钮的回调
-(void)actionNavBarBackBtnClickBlock:(JobsNavBarBackBtnClickAction)objectBlock;
// 关闭按钮的回调
-(void)actionNavBarCloseBtnClickBlock:(JobsNavBarCloseBtnClickAction)objectBlock;

@end

NS_ASSUME_NONNULL_END
