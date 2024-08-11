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
@property(nonatomic,strong)UITableView *tableView;
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
        self.tableView.alpha = 1;
        self.backgroundColor = JobsClearColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.tableView.alpha = 1;
        self.backgroundColor = JobsClearColor;
    }return self;
}

-(instancetype)initWithTableViewClass:(Class <UITableViewCellProtocol>_Nonnull)tableViewClass{
    if (self = [super init]) {
        self.tbvCell_cls = tableViewClass;
        self.tableView.alpha = 1;
        self.backgroundColor = JobsClearColor;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.tableView.contentInset = UIEdgeInsetsMake(0,
                                                   0,
                                                   [JobsDropDownListView getWindowFrameByView:self].origin.y,
                                                   0);
    /// 动画效果
    [self.tableView alphaAnimWithSortingType:(SortingType)self.direction
                              animationBlock:nil
                             completionBlock:nil];
}

-(void)dropDownListViewDisappear:(UIControl *_Nullable)x{
    x.selected = NO;
    [self removeFromSuperview];
}

-(void)richElementsInViewWithModel:(NSMutableArray <__kindof UIViewModel *>*_Nullable)model{
    if ([model isKindOfClass:NSArray.class]) {
        self.dataMutArr = model;
        self.tableView.alpha = 1;
    }
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    /// self.tbvCell_cls没有值的时候等于调用 [JobsDropDownListTBVCell cellHeightWithModel:Nil];
    NSNumber *d = [NSObject methodName:@"cellHeightWithModel:"
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

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)self.tbvCellMutArr[indexPath.row];
    cell.richElementsInCellWithModel(self.dataMutArr[indexPath.row]);
    return cell;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView hideSeparatorLineAtLast:indexPath
                                  cell:cell];
}
#pragma mark —— lazyLoad
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
        _tbvCellMutArr = NSMutableArray.array;
        NSInteger dataMutArrCount = self.dataMutArr.count;
        do {
            UITableViewCell *tableViewCell = [self.tableView tableViewCellClass:self.tbvCell_cls ? : JobsDropDownListTBVCell.class
                                                   tableViewCellStyleValue1Salt:@""];
            _tbvCellMutArr.jobsAddObject(tableViewCell);
            dataMutArrCount -= 1;
        } while (dataMutArrCount);
    }return _tbvCellMutArr;
}

@end
