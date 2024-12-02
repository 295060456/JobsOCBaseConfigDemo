//
//  UIView+Masonry.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/18.
//

#import <UIKit/UIKit.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Masonry)

@property(nonatomic,copy)jobsByMASConstraintMakerBlock masonryBlock;
-(JobsReturnViewByMasonryConstraintsBlock _Nonnull)setMasonryBy;
/// 卸载当前view上的某个方向的约束
-(jobsByLayoutAttributeBlock _Nonnull)uninstall;
/// 卸载当前view上的全部约束
-(jobsByVoidBlock _Nonnull)uninstallAllLayoutAttribute;
/// Masonry约束动画
/// - Parameters:
///   - masonryBeforeBlock: 最初的约束
///   - masonryAfterBlock: 希望变到的最后的约束
-(void)jobsMasonryBeforeBlock:(void(^)(MASConstraintMaker *make))masonryBeforeBlock
            masonryAfterBlock:(void(^)(MASConstraintMaker *make))masonryAfterBlock;

@end

NS_ASSUME_NONNULL_END
