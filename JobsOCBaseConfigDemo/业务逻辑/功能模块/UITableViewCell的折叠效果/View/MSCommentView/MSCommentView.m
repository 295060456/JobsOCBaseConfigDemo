//
//  MSCommentView.m
//  MataShop
//
//  Created by Jobs Hi on 10/1/23.
//

#import "MSCommentView.h"

@interface MSCommentView ()
/// UI
/// Data
@property(nonatomic,strong)NSMutableArray <MSCommentModel *>*dataMutArr;

@end

@implementation MSCommentView
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_commentViewOnceToken = 0;
    static_commentView = nil;
}

static MSCommentView *static_commentView = nil;
static dispatch_once_t static_commentViewOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_commentViewOnceToken, ^{
        static_commentView = MSCommentView.new;
    });return static_commentView;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        @jobs_weakify(self)
        [self addNotificationName:语言切换
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
//            @jobs_strongify(self)
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:NSNumber.class]){
                NSNumber *b = notification.object;
                NSLog(@"SSS = %d",b.boolValue);
            }
            NSLog(@"通知传递过来的 = %@",notification.object);
        }];
//        [self netWorking];
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    /// 内部指定圆切角
    [self appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— 一些私有方法
/// 设置headerView
-(void)headerView:(UITableViewHeaderFooterView *)headerView
          section:(NSInteger)section{
    UIViewModel *viewModel = UIViewModel.new;
    viewModel.textModel.text = self.dataMutArr[section].sectionTitle;
    viewModel.textModel.font = UIFontWeightBoldSize(16);
    viewModel.textModel.textCor = JobsCor(@"#333333");
    headerView.jobsRichViewByModel(viewModel);
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.tableView.reloadDatas();
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
/// 编辑模式下，点击取消左边已选中的cell的按钮
- (void)tableView:(UITableView *)tableView
didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataMutArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return MSCommentTBVCell.cellHeightByModel(self.dataMutArr[indexPath.section].commentDataMutArr[indexPath.row]);
}

- (NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr[section].commentDataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MSCommentTBVCell *cell = MSCommentTBVCell.cellStyleDefaultWithTableView(tableView);
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.indexPath = indexPath;
    cell.jobsRichElementsInCellWithModel(self.dataMutArr[indexPath.section].commentDataMutArr[indexPath.row]);
    
    CGRect cellFrame = cell.frame;
    cellFrame.size.width -= JobsWidth(15 * 2);
    cell.frame = cellFrame;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return MSCommentTableHeaderFooterView.heightForHeaderInSection(nil);
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSectionByModel:(NSInteger)section{
    return CGFLOAT_MIN;
}
/// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    MSCommentTableHeaderFooterView *header = (MSCommentTableHeaderFooterView *)tableView.tableViewHeaderFooterView(MSCommentTableHeaderFooterView.class,@"");
    if(!header){
        header = [MSCommentTableHeaderFooterView.alloc initWithReuseIdentifier:MSCommentTableHeaderFooterView.class.description];
    }

    {
        header.numberOfTouchesRequired = 1;
        header.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
        header.minimumPressDuration = 0.1;
        header.numberOfTouchesRequired = 1;
        header.allowableMovement = 1;
        header.userInteractionEnabled = YES;
        header.target = self;
        header.tapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                             UITapGestureRecognizer *_Nullable arg) {
            MSCommentTableHeaderFooterView *header = (MSCommentTableHeaderFooterView *)arg.view;
            NSInteger section = header.tag;
            [tableView ww_foldSection:section fold:![tableView ww_isSectionFolded:section]];
            return nil;
        }];
        header.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
    }
    header.tag = section;
    return header;
}

- (void)tableView:(UITableView *)tableView
willDisplayHeaderView:(UIView *)view
       forSection:(NSInteger)section{
    MSCommentTableHeaderFooterView *commentTableHeaderFooterView = (MSCommentTableHeaderFooterView *)view;
    [self headerView:commentTableHeaderFooterView section:section];
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(BaseTableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = BaseTableView.initWithStyleGrouped;
        _tableView.ww_foldable = YES;
        _tableView.dataLink(self);
        _tableView.backgroundColor = JobsCor(@"#FFFFFF");
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.separatorColor = HEXCOLOR(0xEEE2C8);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = YES;
        _tableView.tableHeaderView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
        });
        _tableView.tableFooterView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
        });
        _tableView.registerHeaderFooterViewClass(MSCommentTableHeaderFooterView.class,@"");
        if(@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        
        {
            _tableView.mj_header = self.MJRefreshNormalHeaderBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                data.stateIdleTitle = JobsInternationalization(@"下拉可以刷新");
                data.pullingTitle = JobsInternationalization(@"下拉可以刷新");
                data.refreshingTitle = JobsInternationalization(@"松开立即刷新");
                data.willRefreshTitle = JobsInternationalization(@"刷新数据中");
                data.noMoreDataTitle = JobsInternationalization(@"下拉可以刷新");
                data.automaticallyChangeAlpha = YES;/// 根据拖拽比例自动切换透明度
                data.loadBlock = ^id _Nullable(id  _Nullable data) {
                    @jobs_strongify(self)
                    self.feedbackGenerator();//震动反馈
                    return nil;
                };
            }));
            _tableView.mj_footer = self.MJRefreshFooterBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                data.stateIdleTitle = JobsInternationalization(@"");
                data.pullingTitle = JobsInternationalization(@"");
                data.refreshingTitle = JobsInternationalization(@"");
                data.willRefreshTitle = JobsInternationalization(@"");
                data.noMoreDataTitle = JobsInternationalization(@"");
                data.loadBlock = ^id _Nullable(id  _Nullable data) {
                    @jobs_strongify(self)
                    self->_tableView.endRefreshing(YES);
                    return nil;
                };
            }));
        }
        
//        {// 设置tabAnimated相关属性
//            _tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:JobsBaseTableViewCell.class
//                                                                  cellHeight:JobsBaseTableViewCell.cellHeightByModel(nil)];
//            _tableView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeBinAnimation;
//            _tableView.tabAnimated.canLoadAgain = YES;
////            _tableView.tabAnimated.animatedBackViewCornerRadius = JobsWidth(8);
////            _tableView.tabAnimated.animatedBackgroundColor = JobsRedColor;
//            [_tableView tab_startAnimation];   // 开启动画
//        }
        
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];

    }return _tableView;
}

-(NSMutableArray<MSCommentModel *> *)dataMutArr{
    if(!_dataMutArr){
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            {
                @jobs_weakify(data)
                NSMutableArray <MSCommentDetailModel *>*commentDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <MSCommentDetailModel *>*_Nullable data2) {
                    @jobs_strongify(data)
                    {
                        MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                        commentDetailModel.rowTitle = JobsInternationalization(@"张山的歌").add(@",").add(JobsInternationalization(@"第1条评论"));
                        data2.add(commentDetailModel);
                    }
                    
                    {
                        MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                        commentDetailModel.rowTitle = JobsInternationalization(@"张山的歌").add(@",").add(JobsInternationalization(@"第2条评论"));
                        data2.add(commentDetailModel);
                    }

                    {
                        MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                        commentDetailModel.rowTitle = JobsInternationalization(@"张山的歌").add(@",").add(JobsInternationalization(@"第3条评论"));
                        data2.add(commentDetailModel);
                    }
                });
                MSCommentModel *commentModel = MSCommentModel.new;
                commentModel.sectionTitle = JobsInternationalization(@"张山的歌");
                commentModel.commentDataMutArr = commentDataMutArr;
                data.add(commentModel);
            }
            
            {
                @jobs_weakify(data)
                NSMutableArray <MSCommentDetailModel *>*commentDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <MSCommentDetailModel *>*_Nullable data2) {
                    @jobs_strongify(data)
                    {
                        MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                        commentDetailModel.rowTitle = JobsInternationalization(@"赵四的歌").add(@",").add(JobsInternationalization(@"第1条评论"));
                        data2.add(commentDetailModel);
                    }
                    
                    {
                        MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                        commentDetailModel.rowTitle = JobsInternationalization(@"赵四的歌").add(@",").add(JobsInternationalization(@"第2条评论"));
                        data2.add(commentDetailModel);
                    }

                    {
                        MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                        commentDetailModel.rowTitle = JobsInternationalization(@"赵四的歌").add(@",").add(JobsInternationalization(@"第3条评论"));
                        data2.add(commentDetailModel);
                    }
                });
                MSCommentModel *commentModel = MSCommentModel.new;
                commentModel.sectionTitle = JobsInternationalization(@"赵四的歌");
                commentModel.commentDataMutArr = commentDataMutArr;
                data.add(commentModel);
            }
            
            {
                @jobs_weakify(data)
                NSMutableArray <MSCommentDetailModel *>*commentDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <MSCommentDetailModel *>*_Nullable data2) {
                    @jobs_strongify(data)
                    {
                        MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                        commentDetailModel.rowTitle = JobsInternationalization(@"王五的歌").add(@",").add(JobsInternationalization(@"第1条评论"));
                        data2.add(commentDetailModel);
                    }
                    
                    {
                        MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                        commentDetailModel.rowTitle = JobsInternationalization(@"王五的歌").add(@",").add(JobsInternationalization(@"第2条评论"));
                        data2.add(commentDetailModel);
                    }

                    {
                        MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                        commentDetailModel.rowTitle = JobsInternationalization(@"王五的歌").add(@",").add(JobsInternationalization(@"第3条评论"));
                        data2.add(commentDetailModel);
                    }
                });
                MSCommentModel *commentModel = MSCommentModel.new;
                commentModel.sectionTitle = JobsInternationalization(@"王五的歌");
                commentModel.commentDataMutArr = commentDataMutArr;
                data.add(commentModel);
            }
        });
    }return _dataMutArr;
}

@end
