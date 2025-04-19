//
//  FMBannerAdsModel.h
//  FM
//
//  Created by User on 9/17/24.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"
#import "UIViewModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface FMBannerAdsModel : BaseModel<UIViewModelProtocol>

Prop_copy()NSString *accountName; /// 会员账号列表或代理账号列表：只有account_type等于1,3 有值
Prop_assign()FMAccType accountType; /// 账号类型：0-所有会员 1-指定会员 2-全代理线 3-指定代理线
Prop_assign()BOOL advStatus; /// 广告状态（0开启 1停用）
Prop_assign()FMAdsType advType; /// 广告类型：0-首页天顶轮播大Banner 1-导航栏4小Banner 2-APP首页右下3Banner, 3-APP会员中心,4-活动推广专区
Prop_copy()NSString *androidImage; /// 安卓图片：adv_type=2,3,4才有值
Prop_copy()NSString *carouselTitle; /// 轮播标题
Prop_copy()NSString *createBy; /// 创建人
Prop_copy()NSString *endingTime; /// 下架时间
Prop_copy()NSString *h5Image; /// H5图片：adv_type=0,1,4才有值
Prop_copy()NSString *h5SmallImage; /// H5图片(小)：adv_type=1才有值
Prop_assign()NSInteger ID;
Prop_copy()NSString *introduction; /// 简介
Prop_copy()NSString *iosImage; /// ios图片:：adv_type=2,3,4才有值
Prop_copy()NSString *jumpParameter; /// 跳转参数 0:lobbyId ,1: lobbyId, 2 : activityId,3 : 網址 4:不用傳
Prop_assign()FMJumpType jumpType; /// 跳转类型:0-指定游戏 1-场馆大厅 2-活动模块 3-网站地址 4-不跳转
Prop_copy()NSString *port; /// 适用端口
Prop_assign()BOOL showForGuest; /// 游客展示（0否 1是）
Prop_assign()NSInteger sortNum; /// 排序序号
Prop_copy()NSString *startingTime; /// 上架时间
Prop_assign()NSInteger tenantId; /// 租户ID
Prop_copy()NSString *updateBy; /// 修改人
Prop_copy()NSString *updateTime;
Prop_copy()NSString *vipLimitGroup; /// VIP限制(根据会员ID)
Prop_copy()NSString *webImage; /// web图片(PC)：adv_type=0,1,4才有值
Prop_copy()NSString *webSmallImage; /// web图片(小)：adv_type=1才有值

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof FMBannerAdsModel *_Nonnull jobsMakeBannerAdsModel(jobsByBannerAdsModelBlock _Nonnull block){
    FMBannerAdsModel *data = FMBannerAdsModel.alloc.init;
    if (block) block(data);
    return data;
}
