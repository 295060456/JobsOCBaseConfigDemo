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
    [self registerClass:UITableViewCell.class
 forCellReuseIdentifier:UITableViewCell.class.description.add(@"")];
    /// 以此类推
}
/// 注册 HeaderFooterView 及其子类 jobsByClassBlock
-(jobsByClassAndSaltStrBlock)registerHeaderFooterViewClass{
    @jobs_weakify(self)
    return ^(Class _Nonnull cls,NSString * _Nullable salt) {
        @jobs_strongify(self)
        if(!cls) cls = UITableViewCell.class;
        [self registerClass:cls forHeaderFooterViewReuseIdentifier:cls.description.add(salt)];
    };
}
/// 注册 UITableViewCell 及其子类
-(jobsByClassAndSaltStrBlock)registerTableViewCellClass{
    @jobs_weakify(self)
    return ^(Class _Nonnull cls,NSString * _Nullable salt) {
        @jobs_strongify(self)
        if(!cls) cls = UITableViewCell.class;
        [self registerClass:cls forCellReuseIdentifier:cls.description.add(salt)];
    };
}
#pragma mark —— 取值
/// 不使用 registerClass 直接创建 UITableViewCell ❤️复用字符串是目标类的类名❤️
-(JobsReturnTableViewCellByClsAndSaltStrBlock)tableViewCellClass{
    @jobs_weakify(self)
    return ^(Class _Nonnull cls,NSString * _Nullable salt) {
        @jobs_strongify(self)
        if(!cls) cls = UITableViewCell.class;
        return [self dequeueReusableCellWithIdentifier:cls.description.add(salt)];
    };
}
/// 使用 registerClass 注册 UITableViewCell ❤️复用字符串是目标类的类名❤️
-(JobsReturnTableViewCellByCls_SaltStr_IndexPath_Block)tableViewCellClassForIndexPath{
    @jobs_weakify(self)
    return ^(Class _Nonnull cls,
             NSString * _Nullable salt,
             NSIndexPath * _Nonnull indexPath) {
        @jobs_strongify(self)
        if(!cls) cls = UITableViewCell.class;
        UITableViewCell *tableViewCell = [self dequeueReusableCellWithIdentifier:cls.description.add(salt) forIndexPath:indexPath];
        if(!tableViewCell){
            self.registerTableViewCellClass(cls,salt);
            tableViewCell = [self dequeueReusableCellWithIdentifier:cls.description.add(salt) forIndexPath:indexPath];
        }return tableViewCell;
    };
}
/// 一种用字符串取UITableViewHeaderFooterView及其子类的方法❤️复用字符串是目标类的类名❤️
-(JobsReturnTableViewHeaderFooterViewByClsAndSaltStrBlock)tableViewHeaderFooterView{
    @jobs_weakify(self)
    return ^(Class _Nonnull cls, NSString * _Nullable salt) {
        @jobs_strongify(self)
        if(!cls) cls = UITableViewHeaderFooterView.class;
        UITableViewHeaderFooterView *tableViewHeaderFooterView = [self dequeueReusableHeaderFooterViewWithIdentifier:cls.description.add(salt)];
        if(!tableViewHeaderFooterView){
            self.registerHeaderFooterViewClass(cls,salt);
            tableViewHeaderFooterView = self.tableViewHeaderFooterView(cls,@"");
        }return tableViewHeaderFooterView;
    };
}

@end
