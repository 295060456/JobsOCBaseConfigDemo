//
//  JobsToggleBaseView.m
//  RPTaggedNavView
//
//  Created by User on 7/20/24.
//  Copyright © 2024 Tao. All rights reserved.
//

#import "JobsToggleBaseView.h"

@interface JobsToggleBaseView ()
/// UI
@property(nonatomic,strong)JobsToggleNavView *taggedNavView;
@property(nonatomic,strong)UIScrollView *bgScroll;
/// Data
@property(nonatomic,strong)NSMutableArray <NSString *>*tempTitles;
@property(nonatomic,strong)NSMutableArray <__kindof UIView *>*tempLabs;

@end

@implementation JobsToggleBaseView
JobsToggleNavViewProtocolSynthesize
#pragma mark —— SysMethod
-(void)dealloc{
    NSLog(@"");
}

-(instancetype)init{
    if (self = [super init]) {
//        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    /// 内部指定圆切角
//    [self layoutSubviewsCutCnrByRoundingCorners:UIRectCornerAllCorners
//                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
//        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock)jobsRichElementsInViewWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
//        self.viewModel = model ? : UIViewModel.new;
//        MakeDataNull
        self.taggedNavView.alpha = 1;
        [self makeScrollContentViewsFrame];
        self.bgScroll.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(454),JobsWidth(155));
}

-(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return jobsEqualToZeroSize(self.toggleView_size) ? [JobsToggleBaseView viewSizeWithModel:nil] : self.toggleView_size;
}
#pragma mark —— 一些公共方法

#pragma mark —— 一些私有方法
-(void)makeScrollContentViewsFrame{
    int t = 0;
    for (UIView *subView in self.scrollContentViews) {
        subView.frame = CGRectMake([self viewSizeWithModel:nil].width * t,
                                 0,
                                 self.bgScroll.width,
                                 self.bgScroll.height);
        t+=1;
    }
}
#pragma mark —— scrollviewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"");
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                    withVelocity:(CGPoint)velocity
             targetContentOffset:(inout CGPoint *)targetContentOffset{
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                 willDecelerate:(BOOL)decelerate{
    CGFloat scrollView_contentOffset_x = scrollView.contentOffset.x;
    if(scrollView_contentOffset_x < 0) scrollView_contentOffset_x = 0;
    if(scrollView_contentOffset_x > scrollView.width * self.scrollContentViews.count - 1)
        scrollView_contentOffset_x = scrollView.width * self.scrollContentViews.count - 1;
    
    NSInteger selectedIndx = round(scrollView_contentOffset_x / scrollView.width);
    NSLog(@"当前滑动的index = %ld",(long)selectedIndx)
    [self.taggedNavView selectingOneTagWithIndex:selectedIndx];
}
#pragma mark —— lazyLoad
-(JobsToggleNavView *)taggedNavView{
    if(!_taggedNavView){
        _taggedNavView = JobsToggleNavView.new;
        _taggedNavView.btn_each_offset = self.btn_each_offset;
        _taggedNavView.frame = CGRectMake(0,
                                          0,
                                          self.taggedNavView_width,
                                          self.taggedNavView_height);
        _taggedNavView.buttonModel = self.buttonModel;
        
        _taggedNavView.dataArr = self.taggedNavTitles;
        _taggedNavView.sliderColor = self.sliderColor;
        _taggedNavView.sliderW = self.sliderW;
        _taggedNavView.sliderH = JobsWidth(1);
        
        [self addSubview:_taggedNavView];
        _taggedNavView.jobsRichElementsInViewWithModel(nil);
        @jobs_weakify(self)
        /// 联动
        [_taggedNavView actionObjectBlock:^(id _Nullable data) {
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(data);
            if(KindOfBaseButtonCls(data)){
                BaseButton *btn = (BaseButton *)data;
                /// 由 self.bgScroll 驱动
                self.bgScroll.contentOffset = CGPointMake(self.bgScroll.width * btn.index,0);
                NSLog(@"当前滑动的index = %ld",(long)btn.index);
                [self.taggedNavView selectingOneTagWithIndex:btn.index];
            }
        }];
    }return _taggedNavView;
}

-(UIScrollView *)bgScroll{
    if(!_bgScroll){
        _bgScroll = UIScrollView.new;
        _bgScroll.scrollEnabled = NO;
        _bgScroll.frame = CGRectMake(0,
                                     self.taggedNavView_height + self.taggedNavView_bgScroll_offset,
                                     [self viewSizeWithModel:nil].width,
                                     [self viewSizeWithModel:nil].height - (self.taggedNavView_height + self.taggedNavView_bgScroll_offset));
        _bgScroll.contentSize = CGSizeMake(_bgScroll.width * self.scrollContentViews.count, 0);
        _bgScroll.delegate = self;
        _bgScroll.pagingEnabled = YES;
        _bgScroll.showsHorizontalScrollIndicator = NO;
        _bgScroll.showsVerticalScrollIndicator = NO;
        for (UIView *subView in self.scrollContentViews) {
            [_bgScroll addSubview:subView];
        }
        [self addSubview:_bgScroll];
    }return _bgScroll;
}

-(NSMutableArray<__kindof UIView *> *)scrollContentViews{
    if(!_scrollContentViews){
        _scrollContentViews = self.tempLabs;
    }return _scrollContentViews;
}

-(CGFloat)taggedNavView_width{
    if(!_taggedNavView_width){
        _taggedNavView_width = [self viewSizeWithModel:nil].width;
    }return _taggedNavView_width;
}

-(CGFloat)taggedNavView_height{
    if(!_taggedNavView_height){
        _taggedNavView_height = JobsWidth(44);
    }return _taggedNavView_height;
}

-(CGFloat)taggedNavView_bgScroll_offset{
    if(!_taggedNavView_bgScroll_offset){
        _taggedNavView_bgScroll_offset = 0;
    }return _taggedNavView_bgScroll_offset;
}

-(NSMutableArray<UIView *> *)tempLabs{
    if(!_tempLabs){
        _tempLabs = NSMutableArray.array;
        int t = 0;
        for (NSString *title in self.tempTitles) {
            UILabel *label = UILabel.new;
            label.backgroundColor = JobsRandomColor;
            label.text = [NSString stringWithFormat:@"%d\n%@",t,title];
            label.textAlignment = NSTextAlignmentCenter;
            label.numberOfLines = 0;
            [_tempLabs addObject:label];
            t+=1;
        }
    }return _tempLabs;
}

-(NSMutableArray<NSString *> *)tempTitles{
    if(!_tempTitles){
        _tempTitles = NSMutableArray.array;
        [_tempTitles addObject:JobsInternationalization(@"人生到处知何似，恰似飞鸿踏雪泥；")];
        [_tempTitles addObject:JobsInternationalization(@"泥上偶然留指爪，鸿飞那复计东西。")];
        [_tempTitles addObject:JobsInternationalization(@"老僧已死成新塔，坏壁无由见旧题；")];
        [_tempTitles addObject:JobsInternationalization(@"往日崎岖还记否，路长人困蹇驴嘶。")];
    }return _tempTitles;
}

-(NSMutableArray<NSString *> *)taggedNavTitles{
    if(!_taggedNavTitles){
        _taggedNavTitles = NSMutableArray.array;
        for (int y = 0; y < self.tempTitles.count; y++) {
            [_taggedNavTitles addObject:toStringByInt(y)];
        }
    }return _taggedNavTitles;
}
INIT_BUTTON_MODE
@end
