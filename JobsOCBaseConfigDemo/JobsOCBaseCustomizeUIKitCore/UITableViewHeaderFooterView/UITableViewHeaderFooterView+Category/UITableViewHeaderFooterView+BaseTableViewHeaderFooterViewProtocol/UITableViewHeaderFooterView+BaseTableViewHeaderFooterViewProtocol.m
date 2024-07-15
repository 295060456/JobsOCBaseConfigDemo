//
//  UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.m
//  Casino
//
//  Created by Jobs on 2021/11/19.
//

#import "UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.h"

@implementation UITableViewHeaderFooterView (BaseTableViewHeaderFooterViewProtocol)
/// 具体由子类进行复写【数据定UI】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    if ([model isKindOfClass:UIViewModel.class]) {
        /// self.contentView.backgroundColor = JobsCyanColor; 这样设置无效
        self.backgroundView.backgroundColor = JobsCyanColor;
    }
}
/// 具体由子类进行复写【数据定高】
+(CGFloat)viewHeightWithModel:(id _Nullable)model{
    return JobsWidth(5);
}
/// 具体由子类进行复写【数据Frame】
+(CGRect)viewFrameWithModel:(id _Nullable)model{
    return CGRectMake(0,
                      0,
                      JobsMainScreen_WIDTH(),
                      JobsWidth(5));
}

@end
