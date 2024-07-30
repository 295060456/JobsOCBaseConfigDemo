//
//  MSCommentView.m
//  MataShop
//
//  Created by Jobs Hi on 10/1/23.
//

#import "MSCommentView.h"

@interface MSCommentView ()
/// UI
@property(nonatomic,strong)BaseTableView *tableView;
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
+(instancetype)sharedInstance{
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
        @jobs_weakify(self)
        JobsAddNotification(self,
                        selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                  id _Nullable arg){
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:NSNumber.class]){
                NSNumber *b = notification.object;
                NSLog(@"SSS = %d",b.boolValue);
            }
            @jobs_strongify(self)
            NSLog(@"通知传递过来的 = %@",notification.object);
            return nil;
        },nil, self),JobsLanguageSwitchNotification,nil);
//        [self netWorking];
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    /// 内部指定圆切角
    [self layoutSubviewsCutCnrByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
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
    [headerView richElementsInViewWithModel:viewModel];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.tableView.alpha = 1;
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
    return [MSCommentTBVCell cellHeightWithModel:self.dataMutArr[indexPath.section].commentDataMutArr[indexPath.row]];
}

- (NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr[section].commentDataMutArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MSCommentTBVCell *cell = [MSCommentTBVCell cellStyleDefaultWithTableView:tableView];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.indexPath = indexPath;
    [cell richElementsInCellWithModel:self.dataMutArr[indexPath.section].commentDataMutArr[indexPath.row]];
    
    CGRect cellFrame = cell.frame;
    cellFrame.size.width -= JobsWidth(15 * 2);
    cell.frame = cellFrame;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return [MSCommentTableHeaderFooterView heightForHeaderInSection:nil];
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section{
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
        @jobs_weakify(self)
        header.tapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                             UITapGestureRecognizer *_Nullable arg) {
            @jobs_strongify(self)
            MSCommentTableHeaderFooterView *header = (MSCommentTableHeaderFooterView *)arg.view;
            NSInteger section = header.tag;
            [tableView ww_foldSection:section
                                 fold:![tableView ww_isSectionFolded:section]];
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
-(BaseTableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = BaseTableView.initWithStyleGrouped;
        _tableView.ww_foldable = YES;
        [self dataLinkByTableView:_tableView];
        _tableView.backgroundColor = JobsCor(@"#FFFFFF");
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.separatorColor = HEXCOLOR(0xEEE2C8);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = YES;
        _tableView.tableHeaderView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.registerHeaderFooterViewClass(MSCommentTableHeaderFooterView.class,@"");
        if(@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        
        {
            MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
            refreshConfigHeader.stateIdleTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.pullingTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.refreshingTitle = JobsInternationalization(@"松开立即刷新");
            refreshConfigHeader.willRefreshTitle = JobsInternationalization(@"刷新数据中");
            refreshConfigHeader.noMoreDataTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.loadBlock = ^id _Nullable(id  _Nullable data) {
                @jobs_strongify(self)
                [self feedbackGenerator];//震动反馈
                return nil;
            };
            
            MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
            refreshConfigFooter.stateIdleTitle = JobsInternationalization(@"");
            refreshConfigFooter.pullingTitle = JobsInternationalization(@"");
            refreshConfigFooter.refreshingTitle = JobsInternationalization(@"");
            refreshConfigFooter.willRefreshTitle = JobsInternationalization(@"");
            refreshConfigFooter.noMoreDataTitle = JobsInternationalization(@"");
            refreshConfigFooter.loadBlock = ^id _Nullable(id  _Nullable data) {
                @jobs_strongify(self)
                [self endRefreshing:self.tableView];
                return nil;
            };
            
            self.refreshConfigHeader = refreshConfigHeader;
            self.refreshConfigFooter = refreshConfigFooter;
            
            _tableView.mj_header = self.mjRefreshNormalHeader;
            _tableView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
        }
        
        {
            _tableView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:JobsInternationalization(@"暂无数据")
                                                                titleStr:JobsInternationalization(@"暂无数据")
                                                               detailStr:JobsInternationalization(@"")];
            
            _tableView.ly_emptyView.titleLabTextColor = JobsLightGrayColor;
            _tableView.ly_emptyView.contentViewOffset = JobsWidth(-180);
            _tableView.ly_emptyView.titleLabFont = UIFontWeightLightSize(16);
        }
        
//        {/// 设置tabAnimated相关属性
//            // 可以不进行手动初始化，将使用默认属性
//            _tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:MSCommentTBVCell.class
//                                                                  cellHeight:74.5];
//            _tableView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
//            [_tableView tab_startAnimation];   // 开启动画
//        }
//
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];

    }return _tableView;
}

-(NSMutableArray<MSCommentModel *> *)dataMutArr{
    if(!_dataMutArr){
        _dataMutArr = NSMutableArray.array;
        {
            NSMutableArray <MSCommentDetailModel *>*commentDataMutArr = NSMutableArray.array;
            
            {
                MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                commentDetailModel.rowTitle = @"张山的歌，第1条评论";
                [commentDataMutArr addObject:commentDetailModel];
            }
            
            {
                MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                commentDetailModel.rowTitle = @"张山的歌，第2条评论";
                [commentDataMutArr addObject:commentDetailModel];
            }

            {
                MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                commentDetailModel.rowTitle = @"张山的歌，第3条评论";
                [commentDataMutArr addObject:commentDetailModel];
            }
            
            MSCommentModel *commentModel = MSCommentModel.new;
            commentModel.sectionTitle = JobsInternationalization(@"张山的歌");
            commentModel.commentDataMutArr = commentDataMutArr;
            
            [_dataMutArr addObject:commentModel];
        }
        
        {
            NSMutableArray <MSCommentDetailModel *>*commentDataMutArr = NSMutableArray.array;
            
            {
                MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                commentDetailModel.rowTitle = @"我是李闯，第1条评论";
                [commentDataMutArr addObject:commentDetailModel];
            }
            
            {
                MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                commentDetailModel.rowTitle = @"我是李闯，第2条评论";
                [commentDataMutArr addObject:commentDetailModel];
            }

            {
                MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                commentDetailModel.rowTitle = @"我是李闯，第3条评论";
                [commentDataMutArr addObject:commentDetailModel];
            }
            
            {
                MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                commentDetailModel.rowTitle = @"我是李闯，第4条评论";
                [commentDataMutArr addObject:commentDetailModel];
            }
            
            MSCommentModel *commentModel = MSCommentModel.new;
            commentModel.sectionTitle = JobsInternationalization(@"我是李闯");
            commentModel.commentDataMutArr = commentDataMutArr;
            
            [_dataMutArr addObject:commentModel];
        }

        {
            NSMutableArray <MSCommentDetailModel *>*commentDataMutArr = NSMutableArray.array;
            
            {
                MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                commentDetailModel.rowTitle = @"今天我很高兴，第1条评论";
                [commentDataMutArr addObject:commentDetailModel];
            }
            
            {
                MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                commentDetailModel.rowTitle = @"今天我很高兴，第2条评论";
                [commentDataMutArr addObject:commentDetailModel];
            }

            {
                MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                commentDetailModel.rowTitle = @"今天我很高兴，第3条评论";
                [commentDataMutArr addObject:commentDetailModel];
            }
            
            {
                MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                commentDetailModel.rowTitle = @"今天我很高兴，第4条评论";
                [commentDataMutArr addObject:commentDetailModel];
            }
            
            {
                MSCommentDetailModel *commentDetailModel = MSCommentDetailModel.new;
                commentDetailModel.rowTitle = @"今天我很高兴，第5条评论";
                [commentDataMutArr addObject:commentDetailModel];
            }
            
            MSCommentModel *commentModel = MSCommentModel.new;
            commentModel.sectionTitle = JobsInternationalization(@"今天我很高兴");
            commentModel.commentDataMutArr = commentDataMutArr;
            
            [_dataMutArr addObject:commentModel];
        }

    }return _dataMutArr;
}

@end
