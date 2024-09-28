//
//  UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.m
//  Casino
//
//  Created by Jobs on 2021/11/19.
//

#import "UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.h"

@implementation UITableViewHeaderFooterView (BaseTableViewHeaderFooterViewProtocol)
/// 具体由子类进行复写【数据定UI】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        if ([model isKindOfClass:UIViewModel.class]) {
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

@end
