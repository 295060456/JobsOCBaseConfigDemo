//
//  UIScrollView+Extra.h
//  Casino
//
//  Created by Jobs on 2021/12/22.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (Extra)
/// 在 UIScrollViewDelegate协议方法 -(void)scrollViewDidScroll:(UIScrollView *)scrollView里进行调用
-(ScrollDirection)scrolldirectionWhenScrollViewDidScroll;
#pragma mark —— 一些公共方法
-(jobsByVoidBlock _Nonnull)reloadDatas;
/// 得到visibleCells
-(NSArray <UIView *>*_Nullable)scrollViewCells;
/// 依据index得到cell
-(UIView *_Nullable)scrollViewCellsAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
