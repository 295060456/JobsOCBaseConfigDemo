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
@synthesize backgroundView = _backgroundView;
BaseViewProtocol_synthesize
-(instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        /// self.backgroundColor 和  self.contentView.backgroundColor 均是无效操作
        /// 只有 self.backgroundView.backgroundColor 是有效操作
        self.backgroundView.alpha = 1;
    }return self;
}
/// 在具体的子类实现，实现控制UITableViewHeaderFooterView是否悬停
- (void)setFrame:(CGRect)frame {
    if (self.headerFooterViewStyle == JobsHeaderViewStyle) {
        [super setFrame:[self.tableView rectForHeaderInSection:self.section]];
    }else if (self.headerFooterViewStyle == JobsFooterViewStyle){
        [super setFrame:[self.tableView rectForFooterInSection:self.section]];
    }else{}
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    if (self.objectBlock) self.objectBlock(@1);
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(id _Nullable)model{}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)heightForHeaderInSection:(id _Nullable)model{
    return JobsWidth(70);
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)heightForFooterInSection:(id _Nullable)model{
    return JobsWidth(70);
}
#pragma mark —— lazyLoad
-(UIView *)backgroundView{
    if (!_backgroundView) {
        _backgroundView = UIView.new;
        _backgroundView.frame = self.bounds;
    }return _backgroundView;
}

@end
