//
//  JobsUserHeaderDataView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/19.
//

#import "JobsUserHeaderDataView.h"

@interface JobsUserHeaderDataView ()
/// Data
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation JobsUserHeaderDataView
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_choiceUserHeaderDataViewOnceToken = 0;
    static_choiceUserHeaderDataView = nil;
}

static JobsUserHeaderDataView *static_choiceUserHeaderDataView = nil;
static dispatch_once_t static_choiceUserHeaderDataViewOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_choiceUserHeaderDataViewOnceToken, ^{
        static_choiceUserHeaderDataView = JobsUserHeaderDataView.new;
    });return static_choiceUserHeaderDataView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
//        [self appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
//                                            cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        [self appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
//                                            cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
    }return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
//        [self appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
//                                            cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— 一些公有方法
-(__kindof JobsUserHeaderDataView *)makeImageByBlock:(jobsByIDBlock _Nullable)block
                                         finishBlock:(jobsByVoidBlock)finishBlock{
    @jobs_weakify(self)
    self.popupParameter = nil;
    self.bySize(JobsUserHeaderDataView.viewSizeByModel(nil))
        .JobsRichViewByModel2(nil)
        .JobsBlock1(^(JobsUserHeaderDataViewTBVCell *cell) {
            @jobs_strongify(self)
            if (cell.getTitleValue.isEqualToString(拍照.tr)) {
                self.invokeSysCamera();/// 完全意义上的调用系统的相机拍照功能
            }else if (cell.getTitleValue.isEqualToString(从相册中选取.tr)){
                [self hx_invokeSysPhotoAlbumSuccessBlock:^(HXPhotoPickerModel *data) {
                    @jobs_strongify(self)
                    self.photoManager = data.photoManager;
                    [data.photoList hx_requestImageWithOriginal:NO
                                                     completion:^(NSArray<UIImage *>*_Nullable imageArray,
                                                                  NSArray<HXPhotoModel *>*_Nullable errorArray) {
                        @jobs_strongify(self)
                        if(block) block(NSMutableArray.initBy(imageArray).lastObject);/// 永远值显示最后选择的图
                    }];
                } failBlock:^(HXPhotoPickerModel *data) {
    //                @jobs_strongify(self)
                }];
            }else if (cell.getTitleValue.isEqualToString(取消.tr)){
//                    @jobs_strongify(self)
            }else{}
            if(finishBlock) finishBlock();
        });
    return self;
}
#pragma mark —— 一些私有方法
+(NSMutableArray<UIViewModel *> *)createDataMutArr{
    return jobsMakeMutArr(^(__kindof NSMutableArray <UIViewModel *>* _Nullable arr) {
        arr.add(JobsUserHeaderDataView.makeViewModelBy(@"拍照".tr))
        .add(JobsUserHeaderDataView.makeViewModelBy(@"从相册中选取".tr))
        .add(JobsUserHeaderDataView.makeViewModelBy(@"取消".tr));
    });
}

+(JobsReturnViewModelByStringBlock _Nonnull)makeViewModelBy{
    return ^ __kindof UIViewModel *_Nullable(NSString *_Nullable data){
        return jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = data;
            viewModel.textModel.font = UIFontWeightRegularSize(JobsWidth(18));
            viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        });
    };
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model ? : UIViewModel.new;
    //    self.viewModel.usesTableViewHeaderView = YES;// 这个属性在外面设置
        MakeDataNull
        self.tableView.byShow(self);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(UIViewModel *_Nullable data){
        data = data ? : UIViewModel.new;
    //    model.usesTableViewHeaderView = YES;// 这个属性在外面设置
        return CGSizeMake(JobsMainScreen_WIDTH(),
                          (data.usesTableViewHeaderView ? JobsUserHeaderDataViewForHeaderInSection.viewHeightByModel(nil) : 0 ) +
                          JobsBottomSafeAreaHeight() +
                          JobsWidth(31) +
                          JobsUserHeaderDataViewTBVCell.cellHeightByModel(nil) * JobsUserHeaderDataView.createDataMutArr.count);
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsUserHeaderDataViewTBVCell.cellHeightByModel(nil);
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.objBlock) self.objBlock([tableView cellForRowAtIndexPath:indexPath]);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsUserHeaderDataViewTBVCell.cellStyleValue2WithTableView(tableView)
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .byIndexPath(indexPath)
        .jobsRichElementsTableViewCellBy(self.dataMutArr[indexPath.row])
            .JobsBlock1(^(id _Nullable data) {
             
            });
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    JobsLog(@"%d",self.viewModel.usesTableViewHeaderView);
    return self.viewModel.usesTableViewHeaderView ? JobsUserHeaderDataViewForHeaderInSection.viewHeightByModel(nil) : 0;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView hideSeparatorLineAtLast:indexPath cell:cell];
}
/// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
/// tableView.registerHeaderFooterViewClass(JobsUserHeaderDataViewForHeaderInSection.class,@"");
- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    if (self.viewModel.usesTableViewHeaderView) {
        @jobs_weakify(self)
        /// 什么不配置就是悬浮
        /// JobsHeaderFooterViewStyleNone 还是悬浮
        /// JobsHeaderViewStyle 不是悬浮
        return JobsUserHeaderDataViewForHeaderInSection.initByReuseIdentifier(tableView,@"")
            .byStyle(JobsHeaderViewStyle)/// 悬浮开关
            .bySection(section)/// 悬浮配置
            .JobsRichViewByModel2(nil)
            .JobsBlock1(^(id _Nullable data) {
                
            });
    }return nil;
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        /// 一般用 initWithStylePlain。initWithStyleGrouped会自己预留一块空间
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByInsetGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.registerHeaderFooterViewClass(JobsUserHeaderDataViewForHeaderInSection.class,@"")
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .bySeparatorColor(HEXCOLOR(0xEEE2C8))
                .registerHeaderFooterViewClass(MSCommentTableHeaderFooterView.class,nil)
                .byTableHeaderView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    /// TODO
                })) // 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                .byTableFooterView(jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
                    label.byText(@"- 没有更多的内容了 -".tr)
                        .byFont(UIFontWeightRegularSize(12))
                        .byTextAlignment(NSTextAlignmentCenter)
                        .byTextCor(HEXCOLOR(0xB0B0B0))
                        .makeLabelByShowingType(UILabelShowingType_03);
                })) // 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                .emptyDataByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                    data.title = @"NO MESSAGES FOUND".tr;
                    data.titleCor = JobsWhiteColor;
                    data.titleFont = bayonRegular(JobsWidth(30));
                    data.normalImage = @"小狮子".img;
                }))
                /// 普通的MJRefreshHeader（触发事件）
                .byMJRefreshHeader([MJRefreshNormalHeader headerWithRefreshingBlock:^{
                    @jobs_strongify(self)
                    NSObject.feedbackGenerator(nil);/// 震动反馈
                    self->_tableView.endRefreshing(YES);
                }].byMJRefreshHeaderConfigModel(self.mjHeaderDefaultConfig))
                /// 普通的MJRefreshFooter（触发事件）
                .byMJRefreshFooter([MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                    @jobs_strongify(self)
                    NSObject.feedbackGenerator(nil);// 震动反馈
                    self->_tableView.endRefreshing(self.dataMutArr.count);
                }].byMJRefreshFooterConfigModel(self.mjFooterDefaultConfig))
                .byShowsVerticalScrollIndicator(NO)
                .byShowsHorizontalScrollIndicator(NO)
                .byScrollEnabled(YES)
                .byBgColor(JobsClearColor);
        })
        .addOn(self)
        .byAdd(^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.edges.equalTo(self);
        });
    }return _tableView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = JobsUserHeaderDataView.createDataMutArr;
    }return _dataMutArr;
}

@end
