//
//  SZTextView+Extra.h
//  FM
//
//  Created by Admin on 10/12/2024.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

#if __has_include(<SZTextView/SZTextView.h>)
#import <SZTextView/SZTextView.h>
#else
#import "SZTextView.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface SZTextView (Extra)

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof SZTextView *_Nonnull jobsMakeSZTextView(jobsBySZTextViewBlock _Nonnull block){
    SZTextView *data = SZTextView.alloc.init;
    if (block) block(data);
    return data;
}
