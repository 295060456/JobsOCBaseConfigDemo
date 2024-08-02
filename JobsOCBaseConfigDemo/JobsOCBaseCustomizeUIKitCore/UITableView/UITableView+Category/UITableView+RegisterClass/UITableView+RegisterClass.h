//
//  UITableView+RegisterClass.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (RegisterClass)
#pragma mark —— 注册
-(void)registerTableViewClass;
/// 注册 HeaderFooterView 及其子类 jobsByClassBlock
-(jobsByClassAndSaltStrBlock)registerHeaderFooterViewClass;
/// 注册 UITableViewCell 及其子类
-(jobsByClassAndSaltStrBlock)registerTableViewCellClass;
#pragma mark —— 取值
/// 不使用 registerClass 直接创建 UITableViewCell ❤️复用字符串是目标类的类名❤️
-(JobsReturnTableViewCellByClsAndSaltStrBlock)tableViewCellClass;
/// 使用 registerClass 注册 UITableViewCell ❤️复用字符串是目标类的类名❤️
-(JobsReturnTableViewCellByCls_SaltStr_IndexPath_Block)tableViewCellClassForIndexPath;
/// 一种用字符串取UITableViewHeaderFooterView及其子类的方法❤️复用字符串是目标类的类名❤️
-(JobsReturnTableViewHeaderFooterViewByClsAndSaltStrBlock)tableViewHeaderFooterView;

@end

NS_ASSUME_NONNULL_END
