//
//  JobsSearchResultDataListTBVCell.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/6.
//

#import "JobsSearchResultDataListTBVCell.h"

@interface JobsSearchResultDataListTBVCell ()

@property(nonatomic,strong)UITapGestureRecognizer *tapGR;

@end

@implementation JobsSearchResultDataListTBVCell

+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleDefaultWithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsSearchResultDataListTBVCell *cell = (JobsSearchResultDataListTBVCell *)tableView.tableViewCellClass(JobsSearchResultDataListTBVCell.class,@"");
        if (!cell) {
            cell = JobsSearchResultDataListTBVCell.initTableViewCellWithStyle(UITableViewCellStyleDefault);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //        cell.contentView.backgroundColor = JobsRandomColor;
            cell.imageView.image = JobsIMG(@"放大镜");
            cell.tapGR.enabled = YES;
        }return cell;
    };
}

+(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(50);
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        if ([model isKindOfClass:UIViewModel.class]) {
            self.textLabel.text = model.textModel.text;
        }
    };
}
#pragma mark —— UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}
/*  主承载view实现了 touchesBegan 或者手势响应
 *  那么 手势响应优先执行touchesBegan 或者手势响应 而跳过代理方法导致 didSelectRowAtIndexPath 失效
 *  此时需要在cell子类里面重写touchesBegan 或者手势响应 方法以便触发
 */
-(void)tapGRHandleSingleFingerAction:(UITapGestureRecognizer *_Nullable)sender{
    self.objectBlock(self.textLabel.text);
}
#pragma mark —— lazyLoad
-(UITapGestureRecognizer *)tapGR{//单击一下
    if (!_tapGR) {
        _tapGR = [UITapGestureRecognizer.alloc initWithTarget:self
                                                       action:@selector(tapGRHandleSingleFingerAction:)];
        _tapGR.numberOfTouchesRequired = 1; //手指数
        _tapGR.numberOfTapsRequired = 1; //tap次数
        _tapGR.delegate = self;
        [self addGestureRecognizer:self.tapGR];
    }return _tapGR;
}

@end
