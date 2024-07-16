//
//  BaiShaETProjMembersSubsBaseVC.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/18.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaiShaETProjMembersSubsBaseVC : BaseViewController

@property(nonatomic,strong)UILabel *topLineLab;

#pragma mark —— 一些公有方法
-(CGSize)getTopLineLabSize;

@end

NS_ASSUME_NONNULL_END
