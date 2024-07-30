//
//  UITableView+RegisterClass.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (RegisterClass)

-(void)registerTableViewClass;
/// 注册 HeaderFooterView 及其子类 jobsByClassBlock
-(jobsByClassAndSaltStrBlock)registerHeaderFooterViewClass;
/// 注册 UITableViewCell 及其子类
-(jobsByClassAndSaltStrBlock)registerTableViewCellClass;
/// 一种用字符串取UITableViewCell及其子类的方法❤️复用字符串是目标类的类名❤️
-(JobsReturnTableViewCellByClsAndSaltStrBlock)tableViewCellClass;
/// 一种用字符串 和 indexPath 取UITableViewCell及其子类的方法❤️复用字符串是目标类的类名❤️
-(JobsReturnTableViewCellByCls_SaltStr_IndexPath_Block)tableViewCellClassForIndexPath;
/// 一种用字符串取UITableViewHeaderFooterView及其子类的方法❤️复用字符串是目标类的类名❤️
-(JobsReturnTableViewHeaderFooterViewByClsAndSaltStrBlock)tableViewHeaderFooterView;

@end

NS_ASSUME_NONNULL_END
