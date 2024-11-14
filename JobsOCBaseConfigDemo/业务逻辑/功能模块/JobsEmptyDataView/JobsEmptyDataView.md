# `JobsEmptyDataView`
给UITableview和UICollectionView在无数据情况下加提示

* 特别鸣谢：

  ```ruby
  pod 'LYEmptyView' # https://github.com/dev-liyang/LYEmptyView iOS一行代码集成空白页面占位图(无数据、无网络占位图)
  
  #if __has_include(<LYEmptyView/LYEmptyViewHeader.h>)
  #import <LYEmptyView/LYEmptyViewHeader.h>
  #else
  #import "LYEmptyViewHeader.h"
  #endif
  ```

* 实现思路：方法交换系统的`reloadData`方法

* 提示UI实现了`UILabel`和`UIButton`,最终选用`UIButton`。是因为其丰富的UI表现形式

* 默认全局进行添加

* 只有在不需要的情况下，传未配置的`UIButtonModel`进行取消

  `UICollectionView`同理；

  ```objective-c
  - (UITableView *)tableView {
      if (!_tableView) {
          _tableView = UITableView.initWithStylePlain;
          _tableView.showsVerticalScrollIndicator = NO;
          _tableView.showsHorizontalScrollIndicator = NO;
          _tableView.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
          _tableView.dataLink(self);
          _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
          _tableView.buttonModelEmptyData = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
              /// 这里不显示，传没有配置的UIButtonModel
          });
          [self addSubview:_tableView];
          [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
              make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
          }];
      }return _tableView;
  }
  ```

  

  



