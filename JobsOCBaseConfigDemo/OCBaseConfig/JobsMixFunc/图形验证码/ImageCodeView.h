//
//  ImageCodeView.h
//  XLVerCodeView
//
//  Created by Mac-Qke on 2019/7/9.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageCodeView : UIView

Prop_copy()__kindof NSArray <NSString *>*CodeArr;
Prop_copy()NSString *CodeStr;

Prop_strong()UIColor *color;
Prop_strong()UIFont *font;
Prop_strong()UIColor *bgColor;//外界不传值定义内部即用随机色彩

-(void)actionBlockImageCodeView:(jobsByIDBlock _Nullable)imageCodeViewBlock;

@end

NS_ASSUME_NONNULL_END
