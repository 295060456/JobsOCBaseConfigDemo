//
//  UIViewController+JXPagingViewListViewDelegate.h
//  UBallLive
//
//  Created by Jobs on 2020/10/26.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#if __has_include(<JXPagingView/JXPagerView.h>)
#import <JXPagingView/JXPagerView.h>
#else
#import "JXPagerView.h"
#endif

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (JXPagerViewListViewDelegate)
<
JXPagerViewListViewDelegate,
UIScrollViewDelegate
>

@property(nonatomic,strong)UIScrollView *scrollView;//这个属性一旦有值，说明开启UITableViewHeaderFooterView不悬停。系统在UITableViewStylePlain模式下是默认悬停的
@property(nonatomic,strong)Class scrollViewClass;
@property(nonatomic,copy)void(^scrollCallback)(UIScrollView *scrollView);

@end

NS_ASSUME_NONNULL_END
/**
 
 用JXPagerView管理的区别：
 
 1、注册协议JXPagerViewDelegate、舍弃协议JXCategoryListContainerViewDelegate
    1.1、舍弃 : - (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView;
    1.2、舍弃： - (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index;
    1.3、舍弃： - (void)categoryView:(JXCategoryBaseView *)categoryView didClickSelectedItemAtIndex:(NSInteger)index ;
    1.4、舍弃： - (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index ;
    1.5、舍弃： - (void)categoryView:(JXCategoryBaseView *)categoryView didScrollSelectedItemAtIndex:(NSInteger)index;
    1.6、舍弃： - (void)categoryView:(JXCategoryBaseView *)categoryView
            scrollingFromLeftIndex:(NSInteger)leftIndex
                   toRightIndex:(NSInteger)rightIndex
                         ratio:(CGFloat)ratio ;
 2、舍弃属性类 JXCategoryListContainerView
    2.1、舍弃 @property(nonatomic,strong)JXCategoryListContainerView *listContainerView;/// 此属性决定依附于此的viewController@property(nonatomic,strong)
    2.1 、舍弃
         -(JXCategoryListContainerView *)listContainerView{
             if (!_listContainerView) {
                 _listContainerView = [JXCategoryListContainerView.alloc initWithType:JXCategoryListContainerType_CollectionView
                                                                             delegate:self];
                 _listContainerView.defaultSelectedIndex = 1;// 默认从第二个开始显示
                 [self.view addSubview:_listContainerView];
                 [_listContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
         //            make.edges.equalTo(self.view);
                     make.top.equalTo(self.topLineLab.mas_bottom).offset(listContainerViewDefaultOffset);
                     make.left.right.bottom.equalTo(self.view);

                 }];
                 [self.view layoutIfNeeded];
         //        /// ❤️在需要的地方写❤️
         //        NSNumber *currentIndex = [self.listContainerView valueForKey:@"currentIndex"];
         //        NSLog(@"滑动或者点击以后，改变控制器，得到的目前最新的index = %d",currentIndex.intValue);

             }return _listContainerView;
         }
 3、JXCategoryTitleView 舍弃部分属性：
    3.1、舍弃：_categoryView.contentScrollView = self.listContainerView.scrollView;/// 关联cotentScrollView，关联之后才可以互相联动！！！
    3.2、在 JXPagerView 模式下 ,不用设置JXCategoryTitleView的height、size、frame。而是在JXPagingViewDelegate代理方法里面设置
 
 4、_categoryView新增属性：_categoryView.listContainer = (id<JXCategoryViewListContainer>)self.pagerView.listContainerView;
 5、全局新增属性：@property(nonatomic,strong)JXPagerView *pagerView;
 6、新增JXPagingViewDelegate代理协议的实现
     6.1、- (UIView *)tableHeaderViewInPagerView:(JXPagerView *)pagerView;
     6.2、- (void)pagerView:(JXPagerView *)pagerView
        mainTableViewDidScroll:(UIScrollView *)scrollView;
     6.3、- (NSUInteger)tableHeaderViewHeightInPagerView:(JXPagerView *)pagerView ;
     6.4、- (NSUInteger)heightForPinSectionHeaderInPagerView:(JXPagerView *)pagerView;/// JXCategoryTitleView *categoryView 的高度
     6.5、- (UIView *)viewForPinSectionHeaderInPagerView:(JXPagerView *)pagerView;
     6.6、- (NSInteger)numberOfListsInPagerView:(JXPagerView *)pagerView;
     6.7、- (id<JXPagerViewListViewDelegate>)pagerView:(JXPagerView *)pagerView
                                  initListAtIndex:(NSInteger)index;
 7、各个子VC要遵循代理协议JXPagerViewListViewDelegate，并实现相关方法
    7.1、 - (UIView *)listView;
    7.2、 - (UIScrollView *)listScrollView;
    7.3、 - (void)listViewDidScrollCallback:(void (^)(UIScrollView *scrollView))callback;
    7.4、或者直接导入类：#import "UIViewController+JXPagerViewListViewDelegate.h"
 
 */
