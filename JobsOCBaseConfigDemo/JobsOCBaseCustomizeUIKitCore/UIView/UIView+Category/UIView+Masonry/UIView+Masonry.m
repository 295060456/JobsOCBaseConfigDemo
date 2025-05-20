//
//  UIView+Masonry.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/18.
//

#import "UIView+Masonry.h"

@implementation UIView (Masonry)
#pragma mark —— 一些Masonry算法
/// 制作一个带有n*m小矩形内容的大矩形（二次封装）
-(jobsByViewArrayRowsColumnsBlock _Nonnull)gridLayoutBy{
    @jobs_weakify(self)
    return ^(__kindof NSArray <__kindof UIView *>*_Nullable arr,NSInteger rows,NSInteger columns){
        @jobs_strongify(self)
        [self setupGridWithRows:rows
                        columns:columns
                      itemViews:arr.count ? arr : jobsMakeMutArr(^(__kindof NSMutableArray<UIView *> * _Nullable arr) {
            for (int i = 0; i < rows * columns; i++) {
                arr.add(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    view.backgroundColor = JobsRandomColor;
                }));
            }
        })
                         margin:JobsWidth(10)
                        spacing:JobsWidth(10)];
    };
}
/// 制作一个带有n*m小矩形内容的大矩形（核心算法）
-(void)setupGridWithRows:(NSInteger)rows
                 columns:(NSInteger)columns
               itemViews:(NSArray<__kindof UIView *> *)views
                  margin:(CGFloat)margin
                 spacing:(CGFloat)spacing{
    NSAssert(views.count == rows * columns, @"视图数量必须等于 rows * columns");
    UIView *lastRowTop = nil;
    for (NSInteger row = 0; row < rows; row++) {
        UIView *lastView = nil;
        for (NSInteger col = 0; col < columns; col++) {
            UIView *view = views[row * columns + col];
            self.addSubview(view);
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                // 顶部约束
                if (lastRowTop) {
                    make.top.equalTo(lastRowTop.mas_bottom).offset(spacing);
                } else {
                    make.top.equalTo(self.mas_top).offset(margin);
                }
                // 左右等间距
                if (lastView) {
                    make.left.equalTo(lastView.mas_right).offset(spacing);
                    make.width.equalTo(lastView); // 等宽
                } else {
                    make.left.equalTo(self.mas_left).offset(margin);
                }
                // 最后一列贴右边
                if (col == columns - 1) {
                    make.right.equalTo(self.mas_right).offset(-margin);
                }
                // 固定高度（可调整为参数或动态）
                make.height.mas_equalTo(80);
            }];lastView = view;
        }lastRowTop = views[row * columns]; // 当前行第一项的 top 作为下一行参考
    }
}
#pragma mark —— 实现 masonryBlock 链式方法
-(JobsReturnViewByMasonryConstraintsBlocks _Nonnull)setMasonryBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        self.masonryBlock = block;
        return self;
    };
}
#pragma mark —— 执行约束
/// 含义：添加新的约束
/// 适用场景：第一次为视图添加约束
/// 行为：不会影响已有约束；不会自动删除或更新已存在的约束
-(JobsReturnViewByVoidBlock _Nonnull)on{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(){
        @jobs_strongify(self)
        [self mas_makeConstraints:self.masonryBlock];
        self.refresh();
        return self;
    };
}
/// 含义：更新已有的约束
/// 适用场景：已经添加过约束，需要修改某些数值
/// 行为：只会更新匹配的已有约束；不会新建或移除不相关的约束
-(JobsReturnViewByVoidBlock _Nonnull)upgrade{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(){
        @jobs_strongify(self)
        /// 只更新需要更改的约束，其余约束不变
        [self mas_updateConstraints:self.masonryBlock];
        self.refresh();
        return self;
    };
}
/// 含义：先移除旧的所有约束，再添加新的
/// 适用场景：布局逻辑发生了变化，原有约束不再适用
/// 行为：会移除视图上所有 Masonry 创建的约束，再应用 block 中的新约束
-(JobsReturnViewByVoidBlock _Nonnull)remake{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(){
        @jobs_strongify(self)
        [self mas_remakeConstraints:self.masonryBlock];
        self.refresh();
        return self;
    };
}
#pragma mark —— 添加约束并执行
-(JobsReturnViewByMasonryConstraintsBlocks _Nonnull)masonryBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        self.setMasonryBy(block).on();
        return self;
    };
}

-(JobsReturnViewByMasonryConstraintsBlocks _Nonnull)upgradeBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        self.setMasonryBy(block).upgrade();
        return self;
    };
}

-(JobsReturnViewByMasonryConstraintsBlocks _Nonnull)remakeBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        self.setMasonryBy(block).remake();
        return self;
    };
}
#pragma mark —— 卸载约束
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
#pragma mark —— Masonry约束动画
/// 是一个用于执行 两个阶段动画布局切换 的自定义封装，常用于需要分两次改变布局的 UI 动效
/// - Parameters:
///   - masonryBeforeBlock: 最初的约束
///   - masonryAfterBlock: 希望变到的最后的约束
-(void)jobsMasonryBeforeBlock:(jobsByMASConstraintMakerBlock _Nonnull)masonryBeforeBlock
            masonryAfterBlock:(jobsByMASConstraintMakerBlock _Nonnull)masonryAfterBlock{
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
