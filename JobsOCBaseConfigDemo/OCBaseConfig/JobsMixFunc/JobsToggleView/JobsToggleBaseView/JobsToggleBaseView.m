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
@property(nonatomic,strong)NSMutableArray <__kindof UIView <BaseViewProtocol>*>*tempLabs;
@property(nonatomic,strong)NSMutableArray <UIButtonModel *>*taggedNavDatas;

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
//    [self appointCornerCutToCircleByRoundingCorners:UIRectCornerAllCorners
//                                        cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
//        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(NSMutableArray <UIButtonModel *>*_Nullable model) {
        @jobs_strongify(self)
        self.taggedNavDatas = model;
        self.taggedNavView.alpha = 1;
        [self makeScrollContentViewsFrame];
        self.configBgScroll(self.configSubView(model)).alpha = 1;
        self.switchViewsBy(0);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(id _Nullable data){
        return CGSizeMake(JobsWidth(454),JobsWidth(155));
    };
}

-(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    @jobs_weakify(self)
    return ^(id _Nullable data){
        @jobs_strongify(self)
        if(!jobsEqualToZeroSize(self.toggleView_size)) return self.toggleView_size;
        if(!jobsEqualToZeroSize(self.Size)) return self.Size;
        return JobsToggleBaseView.viewSizeByModel(nil);
    };
}
#pragma mark —— 一些公共方法
-(jobsByNSIntegerBlock _Nonnull)switchViewsBy{
    @jobs_weakify(self)
    return ^(NSInteger index){
        @jobs_strongify(self)
        self.bgScroll.contentOffset = CGPointMake(self.bgScroll.width * index,0);
        self.taggedNavView.selectingOneTagWithIndex(index);
    };
}
#pragma mark —— 一些私有方法
/// 配置显示的滑动View
-(JobsReturnArrayByArrayBlock _Nonnull)configSubView{
    @jobs_weakify(self)
    return ^(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        NSMutableArray *mutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data1) {
            for (UIButtonModel *buttonModel in data) {
                data1.add(buttonModel.view);
            }
        });return mutArr.count ? mutArr : self.scrollContentViews;
    };
}
/// 配置显示的Scroll
-(JobsReturnScrollViewByMutArrBlock _Nonnull)configBgScroll{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(NSMutableArray <__kindof UIView *>*data){
        @jobs_strongify(self)
        if(self.bgScroll.subviews.count){
            for (__kindof UIView *subview in self.bgScroll.subviews) {
                [subview removeFromSuperview];
            }
        }
        for (__kindof UIView *subView in data) {
            [self.bgScroll addSubview:subView];
        }return self.bgScroll;
    };
}

-(void)makeScrollContentViewsFrame{
    int t = 0;
    for (UIView *subView in self.scrollContentViews) {
        subView.frame = CGRectMake(self.viewSizeByModel(nil).width * t,
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
    self.taggedNavView.selectingOneTagWithIndex(selectedIndx);
}
#pragma mark —— lazyLoad
-(JobsToggleNavView *)taggedNavView{
    if(!_taggedNavView){
        @jobs_weakify(self)
        _taggedNavView = JobsToggleNavView.new;
        _taggedNavView.btn_each_offset = self.btn_each_offset;
        _taggedNavView.frame = jobsMakeFrameByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
            @jobs_strongify(self)
            data.jobsX = 0;
            data.jobsY = 0;
            data.jobsWidth = self.taggedNavView_width;
            data.jobsHeight = self.taggedNavView_height;
        });
        _taggedNavView.sliderColor = self.sliderColor;
        _taggedNavView.sliderW = self.sliderW;
        _taggedNavView.sliderH = JobsWidth(1);
        _taggedNavView.backgroundColor = self.taggedNavViewBgColor;
        [self addSubview:_taggedNavView];
        /// 切换联动
        [_taggedNavView actionObjectBlock:^(id _Nullable data) {
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(data);
            if(KindOfBaseButtonCls(data)){
                self.currentSelectedBtn = (BaseButton *)data;
                /// 由 self.bgScroll 驱动
                self.bgScroll.contentOffset = CGPointMake(self.bgScroll.width * self.currentSelectedBtn.index,0);
                NSLog(@"当前滑动的index = %ld",(long)self.currentSelectedBtn.index);
                self.taggedNavView.selectingOneTagWithIndex(self.currentSelectedBtn.index);
            }
        }];
    }
    _taggedNavView.jobsRichViewByModel(self.taggedNavDatas);
    return _taggedNavView;
}

-(UIScrollView *)bgScroll{
    if(!_bgScroll){
        @jobs_weakify(self)
        _bgScroll = UIScrollView.new;
        _bgScroll.scrollEnabled = NO;
        _bgScroll.frame = jobsMakeCGRectByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
            @jobs_strongify(self)
            data.jobsX = 0;
            data.jobsY = self.taggedNavView_height + self.taggedNavView_bgScroll_offset;
            data.jobsWidth = self.viewSizeByModel(nil).width;
            data.jobsHeight = self.viewSizeByModel(nil).height - (self.taggedNavView_height + self.taggedNavView_bgScroll_offset);
        });
        _bgScroll.delegate = self;
        _bgScroll.pagingEnabled = YES;
        _bgScroll.showsHorizontalScrollIndicator = NO;
        _bgScroll.showsVerticalScrollIndicator = NO;
        [self addSubview:_bgScroll];
    }return _bgScroll;
}
@synthesize scrollContentViews = _scrollContentViews;
-(NSMutableArray <__kindof UIView<BaseViewProtocol> *>*)scrollContentViews{
    if(!_scrollContentViews){
        _scrollContentViews = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIView<BaseViewProtocol> *>*_Nullable data) {
            for (UIButtonModel *data1 in self.taggedNavDatas) {
                data.add(data1.view);
            }
        });
        if(!_scrollContentViews.count) _scrollContentViews = self.tempLabs;
    }return _scrollContentViews;
}

-(void)setScrollContentViews:(NSMutableArray<__kindof UIView<BaseViewProtocol> *> *)scrollContentViews{
    _scrollContentViews = scrollContentViews;
    self.configBgScroll(self.configSubView(self.taggedNavDatas));
}

-(CGFloat)taggedNavView_width{
    if(!_taggedNavView_width){
        _taggedNavView_width = self.viewSizeByModel(nil).width;
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

-(NSMutableArray<__kindof UIView <BaseViewProtocol>*>*)tempLabs{
    if(!_tempLabs){
        @jobs_weakify(self)
        _tempLabs = jobsMakeMutArr(^(NSMutableArray <__kindof UIView <BaseViewProtocol>*>*_Nullable data) {
            @jobs_strongify(self)
            int t = 0;
            for (NSString *title in self.tempTitles) {
                data.add(jobsMakeLabel(^(__kindof UILabel<BaseViewProtocol> * _Nullable label) {
                    label.backgroundColor = JobsRandomColor;
                    label.textAlignment = NSTextAlignmentCenter;
                    label.numberOfLines = 0;
                    label.text = toStringByInt(t)
                        .add(@"\n")
                        .add(title);
                }));
                t += 1;
            }
        });
    }return _tempLabs;
}

-(NSMutableArray<NSString *>*)tempTitles{
    if(!_tempTitles){
        _tempTitles = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data) {
            data.add(JobsInternationalization(@"人生到处知何似，恰似飞鸿踏雪泥；"));
            data.add(JobsInternationalization(@"泥上偶然留指爪，鸿飞那复计东西。"));
            data.add(JobsInternationalization(@"老僧已死成新塔，坏壁无由见旧题；"));
            data.add(JobsInternationalization(@"往日崎岖还记否，路长人困蹇驴嘶。"));
        });
    }return _tempTitles;
}

-(NSMutableArray<UIButtonModel *>*)taggedNavDatas{
    if(!_taggedNavDatas){
        @jobs_weakify(self)
        _taggedNavDatas = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data) {
            @jobs_strongify(self)
            for (int y = 0; y < self.tempTitles.count; y++) {
                data.add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                    data.title = JobsInternationalization(@"第")
                        .add(toStringByInt(y))
                        .add(JobsInternationalization(@"个"));
                }));
            }
        });
    }return _taggedNavDatas;
}
INIT_BUTTON_MODE
@end
