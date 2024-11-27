//
//  GDFadeView.h
//  FadeView
//
//  Created by xiaoyu on 15/11/13.
//  Copyright © 2015年 guoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

@interface GDFadeView : UIView

@property(nonatomic,copy,nullable)NSString *text;
@property(nonatomic,assign)NSTextAlignment alignment;
@property(nonatomic,strong,nullable)UIColor *backColor;
@property(nonatomic,strong,nullable)UIColor *foreColor;
@property(nonatomic,strong,nullable)UIFont *font;

-(jobsByTimeIntervalBlock _Nonnull)iPhoneFadeWithDuration;

@end
