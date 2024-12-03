//
//  JobsDropDownListView.m
//  Casino
//
//  Created by Jobs on 2021/12/21.
//

#import "JobsDropDownListView.h"

@interface JobsDropDownListView (){
    CGFloat CellHeight;
}
/// UI
@property(nonatomic,strong)Class <UITableViewCellProtocol>tbvCell_cls;
/// Data
@property(nonatomic,strong)NSMutableArray <__kindof UITableViewCell *>*tbvCellMutArr;
@property(nonatomic,strong)NSMutableArray <__kindof UIViewModel *>*dataMutArr;

@end

@implementation JobsDropDownListView

- (void)dealloc {
    NSLog(@"%@",JobsLocalFunc);
}

-(instancetype)init{
    if (self = [super init]) {
        self.tableView.reloadDatas();
        self.backgroundColor = JobsClearColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.tableView.reloadDatas();
        self.backgroundColor = JobsClearColor;
    }return self;
}

-(instancetype)initWithTableViewClass:(Class <UITableViewCellProtocol>_Nonnull)tableViewClass{
    if (self = [super init]) {
        self.tbvCell_cls = tableViewClass;
        self.tableView.reloadDatas();
        self.backgroundColor = JobsClearColor;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.tableView.contentInset = UIEdgeInsetsMake(0,
                                                   0,
                                                   JobsDropDownListView.getWindowFrameByView(self).origin.y,
                                                   0);
    /// 动画效果
    [self.tableView alphaAnimWithSortingType:(SortingType)self.direction
                              animationBlock:nil
                             completionBlock:nil];
}

-(jobsByControlBlock _Nonnull)dropDownListViewDisappear{
    @jobs_weakify(self)
    return ^(UIControl *_Nullable ctrl){
        @jobs_strongify(self)
        ctrl.selected = NO;
        [self removeFromSuperview];
    };
}

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(NSMutableArray <__kindof UIViewModel *>*_Nullable model) {
        @jobs_strongify(self)
        if ([model isKindOfClass:NSArray.class]) {
            self.dataMutArr = model;
            self.tableView.reloadDatas();
        }
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    /// self.tbvCell_cls没有值的时候等于调用 JobsDropDownListTBVCell.cellHeightByModel(nil)
    NSNumber *d = [NSObject methodName:@"cellHeightByModel:"
                             targetObj:self.tbvCell_cls ? self.tbvCell_cls.class : JobsDropDownListTBVCell.class
                           paramarrays:nil];
    return d.floatValue;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.objectBlock) self.objectBlock(self.dataMutArr[indexPath.row]);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)self.tbvCellMutArr[indexPath.row];
    cell.jobsRichElementsInCellWithModel(self.dataMutArr[indexPath.row]);
    return cell;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView hideSeparatorLineAtLast:indexPath
                                  cell:cell];
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.new;
        _tableView.backgroundColor = JobsClearColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.dataLink(self);
        _tableView.tableHeaderView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.separatorColor = HEXCOLOR(0xEEEEEE);
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }return _tableView;
}

-(NSMutableArray<__kindof UITableViewCell *> *)tbvCellMutArr{
    if (!_tbvCellMutArr) {
        @jobs_weakify(self)
        _tbvCellMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            NSInteger dataMutArrCount = self.dataMutArr.count;
            do {
                UITableViewCell *tableViewCell = [self.tableView tableViewCellClass:self.tbvCell_cls ? : JobsDropDownListTBVCell.class
                                                       tableViewCellStyleValue1Salt:@""];
                data.add(tableViewCell);
                dataMutArrCount -= 1;
            } while (dataMutArrCount);
        });
    }return _tbvCellMutArr;
}

@end
