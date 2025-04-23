//
//  JobsNavBarConfig.h
//  FM
//
//  Created by User on 7/24/24.
//

#import <Foundation/Foundation.h>
#import "UIButtonModel.h"
#import "BaseProtocol.h"
#import "JobsBlock.h"
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN
extern JobsNavBarConfig *static_navBarConfig;
@interface JobsNavBarConfig : NSObject<BaseProtocol>
#pragma mark —— 对Bar的配置
Prop_assign()CGFloat alpha;
Prop_strong(null_resettable)UIColor *bgCor;
Prop_strong()UIImage *bgImage;/// 无默认值，优先级 bgImage > bgCor
Prop_strong()UIViewModel *viewModel;
#pragma mark —— backBtn 的配置
Prop_strong(null_resettable)UIButtonModel *backBtnModel;
Prop_strong()__kindof UIButton *backBtn;
#pragma mark —— 对标题的设置
Prop_copy()NSAttributedString *attributedTitle;
Prop_copy(null_resettable)NSString *title;
Prop_strong(null_resettable)UIFont *font;
Prop_strong(null_resettable)UIColor *titleCor;
#pragma mark —— closeBtn 的配置
Prop_strong(null_resettable)UIButtonModel *closeBtnModel;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsNavBarConfig *_Nonnull jobsMakeNavBarConfig(jobsByNavBarConfigBlock _Nonnull block){
    JobsNavBarConfig *data = JobsNavBarConfig.alloc.init;
    if (block) block(data);
    return data;
}
