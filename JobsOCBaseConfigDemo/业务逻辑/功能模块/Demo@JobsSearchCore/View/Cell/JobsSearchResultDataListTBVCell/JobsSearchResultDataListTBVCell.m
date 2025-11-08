//
//  JobsSearchResultDataListTBVCell.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/6.
//

#import "JobsSearchResultDataListTBVCell.h"

@interface JobsSearchResultDataListTBVCell ()

@end

@implementation JobsSearchResultDataListTBVCell
#pragma mark —— UITableViewCellProtocol
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleDefaultWithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsSearchResultDataListTBVCell *cell = JobsRegisterDequeueTableViewDefaultCell(JobsSearchResultDataListTBVCell);
        cell.imageView.image = @"放大镜".img;
        cell.tapGR.enabled = YES;
        return cell;
    };
}
#pragma mark —— BaseCellProtocol
+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(50);
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        if ([model isKindOfClass:UIViewModel.class]) {
            self.textLabel.text = model.textModel.text;
        } return self;
    };
}
#pragma mark —— UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}
#pragma mark —— lazyLoad
/// GestureProtocol
@synthesize tapGR = _tapGR;
-(UITapGestureRecognizer *)tapGR{//单击一下
    if (!_tapGR) {
        @jobs_weakify(self)
        _tapGR = self.addGestureRecognizer([jobsMakeLongPressGesture(^(__kindof UILongPressGestureRecognizer * _Nullable gesture) {
            @jobs_strongify(self)
            gesture.numberOfTouchesRequired = 1; /// 手指数
            gesture.numberOfTapsRequired = 1; /// tap次数
            gesture.delegate = self;
        }) gestureActionBy:^{
            /*  主承载view实现了 touchesBegan 或者手势响应
             *  那么 手势响应优先执行touchesBegan 或者手势响应 而跳过代理方法导致 didSelectRowAtIndexPath 失效
             *  此时需要在cell子类里面重写touchesBegan 或者手势响应 方法以便触发
             */
            if(self.objBlock) self.objBlock(self.textLabel.text);
        }]);
    }return _tapGR;
}

@end
