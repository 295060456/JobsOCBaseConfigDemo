//
//  UIView+Masonry.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/18.
//

#import "UIView+Masonry.h"

@implementation UIView (Masonry)
/// 实现 masonryBlock 链式方法
-(JobsReturnViewByMasonryConstraintsBlock _Nonnull)setMasonryBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        self.masonryBlock = block;
        return self;
    };
}
/// 卸载当前view上的某个方向的约束
-(jobsByLayoutAttributeBlock _Nonnull)uninstall{
    @jobs_weakify(self)
    return ^(NSLayoutAttribute layoutAttribute) {
        @jobs_strongify(self)
        for (MASViewConstraint *constraint in [MASViewConstraint installedConstraintsForView:self]) {
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
        for (MASViewConstraint *constraint in [MASViewConstraint installedConstraintsForView:self]) {
            [constraint uninstall];
        }
    };
}
/// Masonry约束动画
/// - Parameters:
///   - masonryBeforeBlock: 最初的约束
///   - masonryAfterBlock: 希望变到的最后的约束
-(void)jobsMasonryBeforeBlock:(void(^)(MASConstraintMaker *make))masonryBeforeBlock
            masonryAfterBlock:(void(^)(MASConstraintMaker *make))masonryAfterBlock{
    [self uninstallAllLayoutAttribute];
    if(masonryBeforeBlock) [self mas_remakeConstraints:masonryBeforeBlock];
    // 告诉视图需要更新布局
    [self.superview setNeedsUpdateConstraints];
    // 执行动画
    @jobs_weakify(self)
    [UIView animateWithDuration:0.5
                     animations:^{
        @jobs_strongify(self)
        [self.superview layoutIfNeeded]; // 让视图更新布局
    } completion:^(BOOL finished) {
        @jobs_strongify(self)
        // 在动画完成后，切换到第二个 _view2 的约束
        if(masonryAfterBlock) [self mas_remakeConstraints:masonryAfterBlock];
        // 再次告诉视图需要更新布局
        [self.superview setNeedsUpdateConstraints];
        // 再次执行动画
        @jobs_weakify(self)
        [UIView animateWithDuration:0.5
                         animations:^{
            @jobs_strongify(self)
            [self.superview layoutIfNeeded]; // 让视图更新布局
        }];
    }];
}
#pragma mark —— @property(nonatomic,copy)jobsByMASConstraintMakerBlock masonryBlock;
JobsKey(_masonryBlock)
@dynamic masonryBlock;
-(jobsByMASConstraintMakerBlock)masonryBlock{
    return Jobs_getAssociatedObject(_masonryBlock);
}

-(void)setMasonryBlock:(jobsByMASConstraintMakerBlock)masonryBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_masonryBlock, masonryBlock)
}

@end
