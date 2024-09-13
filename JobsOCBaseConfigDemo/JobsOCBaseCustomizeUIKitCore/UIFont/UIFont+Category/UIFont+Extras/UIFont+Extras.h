//
//  UIFont+Extras.h
//  UBallLive
//
//  Created by Jobs on 2020/11/4.
//

#import <UIKit/UIKit.h>
#import "NSMutableArray+Extra.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (Extras)
/// 打印全员字体
+(JobsReturnArrayByVoidBlock _Nonnull)getAvailableFont;
/// 打印外援字体
+(JobsReturnArrayByVoidBlock _Nonnull)foreignAidFontName;

@end

NS_ASSUME_NONNULL_END
