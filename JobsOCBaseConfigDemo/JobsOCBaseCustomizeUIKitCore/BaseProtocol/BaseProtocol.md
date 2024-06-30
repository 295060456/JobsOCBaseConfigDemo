#  BaseProtocol 相关继承结构关系图

```objective-c
1、UIViewModelProtocol <NSObject>
2、BaseProtocol <NSObject>
    2.1、AppToolsProtocol <BaseProtocol>
    2.2、BaseViewProtocol <BaseProtocol>
        2.2.1、BaseViewControllerProtocol<BaseViewProtocol>
        2.2.2、BaseButtonProtocol <BaseViewProtocol>
        2.2.3、BaseCellProtocol <BaseViewProtocol>
                2.2.3.1、UITableViewCellProtocol<BaseCellProtocol>
                2.2.3.2、UICollectionViewCellProtocol<BaseCellProtocol>
3、NTESVerifyCodeManagerProtocol <NSObject>
4、ZFDouYinCellDelegate <NSObject>
```
