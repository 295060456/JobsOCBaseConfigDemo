//
//  UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.m
//  Casino
//
//  Created by Jobs on 2021/11/19.
//

#import "UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.h"

@implementation UITableViewHeaderFooterView (BaseTableViewHeaderFooterViewProtocol)
#pragma mark —— BaseViewProtocol
+(JobsReturnTableViewHeaderFooterViewByTableViewAndSaltBlock _Nonnull)initByReuseIdentifier{
    @jobs_weakify(self)
    return ^__kindof UITableViewHeaderFooterView *_Nullable(__kindof UITableView *_Nullable tableView,
                                                            NSString * _Nullable salt) {
        @jobs_strongify(self)
        return tableView.tableViewHeaderFooterView(self.class,salt).byTableView(tableView);
    };
}

-(JobsReturnTableViewHeaderFooterViewByNSIntegerBlock _Nonnull)bySection{
    @jobs_weakify(self)
    return ^__kindof UITableViewHeaderFooterView *_Nullable(NSInteger section){
        @jobs_strongify(self)
        self.section = section;
        return self;
    };
}
/// 标记是HeaderView 还是 FooterView
-(JobsReturnTableViewHeaderFooterViewByNSIntegerBlock _Nonnull)byStyle{
    @jobs_weakify(self)
    return ^__kindof UITableViewHeaderFooterView *_Nullable(JobsHeaderFooterViewStyle style){
        @jobs_strongify(self)
        self.headerFooterViewStyle = style;
        return self;
    };
}
/// @implementation UITableViewHeaderFooterView (Attribute)
-(JobsReturnTableViewHeaderFooterViewByTableViewBlock _Nonnull)byTableView{
    @jobs_weakify(self)
    return ^__kindof UITableViewHeaderFooterView *_Nullable(__kindof UITableView *_Nullable tableView){
        @jobs_strongify(self)
        self.tbv = tableView;
        return self;
    };
}
/// 具体由子类进行复写【数据定UI】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(__kindof UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        if (model.isKindOfClass(UIViewModel.class)) {
            /// self.contentView.backgroundColor = JobsCyanColor; 这样设置无效
            self.backgroundView.backgroundColor = JobsCyanColor;
        }
    };
}
/// 具体由子类进行复写【数据定高】
+(JobsReturnCGFloatByIDBlock _Nonnull)viewHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(5);
    };
}
/// 具体由子类进行复写【数据Frame】
+(JobsReturnCGRectByIDBlock _Nonnull)viewFrameByModel{
    return ^CGRect(id _Nullable data){
        return CGRectMake(0,
                          0,
                          JobsMainScreen_WIDTH(),
                          JobsWidth(5));
    };
}
#pragma mark —— Prop_assign()JobsHeaderFooterViewStyle headerFooterViewStyle;
JobsKey(_headerFooterViewStyle)
@dynamic headerFooterViewStyle;
-(JobsHeaderFooterViewStyle)headerFooterViewStyle{
    return [Jobs_getAssociatedObject(_headerFooterViewStyle) integerValue];
}

-(void)setHeaderFooterViewStyle:(JobsHeaderFooterViewStyle)headerFooterViewStyle{
    Jobs_setAssociatedRETAIN_NONATOMIC(_headerFooterViewStyle, @(headerFooterViewStyle))
}


@end
