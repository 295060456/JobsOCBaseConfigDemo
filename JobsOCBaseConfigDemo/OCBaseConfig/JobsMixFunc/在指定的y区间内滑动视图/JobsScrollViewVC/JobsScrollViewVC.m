//
//  JobsScrollViewVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs Hi on 9/20/23.
//

#import "JobsScrollViewVC.h"

@interface JobsScrollViewVC ()

@property(nonatomic,strong)UIView *jobsView;
@property(nonatomic,strong)JobsScrollYView *scrollYView;

@end

@implementation JobsScrollViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.jobsView.alpha = 1;
    self.scrollYView.alpha = 1;
}
#pragma mark —— lazyLoad
-(UIView *)jobsView{
    if(!_jobsView){
        _jobsView = UIView.new;
        _jobsView.backgroundColor = JobsRandomColor;
        [self.view addSubview:_jobsView];
        [_jobsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.height.mas_equalTo(初始位置 - 终点位置);
            make.top.mas_equalTo(终点位置);
        }];
    }return _jobsView;
}

-(JobsScrollYView *)scrollYView{
    if(!_scrollYView){
        _scrollYView = JobsScrollYView.new;
        _scrollYView.backgroundColor = JobsGreenColor;
        [self.view addSubview:_scrollYView];
        
        [self.view layoutIfNeeded];
        _scrollYView.x = 0;
        _scrollYView.y = 初始位置;// 锚点1（最低点）
        _scrollYView.size = [_scrollYView viewSizeWithModel:nil];
        [_scrollYView richElementsInViewWithModel:nil];
        
        @jobs_weakify(self)
        [_scrollYView actionObjectBlock:^(JobsScrollYView *data) {
            NSLog(@"sss = %f",self->_scrollYView.y);
            @jobs_strongify(self)
            /// 向下滑动为正
            if(data.jobsPoint.y > 0){
                /// 滑动向下 + y超过下限 = 回到原点（没有动画）
                if(self->_scrollYView.y >= 初始位置){
                    self->_scrollYView.y = 初始位置;
                }
                /// 滑动向下 + y在上下限之间  = 回到原点（最低点）
                if(self->_scrollYView.y <= 初始位置){// 如果异常可以对这个if进行替换,多一个标准 == 多一层风险
//                if(self->_scrollYView.y <= 初始位置 && self->_scrollYView.y >= 终点位置){
                    [UIView animateWithDuration:0.3
                                     animations:^{
                        self->_scrollYView.y = 初始位置;
                    }];
                }
            }
            /// 向上滑动为负
            if(data.jobsPoint.y < 0){
                /// 滑动向上 + y在上下限之间 = 抵达顶点（最高点）
                if(self->_scrollYView.y >= 终点位置){// 如果异常可以对这个if进行替换,多一个标准 == 多一层风险
//                if(self->_scrollYView.y <= 初始位置 && self->_scrollYView.y >= 终点位置){
                    [UIView animateWithDuration:0.3
                                     animations:^{
                        self->_scrollYView.y = 终点位置;// 锚点2（最高点）
                    }];
                }
                /// 滑动向上 + y超过上限 = 抵达顶点（最高点）（没有动画）
                if(self->_scrollYView.y < 终点位置){
                    self->_scrollYView.y = 终点位置;// 锚点2（最高点）
                }
            }
        }];
    }return _scrollYView;
}

@end
