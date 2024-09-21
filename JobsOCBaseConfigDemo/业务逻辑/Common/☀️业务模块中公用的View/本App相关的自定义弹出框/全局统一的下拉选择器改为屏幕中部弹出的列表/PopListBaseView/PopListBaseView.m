//
//  PopListView.m
//  FM
//
//  Created by User on 8/11/24.
//

#import "PopListBaseView.h"

@interface PopListBaseView ()
/// UI
@property(nonatomic,strong)UITableView *tableView;
/// Data
@property(nonatomic,strong)NSMutableArray <__kindof UITableViewCell *>*tbvCellMutArr;
@property(nonatomic,strong)NSMutableArray <__kindof UIViewModel *>*dataMutArr;

@end

@implementation PopListBaseView
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock)jobsRichElementsInViewWithModel{
    @jobs_weakify(self)
    return ^(NSMutableArray <__kindof UIViewModel *>* model) {
        @jobs_strongify(self)
        self.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
        self.dataMutArr = model;
        self.tableView.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(300), JobsWidth(259));
}

-(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return [self.class viewSizeWithModel:nil];
}
#pragma mark —— 一些私有方法
-(void)layoutSubviews{
    [super layoutSubviews];
    /// 内部指定圆切角
    [self appointCornerCutToCircleByRoundingCorners:UIRectCornerAllCorners
                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewModel *viewModel = self.dataMutArr[indexPath.row];
    for (JobsTextStyleTBVCell *visibleCell in tableView.visibleCells) {
        visibleCell.backgroundColor = visibleCell.contentView.backgroundColor = viewModel.bgCor;
        visibleCell.lab.textColor = viewModel.textCor;
    }
    JobsTextStyleTBVCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = cell.contentView.backgroundColor = viewModel.bgSelectedCor;
    cell.lab.textColor = viewModel.selectedTextCor;
    if (self.objectBlock) self.objectBlock(cell);/// 数据在cell.viewModel
    [self tf_hide];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(37);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.tbvCellMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsTextStyleTBVCell *cell = JobsTextStyleTBVCell.cellStyleDefaultWithTableView(tableView);
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.indexPath = indexPath;
    cell.jobsRichElementsInCellWithModel(self.dataMutArr[indexPath.row]);
    return cell;
}
#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.initWithStylePlain;
        _tableView.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = JobsCor(@"#1E1E1E");
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = YES;
        _tableView.dataLink(self);
        _tableView.tableHeaderView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0);
        if(@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }return _tableView;
}

-(NSMutableArray<UITableViewCell *> *)tbvCellMutArr{
    if (!_tbvCellMutArr) {
        _tbvCellMutArr = NSMutableArray.array;
        for (int d = 0; d < self.dataMutArr.count; d++) {
            _tbvCellMutArr.add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView));
        }
    }return _tbvCellMutArr;
}

-(NSMutableArray<__kindof UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.text = JobsInternationalization(@"选项1");
            viewModel.font = UIFontWeightRegularSize(JobsWidth(16));
            viewModel.textCor = JobsCor(@"#5D5D5D");
            viewModel.selectedTextCor = JobsWhiteColor;
            viewModel.bgSelectedCor = JobsCor(@"#5D5D5D");
            viewModel.bgCor = JobsCor(@"#1F1F1F");
            viewModel.textAlignment = NSTextAlignmentCenter;
            _dataMutArr.add(viewModel);
        }
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.text = JobsInternationalization(@"选项2");
            viewModel.font = UIFontWeightRegularSize(JobsWidth(16));
            viewModel.textCor = JobsCor(@"#5D5D5D");
            viewModel.selectedTextCor = JobsWhiteColor;
            viewModel.bgSelectedCor = JobsCor(@"#5D5D5D");
            viewModel.bgCor = JobsCor(@"#1F1F1F");
            viewModel.textAlignment = NSTextAlignmentCenter;
            _dataMutArr.add(viewModel);
        }
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.text = JobsInternationalization(@"选项3");
            viewModel.font = UIFontWeightRegularSize(JobsWidth(16));
            viewModel.textCor = JobsCor(@"#5D5D5D");
            viewModel.selectedTextCor = JobsWhiteColor;
            viewModel.bgSelectedCor = JobsCor(@"#5D5D5D");
            viewModel.bgCor = JobsCor(@"#1F1F1F");
            viewModel.textAlignment = NSTextAlignmentCenter;
            _dataMutArr.add(viewModel);
        }
    }return _dataMutArr;
}

@end
