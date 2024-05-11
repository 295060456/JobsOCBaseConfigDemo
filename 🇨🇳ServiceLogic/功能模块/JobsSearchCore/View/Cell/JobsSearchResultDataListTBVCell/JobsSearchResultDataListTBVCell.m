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

+(instancetype)cellStyleValue1WithTableView:(UITableView *)tableView{
    JobsSearchResultDataListTBVCell *cell = (JobsSearchResultDataListTBVCell *)[tableView tableViewCellClass:JobsSearchResultDataListTBVCell.class];
    if (!cell) {
        cell = [JobsSearchResultDataListTBVCell initTableViewCellWithStyle:UITableViewCellStyleDefault];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.contentView.backgroundColor = JobsRandomColor;
        cell.imageView.image = JobsIMG(@"放大镜");
        cell.tapGR.enabled = YES;
    }return cell;
}

+(CGFloat)cellHeightWithModel:(id _Nullable)model{
    return 50;
}

-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    if ([model isKindOfClass:UIViewModel.class]) {
        self.textLabel.text = model.textModel.text;
    }
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
