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
@property(nonatomic,strong)NSMutableArray <UIButton *>*btnMutArr;

@end

@implementation JobsShowNumView

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
+(instancetype)sharedInstance{
    dispatch_once(&static_showNumViewOnceToken, ^{
        static_showNumView = JobsShowNumView.new;
    });return static_showNumView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsClearColor;
//        self.backgroundImageView.image = JobsIMG(@"弹框样式_03背景图");
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
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{

    NSArray <NSString *>*temp = @[@"1",@"2",@"3",@"4"];
    CGSize btnSize = CGSizeMake(JobsWidth(60), JobsWidth(60));
    
    if (!model) {
        model = UIViewModel.new;
        model.jobsLeft = 0;
        model.jobsRight = 0;
        model.offsetXForEach = (self.thisViewSize.width - model.jobsLeft - model.jobsRight - btnSize.width * temp.count) / (temp.count - 1);
    }
    
    self.viewModel = model ? : UIViewModel.new;
    MakeDataNull
    
    for (NSString *string in temp) {
        UIButton *btn = UIButton.new;
        btn.normalBackgroundImage(JobsIMG(@"JobsShowNum"));
        btn.normalTitle(JobsInternationalization(string));
        btn.titleFont(UIFontWeightBoldSize(40));
        btn.normalTitleColor(HEXCOLOR(0xAE8330));
        @jobs_weakify(self)
        [btn jobsBtnClickEventBlock:^id(id data) {
            @jobs_strongify(self)
            NSLog(@"%@",btn.titleForNormalState)
            return nil;
        }];
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(btnSize);
            make.centerY.equalTo(self);
            if (self.btnMutArr.count) {
                UIButton *lastBtn = self.btnMutArr.lastObject;
                make.left.equalTo(lastBtn.mas_right).offset(model.offsetXForEach);
            }else{
                make.left.equalTo(self).offset(model.jobsLeft);
            }
        }];
        [self.btnMutArr addObject:btn];
    }
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(327), JobsWidth(266));
}
#pragma mark —— lazyLoad
-(NSMutableArray<UIButton *> *)btnMutArr{
    if (!_btnMutArr) {
        _btnMutArr = NSMutableArray.array;
    }return _btnMutArr;
}

@end
