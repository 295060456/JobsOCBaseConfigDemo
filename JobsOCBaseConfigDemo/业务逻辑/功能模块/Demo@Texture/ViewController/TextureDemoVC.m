//
//  TextureDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import "TextureDemoVC.h"

static inline NSURL *TD_URL(NSString *s) { return [NSURL URLWithString:s]; }
static NSArray<NSNumber *> *TD_AllRows(void) {
    NSMutableArray *rows = [@[
        @(TDDemoRowType_Text),
        @(TDDemoRowType_LocalImage),
        @(TDDemoRowType_NetImage),
        @(TDDemoRowType_Button),
        @(TDDemoRowType_EditableText),
        @(TDDemoRowType_HCarousel),
        @(TDDemoRowType_Video),
        @(TDDemoRowType_Draw)
    ] mutableCopy];
#if HAS_MAPKIT
    [rows insertObject:@(TDDemoRowType_Map) atIndex:7];
#endif
    return rows;
}
#pragma mark - ViewController
@implementation TextureDemoVC

- (instancetype)init {
    _tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStyleInsetGrouped];
    if (self = [super initWithNode:_tableNode]) {
        self.title = @"Texture Demo (OC)";
        self.node.backgroundColor = UIColor.systemBackgroundColor;

        _tableNode.delegate = self;
        _tableNode.dataSource = self;

        // 范围/批量加载调优
        _tableNode.leadingScreensForBatching = 2.0; // 提前两屏准备
        _tableNode.view.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableNode.view.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;

        _rows = TD_AllRows().mutableCopy;
        _hasMore = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 导航大标题
    if (@available(iOS 11.0, *)) {
        self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAutomatic;
        self.navigationController.navigationBar.prefersLargeTitles = YES;
    }
    // 下拉刷新（系统 UIRefreshControl 也能配合 Texture）
    UIRefreshControl *rc = [[UIRefreshControl alloc] init];
    [rc addTarget:self action:@selector(onRefresh:) forControlEvents:UIControlEventValueChanged];
    _tableNode.view.refreshControl = rc;
}

- (void)onRefresh:(UIRefreshControl *)rc {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self->_rows = TD_AllRows().mutableCopy;
        [self.tableNode reloadData];
        [rc endRefreshing];
    });
}

#pragma mark - ASTable DataSource (推荐使用 Block 创建以获得异步构建收益)
- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return self.rows.count;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    TDDemoRowType type = self.rows[indexPath.row].integerValue;
    return ^ASCellNode * _Nonnull{
        switch (type) {
            case TDDemoRowType_Text:
                return [[TDTextCellNode alloc] initWithTitle:@"ASTextNode：高性能异步文本"
                                                   subtitle:@"支持 Truncation/Highlight/Link/排版，多行异步绘制，避免主线程卡顿。"];
            case TDDemoRowType_LocalImage:
                return [[TDImageCellNode alloc] initWithImage:[UIImage imageNamed:@"Sample"]
                                                       title:@"Local Image + Ratio(16:9) + Overlay + Corner"];
            case TDDemoRowType_NetImage:
                return [[TDNetImageCellNode alloc] initWithURL:TD_URL(@"https://picsum.photos/800/400")
                                                          text:@"ASNetworkImageNode：支持默认图、占位渐隐、渐进式渲染、圆角裁切。"];
            case TDDemoRowType_Button:
                return [[TDButtonCellNode alloc] init];
            case TDDemoRowType_EditableText:
                return [[TDEditableTextCellNode alloc] init];
            case TDDemoRowType_HCarousel:
                return [[TDHorizontalCarouselCellNode alloc] initWithCount:18];
            case TDDemoRowType_Video:
                return [[TDVideoCellNode alloc] initWithURL:TD_URL(@"https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
                                                      title:@"ASVideoNode：离屏解码、可见时准备，避免滚动卡顿。"];
#if HAS_MAPKIT
            case TDDemoRowType_Map:
                return [[TDMapCellNode alloc] init];
#endif
            case TDDemoRowType_Draw:
                return [[TDDrawCellNode alloc] init];
        }
        return [[ASCellNode alloc] init];
    };
}
#pragma mark - ASTable Delegate (批量加载示例)
- (BOOL)shouldBatchFetchForTableNode:(ASTableNode *)tableNode {
    return self.hasMore;
}

- (void)tableNode:(ASTableNode *)tableNode willBeginBatchFetchWithContext:(ASBatchContext *)context {
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

@end
