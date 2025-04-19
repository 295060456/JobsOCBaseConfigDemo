//
//  WGradientProgressLab.h
//  Shooting
//
//  Created by Jobs on 2020/9/9.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/// 进度条上方的指示标签，可以作为动态跟随，也可以作为固定在栅栏的上方
@interface WGradientProgressView : UIView

Prop_copy()NSString *titleStr;
Prop_strong()UIImage *img;

Prop_strong()UIFont *titleFont;
Prop_strong()UIColor *titleColor;

@end

NS_ASSUME_NONNULL_END
