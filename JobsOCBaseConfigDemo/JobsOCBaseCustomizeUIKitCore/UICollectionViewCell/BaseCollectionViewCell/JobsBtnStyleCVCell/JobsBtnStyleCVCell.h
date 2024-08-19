//
//  JobsBtnStyleCVCell.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/16.
//

#import "JobsBaseCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN
/// 只在BaseCollectionViewCell完整的盖一个Button
/// 其目的是利用Button丰富的图文展示效果
@interface JobsBtnStyleCVCell : JobsBaseCollectionViewCell
#pragma mark —— 一些公有方法
-(BaseButton *)btn;

@end

NS_ASSUME_NONNULL_END
