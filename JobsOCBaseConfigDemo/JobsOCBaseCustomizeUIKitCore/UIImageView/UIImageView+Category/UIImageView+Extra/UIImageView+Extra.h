//
//  UIImageView+Extra.h
//  FM
//
//  Created by Admin on 4/11/2024.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Extra)

+(JobsReturnImageViewByImageBlock _Nonnull)initBy;
-(JobsReturnImageViewByImageBlock _Nonnull)byImage;

@end

NS_ASSUME_NONNULL_END
