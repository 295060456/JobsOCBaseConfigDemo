//
//  JobsBtnStyleCVCell.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/16.
//

#import "JobsBaseCollectionViewCell.h"
#import "JobsBlock.h"
#import "DefineProperty.h"
#import "UIButtonModel.h"
#import "UIViewModel.h"
#import "UIButton+UI.h"
#import "UIButton+SimplyMake.h"
#import "UIButton+SDWebImage.h"
#import "UIViewModelProtocol.h"
#import "NSObject+CallBackInfoByBlock.h"
#import "UIViewModelOthersProtocol.h"

NS_ASSUME_NONNULL_BEGIN
/// 只在BaseCollectionViewCell完整的盖一个Button
/// 其目的是利用Button丰富的图文展示效果
/// 同 JobsBtnStyleTBVCell
@interface JobsBtnStyleCVCell : JobsBaseCollectionViewCell

-(jobsByIDBlock _Nonnull)makeUp;

@end

NS_ASSUME_NONNULL_END
