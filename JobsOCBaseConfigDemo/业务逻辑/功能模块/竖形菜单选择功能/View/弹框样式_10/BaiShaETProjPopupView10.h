//
//  BaiShaETProjPopupView10.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/16.
//

#import "BaseView.h"
#import "JobsBtnStyleCVCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaiShaETProjPopupView10 : BaseView
<
UICollectionViewDataSource
,UICollectionViewDelegate
,UICollectionViewDelegateFlowLayout
>
#pragma mark —— 一些公有方法
-(void)shakeCell:(BOOL)start;

@end

NS_ASSUME_NONNULL_END
