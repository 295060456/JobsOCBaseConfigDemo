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
/// Data
@property(nonatomic,strong)NSMutableArray <__kindof NSString *>*titleMutArr;
@property(nonatomic,strong)NSMutableArray <__kindof UIView *>*subViewMutArr;
@property(nonatomic,strong)JobsMenuSubView_1 *menuSubView_1;
@property(nonatomic,strong)JobsMenuSubView_2 *menuSubView_2;
@property(nonatomic,strong)JobsMenuSubView_3 *menuSubView_3;
@property(nonatomic,strong)JobsMenuSubView_4 *menuSubView_4;
@property(nonatomic,strong)NSMutableArray <UIImage *>*normal_titleBgImageMutArr;
@property(nonatomic,strong)NSMutableArray <UIImage *>*select_titleBgImageMutArr;

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
    [self layoutSubviewsCutCnrByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {

    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
//    self.viewModel = model ? : UIViewModel.new;
//    MakeDataNull
//    self.backgroundColor = JobsRedColor;
    self.menuView.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsRealWidth() / 2, JobsRealHeight());
}

-(CGSize)viewSizeWithModel:(id _Nullable)model{
    return [JobsMenuView viewSizeWithModel:model];
}
#pragma mark —— lazyLoad
-(JobsLinkageMenuView *)menuView{
    if(!_menuView){
        _menuView = [JobsLinkageMenuView.alloc initWithFrame:self.bounds
                                                   btnConfig:self.buttonModel];
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
        _buttonModel.titleCor = JobsClearColor;
        _buttonModel.selected_titleCor = JobsClearColor;
        _buttonModel.normal_backgroundImages = self.normal_titleBgImageMutArr;
        _buttonModel.selected_backgroundImages = self.select_titleBgImageMutArr;// TODO
        _buttonModel.data = self.subViewMutArr;
    }return _buttonModel;
}

-(NSMutableArray<NSString *> *)titleMutArr{
    if(!_titleMutArr){
        _titleMutArr = NSMutableArray.array;
        [_titleMutArr addObject:JobsInternationalization(@"TOP GAMES")];
        [_titleMutArr addObject:JobsInternationalization(@"SLOT GAMES")];
        [_titleMutArr addObject:JobsInternationalization(@"LIVE CASINO")];
        [_titleMutArr addObject:JobsInternationalization(@"TABLE GAMES")];
        [_titleMutArr addObject:JobsInternationalization(@"SPORTS")];
        [_titleMutArr addObject:JobsInternationalization(@"FISHING")];
    }return _titleMutArr;
}

-(NSMutableArray<__kindof UIView *> *)subViewMutArr{
    if(!_subViewMutArr){
        _subViewMutArr = NSMutableArray.array;
        [_subViewMutArr addObject:self.menuSubView_1];
        [_subViewMutArr addObject:self.menuSubView_2];
        [_subViewMutArr addObject:self.menuSubView_3];
        [_subViewMutArr addObject:self.menuSubView_4];
    }return _subViewMutArr;
}

-(NSMutableArray<UIImage *> *)normal_titleBgImageMutArr{
    if(!_normal_titleBgImageMutArr){
        _normal_titleBgImageMutArr = NSMutableArray.array;
        [_normal_titleBgImageMutArr addObject:JobsIMG(@"Top_Games_menu")];
        [_normal_titleBgImageMutArr addObject:JobsIMG(@"Slot_Games_menu")];
        [_normal_titleBgImageMutArr addObject:JobsIMG(@"Live_Casino_menu")];
        [_normal_titleBgImageMutArr addObject:JobsIMG(@"Table_Games_menu")];
        [_normal_titleBgImageMutArr addObject:JobsIMG(@"Sport_Menu")];
        [_normal_titleBgImageMutArr addObject:JobsIMG(@"Fishing_menu")];
    }return _normal_titleBgImageMutArr;
}
// TODO
-(NSMutableArray<UIImage *> *)select_titleBgImageMutArr{
    if(!_select_titleBgImageMutArr){
        _select_titleBgImageMutArr = NSMutableArray.array;
        [_select_titleBgImageMutArr addObject:JobsIMG(@"Top_Games_menu")];
        [_select_titleBgImageMutArr addObject:JobsIMG(@"Slot_Games_menu")];
        [_select_titleBgImageMutArr addObject:JobsIMG(@"Live_Casino_menu")];
        [_select_titleBgImageMutArr addObject:JobsIMG(@"Table_Games_menu")];
        [_select_titleBgImageMutArr addObject:JobsIMG(@"Sport_Menu")];
        [_select_titleBgImageMutArr addObject:JobsIMG(@"Fishing_menu")];
    }return _select_titleBgImageMutArr;
}

@end
