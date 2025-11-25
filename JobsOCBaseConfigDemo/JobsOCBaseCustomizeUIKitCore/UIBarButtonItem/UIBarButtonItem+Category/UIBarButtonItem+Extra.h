//
//  UIBarButtonItem+Extra.h
//  FM
//
//  Created by User on 8/31/24.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (Extra)

+(JobsRetBarButtonItemByViewBlock _Nonnull)initBy;
-(JobsRetBarButtonItemByRACCommandBlock _Nonnull)byRacCommand;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UIBarButtonItem * _Nullable JobsBarButtonItem(__kindof UIView *_Nullable view){
    return [UIBarButtonItem.alloc initWithCustomView:view];
}
