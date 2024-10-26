//
//  JobsNavBar.h
//  FM
//
//  Created by User on 7/24/24.
//

#import "BaseImageView.h"
#import "BaseButton.h"
#import "JobsNavBarConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsNavBar : BaseImageView
/// Data
@property(nonatomic,strong)JobsNavBarConfig *navBarConfig;
/// 左中右三个控件
-(BaseButton *)backBtn;
-(UILabel *)titleLab;
-(BaseButton *)closeBtn;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsNavBar *_Nonnull jobsMakeNavBar(jobsByNavBarBlock _Nonnull block){
    JobsNavBar *data = JobsNavBar.alloc.init;
    if (block) block(data);
    return data;
}
