//
//  UIView+Refresh.m
//  DouDong-II
//
//  Created by Jobs on 2021/1/17.
//

#import "UIView+Refresh.h"

@implementation UIView (Refresh)
#pragma mark —— 一些公有方法
/// 配置刷新文案
-(jobsByRefreshConfigModelBlock _Nonnull)handleWord{
    @jobs_weakify(self)
    return ^(__kindof MJRefreshConfigModel *_Nullable data){
        @jobs_strongify(self)
        if (self.protocol(@"MJRefreshProtocol")) {
            UIView <MJRefreshProtocol>*view = (UIView <MJRefreshProtocol>*)self;
            view.refreshStateIdleByString (data.stateIdleTitle)/// 普通闲置状态
                .refreshStatePullingByString (data.pullingTitle)/// 松开就可以进行刷新的状态
                .refreshStateRefreshingByString (data.refreshingTitle)/// 正在刷新中的状态
                .refreshStateWillRefreshByString (data.willRefreshTitle)/// 即将刷新的状态
                .refreshStateNoMoreDataByString (data.noMoreDataTitle);/// 所有数据加载完毕，没有更多的数据了
        }
    };
}
#pragma mark —— UI刷新（调用系统底层方法）
-(jobsByVoidBlock _Nonnull)refresh{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self setNeedsLayout];
        [self layoutIfNeeded];
    };
}
#pragma mark —— 创建不同类型的MJHeader 和 MJFootor
/// Header
-(JobsReturnLOTAnimationMJRefreshHeaderByRefreshConfigModelBlock _Nonnull)LOTAnimationMJRefreshHeaderBy{
    @jobs_weakify(self)
    return ^LOTAnimationMJRefreshHeader *_Nonnull(MJRefreshConfigModel *_Nonnull refreshConfigModel){
        @jobs_strongify(self)
        LOTAnimationMJRefreshHeader *refreshHeader = [LOTAnimationMJRefreshHeader headerWithRefreshingBlock:^{
            if(refreshConfigModel.loadBlock) refreshConfigModel.loadBlock(nil);
        }];
        {//图片
            refreshHeader.refreshStatePullingByImages(refreshConfigModel.stateIdlePicsMutArr)/// 普通闲置状态
            .refreshStatePullingByImages(refreshConfigModel.pullingPicsMutArr)/// 松开就可以进行刷新的状态
            .refreshStateWillRefreshByImages(refreshConfigModel.willRefreshPicsMutArr)/// 即将刷新的状态
            .refreshStateNoMoreDataByImages(refreshConfigModel.noMoreDataPicsMutArr);/// 所有数据加载完毕，没有更多的数据了
            // 正在刷新中的状态
            [refreshHeader setImages:self.refreshConfigHeader.refreshingPicsMutArr
                            duration:self.refreshConfigHeader.refreshingDuration
                            forState:MJRefreshStateRefreshing];
        }
        {//文字
            refreshHeader.refreshStateIdleByString(refreshConfigModel.stateIdleTitle)/// 普通闲置状态
            .refreshStatePullingByString(refreshConfigModel.pullingTitle)/// 松开就可以进行刷新的状态
            .refreshStateRefreshingByString(refreshConfigModel.refreshingTitle)/// 正在刷新中的状态
            .refreshStateWillRefreshByString(refreshConfigModel.willRefreshTitle)/// 即将刷新的状态
            .refreshStateNoMoreDataByString(refreshConfigModel.noMoreDataTitle);/// 所有数据加载完毕，没有更多的数据了
        }
        {//其他
            refreshHeader.stateLabel
                .byFont(refreshConfigModel.font)// 设置字体
                .byTextCor(refreshConfigModel.textColor);// 设置颜色
            // 根据拖拽比例自动切换透明度
            refreshHeader.automaticallyChangeAlpha = refreshConfigModel.automaticallyChangeAlpha;
            // 震动特效反馈
            if (refreshConfigModel.isShake) NSObject.feedbackGenerator(nil);
        }return refreshHeader;
    };
}

-(JobsReturnMJRefreshNormalHeaderByRefreshConfigModelBlock _Nonnull)MJRefreshNormalHeaderBy{
    @jobs_weakify(self)
    return ^__kindof MJRefreshNormalHeader *_Nonnull(MJRefreshConfigModel *_Nonnull refreshConfigModel){
        @jobs_strongify(self)
        MJRefreshNormalHeader *refreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            if(refreshConfigModel.loadBlock) refreshConfigModel.loadBlock(nil);
        }];
        self.handleWord(refreshConfigModel);/// 文字
        {//其他
            refreshHeader.stateLabel
                .byFont(refreshConfigModel.font)// 设置字体
                .byTextCor(refreshConfigModel.textColor);// 设置颜色
            // 根据拖拽比例自动切换透明度
            refreshHeader.automaticallyChangeAlpha = refreshConfigModel.automaticallyChangeAlpha;
            //震动特效反馈
            if (refreshConfigModel.isShake) NSObject.feedbackGenerator(nil);
        }return refreshHeader;
    };
}

-(JobsReturnMJRefreshStateHeaderByRefreshConfigModelBlock _Nonnull)MJRefreshStateHeaderBy{
    @jobs_weakify(self)
    return ^__kindof MJRefreshStateHeader *_Nonnull(MJRefreshConfigModel *_Nonnull refreshConfigModel){
        @jobs_strongify(self)
        MJRefreshStateHeader *refreshHeader = [MJRefreshStateHeader headerWithRefreshingBlock:^{
            if(refreshConfigModel.loadBlock) refreshConfigModel.loadBlock(nil);
        }];
        self.handleWord(refreshConfigModel);/// 文字
        {//其他
            refreshHeader.stateLabel
                .byFont(refreshConfigModel.font)// 设置字体
                .byTextCor(refreshConfigModel.textColor);// 设置颜色
            // 根据拖拽比例自动切换透明度
            refreshHeader.automaticallyChangeAlpha = refreshConfigModel.automaticallyChangeAlpha;
            //震动特效反馈
            if (refreshConfigModel.isShake) NSObject.feedbackGenerator(nil);
        }return refreshHeader;
    };
}

-(JobsReturnMJRefreshHeaderByRefreshConfigModelBlock _Nonnull)MJRefreshHeaderBy{
    return ^__kindof MJRefreshHeader *_Nonnull(MJRefreshConfigModel *_Nonnull refreshConfigModel){
        MJRefreshHeader *refreshHeader = [MJRefreshHeader headerWithRefreshingBlock:^{
            if(refreshConfigModel.loadBlock) refreshConfigModel.loadBlock(nil);
        }];
        {//其他
            // 根据拖拽比例自动切换透明度
            refreshHeader.automaticallyChangeAlpha = refreshConfigModel.automaticallyChangeAlpha;
            // 震动特效反馈
            if (refreshConfigModel.isShake) NSObject.feedbackGenerator(nil);
        }return refreshHeader;
    };
}

-(JobsReturnMJRefreshGifHeaderByRefreshConfigModelBlock _Nonnull)MJRefreshGifHeaderBy{
    @jobs_weakify(self)
    return ^__kindof MJRefreshGifHeader *_Nonnull(MJRefreshConfigModel *_Nonnull refreshConfigModel){
        @jobs_strongify(self)
        MJRefreshGifHeader *refreshHeader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
            if(refreshConfigModel.loadBlock) refreshConfigModel.loadBlock(nil);
        }];
        {//图片
            refreshHeader.refreshStatePullingByImages(refreshConfigModel.stateIdlePicsMutArr)/// 普通闲置状态
            .refreshStatePullingByImages(refreshConfigModel.pullingPicsMutArr)/// 松开就可以进行刷新的状态
            .refreshStateWillRefreshByImages(refreshConfigModel.willRefreshPicsMutArr)/// 即将刷新的状态
            .refreshStateNoMoreDataByImages(refreshConfigModel.noMoreDataPicsMutArr);/// 所有数据加载完毕，没有更多的数据了
            /// 正在刷新中的状态
            [refreshHeader setImages:refreshConfigModel.refreshingPicsMutArr
                            duration:refreshConfigModel.refreshingDuration
                            forState:MJRefreshStateRefreshing];
        }
        self.handleWord(refreshConfigModel);/// 文字
        {//其他
            refreshHeader.stateLabel
                .byFont(refreshConfigModel.font)// 设置字体
                .byTextCor(refreshConfigModel.textColor);// 设置颜色
            // 根据拖拽比例自动切换透明度
            refreshHeader.automaticallyChangeAlpha = refreshConfigModel.automaticallyChangeAlpha;
            //震动特效反馈
            if (refreshConfigModel.isShake) NSObject.feedbackGenerator(nil);
        }return refreshHeader;
    };
}
/// Footer
-(JobsReturnMJRefreshAutoGifFooterByRefreshConfigModelBlock _Nonnull)MJRefreshAutoGifFooterBy{
    @jobs_weakify(self)
    return ^__kindof MJRefreshAutoGifFooter *_Nonnull(MJRefreshConfigModel *_Nonnull refreshConfigModel){
        @jobs_strongify(self)
        MJRefreshAutoGifFooter *refreshFooter = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
            if(refreshConfigModel.loadBlock) refreshConfigModel.loadBlock(nil);
        }];
        {// 图片
            refreshFooter.refreshStatePullingByImages (refreshConfigModel.stateIdlePicsMutArr)/// 普通闲置状态
                .refreshStatePullingByImages(refreshConfigModel.pullingPicsMutArr)/// 松开就可以进行刷新的状态
                .refreshStateWillRefreshByImages(refreshConfigModel.willRefreshPicsMutArr)/// 即将刷新的状态
                .refreshStateNoMoreDataByImages(refreshConfigModel.noMoreDataPicsMutArr);/// 所有数据加载完毕，没有更多的数据了
            /// 正在刷新中的状态
            [refreshFooter setImages:refreshConfigModel.refreshingPicsMutArr
                            duration:refreshConfigModel.refreshingDuration
                            forState:MJRefreshStateRefreshing];
        }
        self.handleWord(refreshConfigModel);/// 文字
        {//其他
            refreshFooter.stateLabel
                .byFont(refreshConfigModel.font)// 设置字体
                .byTextCor(refreshConfigModel.textColor);// 设置颜色
            // 根据拖拽比例自动切换透明度
            refreshFooter.automaticallyChangeAlpha = refreshConfigModel.automaticallyChangeAlpha;
            if (self.refreshConfigFooter.isShake) NSObject.feedbackGenerator(nil);
        }return refreshFooter;
    };
}

-(JobsReturnMJRefreshBackNormalFooterByRefreshConfigModelBlock _Nonnull)MJRefreshBackNormalFooterBy{
    @jobs_weakify(self)
    return ^__kindof MJRefreshBackNormalFooter *_Nonnull(MJRefreshConfigModel *_Nonnull refreshConfigModel){
        @jobs_strongify(self)
        MJRefreshBackNormalFooter *refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            if(self.refreshConfigFooter.loadBlock) self.refreshConfigFooter.loadBlock(nil);
        }];
        self.handleWord(refreshConfigModel);/// 文字 (此模式下只有文字而没有图片)
        {//其他
            refreshFooter.stateLabel
                .byFont(refreshConfigModel.font)// 设置字体
                .byTextCor(refreshConfigModel.textColor);// 设置颜色
            // 根据拖拽比例自动切换透明度
            refreshFooter.automaticallyChangeAlpha = refreshConfigModel.automaticallyChangeAlpha;
            if (self.refreshConfigFooter.isShake) NSObject.feedbackGenerator(nil);
        }return refreshFooter;
    };
}

-(JobsReturnMJRefreshAutoNormalFooterByRefreshConfigModelBlock _Nonnull)MJRefreshAutoNormalFooterBy{
    @jobs_weakify(self)
    return ^__kindof MJRefreshAutoNormalFooter *_Nonnull(MJRefreshConfigModel *_Nonnull refreshConfigModel){
        @jobs_strongify(self)
        MJRefreshAutoNormalFooter *refreshFooter = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            if(refreshConfigModel.loadBlock) refreshConfigModel.loadBlock(nil);
        }];
        self.handleWord(refreshConfigModel);/// 文字
        {//其他
            refreshFooter.stateLabel
                .byFont(refreshConfigModel.font)// 设置字体
                .byTextCor(refreshConfigModel.textColor);// 设置颜色
            // 根据拖拽比例自动切换透明度
            refreshFooter.automaticallyChangeAlpha = refreshConfigModel.automaticallyChangeAlpha;
            if (self.refreshConfigFooter.isShake) NSObject.feedbackGenerator(nil);
        }return refreshFooter;
    };
}

-(JobsReturnMJRefreshAutoStateFooterByRefreshConfigModelBlock _Nonnull)MJRefreshAutoStateFooterBy{
    @jobs_weakify(self)
    return ^__kindof MJRefreshAutoStateFooter *_Nonnull(MJRefreshConfigModel *_Nonnull refreshConfigModel){
        @jobs_strongify(self)
        MJRefreshAutoStateFooter *refreshFooter = [MJRefreshAutoStateFooter footerWithRefreshingBlock:^{
            if(refreshConfigModel.loadBlock) refreshConfigModel.loadBlock(nil);
        }];
        self.handleWord(refreshConfigModel);/// 文字
        {//其他
            refreshFooter.stateLabel
                .byFont(refreshConfigModel.font)// 设置字体
                .byTextCor(refreshConfigModel.textColor);// 设置颜色
            // 根据拖拽比例自动切换透明度
            refreshFooter.automaticallyChangeAlpha = refreshConfigModel.automaticallyChangeAlpha;
            if (refreshConfigModel.isShake) NSObject.feedbackGenerator(nil);
        }return refreshFooter;
    };
}

-(JobsReturnMJRefreshAutoFooterByRefreshConfigModelBlock _Nonnull)MJRefreshAutoFooterBy{
    return ^__kindof MJRefreshAutoFooter *_Nonnull(MJRefreshConfigModel *_Nonnull refreshConfigModel){
        MJRefreshAutoFooter *refreshFooter = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
            if(refreshConfigModel.loadBlock) refreshConfigModel.loadBlock(nil);
        }];return refreshFooter;
    };
}
-(JobsReturnMJRefreshBackGifFooterByRefreshConfigModelBlock _Nonnull)MJRefreshBackGifFooterBy{
    @jobs_weakify(self)
    return ^__kindof MJRefreshBackGifFooter *_Nonnull(MJRefreshConfigModel *_Nonnull refreshConfigModel){
        @jobs_strongify(self)
        MJRefreshBackGifFooter *refreshFooter = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
            if(refreshConfigModel.loadBlock) refreshConfigModel.loadBlock(nil);
        }];
        {// 图片
            refreshFooter.refreshStatePullingByImages(refreshConfigModel.stateIdlePicsMutArr)// 普通闲置状态
                .refreshStatePullingByImages(refreshConfigModel.pullingPicsMutArr)// 松开就可以进行刷新的状态
                .refreshStateWillRefreshByImages(refreshConfigModel.willRefreshPicsMutArr)// 即将刷新的状态
                .refreshStateNoMoreDataByImages(refreshConfigModel.noMoreDataPicsMutArr);// 所有数据加载完毕，没有更多的数据了
            // 正在刷新中的状态
            [refreshFooter setImages:refreshConfigModel.refreshingPicsMutArr
                            duration:refreshConfigModel.refreshingDuration
                            forState:MJRefreshStateRefreshing];
        }
        self.handleWord(refreshConfigModel);/// 文字
        {//其他
            refreshFooter.stateLabel
                .byFont(refreshConfigModel.font)// 设置字体
                .byTextCor(refreshConfigModel.textColor);// 设置颜色
            // 根据拖拽比例自动切换透明度
            refreshFooter.automaticallyChangeAlpha = refreshConfigModel.automaticallyChangeAlpha;
            if (refreshConfigModel.isShake) NSObject.feedbackGenerator(nil);
        }return refreshFooter;
    };
}

-(JobsReturnMJRefreshBackStateFooterByRefreshConfigModelBlock _Nonnull)MJRefreshBackStateFooterBy{
    @jobs_weakify(self)
    return ^__kindof MJRefreshBackStateFooter *_Nonnull(MJRefreshConfigModel *_Nonnull refreshConfigModel){
        @jobs_strongify(self)
        MJRefreshBackStateFooter *refreshFooter = [MJRefreshBackStateFooter footerWithRefreshingBlock:^{
            if(self.refreshConfigFooter.loadBlock) refreshConfigModel.loadBlock(nil);
        }];
        self.handleWord(refreshConfigModel);/// 文字
        {//其他
            refreshFooter.stateLabel
                .byFont(refreshConfigModel.font)// 设置字体
                .byTextCor(refreshConfigModel.textColor);// 设置颜色
            // 根据拖拽比例自动切换透明度
            refreshFooter.automaticallyChangeAlpha = refreshConfigModel.automaticallyChangeAlpha;
            if (self.refreshConfigFooter.isShake) NSObject.feedbackGenerator(nil);
        }return refreshFooter;
    };
}

-(JobsReturnMJRefreshBackFooterByRefreshConfigModelBlock _Nonnull)MJRefreshBackFooterBy{
    return ^__kindof MJRefreshBackFooter *_Nonnull(MJRefreshConfigModel *_Nonnull refreshConfigModel){
        MJRefreshBackFooter *refreshFooter = [MJRefreshBackFooter footerWithRefreshingBlock:^{
            if(refreshConfigModel.loadBlock) refreshConfigModel.loadBlock(nil);
        }];
        {//其他
            if (refreshConfigModel.isShake) NSObject.feedbackGenerator(nil);
            // 根据拖拽比例自动切换透明度
            refreshFooter.automaticallyChangeAlpha = refreshConfigModel.automaticallyChangeAlpha;
        }return refreshFooter;
    };
}

-(JobsReturnMJRefreshFooterByRefreshConfigModelBlock _Nonnull)MJRefreshFooterBy{
    return ^__kindof MJRefreshFooter *_Nonnull(MJRefreshConfigModel *_Nonnull refreshConfigModel){
        MJRefreshFooter *refreshFooter = [MJRefreshFooter footerWithRefreshingBlock:^{
            if(refreshConfigModel.loadBlock) refreshConfigModel.loadBlock(nil);
        }];
        {//其他
            if (refreshConfigModel.isShake) NSObject.feedbackGenerator(nil);
            // 根据拖拽比例自动切换透明度
            refreshFooter.automaticallyChangeAlpha = refreshConfigModel.automaticallyChangeAlpha;
        }return refreshFooter;
    };
}
#pragma mark —— 关于 XZMRefresh 的二次封装
-(jobsByVoidBlock _Nonnull)XZM_beginRefreshingNormalHeader{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if(KindOfScrollViewCls(self)){
            UIScrollView *scrollView = (UIScrollView *)self;
            [scrollView.xzm_header beginRefreshing];
        }
    };
}

-(jobsByVoidBlock _Nonnull)XZM_endRefreshingNormalHeader{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if(KindOfScrollViewCls(self)){
            UIScrollView *scrollView = (UIScrollView *)self;
            if(scrollView.xzm_header.state == XZMRefreshStateRefreshing) [scrollView.xzm_header endRefreshing];
        }
    };
}

-(jobsByVoidBlock _Nonnull)XZM_beginRefreshingGifHeader{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if(KindOfScrollViewCls(self)){
            UIScrollView *scrollView = (UIScrollView *)self;
            [scrollView.xzm_gifHeader beginRefreshing];
        }
    };
}

-(jobsByVoidBlock _Nonnull)XZM_endRefreshingGifHeader{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if(KindOfScrollViewCls(self)){
            UIScrollView *scrollView = (UIScrollView *)self;
            if(scrollView.xzm_gifHeader.state == XZMRefreshStateRefreshing) [scrollView.xzm_gifHeader endRefreshing];
        }
    };
}

-(jobsByVoidBlock _Nonnull)XZM_beginRefreshingNormalFooter{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if(KindOfScrollViewCls(self)){
            UIScrollView *scrollView = (UIScrollView *)self;
            [scrollView.xzm_footer beginRefreshing];
        }
    };
}

-(jobsByVoidBlock _Nonnull)XZM_endRefreshingNormalFooter{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if(KindOfScrollViewCls(self)){
            UIScrollView *scrollView = (UIScrollView *)self;
            if(scrollView.xzm_footer.state == XZMRefreshStateRefreshing) [scrollView.xzm_footer endRefreshing];
        }
    };
}

-(jobsByVoidBlock _Nonnull)XZM_beginRefreshingGifFooter{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if(KindOfScrollViewCls(self)){
            UIScrollView *scrollView = (UIScrollView *)self;
            [scrollView.xzm_gifFooter beginRefreshing];
        }
    };
}

-(jobsByVoidBlock _Nonnull)XZM_endRefreshingGifFooter{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if(KindOfScrollViewCls(self)){
            UIScrollView *scrollView = (UIScrollView *)self;
            if(scrollView.xzm_gifFooter.state == XZMRefreshStateRefreshing) [scrollView.xzm_gifFooter endRefreshing];
        }
    };
}
#pragma mark —— 关于 MJRefresh 的二次封装
-(jobsByVoidBlock _Nonnull)mj_beginRefreshing_header{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if(KindOfScrollViewCls(self)){
            UIScrollView *scrollView = (UIScrollView *)self;
            [scrollView.mj_header beginRefreshing];
        }
    };
}

-(jobsByVoidBlock _Nonnull)mj_endRefreshing_header{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if(KindOfScrollViewCls(self)){
            UIScrollView *scrollView = (UIScrollView *)self;
            [scrollView.mj_header endRefreshing];
        }
    };
}

-(jobsByVoidBlock _Nonnull)mj_beginRefreshing_footer{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if(KindOfScrollViewCls(self)){
            UIScrollView *scrollView = (UIScrollView *)self;
            [scrollView.mj_footer beginRefreshing];
        }
    };
}

-(jobsByVoidBlock _Nonnull)mj_endRefreshing_footer{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if(KindOfScrollViewCls(self)){
            UIScrollView *scrollView = (UIScrollView *)self;
            [scrollView.mj_footer endRefreshing];
        }
    };
}

-(jobsByVoidBlock _Nonnull)mj_beginRefreshing_trailer{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if(KindOfScrollViewCls(self)){
            UIScrollView *scrollView = (UIScrollView *)self;
            [scrollView.mj_trailer beginRefreshing];
        }
    };
}

-(jobsByVoidBlock _Nonnull)mj_endRefreshing_trailer{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if(KindOfScrollViewCls(self)){
            UIScrollView *scrollView = (UIScrollView *)self;
            [scrollView.mj_trailer endRefreshing];
        }
    };
}
/// 停止刷新【可能还有数据的情况，状态为：MJRefreshStateIdle】
-(jobsByBOOLBlock _Nonnull)endRefreshing{
    @jobs_weakify(self)
    return ^(BOOL data) {
        @jobs_strongify(self)
        if (KindOfTableViewCls(self)) {
            UITableView *tableView = (UITableView *)self;
            [tableView reloadData];
        }else if (KindOfCollectionViewCls(self)){
            UICollectionView *collectionView = (UICollectionView *)self;
            [collectionView reloadData];
        }else{}
        if(data) [self tab_endAnimation];//里面实现了 [self.collectionView reloadData];
        self.endMJHeaderRefreshing();
        self.endMJFooterRefreshingWithMoreData();
        self.endXZMHeaderRefreshing();
        self.endXZMFooterRefreshing();
    };
}
/// 停止刷新【没有数据的情况，状态为：MJRefreshStateNoMoreData】
-(jobsByBOOLBlock _Nonnull)endRefreshingWithNoMoreData{
    @jobs_weakify(self)
    return ^(BOOL data) {
        @jobs_strongify(self)
        if (KindOfTableViewCls(self)) {
            UITableView *tableView = (UITableView *)self;
            [tableView reloadData];
        }else if (KindOfCollectionViewCls(self)){
            UICollectionView *collectionView = (UICollectionView *)self;
            [collectionView reloadData];
        }else{}
        if(data) [self tab_endAnimation];//里面实现了 [self.collectionView reloadData];

        self.endMJHeaderRefreshing();
        self.endMJFooterRefreshingWithNoMoreData();
        
        self.endXZMHeaderRefreshing();
        self.endXZMFooterRefreshing();
    };
}
#pragma mark —— 针对 MJRefresh
/// 停止MJHeader的刷新
-(jobsByVoidBlock _Nonnull)endMJHeaderRefreshing{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        if(KindOfScrollViewCls(self)){
            UIScrollView *scrollView = (UIScrollView *)self;
            if (scrollView.mj_header.refreshing) [scrollView.mj_header endRefreshing];// 结束刷新
        }
    };
}
/// 停止MJFooter的刷新【没有数据的情况，状态为：MJRefreshStateNoMoreData】
-(jobsByVoidBlock _Nonnull)endMJFooterRefreshingWithNoMoreData{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        if(KindOfScrollViewCls(self)){
            UIScrollView *scrollView = (UIScrollView *)self;
            if (scrollView.mj_footer.refreshing) [scrollView.mj_footer endRefreshingWithNoMoreData];// 结束刷新
        }
    };
}
/// 停止MJFooter刷新【可能还有数据的情况，状态为：MJRefreshStateIdle】
-(jobsByVoidBlock _Nonnull)endMJFooterRefreshingWithMoreData{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        if(KindOfScrollViewCls(self)){
            UIScrollView *scrollView = (UIScrollView *)self;
            if (scrollView.mj_footer.refreshing) {
                [scrollView.mj_footer endRefreshingWithNoMoreData];// 结束刷新
            }else{
                [scrollView.mj_footer resetNoMoreData];// 结束刷新
            }
        }
    };
}
#pragma mark —— 针对 XZMRefresh
/// 停止xzm_header的刷新
-(jobsByVoidBlock _Nonnull)endXZMHeaderRefreshing{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        if(KindOfScrollViewCls(self)){
            UIScrollView *scrollView = (UIScrollView *)self;
            if (scrollView.xzm_header.state == XZMRefreshStateRefreshing) [scrollView.xzm_header endRefreshing]; // 结束刷新
        }
    };
}
/// 停止xzm_footer的刷新
-(jobsByVoidBlock _Nonnull)endXZMFooterRefreshing{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        if(KindOfScrollViewCls(self)){
            UIScrollView *scrollView = (UIScrollView *)self;
            if (scrollView.xzm_footer.state == XZMRefreshStateRefreshing) [scrollView.xzm_footer endRefreshing];// 结束刷新
        }
    };
}
#pragma mark —— 一些私有方法
/*
 * 相关继承关系图谱 4个header + 9个Footer ;已经实现的👌
    MJRefreshGifHeader  👌 ->MJRefreshStateHeader->MJRefreshHeader->MJRefreshComponent->UIView
    MJRefreshNormalHeader 👌->MJRefreshStateHeader->MJRefreshHeader->MJRefreshComponent->UIView
    MJRefreshStateHeader 👌->MJRefreshHeader->MJRefreshComponent->UIView
    MJRefreshHeader 👌->MJRefreshComponent->UIView
 
    MJRefreshAutoGifFooter  👌 ->MJRefreshAutoStateFooter->MJRefreshAutoFooter->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshAutoNormalFooter  👌 ->MJRefreshAutoStateFooter->MJRefreshAutoFooter->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshAutoStateFooter ->MJRefreshAutoFooter->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshAutoFooter ->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshBackGifFooter ->MJRefreshBackStateFooter->MJRefreshBackFooter->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshBackNormalFooter  👌 ->MJRefreshBackStateFooter->MJRefreshBackFooter->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshBackStateFooter ->MJRefreshBackFooter->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshBackFooter ->MJRefreshFooter->MJRefreshComponent->UIView
    MJRefreshFooter->MJRefreshComponent->UIView
 *
 */
#pragma mark —— 覆写子类方法
/// KVO 监听 MJRefresh + 震动特效反馈
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context {
    if ([object isEqual:self.mjRefreshGifHeader] &&
        self.mjRefreshGifHeader.state == MJRefreshStatePulling) {
        NSObject.feedbackGenerator(nil);
    }else if (([object isEqual:self.mjRefreshAutoGifFooter] ||
               [object isEqual:self.mjRefreshBackNormalFooter] ||
               [object isEqual:self.mjRefreshAutoNormalFooter]) && (self.mjRefreshAutoGifFooter.state == MJRefreshStatePulling ||
                                                                    self.mjRefreshBackNormalFooter.state == MJRefreshStatePulling ||
                                                                    self.mjRefreshAutoNormalFooter.state == MJRefreshStatePulling)
             ) {
        NSObject.feedbackGenerator(nil);
    }else{}
}
/**
 MJRefreshStateIdle,   //   普通闲置状态
 MJRefreshStatePulling,   //   松开就可以进行刷新的状态
 MJRefreshStateRefreshing,   //   正在刷新中的状态
 MJRefreshStateWillRefresh,   //   即将刷新的状态
 MJRefreshStateNoMoreData   //   所有数据加载完毕，没有更多的数据了
 */
#pragma mark —— MJRefreshHeader
#pragma mark —— Prop_strong()LOTAnimationMJRefreshHeader *lotAnimMJRefreshHeader;
JobsKey(_lotAnimMJRefreshHeader)
@dynamic lotAnimMJRefreshHeader;
-(LOTAnimationMJRefreshHeader *)lotAnimMJRefreshHeader{
    LOTAnimationMJRefreshHeader *refreshHeader = Jobs_getAssociatedObject(_lotAnimMJRefreshHeader);
    if (!refreshHeader) {
        refreshHeader = self.LOTAnimationMJRefreshHeaderBy(self.refreshConfigHeader);
        Jobs_setAssociatedRETAIN_NONATOMIC(_lotAnimMJRefreshHeader, refreshHeader);
    }return refreshHeader;
}

-(void)setLotAnimMJRefreshHeader:(LOTAnimationMJRefreshHeader *)lotAnimMJRefreshHeader{
    Jobs_setAssociatedRETAIN_NONATOMIC(_lotAnimMJRefreshHeader, lotAnimMJRefreshHeader);
}
#pragma mark —— Prop_strong()MJRefreshNormalHeader *mjRefreshNormalHeader;
JobsKey(_mjRefreshNormalHeader)
@dynamic mjRefreshNormalHeader;
-(MJRefreshNormalHeader *)mjRefreshNormalHeader{
    MJRefreshNormalHeader *refreshHeader = Jobs_getAssociatedObject(_mjRefreshNormalHeader);
    if (!refreshHeader) {
        refreshHeader = self.MJRefreshNormalHeaderBy(self.refreshConfigHeader);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshNormalHeader, refreshHeader)
    }return refreshHeader;
}

-(void)setMjRefreshNormalHeader:(MJRefreshNormalHeader *)mjRefreshNormalHeader{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshNormalHeader, mjRefreshNormalHeader)
}
#pragma mark —— Prop_strong()MJRefreshStateHeader *mjRefreshStateHeader;
JobsKey(_mjRefreshStateHeader)
@dynamic mjRefreshStateHeader;
-(MJRefreshStateHeader *)mjRefreshStateHeader{
    MJRefreshStateHeader *refreshHeader = Jobs_getAssociatedObject(_mjRefreshStateHeader);
    if (!refreshHeader) {
        refreshHeader = self.MJRefreshStateHeaderBy(self.refreshConfigHeader);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshStateHeader, refreshHeader)
    }return refreshHeader;
}

-(void)setMjRefreshStateHeader:(MJRefreshStateHeader *)mjRefreshStateHeader{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshStateHeader, mjRefreshStateHeader)
}
#pragma mark —— Prop_strong()MJRefreshHeader *mjRefreshHeader;
JobsKey(_mjRefreshHeader)
@dynamic mjRefreshHeader;
-(MJRefreshHeader *)mjRefreshHeader{
    MJRefreshHeader *refreshHeader = Jobs_getAssociatedObject(_mjRefreshHeader);
    if (!refreshHeader) {
        refreshHeader = self.MJRefreshHeaderBy(self.refreshConfigHeader);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshHeader, refreshHeader)
    }return refreshHeader;
}

-(void)setMjRefreshHeader:(MJRefreshHeader *)mjRefreshHeader{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshHeader, mjRefreshHeader)
}
#pragma mark —— Prop_strong()MJRefreshGifHeader *mjRefreshGifHeader;
JobsKey(_mjRefreshGifHeader)
@dynamic mjRefreshGifHeader;
-(MJRefreshGifHeader *)mjRefreshGifHeader{
    MJRefreshGifHeader *refreshHeader = Jobs_getAssociatedObject(_mjRefreshGifHeader);
    if (!refreshHeader) {
        refreshHeader = self.MJRefreshGifHeaderBy(self.refreshConfigHeader);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshGifHeader, refreshHeader)
    }return refreshHeader;
}

-(void)setMjRefreshGifHeader:(MJRefreshGifHeader *)mjRefreshGifHeader{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshGifHeader, mjRefreshGifHeader)
}
#pragma mark —— MJRefreshFooter
#pragma mark —— Prop_strong()MJRefreshAutoGifFooter *mjRefreshAutoGifFooter;
JobsKey(_mjRefreshAutoGifFooter)
@dynamic mjRefreshAutoGifFooter;
-(MJRefreshAutoGifFooter *)mjRefreshAutoGifFooter{
    MJRefreshAutoGifFooter *refreshFooter = Jobs_getAssociatedObject(_mjRefreshAutoGifFooter);
    if (!refreshFooter) {
        refreshFooter = self.MJRefreshAutoGifFooterBy(self.refreshConfigHeader);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoGifFooter, refreshFooter)
    }return refreshFooter;
}

-(void)setMjRefreshAutoGifFooter:(MJRefreshAutoGifFooter *)mjRefreshAutoGifFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoGifFooter, mjRefreshAutoGifFooter)
}
#pragma mark —— Prop_strong()MJRefreshBackNormalFooter *mjRefreshBackNormalFooter;
JobsKey(_mjRefreshBackNormalFooter)
@dynamic mjRefreshBackNormalFooter;
-(MJRefreshBackNormalFooter *)mjRefreshBackNormalFooter{
    MJRefreshBackNormalFooter *refreshFooter = Jobs_getAssociatedObject(_mjRefreshBackNormalFooter);
    if (!refreshFooter) {
        refreshFooter = self.MJRefreshBackNormalFooterBy(self.refreshConfigFooter);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackNormalFooter, refreshFooter)
    }return refreshFooter;
}

-(void)setMjRefreshBackNormalFooter:(MJRefreshBackNormalFooter *)mjRefreshBackNormalFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackNormalFooter, mjRefreshBackNormalFooter)
}
#pragma mark —— Prop_strong()MJRefreshAutoNormalFooter *mjRefreshAutoNormalFooter;
JobsKey(_mjRefreshAutoNormalFooter)
@dynamic mjRefreshAutoNormalFooter;
-(MJRefreshAutoNormalFooter *)mjRefreshAutoNormalFooter{
    MJRefreshAutoNormalFooter *refreshFooter = Jobs_getAssociatedObject(_mjRefreshAutoNormalFooter);
    if (!refreshFooter) {
        refreshFooter = self.MJRefreshAutoNormalFooterBy(self.refreshConfigFooter);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoNormalFooter, refreshFooter)
    }return refreshFooter;
}

-(void)setMjRefreshAutoNormalFooter:(MJRefreshAutoNormalFooter *)mjRefreshAutoNormalFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoNormalFooter, mjRefreshAutoNormalFooter)
}
#pragma mark —— Prop_strong()MJRefreshAutoStateFooter *mjRefreshAutoStateFooter;
JobsKey(_mjRefreshAutoStateFooter)
@dynamic mjRefreshAutoStateFooter;
-(MJRefreshAutoStateFooter *)mjRefreshAutoStateFooter{
    MJRefreshAutoStateFooter *refreshFooter = Jobs_getAssociatedObject(_mjRefreshAutoStateFooter);
    if (!refreshFooter) {
        refreshFooter = self.MJRefreshAutoStateFooterBy(self.refreshConfigFooter);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoStateFooter, refreshFooter)
    }return refreshFooter;
}

-(void)setMjRefreshAutoStateFooter:(MJRefreshAutoStateFooter *)mjRefreshAutoStateFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoStateFooter, mjRefreshAutoStateFooter)
}
#pragma mark —— Prop_strong()MJRefreshAutoFooter *mjRefreshAutoFooter;
JobsKey(_mjRefreshAutoFooter)
@dynamic mjRefreshAutoFooter;
-(MJRefreshAutoFooter *)mjRefreshAutoFooter{
    MJRefreshAutoFooter *refreshFooter = Jobs_getAssociatedObject(_mjRefreshAutoFooter);
    if (!refreshFooter) {
        refreshFooter = self.MJRefreshAutoFooterBy(self.refreshConfigFooter);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoFooter, refreshFooter)
    }return refreshFooter;
}

-(void)setMjRefreshAutoFooter:(MJRefreshAutoFooter *)mjRefreshAutoFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoFooter, mjRefreshAutoFooter)
}
#pragma mark —— Prop_strong()MJRefreshBackGifFooter *mjRefreshBackGifFooter;
JobsKey(_mjRefreshBackGifFooter)
@dynamic mjRefreshBackGifFooter;
-(MJRefreshBackGifFooter *)mjRefreshBackGifFooter{
    MJRefreshBackGifFooter *refreshFooter = Jobs_getAssociatedObject(_mjRefreshBackGifFooter);
    if (!refreshFooter) {
        refreshFooter = self.MJRefreshBackGifFooterBy(self.refreshConfigFooter);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackGifFooter, refreshFooter);
    }return refreshFooter;
}

-(void)setMjRefreshBackGifFooter:(MJRefreshBackGifFooter *)mjRefreshBackGifFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackGifFooter, mjRefreshBackGifFooter);
}
#pragma mark —— Prop_strong()MJRefreshBackStateFooter *mjRefreshBackStateFooter;
JobsKey(_mjRefreshBackStateFooter)
@dynamic mjRefreshBackStateFooter;
-(MJRefreshBackStateFooter *)mjRefreshBackStateFooter{
    MJRefreshBackStateFooter *refreshFooter = Jobs_getAssociatedObject(_mjRefreshBackStateFooter);
    if (!refreshFooter) {
        refreshFooter = self.MJRefreshBackStateFooterBy(self.refreshConfigFooter);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackStateFooter, refreshFooter);
    }return refreshFooter;
}

-(void)setMjRefreshBackStateFooter:(MJRefreshBackStateFooter *)mjRefreshBackStateFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackStateFooter, mjRefreshBackStateFooter)
}
#pragma mark —— Prop_strong()MJRefreshBackFooter *mjRefreshBackFooter;
JobsKey(_mjRefreshBackFooter)
@dynamic mjRefreshBackFooter;
-(MJRefreshBackFooter *)mjRefreshBackFooter{
    MJRefreshBackFooter *refreshFooter = Jobs_getAssociatedObject(_mjRefreshBackFooter);
    if (!refreshFooter) {
        refreshFooter = self.MJRefreshBackFooterBy(self.refreshConfigFooter);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackFooter, refreshFooter);
    }return refreshFooter;
}

-(void)setMjRefreshBackFooter:(MJRefreshBackFooter *)mjRefreshBackFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackFooter, mjRefreshBackFooter);
}
#pragma mark —— Prop_strong()MJRefreshFooter *mjRefreshFooter;
JobsKey(_mjRefreshFooter)
@dynamic mjRefreshFooter;
-(MJRefreshFooter *)mjRefreshFooter{
    MJRefreshFooter *refreshFooter = Jobs_getAssociatedObject(_mjRefreshFooter);
    if (!refreshFooter) {
        refreshFooter = self.MJRefreshFooterBy(self.refreshConfigFooter);
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshFooter, refreshFooter)
    }return refreshFooter;
}

-(void)setMjRefreshFooter:(MJRefreshFooter *)mjRefreshFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshFooter, mjRefreshFooter)
}
#pragma mark —— Prop_weak()UIScrollView *mjRefreshTargetView; MJRefresh 作用于targetView
JobsKey(_mjRefreshTargetView)
@dynamic mjRefreshTargetView;
-(UIScrollView *)mjRefreshTargetView{
    return Jobs_getAssociatedObject(_mjRefreshTargetView);
}

-(void)setMjRefreshTargetView:(UIScrollView *)mjRefreshTargetView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshTargetView, mjRefreshTargetView)
}
#pragma mark —— Prop_strong()MJRefreshConfigModel *refreshConfigHeader;//头部的配置信息
JobsKey(_refreshConfigHeader)
@dynamic refreshConfigHeader;
-(MJRefreshConfigModel *)refreshConfigHeader{
    MJRefreshConfigModel *RefreshConfigHeader = Jobs_getAssociatedObject(_refreshConfigHeader);
    if (!RefreshConfigHeader) {
        RefreshConfigHeader = MJRefreshConfigModel.new;
        Jobs_setAssociatedRETAIN_NONATOMIC(_refreshConfigHeader, RefreshConfigHeader)
    }return RefreshConfigHeader;
}

-(void)setRefreshConfigHeader:(MJRefreshConfigModel *)refreshConfigHeader{
    Jobs_setAssociatedRETAIN_NONATOMIC(_refreshConfigHeader, refreshConfigHeader)
}
#pragma mark —— Prop_strong()MJRefreshConfigModel *refreshConfigFooter;//尾部的配置信息
JobsKey(_refreshConfigFooter)
@dynamic refreshConfigFooter;
-(MJRefreshConfigModel *)refreshConfigFooter{
    MJRefreshConfigModel *RefreshConfigFooter = Jobs_getAssociatedObject(_refreshConfigFooter);
    if (!RefreshConfigFooter) {
        RefreshConfigFooter = MJRefreshConfigModel.new;
        Jobs_setAssociatedRETAIN_NONATOMIC(_refreshConfigFooter, RefreshConfigFooter);
    }return RefreshConfigFooter;
}

-(void)setRefreshConfigFooter:(MJRefreshConfigModel *)refreshConfigFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_refreshConfigFooter, refreshConfigFooter)
}

@end
