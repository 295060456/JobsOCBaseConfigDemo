//
//  JobsFiltrationView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/25.
//

#import "JobsFiltrationView.h"

@interface JobsFiltrationView ()
/// UI
@property(nonatomic,strong)JobsHotLabelByMultiLine *hotLabel;
/// Data
@property(nonatomic,strong)NSMutableArray <NSString *>*btnTitleMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;
@property(nonatomic,strong)JobsHotLabelWithMultiLineModel *hotLabelModel;
@property(nonatomic,strong)JobsHeaderFooterViewModel *headerViewModel;
@property(nonatomic,strong)JobsHeaderFooterViewModel *footerViewModel;

@end

@implementation JobsFiltrationView
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_filtrationViewOnceToken = 0;
    static_filtrationView = nil;
}

static JobsFiltrationView *static_filtrationView = nil;
static dispatch_once_t static_filtrationViewOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_filtrationViewOnceToken, ^{
        static_filtrationView = JobsFiltrationView.new;
    });return static_filtrationView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        MakeDataNull
        self.hotLabel.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(134));
    };
}
#pragma mark —— lazyLoad
-(JobsHotLabelByMultiLine *)hotLabel{
    if (!_hotLabel) {
        _hotLabel = JobsHotLabelByMultiLine.new;
        _hotLabel.jobsRichViewByModel(self.hotLabelModel);
        [_hotLabel actionObjectBlock:^(JobsHotLabelByMultiLineCVCell *cell) {
            
        }];
        [self addSubview:_hotLabel];
        [_hotLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }return _hotLabel;
}

-(JobsHotLabelWithMultiLineModel *)hotLabelModel{
    if (!_hotLabelModel) {
        _hotLabelModel = JobsHotLabelWithMultiLineModel.new;
        _hotLabelModel.bgCor = HEXCOLOR(0xFDFCF9);
        _hotLabelModel.viewModelMutArr = self.dataMutArr;
        _hotLabelModel.headerViewModel = self.headerViewModel;
        _hotLabelModel.footerViewModel = self.footerViewModel;
    }return _hotLabelModel;
}

-(JobsHeaderFooterViewModel *)headerViewModel{
    if (!_headerViewModel) {
        _headerViewModel = JobsHeaderFooterViewModel.new;
        _headerViewModel.useHeaderView = YES;
        _headerViewModel.textModel.text = JobsInternationalization(@"交易类型");
        _headerViewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        _headerViewModel.textModel.font = UIFontWeightBoldSize(14);
        _headerViewModel.textModel.textAlignment = NSTextAlignmentLeft;
        _headerViewModel.bgCor = HEXCOLOR(0xFDFCF9);
//        _headerViewModel.jobsSize = CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(20));
    }return _headerViewModel;
}

-(JobsHeaderFooterViewModel *)footerViewModel{
    if (!_footerViewModel) {
        _footerViewModel = JobsHeaderFooterViewModel.new;
        _footerViewModel.useFooterView = NO;
        _footerViewModel.textModel.text = JobsInternationalization(@"查看详情");
        _footerViewModel.textModel.textAlignment = NSTextAlignmentLeft;
        _footerViewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        _footerViewModel.textModel.font = UIFontWeightBoldSize(14);
        _footerViewModel.bgCor = HEXCOLOR(0xFDFCF9);
//        _footerViewModel.jobsSize = CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(20));
    }return _footerViewModel;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        for (NSString *str in self.btnTitleMutArr) {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = str;
            viewModel.textModel.font = UIFontWeightRegularSize(12);
            viewModel.textModel.textCor = HEXCOLOR(0x757575);
            viewModel.bgCor = HEXCOLOR(0xF3F3F3);
            viewModel.jobsSize = CGSizeMake(JobsWidth(80), JobsWidth(30));
            [_dataMutArr addObject:viewModel];
        }
    }return _dataMutArr;
}

-(NSMutableArray<NSString *> *)btnTitleMutArr{
    if (!_btnTitleMutArr) {
        _btnTitleMutArr = NSMutableArray.array;
        [_btnTitleMutArr addObject:JobsInternationalization(@"全部")];
        [_btnTitleMutArr addObject:JobsInternationalization(@"充值")];
        [_btnTitleMutArr addObject:JobsInternationalization(@"取款")];
        [_btnTitleMutArr addObject:JobsInternationalization(@"转账")];
        [_btnTitleMutArr addObject:JobsInternationalization(@"返水")];
        [_btnTitleMutArr addObject:JobsInternationalization(@"会员活动")];
        [_btnTitleMutArr addObject:JobsInternationalization(@"VIP福利")];
        [_btnTitleMutArr addObject:JobsInternationalization(@"其他")];
    }return _btnTitleMutArr;
}

@end


