//
//  PopListView.m
//  FM
//
//  Created by User on 8/11/24.
//

#import "PopListBaseView.h"

@interface PopListBaseView ()
/// Data
@property(nonatomic,strong)NSMutableArray <__kindof UITableViewCell *>*tbvCellMutArr;
@property(nonatomic,strong)NSMutableArray <__kindof UIViewModel *>*dataMutArr;
@property(nonatomic,strong)NSMutableArray <__kindof NSString *>*datas;

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
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(NSMutableArray <__kindof UIViewModel *>* model) {
        @jobs_strongify(self)
        self.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
        self.dataMutArr = model;
        self.tableView.reloadDatas();
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(NSArray *_Nullable data){
        if(data){
            return jobsMakeCGSizeByLocationModelBlock(^(__kindof JobsLocationModel *_Nullable data1) {
                data1.jobsWidth = PopListBaseView.CellWidth;
                data1.jobsHeight = MIN(data.count * PopListBaseView.CellHeight,JobsWidth(259));/// 高度限制在 JobsWidth(259)
                NSLog(@"KKK = %f-%f",data1.jobsWidth,data1.jobsHeight);
            });
        }else return CGSizeMake(JobsWidth(300), JobsWidth(259));
    };
}

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
//    id text = cell.viewModel.text;
//    id placeholder = cell.viewModel.placeholder;
    if (self.objectBlock) self.objectBlock(cell);/// 数据在cell.viewModel
    [self tf_hide:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.cellHeight;
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
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.initWithStylePlain;
        _tableView.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = JobsCor(@"#1E1E1E");
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = YES;
        _tableView.dataLink(self);
        _tableView.tableHeaderView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
        });
        _tableView.tableFooterView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
        });
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

-(NSMutableArray <__kindof UITableViewCell *>*)tbvCellMutArr{
    if (!_tbvCellMutArr) {
        @jobs_weakify(self)
        _tbvCellMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UITableViewCell *>*_Nullable data) {
            @jobs_strongify(self)
            for (int d = 0; d < self.dataMutArr.count; d++) {
                @jobs_strongify(self)
                data.add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView));
            }
        });
    }return _tbvCellMutArr;
}

-(NSMutableArray<__kindof NSString *> *)datas{
    if(!_datas){
        _datas = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(JobsInternationalization(@"选项1"));
            data.add(JobsInternationalization(@"选项2"));
            data.add(JobsInternationalization(@"选项3"));
        });
    }return _datas;
}

@synthesize dataMutArr = _dataMutArr;
-(void)setDataMutArr:(NSMutableArray <__kindof UIViewModel *>*)dataMutArr{
    _dataMutArr = dataMutArr;
    _tbvCellMutArr = nil;
}

-(NSMutableArray<__kindof UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        @jobs_weakify(self)
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <UIViewModel *>*_Nullable data) {
            @jobs_strongify(self)
            for (NSString *t in self.datas) {
                data.add(self.configPopUpDataBy(t));
            }
        });
    }return _dataMutArr;
}
static CGFloat _CellHeight = 0;
+(CGFloat)CellHeight {
    if (!_CellHeight) {
        _CellHeight = JobsWidth(37);
    }return _CellHeight;
}
static CGFloat _CellWidth = 0;
+(CGFloat)CellWidth {
    if (!_CellWidth) {
        _CellWidth = JobsWidth(300);
    }return _CellWidth;
}
@synthesize cellHeight = _cellHeight;
-(CGFloat)cellHeight{
    if(!_cellHeight){
        _cellHeight = PopListBaseView.CellHeight;
    }return _cellHeight;
}
@synthesize cellWidth = _cellWidth;
-(CGFloat)cellWidth{
    if(!_cellWidth){
        _cellWidth = PopListBaseView.CellWidth;
    }return _cellWidth;
}

@end
