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
    JobsLog(@"");
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
        self.makeScrollContentViewsFrameBy(self.refreshScrollContentViews(model));/// 可滑动子View的Frame
        self.configBgScroll(self.refreshScrollContentViews(model)).alpha = 1;/// 配置显示的Scroll
        self.switchViewsBy(0);/// 当前显示的子View
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(id _Nullable data){
        /// 默认的尺寸
        return CGSizeMake(JobsWidth(454),JobsWidth(155));
    };
}

-(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    @jobs_weakify(self)
    return ^(id _Nullable data){
        @jobs_strongify(self)
        if(!jobsEqualToZeroSize(self.toggleView_size)) return self.toggleView_size;
        if(!jobsEqualToZeroSize(self.sizer)) return self.sizer;
        return JobsToggleBaseView.viewSizeByModel(nil);
    };
}
#pragma mark —— 一些公共方法
/// 当前显示的子View
-(jobsByNSIntegerBlock _Nonnull)switchViewsBy{
    @jobs_weakify(self)
    return ^(NSInteger index){
        @jobs_strongify(self)
        self.bgScroll.contentOffset = CGPointMake(self.bgScroll.width * index,0);
        self.taggedNavView.selectingOneTagWithIndex(index);
    };
}
#pragma mark —— 一些私有方法
/// 通过传入的数据源来决定导航栏的尺寸（size）
-(JobsReturnCGSizeByArrBlock _Nonnull)makeTaggedNavViewSizeBy{
    return ^CGSize(NSArray <__kindof UIView<BaseViewProtocol> *>*_Nullable arr){
        @jobs_weakify(self)
        return jobsMakeCGSizeByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
            @jobs_strongify(self)
            if(arr.count){
                data.jobsWidth = self.taggedNavSingleBtn_size.width * arr.count + self.btn_each_offset * (arr.count - 1);
            }else data.jobsWidth = self.taggedNavSingleBtn_size.width;
            data.jobsHeight = self.taggedNavSingleBtn_size.height;
        });
    };
}
/// 数据源创建整个导航栏
-(JobsReturnIDByArrBlock _Nonnull)makeTaggedNavViewBy{
    @jobs_weakify(self)
    return ^JobsToggleNavView *_Nullable(NSArray <__kindof UIView<BaseViewProtocol>*>*_Nullable data){
        return jobsMakeToggleNavView(^(__kindof JobsToggleNavView * _Nullable taggedNavView) {
            @jobs_strongify(self)
            taggedNavView.btn_each_offset = self.btn_each_offset;/// 滑块之间的距离
            taggedNavView.frame = jobsMakeFrameByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data1) {
                @jobs_strongify(self)
                data1.jobsX = 0;
                data1.jobsY = 0;
                data1.jobsWidth = self.makeTaggedNavViewSizeBy(data).width ? : self.taggedNavView_width;
                data1.jobsHeight = self.makeTaggedNavViewSizeBy(data).height ? : self.taggedNavView_height;
            });
            taggedNavView.sliderColor = self.sliderColor;/// 滑块颜色
            taggedNavView.sliderW = self.sliderW;/// 滑块宽度
            taggedNavView.sliderH = JobsWidth(1);/// 滑块高度
            taggedNavView.backgroundColor = self.taggedNavViewBgColor;
            [self addSubview:taggedNavView];
            /// 切换联动
            [taggedNavView actionObjBlock:^(id _Nullable data1) {
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(data1);
                if(KindOfBaseButtonCls(data1)){
                    self.currentSelectedBtn = (BaseButton *)data1;
                    /// 由 self.bgScroll 驱动
                    self.bgScroll.contentOffset = CGPointMake(self.bgScroll.width * self.currentSelectedBtn.index,0);
                    JobsLog(@"当前滑动的index = %ld",(long)self.currentSelectedBtn.index);
                    self.taggedNavView.selectingOneTagWithIndex(self.currentSelectedBtn.index);
                }
            }];taggedNavView.jobsRichViewByModel(self.taggedNavDatas);
        });
    };
}
/// 刷新数据源【滑动的子View】
-(JobsReturnArrayByArrayBlock _Nonnull)refreshScrollContentViews{
    @jobs_weakify(self)
    return ^__kindof NSArray <__kindof UIView<BaseViewProtocol> *>*_Nullable(__kindof NSArray <UIButtonModel *>*_Nullable data){
        @jobs_strongify(self)
        NSMutableArray <__kindof UIView<BaseViewProtocol> *>*mutArr = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIView *>*_Nullable data1) {
            for (UIButtonModel *buttonModel in data) {
                data1.add(buttonModel.view);
            }
        });
        /// 如果新数据源有值则用最新数据，否则使用原有的数据源
        if(mutArr.count) self.scrollContentViews = mutArr;
        return self.scrollContentViews;
    };
}
/// 配置显示的Scroll
-(JobsReturnScrollViewByMutArrBlock _Nonnull)configBgScroll{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(NSMutableArray <__kindof UIView *>*data){
        @jobs_strongify(self)
        /// 每次进行配置的时候，都需要先清理以前创建的子View
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
/// 可滑动子View的Frame
-(jobsByArrayBlock _Nonnull)makeScrollContentViewsFrameBy{
    @jobs_weakify(self)
    return ^(__kindof NSArray <__kindof UIView *>*_Nullable data){
        @jobs_strongify(self)
        int t = 0;
        for (UIView *subView in data) {
            subView.frame = CGRectMake(self.viewSizeByModel(nil).width * t,
                                       0,
                                       self.bgScroll.width,
                                       self.bgScroll.height);
            t+=1;
        }
    };
}
#pragma mark —— scrollviewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    JobsLog(@"");
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
    JobsLog(@"当前滑动的index = %ld",(long)selectedIndx)
    self.taggedNavView.selectingOneTagWithIndex(selectedIndx);
}
#pragma mark —— lazyLoad
-(JobsToggleNavView *)taggedNavView{
    if(!_taggedNavView){
        _taggedNavView = self.makeTaggedNavViewBy(self.taggedNavDatas);
    }return _taggedNavView;
}

-(UIScrollView *)bgScroll{
    if(!_bgScroll){
        @jobs_weakify(self)
        _bgScroll = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            @jobs_strongify(self)
            scrollView.scrollEnabled = NO;
            scrollView.frame = jobsMakeCGRectByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
                @jobs_strongify(self)
                data.jobsX = 0;
                data.jobsY = self.taggedNavView.height + self.taggedNavView_bgScroll_offset;
                data.jobsWidth = self.viewSizeByModel(nil).width;
                data.jobsHeight = self.viewSizeByModel(nil).height - (self.taggedNavView_height + self.taggedNavView_bgScroll_offset);
            });
            scrollView.delegate = self;
            scrollView.pagingEnabled = YES;
            scrollView.showsHorizontalScrollIndicator = NO;
            scrollView.showsVerticalScrollIndicator = NO;
            [self addSubview:scrollView];
        });
    }return _bgScroll;
}

-(NSMutableArray <__kindof UIView<BaseViewProtocol> *>*)scrollContentViews{
    if(!_scrollContentViews){
        @jobs_weakify(self)
        _scrollContentViews = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIView<BaseViewProtocol> *>*_Nullable data) {
            @jobs_strongify(self)
            for (UIButtonModel *data1 in self.taggedNavDatas) {
                data.add(data1.view);
            }
        });if(!_scrollContentViews.count) _scrollContentViews = self.tempLabs;
    }return _scrollContentViews;
}

-(CGFloat)taggedNavView_width{
    if(!_taggedNavView_width){
        _taggedNavView_width = self.viewSizeByModel(nil).width;
    }return _taggedNavView_width;
}

-(CGSize)taggedNavSingleBtn_size{
    if(jobsEqualToZeroSize(_taggedNavSingleBtn_size)){
        _taggedNavSingleBtn_size = CGSizeMake(JobsWidth(80), self.taggedNavView_height);
    }return _taggedNavSingleBtn_size;
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

-(UIButtonModel *)buttonModel{
    if(!_buttonModel){
        _buttonModel = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
            model.buttonConfiguration = nil;
            model.backgroundConfiguration = nil;
            model.buttonConfigurationTitleAlignment = UIButtonConfigurationTitleAlignmentAutomatic;
            model.textAlignment = NSTextAlignmentCenter;
            model.subTextAlignment = NSTextAlignmentCenter;
            model.normalImage = nil;
            model.highlightImage = nil;
            model.attributedTitle = nil;
            model.selectedAttributedTitle = nil;
            model.attributedSubTitle = nil;
            model.title = nil;
            model.subTitle = nil;
            model.titleFont = bayonRegular(JobsWidth(16));
            model.subTitleFont = nil;
            model.titleCor = JobsCor(@"#ABABAB");
            model.subTitleCor = nil;
            model.titleLineBreakMode = NSLineBreakByWordWrapping;
            model.subtitleLineBreakMode = NSLineBreakByWordWrapping;
            model.baseBackgroundColor = JobsWhiteColor;
            model.backgroundImage = nil;
            model.imagePadding = JobsWidth(0);
            model.titlePadding = JobsWidth(0);
            model.imagePlacement = NSDirectionalRectEdgeNone;
            model.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            model.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
            model.contentInsets = jobsSameDirectionalEdgeInsets(0);
            model.cornerRadiusValue = JobsWidth(0);
            model.roundingCorners = UIRectCornerAllCorners;
            model.roundingCornersRadii = CGSizeZero;
            model.layerBorderCor = nil;
            model.borderWidth = JobsWidth(0);
            model.primaryAction = nil;
            model.longPressGestureEventBlock = nil;
            model.clickEventBlock = nil;
        });
    }return _buttonModel;
}

@end
