//
//  TextureDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import "TextureDemoVC.h"

@interface TextureDemoVC ()

Prop_strong() ASTableNode *tableNode;
Prop_strong() NSMutableArray<NSNumber *> *rows;
Prop_assign() BOOL hasMore;

@end

@implementation TextureDemoVC

- (instancetype)init {
    if (self = [super initWithNode:self.tableNode]) {
        self.title = @"Texture Demo (OC)";
        _hasMore = YES;
    }return self;
}

-(void)loadView{
    [super loadView];
    self.node.backgroundColor = UIColor.systemBackgroundColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 导航大标题
    if (@available(iOS 11.0, *)) {
        self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAutomatic;
        self.navigationController.navigationBar.prefersLargeTitles = YES;
    }
    self.tableNode.inverted = NO;
}
#pragma mark - ASTable DataSource (推荐使用 Block 创建以获得异步构建收益)
- (NSInteger)tableNode:(ASTableNode *)tableNode
 numberOfRowsInSection:(NSInteger)section {
    return self.rows.count;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode
  nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    TDDemoRowType type = self.rows[indexPath.row].integerValue;
    return ^ASCellNode * _Nonnull{
        switch (type) {
            case TDDemoRowType_Text:
                return [[TDTextCellNode alloc] initWithTitle:@"ASTextNode：高性能异步文本"
                                                   subtitle:@"支持 Truncation/Highlight/Link/排版，多行异步绘制，避免主线程卡顿。"];
            case TDDemoRowType_LocalImage:
                return [[TDImageCellNode alloc] initWithImage:@"Sample".img
                                                       title:@"Local Image + Ratio(16:9) + Overlay + Corner"];
            case TDDemoRowType_NetImage:
                return [[TDNetImageCellNode alloc] initWithURL:@"https://picsum.photos/800/400".jobsUrl
                                                          text:@"ASNetworkImageNode：支持默认图、占位渐隐、渐进式渲染、圆角裁切。"];
            case TDDemoRowType_Button:
                return [[TDButtonCellNode alloc] init];
            case TDDemoRowType_EditableText:
                return [[TDEditableTextCellNode alloc] init];
            case TDDemoRowType_HCarousel:
                return [[TDHorizontalCarouselCellNode alloc] initWithCount:18];
            case TDDemoRowType_Video:
                return [[TDVideoCellNode alloc] initWithURL:@"https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4".jobsUrl
                                                      title:@"ASVideoNode：离屏解码、可见时准备，避免滚动卡顿。"];
#if HAS_MAPKIT
            case TDDemoRowType_Map:
                return [[TDMapCellNode alloc] init];
#endif
            case TDDemoRowType_Draw:
                return [[TDDrawCellNode alloc] init];
        }return [[ASCellNode alloc] init];
    };
}
#pragma mark —— ASTable Delegate (批量加载示例)
-(BOOL)shouldBatchFetchForTableNode:(ASTableNode *)tableNode {
    return self.hasMore;
}

-(void)tableNode:(ASTableNode *)tableNode
willBeginBatchFetchWithContext:(ASBatchContext *)context {
    // 模拟分页拉取
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.9 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSInteger startCount = self.rows.count;
        // 追加一轮混合条目
        NSArray *more = @[
            @(TDDemoRowType_Text),
            @(TDDemoRowType_NetImage),
            @(TDDemoRowType_HCarousel),
            @(TDDemoRowType_Draw),
        ];
        [self.rows addObjectsFromArray:more];

        NSMutableArray<NSIndexPath *> *inserts = [NSMutableArray array];
        for (NSInteger i = startCount; i < self.rows.count; i++) {
            [inserts addObject:[NSIndexPath indexPathForRow:i inSection:0]];
        }
        self.hasMore = (self.rows.count < 60);
        [self.tableNode insertRowsAtIndexPaths:inserts withRowAnimation:UITableViewRowAnimationAutomatic];
        [context completeBatchFetching:YES];
    });
}
#pragma mark —— lazyLoad
-(__kindof NSArray *)rows{
    if(!_rows){
        _rows = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
            arr.add(@(TDDemoRowType_Text))
            .add(@(TDDemoRowType_LocalImage))
            .add(@(TDDemoRowType_NetImage))
            .add(@(TDDemoRowType_Button))
            .add(@(TDDemoRowType_EditableText))
            .add(@(TDDemoRowType_HCarousel))
            .add(@(TDDemoRowType_Video))
            .add(@(TDDemoRowType_Draw));
#if HAS_MAPKIT
    [arr insertObject:@(TDDemoRowType_Map) atIndex:7];
#endif
        });
    }return _rows;
}

-(ASTableNode *)tableNode{
    if(!_tableNode){
        _tableNode = [ASTableNode.alloc initWithStyle:UITableViewStyleInsetGrouped];
        _tableNode.delegate = self;
        _tableNode.dataSource = self;
        // 范围/批量加载调优
        _tableNode.leadingScreensForBatching = 2.0; // 提前两屏准备
        _tableNode.view.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableNode.view.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        // 下拉刷新（系统 UIRefreshControl 也能配合 Texture）
        _tableNode.view.refreshControl = jobsMakeRefreshControl(^(__kindof UIRefreshControl * _Nullable refreshCtrl) {
            [refreshCtrl jobs_onChange:^(UIRefreshControl *x) {
                // 刷新逻辑…
                @jobs_weakify(self)
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(0.8 * NSEC_PER_SEC)),
                               dispatch_get_main_queue(), ^{
                    @jobs_strongify(self)
                    [self.tableNode reloadData];
                    [x endRefreshing];
                });
            }];
        });
    }return _tableNode;
}

@end
