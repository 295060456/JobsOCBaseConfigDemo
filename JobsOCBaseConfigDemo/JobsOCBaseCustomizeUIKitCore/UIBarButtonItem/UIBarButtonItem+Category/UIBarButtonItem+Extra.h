//
//  UIBarButtonItem+Extra.h
//  FM
//
//  Created by User on 8/31/24.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_INLINE __kindof UIBarButtonItem * _Nullable JobsBarButtonItem(__kindof UIView *_Nullable view){
    return [UIBarButtonItem.alloc initWithCustomView:view];
}

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (Extra)

+(JobsReturnBarButtonItemByViewBlock _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END
