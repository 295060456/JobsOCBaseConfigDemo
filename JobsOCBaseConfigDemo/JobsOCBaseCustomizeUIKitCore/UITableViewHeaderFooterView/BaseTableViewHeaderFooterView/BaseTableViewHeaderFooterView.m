//
//  BaseTableViewHeaderFooterView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/30.
//

#import "BaseTableViewHeaderFooterView.h"

@interface BaseTableViewHeaderFooterView ()

@end

@implementation BaseTableViewHeaderFooterView
#pragma mark —— BaseViewProtocol
BaseViewProtocol_synthesize
-(instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        /// self.backgroundColor 和  self.contentView.backgroundColor 均是无效操作❌
        /// 只有 self.backgroundView.backgroundColor 是有效操作✅
        /// 默认情况下，backgroundView 是 nil
        self.backgroundView = [UIView.alloc initWithFrame:self.bounds];
    }return self;
}
/**
 #import "UITableViewHeaderFooterView+Attribute.h"
 在具体的子类实现，实现控制UITableViewHeaderFooterView是否悬停
 资料来源：https://github.com/Zydhjx/HeaderDemo
 */
- (void)setFrame:(CGRect)frame {
    if (self.headerFooterViewStyle == JobsHeaderViewStyle) {
        [super setFrame:[self.tableView rectForHeaderInSection:self.section]];
    }else if (self.headerFooterViewStyle == JobsFooterViewStyle){
        [super setFrame:[self.tableView rectForFooterInSection:self.section]];
    }else{}
}

- (void)layoutSubviews{
    [super layoutSubviews];
    // 解决当UITableViewHeaderFooterView悬浮的时候背景白色的问题（设置成透明色）
    // 遍历子视图，找到UIVisualEffectView
    for (UIView *subview in self.subviews) {
        if([subview isKindOfClass:NSClassFromString(@"_UISystemBackgroundView")]){
            // subview.backgroundColor = JobsClearColor; 设置成透明色，无效
            subview.jobsVisible = NO;
        }
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    if (self.objectBlock) self.objectBlock(@1);
}
#pragma mark —— BaseViewProtocol
/**
 在这个方法里：
 传入：UITableViewHeaderFooterView *
 对外返回：创建需要覆盖在UITableViewHeaderFooterView *的在View
 再在- (nullable __kindof UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section方法里面：
 self.makeViewOnTableViewHeaderFooterView(headerView).alpha = 1; /// 进行一句话进行调用
 */
-(JobsReturnViewByTableViewHeaderFooterViewBlock)makeViewOnTableViewHeaderFooterView{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable (__kindof UITableViewHeaderFooterView *_Nonnull headerFooterView) {
        @jobs_strongify(self)
        /// headerFooterView.backgroundColor 和  headerFooterView.contentView.backgroundColor 均是无效操作❌
        /// 只有 headerFooterView.backgroundView.backgroundColor 是有效操作✅
        return nil;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable data) {
        @jobs_strongify(self)
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)heightForHeaderInSection{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(140);
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)heightForFooterInSectionByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(70);
    };
}
#pragma mark —— lazyLoad

@end
