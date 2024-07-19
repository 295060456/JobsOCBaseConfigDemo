//
//  JobsMenuView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/17.
//

#import "JobsMenuView.h"

@interface JobsMenuView ()

@property(nonatomic,strong)LinkageMenuView *menuView;
@property(nonatomic,strong)NSMutableArray <__kindof NSString *>*titleMutArr;
@property(nonatomic,strong)NSMutableArray <__kindof UIView *>*subViewMutArr;
@property(nonatomic,strong)JobsMenuSubView_1 *menuSubView_1;
@property(nonatomic,strong)JobsMenuSubView_2 *menuSubView_2;
@property(nonatomic,strong)JobsMenuSubView_3 *menuSubView_3;
@property(nonatomic,strong)JobsMenuSubView_4 *menuSubView_4;

@end

@implementation JobsMenuView
@synthesize viewModel = _viewModel;
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
-(LinkageMenuView *)menuView{
    if(!_menuView){
        _menuView = [LinkageMenuView.alloc initWithFrame:self.bounds
                                                withMenu:self.titleMutArr
                                                andViews:self.subViewMutArr];
        [self addSubview:_menuView];

        
    }return _menuView;
}

-(NSMutableArray<__kindof NSString *> *)titleMutArr{
    if(!_titleMutArr){
        _titleMutArr = NSMutableArray.array;
        [_titleMutArr addObject:JobsInternationalization(@"四川")];
        [_titleMutArr addObject:JobsInternationalization(@"重庆")];
        [_titleMutArr addObject:JobsInternationalization(@"广西")];
        [_titleMutArr addObject:JobsInternationalization(@"哈尔滨")];
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

-(JobsMenuSubView_1 *)menuSubView_1{
    if(!_menuSubView_1){
        _menuSubView_1 = JobsMenuSubView_1.new;
        NSLog(@"%f",self.width);
        _menuSubView_1.frame = CGRectMake(0,
                                          0,
                                          self.width - 100,
                                          self.height);
        [_menuSubView_1 richElementsInViewWithModel:nil];
    }return _menuSubView_1;
}

-(JobsMenuSubView_2 *)menuSubView_2{
    if(!_menuSubView_2){
        _menuSubView_2 = JobsMenuSubView_2.new;
        NSLog(@"%f",self.width);
        _menuSubView_2.frame = CGRectMake(0,
                                          0,
                                          self.width - 100,
                                          self.height);
        [_menuSubView_2 richElementsInViewWithModel:nil];
    }return _menuSubView_2;
}

-(JobsMenuSubView_3 *)menuSubView_3{
    if(!_menuSubView_3){
        _menuSubView_3 = JobsMenuSubView_3.new;
        NSLog(@"%f",self.width);
        _menuSubView_3.frame = CGRectMake(0,
                                          0,
                                          self.width - 100,
                                          self.height);
        [_menuSubView_3 richElementsInViewWithModel:nil];
    }return _menuSubView_3;
}

-(JobsMenuSubView_4 *)menuSubView_4{
    if(!_menuSubView_4){
        _menuSubView_4 = JobsMenuSubView_4.new;
        NSLog(@"%f",self.width);
        _menuSubView_4.frame = CGRectMake(0,
                                          0,
                                          self.width - 100,
                                          self.height);
        [_menuSubView_4 richElementsInViewWithModel:nil];
    }return _menuSubView_4;
}



@end
