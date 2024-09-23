//
//  UIView+Refresh.m
//  DouDong-II
//
//  Created by Jobs on 2021/1/17.
//

#import "UIView+Refresh.h"

@implementation UIView (Refresh)
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
-(jobsByVoidBlock _Nonnull)endRefreshing{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        if (KindOfTableViewCls(self)) {
            UITableView *tableView = (UITableView *)self;
            [tableView reloadData];
        }else if (KindOfCollectionViewCls(self)){
            UICollectionView *collectionView = (UICollectionView *)self;
            [collectionView reloadData];
        }else{}
        
        [self tab_endAnimation];//里面实现了 [self.collectionView reloadData];
        
        self.endMJHeaderRefreshing();
        self.endMJFooterRefreshingWithMoreData();
        
        self.endXZMHeaderRefreshing();
        self.endXZMFooterRefreshing();
    };
}
/// 停止刷新【没有数据的情况，状态为：MJRefreshStateNoMoreData】
-(jobsByVoidBlock _Nonnull)endRefreshingWithNoMoreData{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        if (KindOfTableViewCls(self)) {
            UITableView *tableView = (UITableView *)self;
            [tableView reloadData];
        }else if (KindOfCollectionViewCls(self)){
            UICollectionView *collectionView = (UICollectionView *)self;
            [collectionView reloadData];
        }else{}
        
        [self tab_endAnimation];//里面实现了 [self.collectionView reloadData];

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
            [scrollView.xzm_header endRefreshing];// 结束刷新
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
            [scrollView.xzm_footer endRefreshing];// 结束刷新
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
        self.feedbackGenerator();
    }else if (([object isEqual:self.mjRefreshAutoGifFooter] ||
               [object isEqual:self.mjRefreshBackNormalFooter] ||
               [object isEqual:self.mjRefreshAutoNormalFooter]) && (self.mjRefreshAutoGifFooter.state == MJRefreshStatePulling ||
                                                                    self.mjRefreshBackNormalFooter.state == MJRefreshStatePulling ||
                                                                    self.mjRefreshAutoNormalFooter.state == MJRefreshStatePulling)
             ) {
        self.feedbackGenerator();
    }else{}
}
#pragma mark —— @property(nonatomic,weak)UIScrollView *mjRefreshTargetView; MJRefresh 作用于targetView
JobsKey(_mjRefreshTargetView)
@dynamic mjRefreshTargetView;
-(UIScrollView *)mjRefreshTargetView{
    return Jobs_getAssociatedObject(_mjRefreshTargetView);
}

-(void)setMjRefreshTargetView:(UIScrollView *)mjRefreshTargetView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshTargetView, mjRefreshTargetView)
}
#pragma mark —— @property(nonatomic,strong)MJRefreshConfigModel *refreshConfigHeader;//头部的配置信息
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
#pragma mark —— @property(nonatomic,strong)MJRefreshConfigModel *refreshConfigFooter;//尾部的配置信息
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
/**
 MJRefreshStateIdle,   //   普通闲置状态
 MJRefreshStatePulling,   //   松开就可以进行刷新的状态
 MJRefreshStateRefreshing,   //   正在刷新中的状态
 MJRefreshStateWillRefresh,   //   即将刷新的状态
 MJRefreshStateNoMoreData   //   所有数据加载完毕，没有更多的数据了
 */
#pragma mark —— MJRefreshHeader
#pragma mark —— @property(nonatomic,strong)LOTAnimationMJRefreshHeader *lotAnimMJRefreshHeader;
JobsKey(_lotAnimMJRefreshHeader)
@dynamic lotAnimMJRefreshHeader;
-(LOTAnimationMJRefreshHeader *)lotAnimMJRefreshHeader{
    LOTAnimationMJRefreshHeader *lotAnimMJRefreshHeader = Jobs_getAssociatedObject(_lotAnimMJRefreshHeader);
    if (!lotAnimMJRefreshHeader) {
        @jobs_weakify(self)
        lotAnimMJRefreshHeader = [LOTAnimationMJRefreshHeader headerWithRefreshingBlock:^{
            @jobs_strongify(self)
            if(self.refreshConfigHeader.loadBlock) self.refreshConfigHeader.loadBlock(nil);
        }];
        //图片
        {
            // 普通闲置状态
            [lotAnimMJRefreshHeader setImages:self.refreshConfigHeader.stateIdlePicsMutArr
                                     forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [lotAnimMJRefreshHeader setImages:self.refreshConfigHeader.pullingPicsMutArr
                                     forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [lotAnimMJRefreshHeader setImages:self.refreshConfigHeader.refreshingPicsMutArr
                                     duration:self.refreshConfigHeader.refreshingDuration
                                     forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [lotAnimMJRefreshHeader setImages:self.refreshConfigHeader.willRefreshPicsMutArr
                                     forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [lotAnimMJRefreshHeader setImages:self.refreshConfigHeader.noMoreDataPicsMutArr
                                     forState:MJRefreshStateNoMoreData];
        }
        //文字
        {
//            NSLog(@"%@",self.refreshConfigHeader.stateIdleTitle);
            NSLog(@"%@",self.refreshConfigHeader);
            // 普通闲置状态
            [lotAnimMJRefreshHeader setTitle:self.refreshConfigHeader.stateIdleTitle
                                    forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [lotAnimMJRefreshHeader setTitle:self.refreshConfigHeader.pullingTitle
                                    forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [lotAnimMJRefreshHeader setTitle:self.refreshConfigHeader.refreshingTitle
                                    forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [lotAnimMJRefreshHeader setTitle:self.refreshConfigHeader.willRefreshTitle
                                    forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [lotAnimMJRefreshHeader setTitle:self.refreshConfigHeader.noMoreDataTitle
                                    forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            lotAnimMJRefreshHeader.stateLabel.font = self.refreshConfigHeader.font;
            // 设置颜色
            lotAnimMJRefreshHeader.stateLabel.textColor = self.refreshConfigHeader.textColor;
            //震动特效反馈
            if (self.refreshConfigHeader.isShake) self.震动特效反馈();
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_lotAnimMJRefreshHeader, lotAnimMJRefreshHeader);
    }return lotAnimMJRefreshHeader;
}

-(void)setLotAnimMJRefreshHeader:(LOTAnimationMJRefreshHeader *)lotAnimMJRefreshHeader{
    Jobs_setAssociatedRETAIN_NONATOMIC(_lotAnimMJRefreshHeader, lotAnimMJRefreshHeader);
}
#pragma mark —— @property(nonatomic,strong)MJRefreshNormalHeader *mjRefreshNormalHeader;
JobsKey(_mjRefreshNormalHeader)
@dynamic mjRefreshNormalHeader;
-(MJRefreshNormalHeader *)mjRefreshNormalHeader{
    MJRefreshNormalHeader *MjRefreshNormalHeader = Jobs_getAssociatedObject(_mjRefreshNormalHeader);
    if (!MjRefreshNormalHeader) {
        @jobs_weakify(self)
        MjRefreshNormalHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            @jobs_strongify(self)
            if(self.refreshConfigHeader.loadBlock)self.refreshConfigHeader.loadBlock(nil);
        }];
        //文字
        {
            // 普通闲置状态
            [MjRefreshNormalHeader setTitle:self.refreshConfigHeader.stateIdleTitle
                                   forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshNormalHeader setTitle:self.refreshConfigHeader.pullingTitle
                                   forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshNormalHeader setTitle:self.refreshConfigHeader.refreshingTitle
                                   forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [MjRefreshNormalHeader setTitle:self.refreshConfigHeader.willRefreshTitle
                                   forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [MjRefreshNormalHeader setTitle:self.refreshConfigHeader.noMoreDataTitle
                                   forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            MjRefreshNormalHeader.stateLabel.font = self.refreshConfigHeader.font;
            // 设置颜色
            MjRefreshNormalHeader.stateLabel.textColor = self.refreshConfigHeader.textColor;
            //震动特效反馈
            if (self.refreshConfigHeader.isShake) self.震动特效反馈();
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshNormalHeader, MjRefreshNormalHeader)
    }return MjRefreshNormalHeader;
}

-(void)setMjRefreshNormalHeader:(MJRefreshNormalHeader *)mjRefreshNormalHeader{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshNormalHeader, mjRefreshNormalHeader)
}
#pragma mark —— @property(nonatomic,strong)MJRefreshStateHeader *mjRefreshStateHeader;
JobsKey(_mjRefreshStateHeader)
@dynamic mjRefreshStateHeader;
-(MJRefreshStateHeader *)mjRefreshStateHeader{
    MJRefreshStateHeader *MjRefreshStateHeader = Jobs_getAssociatedObject(_mjRefreshStateHeader);
    if (!MjRefreshStateHeader) {
        @jobs_weakify(self)
        MjRefreshStateHeader = [MJRefreshStateHeader headerWithRefreshingBlock:^{
            @jobs_strongify(self)
            if(self.refreshConfigHeader.loadBlock)self.refreshConfigHeader.loadBlock(nil);
        }];
        //文字
        {
            // 普通闲置状态
            [MjRefreshStateHeader setTitle:self.refreshConfigHeader.stateIdleTitle
                                  forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshStateHeader setTitle:self.refreshConfigHeader.pullingTitle
                                  forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshStateHeader setTitle:self.refreshConfigHeader.refreshingTitle
                                  forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [MjRefreshStateHeader setTitle:self.refreshConfigHeader.willRefreshTitle
                                  forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [MjRefreshStateHeader setTitle:self.refreshConfigHeader.noMoreDataTitle
                                  forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            MjRefreshStateHeader.stateLabel.font = self.refreshConfigHeader.font;
            // 设置颜色
            MjRefreshStateHeader.stateLabel.textColor = self.refreshConfigHeader.textColor;
            //震动特效反馈
            if (self.refreshConfigHeader.isShake) self.震动特效反馈();
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshStateHeader, MjRefreshStateHeader)
    }return MjRefreshStateHeader;
}

-(void)setMjRefreshStateHeader:(MJRefreshStateHeader *)mjRefreshStateHeader{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshStateHeader, mjRefreshStateHeader)
}
#pragma mark —— @property(nonatomic,strong)MJRefreshHeader *mjRefreshHeader;
JobsKey(_mjRefreshHeader)
@dynamic mjRefreshHeader;
-(MJRefreshHeader *)mjRefreshHeader{
    MJRefreshHeader *MjRefreshHeader = Jobs_getAssociatedObject(_mjRefreshHeader);
    if (!MjRefreshHeader) {
        @jobs_weakify(self)
        MjRefreshHeader = [MJRefreshHeader headerWithRefreshingBlock:^{
            @jobs_strongify(self)
            if(self.refreshConfigHeader.loadBlock)self.refreshConfigHeader.loadBlock(nil);
        }];
        //其他
        {
            //震动特效反馈
            if (self.refreshConfigHeader.isShake) self.震动特效反馈();
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshHeader, MjRefreshHeader)
    }return MjRefreshHeader;
}

-(void)setMjRefreshHeader:(MJRefreshHeader *)mjRefreshHeader{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshHeader, mjRefreshHeader)
}
#pragma mark —— @property(nonatomic,strong)MJRefreshGifHeader *mjRefreshGifHeader;
JobsKey(_mjRefreshGifHeader)
@dynamic mjRefreshGifHeader;
-(MJRefreshGifHeader *)mjRefreshGifHeader{
    MJRefreshGifHeader *MjRefreshGifHeader = Jobs_getAssociatedObject(_mjRefreshGifHeader);
    if (!MjRefreshGifHeader) {
        @jobs_weakify(self)
        MjRefreshGifHeader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
            @jobs_strongify(self)
            if(self.refreshConfigHeader.loadBlock)self.refreshConfigHeader.loadBlock(nil);
        }];
        //图片
        {
            // 普通闲置状态
            [MjRefreshGifHeader setImages:self.refreshConfigHeader.stateIdlePicsMutArr
                                 forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshGifHeader setImages:self.refreshConfigHeader.pullingPicsMutArr
                                 forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshGifHeader setImages:self.refreshConfigHeader.refreshingPicsMutArr
                                 duration:self.refreshConfigHeader.refreshingDuration
                                 forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [MjRefreshGifHeader setImages:self.refreshConfigHeader.willRefreshPicsMutArr
                                 forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [MjRefreshGifHeader setImages:self.refreshConfigHeader.noMoreDataPicsMutArr
                                 forState:MJRefreshStateNoMoreData];
        }
        //文字
        {
            // 普通闲置状态
            [MjRefreshGifHeader setTitle:self.refreshConfigHeader.stateIdleTitle
                                forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshGifHeader setTitle:self.refreshConfigHeader.pullingTitle
                                forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshGifHeader setTitle:self.refreshConfigHeader.refreshingTitle
                                forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [MjRefreshGifHeader setTitle:self.refreshConfigHeader.willRefreshTitle
                                forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [MjRefreshGifHeader setTitle:self.refreshConfigHeader.noMoreDataTitle
                                forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            MjRefreshGifHeader.stateLabel.font = self.refreshConfigHeader.font;
            // 设置颜色
            MjRefreshGifHeader.stateLabel.textColor = self.refreshConfigHeader.textColor;
            //震动特效反馈
            if (self.refreshConfigHeader.isShake) self.震动特效反馈();
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshGifHeader, MjRefreshGifHeader)
    }return MjRefreshGifHeader;
}

-(void)setMjRefreshGifHeader:(MJRefreshGifHeader *)mjRefreshGifHeader{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshGifHeader, mjRefreshGifHeader)
}
#pragma mark —— MJRefreshFooter
#pragma mark —— @property(nonatomic,strong)MJRefreshAutoGifFooter *mjRefreshAutoGifFooter;
JobsKey(_mjRefreshAutoGifFooter)
@dynamic mjRefreshAutoGifFooter;
-(MJRefreshAutoGifFooter *)mjRefreshAutoGifFooter{
    MJRefreshAutoGifFooter *MjRefreshAutoGifFooter = Jobs_getAssociatedObject(_mjRefreshAutoGifFooter);
    if (!MjRefreshAutoGifFooter) {
        @jobs_weakify(self)
        MjRefreshAutoGifFooter = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            if(self.refreshConfigFooter.loadBlock)self.refreshConfigFooter.loadBlock(nil);
            
        }];
        // 图片
        {
            // 普通闲置状态
            [MjRefreshAutoGifFooter setImages:self.refreshConfigFooter.stateIdlePicsMutArr
                                     forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshAutoGifFooter setImages:self.refreshConfigFooter.pullingPicsMutArr
                                     forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshAutoGifFooter setImages:self.refreshConfigFooter.refreshingPicsMutArr
                                     duration:self.refreshConfigFooter.refreshingDuration
                                     forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [MjRefreshAutoGifFooter setImages:self.refreshConfigFooter.willRefreshPicsMutArr
                                     forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [MjRefreshAutoGifFooter setImages:self.refreshConfigFooter.noMoreDataPicsMutArr
                                     forState:MJRefreshStateNoMoreData];
        }
        // 文字
        {
            // 普通闲置状态
            [MjRefreshAutoGifFooter setTitle:self.refreshConfigFooter.stateIdleTitle
                                    forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshAutoGifFooter setTitle:self.refreshConfigFooter.pullingTitle
                                    forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshAutoGifFooter setTitle:self.refreshConfigFooter.refreshingTitle
                                    forState:MJRefreshStateRefreshing];
            /** 即将刷新的状态 */
            [MjRefreshAutoGifFooter setTitle:self.refreshConfigFooter.willRefreshTitle
                                    forState:MJRefreshStateWillRefresh];
            /** 所有数据加载完毕，没有更多的数据了 */
            [MjRefreshAutoGifFooter setTitle:self.refreshConfigFooter.noMoreDataTitle
                                    forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            MjRefreshAutoGifFooter.stateLabel.font = self.refreshConfigFooter.font;
            // 设置颜色
            MjRefreshAutoGifFooter.stateLabel.textColor = self.refreshConfigFooter.textColor;
            if (self.refreshConfigFooter.isShake) self.震动特效反馈();
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoGifFooter, MjRefreshAutoGifFooter)
    }return MjRefreshAutoGifFooter;
}

-(void)setMjRefreshAutoGifFooter:(MJRefreshAutoGifFooter *)mjRefreshAutoGifFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoGifFooter, mjRefreshAutoGifFooter)
}
#pragma mark —— @property(nonatomic,strong)MJRefreshBackNormalFooter *mjRefreshBackNormalFooter;
JobsKey(_mjRefreshBackNormalFooter)
@dynamic mjRefreshBackNormalFooter;
-(MJRefreshBackNormalFooter *)mjRefreshBackNormalFooter{
    MJRefreshBackNormalFooter *MjRefreshBackNormalFooter = Jobs_getAssociatedObject(_mjRefreshBackNormalFooter);
    if (!MjRefreshBackNormalFooter) {
        @jobs_weakify(self)
        MjRefreshBackNormalFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            if(self.refreshConfigFooter.loadBlock)self.refreshConfigFooter.loadBlock(nil);
        }];
        // 文字 (此模式下只有文字而没有图片)
        {
            // 普通闲置状态
            [MjRefreshBackNormalFooter setTitle:self.refreshConfigFooter.stateIdleTitle
                                       forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshBackNormalFooter setTitle:self.refreshConfigFooter.pullingTitle
                                       forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshBackNormalFooter setTitle:self.refreshConfigFooter.refreshingTitle
                                       forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [MjRefreshBackNormalFooter setTitle:self.refreshConfigFooter.willRefreshTitle
                                       forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [MjRefreshBackNormalFooter setTitle:self.refreshConfigFooter.noMoreDataTitle
                                       forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            MjRefreshBackNormalFooter.stateLabel.font = self.refreshConfigFooter.font;
            // 设置颜色
            MjRefreshBackNormalFooter.stateLabel.textColor = self.refreshConfigFooter.textColor;
            if (self.refreshConfigFooter.isShake) self.震动特效反馈();
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackNormalFooter, MjRefreshBackNormalFooter)
    }return MjRefreshBackNormalFooter;
}

-(void)setMjRefreshBackNormalFooter:(MJRefreshBackNormalFooter *)mjRefreshBackNormalFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackNormalFooter, mjRefreshBackNormalFooter)
}
#pragma mark —— @property(nonatomic,strong)MJRefreshAutoNormalFooter *mjRefreshAutoNormalFooter;
JobsKey(_mjRefreshAutoNormalFooter)
@dynamic mjRefreshAutoNormalFooter;
-(MJRefreshAutoNormalFooter *)mjRefreshAutoNormalFooter{
    MJRefreshAutoNormalFooter *MjRefreshAutoNormalFooter = Jobs_getAssociatedObject(_mjRefreshAutoNormalFooter);
    if (!MjRefreshAutoNormalFooter) {
        @jobs_weakify(self)
        MjRefreshAutoNormalFooter = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            if(self.refreshConfigFooter.loadBlock)self.refreshConfigFooter.loadBlock(nil);
        }];
        
        // 文字
        {
            // 普通闲置状态
            [MjRefreshAutoNormalFooter setTitle:self.refreshConfigFooter.stateIdleTitle
                                       forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshAutoNormalFooter setTitle:self.refreshConfigFooter.pullingTitle
                                       forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshAutoNormalFooter setTitle:self.refreshConfigFooter.refreshingTitle
                                       forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [MjRefreshAutoNormalFooter setTitle:self.refreshConfigFooter.willRefreshTitle
                                       forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [MjRefreshAutoNormalFooter setTitle:self.refreshConfigFooter.noMoreDataTitle
                                       forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            MjRefreshAutoNormalFooter.stateLabel.font = self.refreshConfigFooter.font;
            // 设置颜色
            MjRefreshAutoNormalFooter.stateLabel.textColor = self.refreshConfigFooter.textColor;
            if (self.refreshConfigFooter.isShake) self.震动特效反馈();
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoNormalFooter, MjRefreshAutoNormalFooter)
    }return MjRefreshAutoNormalFooter;
}

-(void)setMjRefreshAutoNormalFooter:(MJRefreshAutoNormalFooter *)mjRefreshAutoNormalFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoNormalFooter, mjRefreshAutoNormalFooter)
}
#pragma mark —— @property(nonatomic,strong)MJRefreshAutoStateFooter *mjRefreshAutoStateFooter;
JobsKey(_mjRefreshAutoStateFooter)
@dynamic mjRefreshAutoStateFooter;
-(MJRefreshAutoStateFooter *)mjRefreshAutoStateFooter{
    MJRefreshAutoStateFooter *MjRefreshAutoStateFooter = Jobs_getAssociatedObject(_mjRefreshAutoStateFooter);
    if (!MjRefreshAutoStateFooter) {
        @jobs_weakify(self)
        MjRefreshAutoStateFooter = [MJRefreshAutoStateFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            if(self.refreshConfigFooter.loadBlock)self.refreshConfigFooter.loadBlock(nil);
        }];
        // 文字
        {
            // 普通闲置状态
            [MjRefreshAutoStateFooter setTitle:self.refreshConfigFooter.stateIdleTitle
                                      forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshAutoStateFooter setTitle:self.refreshConfigFooter.pullingTitle
                                      forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshAutoStateFooter setTitle:self.refreshConfigFooter.refreshingTitle
                                      forState:MJRefreshStateRefreshing];
            /** 即将刷新的状态 */
            [MjRefreshAutoStateFooter setTitle:self.refreshConfigFooter.willRefreshTitle
                                      forState:MJRefreshStateWillRefresh];
            /** 所有数据加载完毕，没有更多的数据了 */
            [MjRefreshAutoStateFooter setTitle:self.refreshConfigFooter.noMoreDataTitle
                                      forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            MjRefreshAutoStateFooter.stateLabel.font = self.refreshConfigFooter.font;
            // 设置颜色
            MjRefreshAutoStateFooter.stateLabel.textColor = self.refreshConfigFooter.textColor;
            if (self.refreshConfigFooter.isShake) self.震动特效反馈();
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoStateFooter, MjRefreshAutoStateFooter)
    }return MjRefreshAutoStateFooter;
}

-(void)setMjRefreshAutoStateFooter:(MJRefreshAutoStateFooter *)mjRefreshAutoStateFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoStateFooter, mjRefreshAutoStateFooter)
}
#pragma mark —— @property(nonatomic,strong)MJRefreshAutoFooter *mjRefreshAutoFooter;
JobsKey(_mjRefreshAutoFooter)
@dynamic mjRefreshAutoFooter;
-(MJRefreshAutoFooter *)mjRefreshAutoFooter{
    MJRefreshAutoFooter *MjRefreshAutoFooter = Jobs_getAssociatedObject(_mjRefreshAutoFooter);
    if (!MjRefreshAutoFooter) {
        @jobs_weakify(self)
        MjRefreshAutoFooter = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            if(self.refreshConfigFooter.loadBlock)self.refreshConfigFooter.loadBlock(nil);
        }];
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoFooter, MjRefreshAutoFooter)
    }return MjRefreshAutoFooter;
}

-(void)setMjRefreshAutoFooter:(MJRefreshAutoFooter *)mjRefreshAutoFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshAutoFooter, mjRefreshAutoFooter)
}
#pragma mark —— @property(nonatomic,strong)MJRefreshBackGifFooter *mjRefreshBackGifFooter;
JobsKey(_mjRefreshBackGifFooter)
@dynamic mjRefreshBackGifFooter;
-(MJRefreshBackGifFooter *)mjRefreshBackGifFooter{
    MJRefreshBackGifFooter *MjRefreshBackGifFooter = Jobs_getAssociatedObject(_mjRefreshBackGifFooter);
    if (!MjRefreshBackGifFooter) {
        @jobs_weakify(self)
        MjRefreshBackGifFooter = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            if(self.refreshConfigFooter.loadBlock)self.refreshConfigFooter.loadBlock(nil);
        }];
        // 图片
        {
            // 普通闲置状态
            [MjRefreshBackGifFooter setImages:self.refreshConfigFooter.stateIdlePicsMutArr
                                     forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshBackGifFooter setImages:self.refreshConfigFooter.pullingPicsMutArr
                                     forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshBackGifFooter setImages:self.refreshConfigFooter.refreshingPicsMutArr
                                     duration:self.refreshConfigFooter.refreshingDuration
                                     forState:MJRefreshStateRefreshing];
            // 即将刷新的状态
            [MjRefreshBackGifFooter setImages:self.refreshConfigFooter.willRefreshPicsMutArr
                                     forState:MJRefreshStateWillRefresh];
            // 所有数据加载完毕，没有更多的数据了
            [MjRefreshBackGifFooter setImages:self.refreshConfigFooter.noMoreDataPicsMutArr
                                     forState:MJRefreshStateNoMoreData];
        }
        // 文字
        {
            // 普通闲置状态
            [MjRefreshBackGifFooter setTitle:self.refreshConfigFooter.stateIdleTitle
                                    forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshBackGifFooter setTitle:self.refreshConfigFooter.pullingTitle
                                    forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshBackGifFooter setTitle:self.refreshConfigFooter.refreshingTitle
                                    forState:MJRefreshStateRefreshing];
            /** 即将刷新的状态 */
            [MjRefreshBackGifFooter setTitle:self.refreshConfigFooter.willRefreshTitle
                                    forState:MJRefreshStateWillRefresh];
            /** 所有数据加载完毕，没有更多的数据了 */
            [MjRefreshBackGifFooter setTitle:self.refreshConfigFooter.noMoreDataTitle
                                    forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            MjRefreshBackGifFooter.stateLabel.font = self.refreshConfigFooter.font;
            // 设置颜色
            MjRefreshBackGifFooter.stateLabel.textColor = self.refreshConfigFooter.textColor;
            if (self.refreshConfigFooter.isShake) self.震动特效反馈();
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackGifFooter, MjRefreshBackGifFooter);
    }return MjRefreshBackGifFooter;
}

-(void)setMjRefreshBackGifFooter:(MJRefreshBackGifFooter *)mjRefreshBackGifFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackGifFooter, mjRefreshBackGifFooter);
}
#pragma mark —— @property(nonatomic,strong)MJRefreshBackStateFooter *mjRefreshBackStateFooter;
JobsKey(_mjRefreshBackStateFooter)
@dynamic mjRefreshBackStateFooter;
-(MJRefreshBackStateFooter *)mjRefreshBackStateFooter{
    MJRefreshBackStateFooter *MjRefreshBackStateFooter = Jobs_getAssociatedObject(_mjRefreshBackStateFooter);
    if (!MjRefreshBackStateFooter) {
        @jobs_weakify(self)
        MjRefreshBackStateFooter = [MJRefreshBackStateFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            if(self.refreshConfigFooter.loadBlock)self.refreshConfigFooter.loadBlock(nil);
        }];
        // 文字
        {
            // 普通闲置状态
            [MjRefreshBackStateFooter setTitle:self.refreshConfigFooter.stateIdleTitle
                                      forState:MJRefreshStateIdle];
            // 松开就可以进行刷新的状态
            [MjRefreshBackStateFooter setTitle:self.refreshConfigFooter.pullingTitle
                                      forState:MJRefreshStatePulling];
            // 正在刷新中的状态
            [MjRefreshBackStateFooter setTitle:self.refreshConfigFooter.refreshingTitle
                                      forState:MJRefreshStateRefreshing];
            /** 即将刷新的状态 */
            [MjRefreshBackStateFooter setTitle:self.refreshConfigFooter.willRefreshTitle
                                      forState:MJRefreshStateWillRefresh];
            /** 所有数据加载完毕，没有更多的数据了 */
            [MjRefreshBackStateFooter setTitle:self.refreshConfigFooter.noMoreDataTitle
                                      forState:MJRefreshStateNoMoreData];
        }
        //其他
        {
            // 设置字体
            MjRefreshBackStateFooter.stateLabel.font = self.refreshConfigFooter.font;
            // 设置颜色
            MjRefreshBackStateFooter.stateLabel.textColor = self.refreshConfigFooter.textColor;
            if (self.refreshConfigFooter.isShake) self.震动特效反馈();
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackStateFooter, MjRefreshBackStateFooter);
    }return MjRefreshBackStateFooter;
}

-(void)setMjRefreshBackStateFooter:(MJRefreshBackStateFooter *)mjRefreshBackStateFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackStateFooter, mjRefreshBackStateFooter)
}
#pragma mark —— @property(nonatomic,strong)MJRefreshBackFooter *mjRefreshBackFooter;
JobsKey(_mjRefreshBackFooter)
@dynamic mjRefreshBackFooter;
-(MJRefreshBackFooter *)mjRefreshBackFooter{
    MJRefreshBackFooter *MjRefreshBackFooter = Jobs_getAssociatedObject(_mjRefreshBackFooter);
    if (!MjRefreshBackFooter) {
        @jobs_weakify(self)
        MjRefreshBackFooter = [MJRefreshBackFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            if(self.refreshConfigFooter.loadBlock)self.refreshConfigFooter.loadBlock(nil);
        }];
        //其他
        {
            if (self.refreshConfigFooter.isShake) self.震动特效反馈();
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackFooter, MjRefreshBackFooter);
    }return MjRefreshBackFooter;
}

-(void)setMjRefreshBackFooter:(MJRefreshBackFooter *)mjRefreshBackFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshBackFooter, mjRefreshBackFooter);
}
#pragma mark —— @property(nonatomic,strong)MJRefreshFooter *mjRefreshFooter;
JobsKey(_mjRefreshFooter)
@dynamic mjRefreshFooter;
-(MJRefreshFooter *)mjRefreshFooter{
    MJRefreshFooter *MjRefreshFooter = Jobs_getAssociatedObject(_mjRefreshFooter);
    if (!MjRefreshFooter) {
        @jobs_weakify(self)
        MjRefreshFooter = [MJRefreshFooter footerWithRefreshingBlock:^{
            @jobs_strongify(self)
            if(self.refreshConfigFooter.loadBlock)self.refreshConfigFooter.loadBlock(nil);
        }];
        //其他
        {
            if (self.refreshConfigFooter.isShake) self.震动特效反馈();
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshFooter, MjRefreshFooter)
    }return MjRefreshFooter;
}

-(void)setMjRefreshFooter:(MJRefreshFooter *)mjRefreshFooter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mjRefreshFooter, mjRefreshFooter)
}

@end
