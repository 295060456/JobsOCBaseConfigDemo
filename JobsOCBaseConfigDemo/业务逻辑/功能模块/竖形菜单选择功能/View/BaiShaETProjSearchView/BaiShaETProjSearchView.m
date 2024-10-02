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
+(instancetype)sharedManager{
    dispatch_once(&static_searchViewOnceToken, ^{
        static_searchView = BaiShaETProjSearchView.new;
    });return static_searchView;
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
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsRedColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model ? : UIViewModel.new;
        MakeDataNull
        self.backgroundColor = JobsRedColor;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(234), JobsWidth(36));
    };
}
#pragma mark —— lazyLoad

@end
