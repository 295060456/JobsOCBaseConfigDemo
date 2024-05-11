//
//  BaseContentView.h
//  JobsAppDoor
//
//  Created by Jobs on 2020/12/7.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

static const CGFloat btnWidth = 64;

NS_ASSUME_NONNULL_BEGIN

@interface BaseContentView : BaseView

-(void)showContentViewWithOffsetY:(CGFloat)offsetY;
-(void)removeContentViewWithOffsetY:(CGFloat)offsetY;

@end

NS_ASSUME_NONNULL_END
