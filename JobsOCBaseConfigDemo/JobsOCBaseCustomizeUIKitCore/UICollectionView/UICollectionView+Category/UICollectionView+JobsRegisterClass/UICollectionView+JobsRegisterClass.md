# ***UICollectionView+JobsRegisterClass***

* 我为什么要这么做
  * 所有的关于***UICollectionView***复用的模块统一进行管理，因为从本质上来讲他们是View
  * 需要进行注册，那么在`@interface UICollectionView (JobsRegisterClass)`这个类进行统一的管理
  * 这么做的好处是：防止业务变更，UI界面的调整，程序员要在每一个具体的单位进行调整，造成代码很难看而且增加crash的风险
  * 统一注册之后，那么用的时候用字符串进行取值，从而达到代码和业务逻辑强烈变更的某种平衡
