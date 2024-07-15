//
//  BaiShaETProjSearchView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/15.
//

#import "BaiShaETProjSearchView.h"

@interface BaiShaETProjSearchView ()

@end

@implementation BaiShaETProjSearchView

@synthesize viewModel = _viewModel;

#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_searchViewOnceToken = 0;
    static_searchView = nil;
}

static BaiShaETProjSearchView *static_searchView = nil;
static dispatch_once_t static_searchViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_searchViewOnceToken, ^{
        static_searchView = BaiShaETProjSearchView.new;
    });return static_searchView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = UIColor.whiteColor;
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
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = UIColor.redColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model ? : UIViewModel.new;
    MakeDataNull
    self.backgroundColor = UIColor.redColor;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(234), JobsWidth(36));
}
#pragma mark —— lazyLoad

@end
