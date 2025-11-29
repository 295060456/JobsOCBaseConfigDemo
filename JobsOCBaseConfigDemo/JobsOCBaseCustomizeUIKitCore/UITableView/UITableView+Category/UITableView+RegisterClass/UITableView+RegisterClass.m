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
    [self registerClass:UITableViewCell.class forCellReuseIdentifier:UITableViewCell.class.description.add(@"")];
    /// 以此类推
}

-(JobsRetTableViewByStringBlock _Nonnull)byRegisterTableViewClass{
    return ^__kindof UITableView *_Nullable(NSString *_Nullable ID){
        if(!ID) ID = @"";
        [self registerClass:UITableViewCell.class forCellReuseIdentifier:UITableViewCell.class.description.add(ID)];
        return self;
    };
}
/// 不加盐注册
-(jobsByClsBlock _Nonnull)registerTableViewClassBy{
    @jobs_weakify(self)
    return ^(Class _Nonnull cls){
        @jobs_strongify(self)
        [self registerClass:cls forCellReuseIdentifier:cls.description];
    };
}
/// 加盐注册
-(jobsByClassAndSaltBlock _Nonnull)registerTableViewClassBySalt{
    @jobs_weakify(self)
    return ^(Class _Nonnull cls,__kindof NSString *_Nullable salt){
        @jobs_strongify(self)
        [self registerClass:cls forCellReuseIdentifier:cls.description.add(salt)];
    };
}
/// 注册 HeaderFooterView 及其子类 jobsByClassBlock
-(JobsRetTableViewByClsAndSaltStrBlock _Nonnull)registerHeaderFooterViewClass{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(Class _Nonnull cls,NSString * _Nullable salt) {
        @jobs_strongify(self)
        if(!cls) cls = UITableViewHeaderFooterView.class;
        [self registerClass:cls forHeaderFooterViewReuseIdentifier:cls.description.add(salt)];
        return self;
    };
}
/// 注册 UITableViewCell 及其子类
-(JobsRetTableViewByClsAndSaltStrBlock _Nonnull)registerTableViewCellClass{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(Class _Nonnull cls,NSString * _Nullable salt) {
        @jobs_strongify(self)
        if(!cls) cls = UITableViewCell.class;
        [self registerClass:cls forCellReuseIdentifier:cls.description.add(salt)];
        return self;
    };
}
#pragma mark —— 取值
/// 不使用 registerClass 直接创建 UITableViewCell ❤️复用字符串是目标类的类名❤️
-(JobsRetTableViewCellByClsAndSaltStrBlock _Nonnull)tableViewCellClass{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(Class _Nonnull cls,NSString * _Nullable salt) {
        @jobs_strongify(self)
        if(!cls) cls = UITableViewCell.class;
        return [self dequeueReusableCellWithIdentifier:cls.description.add(salt)];
    };
}
/// 使用 registerClass 注册 UITableViewCell ❤️复用字符串是目标类的类名❤️
-(JobsRetTableViewCellByCls_SaltStr_IndexPath_Block _Nonnull)tableViewCellClassForIndexPath{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(Class _Nonnull cls,
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
-(JobsRetTableViewHeaderFooterViewByClsAndSaltStrBlock _Nonnull)tableViewHeaderFooterView{
    @jobs_weakify(self)
    return ^__kindof UITableViewHeaderFooterView *_Nullable(Class _Nonnull cls, NSString * _Nullable salt) {
        @jobs_strongify(self)
        if(!cls) cls = UITableViewHeaderFooterView.class;
        UITableViewHeaderFooterView *tableViewHeaderFooterView = [self dequeueReusableHeaderFooterViewWithIdentifier:cls.description.add(salt)];
        if(!tableViewHeaderFooterView){
            self.registerHeaderFooterViewClass(cls,salt);
            tableViewHeaderFooterView = self.tableViewHeaderFooterView(cls,salt);
        }return tableViewHeaderFooterView;
    };
}

@end
