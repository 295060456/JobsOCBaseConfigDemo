//
//  SlideToUnlockView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 11/29/25.
//

#import <UIKit/UIKit.h>
#import "DefineProperty.h"
#import "JobsBlock.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface SlideToUnlockView : UIView
/// 滑到最右侧时回调（只在成功滑到头时调用）
Prop_copy(nullable)jobsByVoidBlock onUnlock;
/// DSL：点语法配置解锁回调
Prop_copy(readonly)SlideToUnlockView * _Nonnull (^byOnUnlock)(jobsByVoidBlock _Nullable);
/// 复位到最左侧
-(jobsByBOOLBlock _Nonnull)byResetAnimated;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof SlideToUnlockView *_Nonnull
jobsMakeSlideToUnlockView(jobsBySlideToUnlockViewBlock _Nonnull block){
    SlideToUnlockView *data = SlideToUnlockView.alloc.init;
    if (block) block(data);
    return data;
}
