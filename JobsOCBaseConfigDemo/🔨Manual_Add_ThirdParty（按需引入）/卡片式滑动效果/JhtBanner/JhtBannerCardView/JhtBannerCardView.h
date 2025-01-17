//
//  JhtBannerCardView.h
//  JhtBannerScrollView
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jinht on 2017/6/2.
//  Copyright © 2017年 JhtBannerScrollView. All rights reserved.
//

#import <UIKit/UIKit.h>
/// banner cardView（单张卡片）
@interface JhtBannerCardView : UIView
/// 图片
@property(nonatomic,strong,nullable)UIImageView *cardImageView;
@property(nonatomic,strong,nullable)UILabel *cardLab;
/// 蒙板 View（覆盖在cardImageView上）
@property(nonatomic,strong,nullable)UIView *coverView;

+(JobsReturnJhtBannerCardViewByFrame _Nonnull)initByFrame;

@end
