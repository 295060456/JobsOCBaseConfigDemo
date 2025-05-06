//
//  JobsNavBar.h
//  FM
//
//  Created by User on 7/24/24.
//

#import "JobsBlock.h"
#import "DefineProperty.h"
#import "BaseImageView.h"
#import "BaseButton.h"
#import "JobsNavBarConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsNavBar : BaseImageView

Prop_strong(readonly)BaseButton *backBtn;
Prop_strong(readonly)UILabel *titleLab;
Prop_strong(readonly)BaseButton *closeBtn;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsNavBar *_Nonnull jobsMakeNavBar(jobsByNavBarBlock _Nonnull block){
    JobsNavBar *data = JobsNavBar.alloc.init;
    if (block) block(data);
    return data;
}
