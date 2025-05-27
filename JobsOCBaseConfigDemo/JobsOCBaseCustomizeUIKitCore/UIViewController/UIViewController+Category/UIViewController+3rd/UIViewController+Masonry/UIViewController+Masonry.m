//
//  UIViewController+Masonry.m
//  FMNormal
//
//  Created by Jobs on 2025/5/14.
//

#import "UIViewController+Masonry.h"

@implementation UIViewController (Masonry)

-(JobsReturnBOOLByViewBlock _Nonnull)containBy{
    @jobs_weakify(self)
    return ^BOOL(__kindof UIView *_Nullable subView){
        @jobs_strongify(self)
        return self.view.subviews.containsObject(subView);
    };
}
/// 实现 masonryBlock 链式方法
-(JobsReturnVCByMasonryConstraintsBlocks _Nonnull)setMasonryBy{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        self.masonryBlock = block;
        return self;
    };
}
#pragma mark —— 执行约束
/// 含义：添加新的约束
/// 适用场景：第一次为视图添加约束
/// 行为：不会影响已有约束；不会自动删除或更新已存在的约束
-(JobsReturnViewByViewBlock _Nonnull)on{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIView *_Nullable subView){
        @jobs_strongify(self)
        if(!self.containBy(subView)) self.view.addSubview(subView);
        [subView mas_makeConstraints:self.masonryBlock];
        self.view.refresh();
        return subView;
    };
}
/// 含义：更新已有的约束
/// 适用场景：已经添加过约束，需要修改某些数值
/// 行为：只会更新匹配的已有约束；不会新建或移除不相关的约束
-(JobsReturnViewByViewBlock _Nonnull)upgrade{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIView *_Nullable subView){
        @jobs_strongify(self)
        if(!self.containBy(subView)) self.view.addSubview(subView);
        /// 只更新需要更改的约束，其余约束不变
        [subView mas_updateConstraints:self.masonryBlock];
        self.view.refresh();
        return subView;
    };
}
/// 含义：先移除旧的所有约束，再添加新的
/// 适用场景：布局逻辑发生了变化，原有约束不再适用
/// 行为：会移除视图上所有 Masonry 创建的约束，再应用 block 中的新约束
-(JobsReturnViewByViewBlock _Nonnull)remake{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIView *_Nullable subView){
        @jobs_strongify(self)
        if(!self.containBy(subView)) self.view.addSubview(subView);
        [subView mas_remakeConstraints:self.masonryBlock];
        self.view.refresh();
        return subView;
    };
}
#pragma mark —— 添加约束并执行
-(JobsReturnViewByViewAndMasonryConstraintsBlocks _Nonnull)masonryBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView * _Nonnull subview,jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        self.setMasonryBy(block).on(subview);
        return subview;
    };
}

-(JobsReturnViewByViewAndMasonryConstraintsBlocks _Nonnull)upgradeBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView * _Nonnull subview,jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        self.setMasonryBy(block).upgrade(subview);
        return subview;
    };
}

-(JobsReturnViewByViewAndMasonryConstraintsBlocks _Nonnull)remakeBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView * _Nonnull subview,jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        self.setMasonryBy(block).remake(subview);
        return subview;
    };
}
#pragma mark —— 卸载约束
/// 卸载当前view上的某个方向的约束
-(jobsByLayoutAttributeBlock _Nonnull)uninstall{
    @jobs_weakify(self)
    return ^(NSLayoutAttribute layoutAttribute) {
        @jobs_strongify(self)
        for (MASViewConstraint *constraint in [MASViewConstraint installedConstraintsForView:self.view]) {
            if (constraint.firstViewAttribute.layoutAttribute == layoutAttribute) {
                [constraint uninstall];
            }
        }
    };
}
/// 卸载当前view上的全部约束
-(jobsByVoidBlock _Nonnull)uninstallAllLayoutAttribute{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        for (MASViewConstraint *constraint in [MASViewConstraint installedConstraintsForView:self.view]) {
            [constraint uninstall];
        }
    };
}
#pragma mark —— Masonry约束动画
/// 是一个用于执行 两个阶段动画布局切换 的自定义封装，常用于需要分两次改变布局的 UI 动效
/// - Parameters:
///   - masonryBeforeBlock: 最初的约束
///   - masonryAfterBlock: 希望变到的最后的约束
-(void)jobsMasonryBeforeBlock:(jobsByMASConstraintMakerBlock _Nonnull)masonryBeforeBlock
            masonryAfterBlock:(jobsByMASConstraintMakerBlock _Nonnull)masonryAfterBlock{
    [self uninstallAllLayoutAttribute];
    if(masonryBeforeBlock) [self.view mas_remakeConstraints:masonryBeforeBlock];
    /// 告诉视图需要更新布局
    [self.view setNeedsUpdateConstraints];
    /// 执行动画
    @jobs_weakify(self)
    [UIView animateWithDuration:0.5
                     animations:^{
        @jobs_strongify(self)
        [self.view layoutIfNeeded]; // 让视图更新布局
    } completion:^(BOOL finished) {
        @jobs_strongify(self)
        /// 在动画完成后，切换到第二个 _view2 的约束
        if(masonryAfterBlock) [self.view mas_remakeConstraints:masonryAfterBlock];
        /// 再次告诉视图需要更新布局
        [self.view setNeedsUpdateConstraints];
        /// 再次执行动画
        @jobs_weakify(self)
        [UIView animateWithDuration:0.5
                         animations:^{
            @jobs_strongify(self)
            [self.view layoutIfNeeded]; // 让视图更新布局
        }];
    }];
}
#pragma mark —— Prop_copy()jobsByMASConstraintMakerBlock masonryBlock;
JobsKey(_masonryBlock)
@dynamic masonryBlock;
-(jobsByMASConstraintMakerBlock)masonryBlock{
    return Jobs_getAssociatedObject(_masonryBlock);
}

-(void)setMasonryBlock:(jobsByMASConstraintMakerBlock)masonryBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_masonryBlock, masonryBlock)
}

@end
