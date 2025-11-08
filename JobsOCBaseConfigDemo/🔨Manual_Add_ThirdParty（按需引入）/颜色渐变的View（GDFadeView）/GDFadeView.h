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
Prop_assign()NSTextAlignment alignment;
@property(nonatomic,strong,nullable)UIColor *backColor;
@property(nonatomic,strong,nullable)UIColor *foreColor;
@property(nonatomic,strong,nullable)UIFont *font;

-(JobsRetViewByTimeIntervalBlock _Nonnull)iPhoneFadeWithDuration;

@end

NS_INLINE __kindof GDFadeView *_Nonnull jobsMakeGDFadeView(jobsByGDFadeViewBlock _Nonnull block){
    GDFadeView *data = GDFadeView.alloc.init;
    if (block) block(data);
    return data;
}
