//
//  JobsMenuView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/17.
//

#import "JobsMenuView.h"

@interface JobsMenuView ()
/// UI
@property(nonatomic,strong)JobsLinkageMenuView *menuView;

@end

@implementation JobsMenuView
@synthesize viewModel = _viewModel;
@synthesize buttonModel = _buttonModel;
#pragma mark —— BaseProtocol

#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        
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
    [self appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— 一些公有方法
-(JobsLinkageMenuView *)getLinkageMenuView{
    return self.menuView;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {

    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock)jobsRichElementsInViewWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
//        self.viewModel = model ? : UIViewModel.new;
//        MakeDataNull
//        self.backgroundColor = JobsRedColor;
        self.menuView.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsRealWidth(),
                      JobsWidth(200));
//    return CGSizeMake(JobsRealWidth(),
//                      JobsRealHeight() - AppDelegate.jobsCustomTabBarConfig.tabBarHeight - [TopBar viewSizeWithModel:nil].height + JobsBottomSafeAreaHeight());
}

-(CGSize)viewSizeWithModel:(id _Nullable)model{
    return [JobsMenuView viewSizeWithModel:model];
}
#pragma mark —— lazyLoad
-(JobsLinkageMenuView *)menuView{
    if(!_menuView){
        _menuView = [JobsLinkageMenuView.alloc initWithFrame:self.bounds
                                                   btnConfig:self.buttonModel
                                       linkageMenuViewConfig:self.linkageMenuViewConfig];
//        _menuView.backgroundColor = JobsRedColor;
        _menuView.jobsRichElementsInViewWithModel(nil);
        @jobs_weakify(self)
        [_menuView actionObjectBlock:^(id  _Nullable x) {
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
        }];
        [self addSubview:_menuView];
    }return _menuView;
}

-(UIButtonModel *)buttonModel{
    if(!_buttonModel){
        _buttonModel = UIButtonModel.new;
        _buttonModel.normal_titles = self.titleMutArr;
        _buttonModel.titleCor = JobsWhiteColor;
        _buttonModel.selected_titleCor = JobsClearColor;
        _buttonModel.normal_backgroundImages = self.normal_titleBgImageMutArr;
        _buttonModel.selected_backgroundImages = self.select_titleBgImageMutArr;// TODO
        _buttonModel.normal_images = self.normal_titleImageMutArr;
        _buttonModel.data = self.subViewMutArr;
        _buttonModel.imagePaddings = self.imagePaddings;
        _buttonModel.imagePlacement = NSDirectionalRectEdgeLeading;
    }return _buttonModel;
}

-(JobsLinkageMenuViewConfig *)linkageMenuViewConfig{
    if(!_linkageMenuViewConfig){
        _linkageMenuViewConfig = JobsLinkageMenuViewConfig.new;
    }return _linkageMenuViewConfig;
}

@end
