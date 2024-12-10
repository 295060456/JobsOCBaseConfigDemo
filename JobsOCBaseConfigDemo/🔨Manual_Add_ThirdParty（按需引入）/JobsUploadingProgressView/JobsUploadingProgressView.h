//
//  JobsUploadingProgressView.h
//  DouDong-II
//
//  Created by xxx on 2021/1/12.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsUploadingProgressView : BaseView

@property(nonatomic,strong)UIColor *strokeColor; // 圆的线条颜色
@property(nonatomic,copy)NSString *titleStr; // 描述文字
@property(nonatomic,strong)UIImage *imge; // 圆内Logo
@property(nonatomic,assign)CGFloat width; // 提示框 w
@property(nonatomic,assign)CGFloat height; // 提示框 h
@property(nonatomic,assign)CGFloat radius; // 圆半径

+(instancetype)sharedManager;
-(void)updateProgressText:(NSString *)progressText;

@end

NS_ASSUME_NONNULL_END
