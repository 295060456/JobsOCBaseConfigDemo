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

@property(nonatomic,strong,readonly)BaseButton *backBtn;
@property(nonatomic,strong,readonly)UILabel *titleLab;
@property(nonatomic,strong,readonly)BaseButton *closeBtn;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsNavBar *_Nonnull jobsMakeNavBar(jobsByNavBarBlock _Nonnull block){
    JobsNavBar *data = JobsNavBar.alloc.init;
    if (block) block(data);
    return data;
}
