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
#pragma mark —— SysMethod
-(void)dealloc{
    NSLog(@"");
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
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
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
//    self.viewModel = model ? : UIViewModel.new;
//    MakeDataNull
    self.taggedNavView.alpha = 1;
    self.bgScroll.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(454),JobsWidth(167));
}

-(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return [JobsToggleBaseView viewSizeWithModel:nil];
}
#pragma mark —— 一些公共方法
-(JobsToggleNavView *)getToggleNavView{
    return self.taggedNavView;
}
#pragma mark —— scrollviewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger selectedIndx = scrollView.contentOffset.x / self.bgScroll.width;
    [self.taggedNavView selectingOneTagWithIndex:selectedIndx];
}
#pragma mark —— lazyLoad
-(JobsToggleNavView *)taggedNavView{
    if(!_taggedNavView){
        _taggedNavView = JobsToggleNavView.new;
        _taggedNavView.frame = CGRectMake(0, 
                                          0,
                                          [JobsToggleBaseView viewSizeWithModel:nil].width,
                                          self.taggedNavView_height);
        _taggedNavView.dataArr = self.taggedNavTitles;
        _taggedNavView.tagTextColor_normal = JobsBlackColor;
        _taggedNavView.tagTextColor_selected = JobsRedColor;
        _taggedNavView.tagTextFont_normal = JobsWidth(15);
        _taggedNavView.tagTextFont_selected = JobsWidth(22);
        _taggedNavView.sliderColor = JobsRedColor;
        _taggedNavView.sliderW = JobsWidth(30);
        _taggedNavView.sliderH = JobsWidth(1);
        [self addSubview:_taggedNavView];
        [_taggedNavView richElementsInViewWithModel:nil];
        @jobs_weakify(self)
        /// 联动
        [_taggedNavView actionObjectBlock:^(id _Nullable data) {
            @jobs_strongify(self)
            if(KindOfBtnCls(data)){
                UIButton *btn = (UIButton *)data;
                self.bgScroll.contentOffset = CGPointMake(self.bgScroll.width * (btn.tag - 1000),
                                                          0);
            }
        }];
    }return _taggedNavView;
}

-(UIScrollView *)bgScroll{
    if(!_bgScroll){
        _bgScroll = UIScrollView.new;
        _bgScroll.frame = CGRectMake(0,
                                     self.taggedNavView_height + self.taggedNavView_bgScroll_offset,
                                     [JobsToggleBaseView viewSizeWithModel:nil].width,
                                     [JobsToggleBaseView viewSizeWithModel:nil].height - (self.taggedNavView_height + self.taggedNavView_bgScroll_offset));
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
            label.frame = CGRectMake([JobsToggleBaseView viewSizeWithModel:nil].width * t,
                                     0,
                                     self.bgScroll.width,
                                     self.bgScroll.height);
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

@end
