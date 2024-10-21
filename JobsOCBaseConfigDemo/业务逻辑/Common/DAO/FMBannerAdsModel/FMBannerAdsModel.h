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

@property(nonatomic,copy)NSString *accountName; /// 会员账号列表或代理账号列表：只有account_type等于1,3 有值
@property(nonatomic,assign)FMAccType accountType; /// 账号类型：0-所有会员 1-指定会员 2-全代理线 3-指定代理线
@property(nonatomic,assign)BOOL advStatus; /// 广告状态（0开启 1停用）
@property(nonatomic,assign)FMAdsType advType; /// 广告类型：0-首页天顶轮播大Banner 1-导航栏4小Banner 2-APP首页右下3Banner, 3-APP会员中心,4-活动推广专区
@property(nonatomic,copy)NSString *androidImage; /// 安卓图片：adv_type=2,3,4才有值
@property(nonatomic,copy)NSString *carouselTitle; /// 轮播标题
@property(nonatomic,copy)NSString *createBy; /// 创建人
@property(nonatomic,copy)NSString *endingTime; /// 下架时间
@property(nonatomic,copy)NSString *h5Image; /// H5图片：adv_type=0,1,4才有值
@property(nonatomic,copy)NSString *h5SmallImage; /// H5图片(小)：adv_type=1才有值
@property(nonatomic,assign)NSInteger ID;
@property(nonatomic,copy)NSString *introduction; /// 简介
@property(nonatomic,copy)NSString *iosImage; /// ios图片:：adv_type=2,3,4才有值
@property(nonatomic,copy)NSString *jumpParameter; /// 跳转参数 0:lobbyId ,1: lobbyId, 2 : activityId,3 : 網址 4:不用傳
@property(nonatomic,assign)FMJumpType jumpType; /// 跳转类型:0-指定游戏 1-场馆大厅 2-活动模块 3-网站地址 4-不跳转
@property(nonatomic,copy)NSString *port; /// 适用端口
@property(nonatomic,assign)BOOL showForGuest; /// 游客展示（0否 1是）
@property(nonatomic,assign)NSInteger sortNum; /// 排序序号
@property(nonatomic,copy)NSString *startingTime; /// 上架时间
@property(nonatomic,assign)NSInteger tenantId; /// 租户ID
@property(nonatomic,copy)NSString *updateBy; /// 修改人
@property(nonatomic,copy)NSString *updateTime;
@property(nonatomic,copy)NSString *vipLimitGroup; /// VIP限制(根据会员ID)
@property(nonatomic,copy)NSString *webImage; /// web图片(PC)：adv_type=0,1,4才有值
@property(nonatomic,copy)NSString *webSmallImage; /// web图片(小)：adv_type=1才有值

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof FMBannerAdsModel *_Nonnull jobsMakeBannerAdsModel(jobsByBannerAdsModelBlock _Nonnull block){
    FMBannerAdsModel *data = FMBannerAdsModel.alloc.init;
    if (block) block(data);
    return data;
}
