//
//  UIViewController+Masonry.h
//  FMNormal
//
//  Created by Jobs on 2025/5/14.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "DefineProperty.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Masonry)

Prop_copy()jobsByMASConstraintMakerBlock masonryBlock;

-(JobsRetBOOLByViewBlock _Nonnull)containBy;
/// 实现 masonryBlock 链式方法
-(JobsReturnVCByMasonryConstraintsBlocks _Nonnull)setMasonryBy;
#pragma mark —— 执行约束
/// 含义：添加新的约束
/// 适用场景：第一次为视图添加约束
/// 行为：不会影响已有约束；不会自动删除或更新已存在的约束
-(JobsRetViewByViewBlock _Nonnull)on;
/// 含义：更新已有的约束
/// 适用场景：已经添加过约束，需要修改某些数值
/// 行为：只会更新匹配的已有约束；不会新建或移除不相关的约束
-(JobsRetViewByViewBlock _Nonnull)upgrade;
/// 含义：先移除旧的所有约束，再添加新的
/// 适用场景：布局逻辑发生了变化，原有约束不再适用
/// 行为：会移除视图上所有 Masonry 创建的约束，再应用 block 中的新约束
-(JobsRetViewByViewBlock _Nonnull)remake;
#pragma mark —— 添加约束并执行
-(JobsReturnViewByViewAndMasonryConstraintsBlocks _Nonnull)byAdd;
-(JobsReturnViewByViewAndMasonryConstraintsBlocks _Nonnull)byUpgrade;
-(JobsReturnViewByViewAndMasonryConstraintsBlocks _Nonnull)byRemake;
#pragma mark —— 卸载约束
/// 卸载当前view上的某个方向的约束
-(jobsByLayoutAttributeBlock _Nonnull)uninstall;
/// 卸载当前view上的全部约束
-(jobsByVoidBlock _Nonnull)uninstallAllLayoutAttribute;
#pragma mark —— Masonry约束动画
/// 是一个用于执行 两个阶段动画布局切换 的自定义封装，常用于需要分两次改变布局的 UI 动效
/// - Parameters:
///   - masonryBeforeBlock: 最初的约束
///   - masonryAfterBlock: 希望变到的最后的约束
-(void)jobsMasonryBeforeBlock:(jobsByMASConstraintMakerBlock _Nonnull)masonryBeforeBlock
            masonryAfterBlock:(jobsByMASConstraintMakerBlock _Nonnull)masonryAfterBlock;
@end

NS_ASSUME_NONNULL_END
