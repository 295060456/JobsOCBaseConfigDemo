//
//  UICollectionHeaderFooterView.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/10.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
/**
 
 参考资料：https://juejin.cn/post/6844904016959258631
 对于 UITableView 实现表头很简单，对列表的 tableHeaderView 属性设置即可：
 self.tableView.tableHeaderView = self.topHeaderView;
 
 UICollectionView 并没有类似的 tableHeaderView 属性，若要实现表头表尾，大体可分为2种方式：
 【方式一】
 // 设定列表头部内边距为顶部视图高度
  _collectionView.contentInset = UIEdgeInsetsMake(self.topHeaderViewHeightValue, 0, 0, 0);
 // 将表头添加到列表中，在内边距位置展示
 [_collectionView addSubView:self.topHeaderView];
 ...
 设定列表尾类似（略）
 【方式二】
 UICollectionViewDelegateFlowLayout代理实现头尾
 在实际开发中，若存在复杂的回顶操作，下拉刷新，动态调整表头高度等操作，建议不要使用内边距方法实现，使用 UICollectionViewDelegateFlowLayout 代理实现更佳
 1、添加 UICollectionViewDelegateFlowLayout 代理
 2、注册表头（头部视图）、注册表尾（尾部视图）
 /// 注册 UICollectionElementKindSectionHeader 及其子类
 -(void)registerCollectionElementKindSectionHeaderClass:(Class)cls{
     [self registerClass:cls
     forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
     withReuseIdentifier:cls.description];
 }
 /// 注册 UICollectionElementKindSectionFooter 及其子类
 -(void)registerCollectionElementKindSectionFooterClass:(Class)cls{
     [self registerClass:cls
     forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
     withReuseIdentifier:cls.description];
 }
 3、实现头部视图
 - (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
            viewForSupplementaryElementOfKind:(NSString *)kind
                                  atIndexPath:(NSIndexPath *)indexPath;
 
     kind == UICollectionElementKindSectionHeader
     kind == UICollectionElementKindSectionFooter
 4、设置视图高度
    4.1、设置头部视图高度
 - (CGSize)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
 referenceSizeForHeaderInSection:(NSInteger)section;
    4.2、设置尾部视图高度
 - (CGSize)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout
 referenceSizeForFooterInSection:(NSInteger)section;
 
 */
@interface UICollectionHeaderFooterView : BaseView

@property(nonatomic,assign)BOOL isZoom;

-(void)scrollViewDidScrollWithContentOffsetY:(CGFloat)contentOffsetY;

@end

NS_ASSUME_NONNULL_END
