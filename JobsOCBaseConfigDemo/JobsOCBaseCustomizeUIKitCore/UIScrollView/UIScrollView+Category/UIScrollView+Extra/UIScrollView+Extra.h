//
//  UIScrollView+Extra.h
//  Casino
//
//  Created by Jobs on 2021/12/22.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#import "JobsBlock.h"
#import "JobsDefineAllEnumHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (Extra)
/// 在 UIScrollViewDelegate协议方法 -(void)scrollViewDidScroll:(UIScrollView *)scrollView里进行调用
-(ScrollDirection)scrolldirectionWhenScrollViewDidScroll;
#pragma mark —— 一些公共方法
-(jobsByVoidBlock _Nonnull)reloadDatas;
/// 得到visibleCells
-(NSArray <UIView *>*_Nullable)scrollViewCells;
/// 依据index得到cell
-(JobsReturnViewByNSUIntegerBlock _Nonnull)scrollViewCellsByIndex;
/// 对系统方法 - (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;  的二次封装
-(JobsReturnScrollViewByPointBlock _Nonnull)setContentOffsetByYES;
/// 对系统方法 - (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;  的二次封装
-(JobsReturnScrollViewByPointBlock _Nonnull)setContentOffsetByNO;
/// 对系统方法 - (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated;   的二次封装
-(JobsReturnScrollViewByRectBlock _Nonnull)scrollRectToVisibleByYES;
/// 对系统方法 - (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated;  的二次封装
-(JobsReturnScrollViewByRectBlock _Nonnull)scrollRectToVisibleByNO;

@end

NS_ASSUME_NONNULL_END
