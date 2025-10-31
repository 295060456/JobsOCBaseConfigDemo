//
//  JobsShowNumView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/13.
//

#import "JobsShowNumView.h"

@interface JobsShowNumView ()
/// UI
/// Data
Prop_strong()NSMutableArray <__kindof UIButton *>*btnMutArr;

@end

@implementation JobsShowNumView
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
@synthesize thisViewSize = _thisViewSize;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_showNumViewOnceToken = 0;
    static_showNumView = nil;
}

static JobsShowNumView *static_showNumView = nil;
static dispatch_once_t static_showNumViewOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_showNumViewOnceToken, ^{
        static_showNumView = JobsShowNumView.new;
    });return static_showNumView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsClearColor;
//        self.backgroundImageView.image = @"弹框样式_03背景图".img;
    }return self;
}
/// 初始化的时候最好传入一个size值将其子视图的大小固定死。因为只有当父视图有Size的情况下子视图才会展开，从而避免刷新约束时候的一系列麻烦事。
-(instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.thisViewSize = thisViewSize;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        NSArray <NSString *>*temp = jobsMakeMutArr(^(__kindof NSMutableArray<NSString *> * _Nullable arr) {
            arr.add(@"1")
            .add(@"2")
            .add(@"3")
            .add(@"4");
        });
        CGSize btnSize = CGSizeMake(JobsWidth(60), JobsWidth(60));
        
        self.viewModel = model ? : jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.jobsLeft = 0;
            data.jobsRight = 0;
            data.offsetXForEach = (self.thisViewSize.width - model.jobsLeft - model.jobsRight - btnSize.width * temp.count) / (temp.count - 1);
        });
        MakeDataNull
        
        for (NSString *string in temp) {
            UIButton *btn = UIButton.jobsInit()
            .jobsResetBtnBgImage(@"JobsShowNum".img)
            .jobsResetBtnTitle(JobsInternationalization(string))
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(40))
            .jobsResetBtnTitleCor(HEXCOLOR(0xAE8330))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                x.selected = !x.selected;
                JobsLog(@"%@",x.titleForNormalState)
                if (self.objBlock) self.objBlock(x);
            });

            [self.addSubview(btn) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(btnSize);
                make.centerY.equalTo(self);
                if (self.btnMutArr.count) {
                    UIButton *lastBtn = self.btnMutArr.lastObject;
                    make.left.equalTo(lastBtn.mas_right).offset(model.offsetXForEach);
                }else{
                    make.left.equalTo(self).offset(model.jobsLeft);
                }
            }];
            
            self.btnMutArr.add(btn);
        }
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(327), JobsWidth(266));
    };
}
#pragma mark —— lazyLoad
-(NSMutableArray<UIButton *> *)btnMutArr{
    if (!_btnMutArr) {
        _btnMutArr = NSMutableArray.array;
    }return _btnMutArr;
}

@end
