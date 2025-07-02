//
//  PopListView.m
//  FM
//
//  Created by User on 8/11/24.
//

#import "PopListBaseView.h"

@interface PopListBaseView ()
/// Data
Prop_strong()NSMutableArray <__kindof UITableViewCell *>*tbvCellMutArr;
Prop_strong()NSMutableArray <__kindof UIViewModel *>*dataMutArr;
Prop_strong()NSMutableArray <__kindof NSString *>*datas;

@end

@implementation PopListBaseView
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.byBgCor(JobsClearColor.colorWithAlphaComponentBy(0));
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
        self.byBgCor(JobsClearColor.colorWithAlphaComponentBy(0));
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(NSMutableArray <__kindof UIViewModel *>* model) {
        @jobs_strongify(self)
        self.byBgCor(JobsClearColor.colorWithAlphaComponentBy(0));
        self.dataMutArr = model;
        self.tableView.reloadDatas();
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(NSArray *_Nullable data){
        if(data){
            return jobsMakeCGSizeByLocationModelBlock(^(__kindof JobsLocationModel *_Nullable data1) {
                data1.jobsWidth = PopListBaseView.CellWidth;
                data1.jobsHeight = MIN(data.count * PopListBaseView.CellHeight,JobsWidth(259));/// 高度限制在 JobsWidth(259)
                JobsLog(@"KKK = %f-%f",data1.jobsWidth,data1.jobsHeight);
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
    for (JobsTextLabStyleTBVCell *visibleCell in tableView.visibleCells) {
        visibleCell.byBgCor(viewModel.bgCor);
        visibleCell.contentView.byBgCor(viewModel.bgCor);
        visibleCell.label.byTextCor(viewModel.textCor);
    }
    JobsTextLabStyleTBVCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.byBgCor(viewModel.bgSelectedCor);
    cell.contentView.byBgCor(viewModel.bgSelectedCor);
    cell.label.byTextCor(viewModel.selectedTextCor);
    if (self.objBlock) self.objBlock(cell);/// 数据在cell.viewModel
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
    return JobsTextLabStyleTBVCell.cellStyleDefaultWithTableView(tableView)
        .byAccessoryType(UITableViewCellAccessoryNone)
        .byIndexPath(indexPath)
        .jobsRichElementsTableViewCellBy(self.dataMutArr[indexPath.row])
            .JobsBlock1(^(id _Nullable data) {

            });
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(__kindof UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = self.addSubview(jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            tableView
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .bySeparatorColor(JobsCor(@"#1E1E1E"))
                .byContentInset(UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0))
                .byTableHeaderView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                }))
                .byTableFooterView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                }))
                .emptyDataByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                    data.title = JobsInternationalization(@"NO MESSAGES FOUND");
                    data.titleCor = JobsWhiteColor;
                    data.titleFont = bayonRegular(JobsWidth(30));
                    data.normalImage = JobsIMG(@"小狮子");
                }))
                .showsVerticalScrollIndicatorBy(NO)
                .showsHorizontalScrollIndicatorBy(NO)
                .byScrollEnabled(YES)
                .byBgCor(JobsClearColor);
            if(@available(iOS 11.0, *)) {
                tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }
        })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
            @jobs_strongify(self)
            make.edges.equalTo(self);
        }).on().dataLink(self);/// dataLink(self)不能写在Block里面，会出问题
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
            data.add(JobsInternationalization(@"选项1"))
            .add(JobsInternationalization(@"选项2"))
            .add(JobsInternationalization(@"选项3"));
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
