//
//  NSObject+UIScrollViewDelegate.m
//  Casino
//
//  Created by Jobs on 2021/12/22.
//

#import "NSObject+UIScrollViewDelegate.h"

@implementation NSObject (UIScrollViewDelegate)
/// 滚动视图移动时回调
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [scrollView scrolldirectionWhenScrollViewDidScroll];
}
/// 滚动视图结束拖动时回调
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                 willDecelerate:(BOOL)decelerate{
    JobsLog(@"视图结束拖动");
}
/// 滚动视图即将开始拖动时回调
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    JobsLog(@"滚动视图即将开始拖动");
}
/// 滚动视图结束拖动时回调
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset{
    JobsLog(@"滚动视图结束拖动");
}
/// 视图即将减速时调用
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    JobsLog(@"视图即将减速");
}
/// 视图已经结束减速时回调
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    JobsLog(@"视图已经结束减速");
}


@end
