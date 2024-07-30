//
//  UITableView+RegisterClass.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/26.
//

#import "UITableView+RegisterClass.h"

@implementation UITableView (RegisterClass)
#pragma mark —— 注册
-(void)registerTableViewClass{
#warning initTableViewCellWithStyle:UITableViewCellStyleSubtitle 怎么设置？！

}
/// 注册 HeaderFooterView 及其子类 jobsByClassBlock
-(jobsByClassAndSaltStrBlock)registerHeaderFooterViewClass{
    @jobs_weakify(self)
    return ^(Class _Nonnull cls,NSString * _Nullable salt) {
        @jobs_strongify(self)
        [self registerClass:cls forHeaderFooterViewReuseIdentifier:cls.description.add(salt)];
    };
}
/// 注册 UITableViewCell 及其子类
-(jobsByClassAndSaltStrBlock)registerTableViewCellClass{
    @jobs_weakify(self)
    return ^(Class _Nonnull cls,NSString * _Nullable salt) {
        @jobs_strongify(self)
        [self registerClass:cls forCellReuseIdentifier:cls.description.add(salt)];
    };
}
#pragma mark —— 取值
/// 一种用字符串取UITableViewCell及其子类的方法❤️复用字符串是目标类的类名❤️
-(JobsReturnTableViewCellByClsAndSaltStrBlock)tableViewCellClass{
    @jobs_weakify(self)
    return ^(Class _Nonnull cls,NSString * _Nullable salt) {
        @jobs_strongify(self)
        return [self dequeueReusableCellWithIdentifier:cls.description.add(salt)];
    };
}
/// 一种用字符串 和 indexPath 取UITableViewCell及其子类的方法❤️复用字符串是目标类的类名❤️
-(JobsReturnTableViewCellByCls_SaltStr_IndexPath_Block)tableViewCellClassForIndexPath{
    @jobs_weakify(self)
    return ^(Class _Nonnull cls,
             NSString * _Nullable salt,
             NSIndexPath * _Nonnull indexPath) {
        @jobs_strongify(self)
        return [self dequeueReusableCellWithIdentifier:cls.description.add(salt) forIndexPath:indexPath];
    };
}
/// 一种用字符串取UITableViewHeaderFooterView及其子类的方法❤️复用字符串是目标类的类名❤️
-(JobsReturnTableViewHeaderFooterViewByClsAndSaltStrBlock)tableViewHeaderFooterView{
    @jobs_weakify(self)
    return ^(Class _Nonnull cls, NSString * _Nullable salt) {
        @jobs_strongify(self)
        return [self dequeueReusableHeaderFooterViewWithIdentifier:cls.description.add(salt)];
    };
}

@end
