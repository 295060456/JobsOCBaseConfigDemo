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

NS_ASSUME_NONNULL_BEGIN
extern JobsNavBarConfig *static_navBarConfig;
@interface JobsNavBarConfig : NSObject<BaseProtocol>
#pragma mark —— 对Bar的配置
@property(nonatomic,strong,null_resettable)UIColor *bgCor;
@property(nonatomic,strong)UIImage *bgImage;/// 无默认值，优先级 bgImage > bgCor
#pragma mark —— backBtn 的配置
@property(nonatomic,strong,null_resettable)UIButtonModel *backBtnModel;
#pragma mark —— 对标题的设置
@property(nonatomic,copy)NSAttributedString *attributedTitle;
@property(nonatomic,copy,null_resettable)NSString *title;
@property(nonatomic,strong,null_resettable)UIFont *font;
@property(nonatomic,strong,null_resettable)UIColor *titleCor;
#pragma mark —— closeBtn 的配置
@property(nonatomic,strong,null_resettable)UIButtonModel *closeBtnModel;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsNavBarConfig *_Nonnull jobsMakeNavBarConfig(jobsByNavBarConfigBlock _Nonnull block){
    JobsNavBarConfig *data = JobsNavBarConfig.alloc.init;
    if (block) block(data);
    return data;
}
