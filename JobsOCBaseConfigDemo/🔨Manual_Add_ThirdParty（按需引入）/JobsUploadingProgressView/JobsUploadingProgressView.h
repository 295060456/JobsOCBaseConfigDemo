//
//  JobsUploadingProgressView.h
//  DouDong-II
//
//  Created by xxx on 2021/1/12.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsUploadingProgressView : BaseView

Prop_strong()UIColor *strokeColor; // 圆的线条颜色
Prop_copy()NSString *titleStr; // 描述文字
Prop_strong()UIImage *imge; // 圆内Logo
Prop_assign()CGFloat width; // 提示框 w
Prop_assign()CGFloat height; // 提示框 h
Prop_assign()CGFloat radius; // 圆半径

+(instancetype)sharedManager;
-(void)updateProgressText:(NSString *)progressText;

@end

NS_ASSUME_NONNULL_END
