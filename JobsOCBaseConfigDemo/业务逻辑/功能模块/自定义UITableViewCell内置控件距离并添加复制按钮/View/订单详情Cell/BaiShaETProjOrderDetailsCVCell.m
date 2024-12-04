//
//  BaiShaETProjOrderDetailsCVCell.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/26.
//

#import "BaiShaETProjOrderDetailsCVCell.h"

@interface BaiShaETProjOrderDetailsCVCell ()
/// UI
@property(nonatomic,strong)UIButton *jobsCopyBtn;

@end

@implementation BaiShaETProjOrderDetailsCVCell
@synthesize viewModel = _viewModel;
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}
#pragma mark —— BaseViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    return self.viewModel;
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    BaiShaETProjOrderDetailsCVCell *cell = (BaiShaETProjOrderDetailsCVCell *)[collectionView collectionViewCellClass:BaiShaETProjOrderDetailsCVCell.class forIndexPath:indexPath];
    if (!cell) {
        collectionView.registerCollectionViewCellClass(BaiShaETProjOrderDetailsCVCell.class,@"");
        cell = (BaiShaETProjOrderDetailsCVCell *)[collectionView collectionViewCellClass:BaiShaETProjOrderDetailsCVCell.class forIndexPath:indexPath];
    }
    cell.indexPath = indexPath;
    cell.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable model) {
        model.jobsWidth = .5f;
        model.layerCor = HEXCOLOR(0xEEE2C8);
        model.cornerRadius = JobsWidth(8);
    }));
    JobsCellCor(JobsWhiteColor);
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model ? : UIViewModel.new;
        self.tableView.reloadDatas();
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)cellSizeByModel{
    return ^CGSize(UIViewModel *_Nullable data){
        return CGSizeMake(JobsWidth(343), 子TableViewCell的高度 * data.jobsDataMutArr.count + JobsWidth(40));
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 子TableViewCell的高度;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.jobsDataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBaseTableViewCell *cell = JobsBaseTableViewCell.cellStyleValue1WithTableView(tableView);
    
    cell.textLabelFrameOffsetY = JobsWidth(-2);/// 这里需要设置一个偏移量去抵消有一个莫名出现的偏移量
    cell.detailTextLabelOffsetY = JobsWidth(-2);/// 这里需要设置一个偏移量去抵消有一个莫名出现的偏移量
    cell.textLabelFrameOffsetX = JobsWidth(-13);/// 这里需要设置一个偏移量去抵消有一个莫名出现的偏移量
    cell.detailTextLabelOffsetX = JobsWidth(-65);/// 这里需要设置一个偏移量去抵消有一个莫名出现的偏移量

    cell.jobsRichElementsInCellWithModel(self.viewModel.jobsDataMutArr[indexPath.row]);
    
    _jobsCopyBtn = nil;/// ❤️ 关键。[self layoutIfNeeded];会出现异常
    [cell.contentView addSubview:self.jobsCopyBtn];
    [self.jobsCopyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(cell.contentView);
        make.right.equalTo(cell.contentView).offset(JobsWidth(-12));
        make.height.mas_equalTo(JobsWidth(18));
    }];
    self.jobsCopyBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
    self.jobsCopyBtn.cornerCutToCircleWithCornerRadius(JobsWidth(18 / 2));
    @jobs_weakify(self)
    [self.jobsCopyBtn jobsBtnClickEventBlock:^id(id data) {
        @jobs_strongify(self)
        UIViewModel *viewModel = (UIViewModel *)self.viewModel.jobsDataMutArr[indexPath.row];
        viewModel.subTextModel.text.pasteboard();
        return nil;
    }];
    cell.textLabel.textColor = HEXCOLOR(0x757575);
    cell.textLabel.font = UIFontWeightRegularSize(12);
    cell.detailTextLabel.textColor = HEXCOLOR(0x3D4A58);
    cell.detailTextLabel.font = UIFontWeightBoldSize(14);
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSectionByModel:(NSInteger)section{
    return BaseTableViewHeaderFooterView.heightForFooterInSectionByModel(nil);
}
/// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
- (nullable __kindof UIView *)tableView:(UITableView *)tableView
                 viewForFooterInSection:(NSInteger)section{
    BaseTableViewHeaderFooterView *tbvFooterView = tableView.tableViewHeaderFooterView(BaseTableViewHeaderFooterView.class,@"");
    tbvFooterView.headerFooterViewStyle = JobsFooterViewStyle;
    {
        // 不写这两句有悬浮
        tbvFooterView.tableView = tableView;
        tbvFooterView.section = section;
    }
    /// tbvFooterView.backgroundColor 和  tbvFooterView.contentView.backgroundColor 均是无效操作❌
    /// 只有 tbvFooterView.backgroundView.backgroundColor 是有效操作✅
    tbvFooterView.contentView.backgroundColor = HEXCOLOR(0xFFFFFF);
    tbvFooterView.jobsRichViewByModel(nil);
    @jobs_weakify(self)
    [tbvFooterView actionObjectBlock:^(id data) {
        @jobs_strongify(self)
    }];return tbvFooterView;
}
#pragma mark —— lazyLoad
-(UIButton *)jobsCopyBtn{
    if (!_jobsCopyBtn) {
        _jobsCopyBtn = UIButton.new;
        _jobsCopyBtn.jobsResetBtnTitle(@"   ".add(JobsInternationalization(@"複製")).add(@"  "));
        _jobsCopyBtn.jobsResetBtnTitleFont(UIFontWeightBoldSize(12));
        _jobsCopyBtn.jobsResetBtnTitleCor(HEXCOLOR(0x757575));
        _jobsCopyBtn.backgroundColor = HEXCOLOR(0xEAEBED);
    }return _jobsCopyBtn;
}
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.initWithStylePlain;
        _tableView.dataLink(self);
        _tableView.scrollEnabled = NO;
        _tableView.backgroundColor = JobsWhiteColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableHeaderView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
        });
        _tableView.tableFooterView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
        });
        _tableView.separatorColor = HEXCOLOR(0xEEEEEE);
        [self.contentView addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.contentView).insets(UIEdgeInsetsMake(JobsWidth(20), 0, JobsWidth(20), 0));
        }];
    }return _tableView;
}

@end
