//
//  JobsPageView.m
//  Casino
//
//  Created by Jobs on 2021/11/24.
//

#import "JobsPageView.h"

@interface JobsPageView ()
/// Data
@property(nonatomic,strong)NSArray <UIViewModel *>*dataArr;

@end

@implementation JobsPageView
@synthesize cellHeight = _cellHeight;
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.cellHeight = self.height;//16
    [self.tableView reloadData];
}
#pragma mark —— BaseViewProtocol
//具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(NSArray <UIViewModel *>*_Nullable model) {
        @jobs_strongify(self)
        self.dataArr = model;
        self.tableView.reloadDatas();
    //    self.backgroundImageView.image = JobsIMG(@"抖动钱包抖币用途");
    //    self.imageView_1.alpha = 1;
    //    self.imageView_2.alpha = 1;
    //    self.valueLab.text = model.goldNumber;
    //    self.btn.alpha = 1;
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsPageTBVCell.cellHeightByModel(nil) ? : self.cellHeight;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsPageTBVCell *cell = JobsPageTBVCell.cellStyleSubtitleWithTableView(tableView);
    cell.jobsRichElementsInCellWithModel(self.dataArr[indexPath.row]);
#warning 这里需要被修改
//    UIViewModel *viewModel = self.dataArr[indexPath.row];
//    viewModel.jobsWidth = JobsPageTBVCell.cellHeightByModel(nil) ? : self.cellHeight;
//    UIView.widthByData(viewModel);
    return cell;
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.new;
        _tableView.backgroundColor = JobsClearColor;
        _tableView.pagingEnabled = YES;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.scrollEnabled = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.dataLink(self);
        _tableView.tableFooterView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
        });
        _tableView.separatorColor = HEXCOLOR(0xEEEEEE);
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }return _tableView;
}

@end
