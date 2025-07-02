//
//  FMHomeMainBizSubView.m
//  FM_Normal
//
//  Created by Admin on 11/4/2025.
//

#import "FMHomeMainBizSubView.h"

@interface FMHomeMainBizSubView ()
/// UI
Prop_strong()ThreeClassCell *tempCell;
/// Data
Prop_strong()NSMutableArray <GoodsClassModel *>*leftDataArray;/// 左边的数据源
Prop_strong()NSMutableArray <GoodsClassModel *>*rightDataArray;/// 右边的数据源
Prop_strong()GoodsClassModel *rightViewCurrentSelectModel;
Prop_strong()UIViewModel *leftViewCurrentSelectModel;
Prop_strong()NSMutableArray <UIButtonModel *>*leftCellDataMutArr;
Prop_strong()NSMutableArray <UIButtonModel *>*cellDataMutArr;
Prop_strong()NSMutableArray <NSString *>*cellTitleMutArr;
Prop_assign()NSUInteger thisIndex;

@end

@implementation FMHomeMainBizSubView

-(void)dealloc{
    JobsLog(@"");
}
#pragma mark —— BaseProtocol
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsClearColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = JobsClearColor;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    /// 内部指定圆切角
//    [self appointCornerCutToCircleByRoundingCorners:UIRectCornerAllCorners
//                                        cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsClearColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.tableView.reloadDatas();
        self.collectionView.reloadDatas();
        self.refreshLeftView();
        [self.tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        self.actionBy(0);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH() - JobsWidth(30),
                          JobsWidth(400));
    };
}
#pragma mark —— 一些私有方法
-(jobsByMutArrayBlock _Nonnull)makeCellData{
    @jobs_weakify(self)
    return ^(__kindof NSMutableArray *_Nullable arr){
        @jobs_strongify(self)
        for (int i = 0; i < self.thisIndex + 1; i++) {
            arr.add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
                model.backgroundImage = JobsIMG(self.cellTitleMutArr[self.thisIndex].add(已点击));
                model.titleCor = HEXCOLOR(0xC4C4C4);
                model.titleFont = UIFontWeightRegularSize(12);
                model.baseBackgroundColor = JobsRedColor;
                model.imagePadding = JobsWidth(5);
            }));
        }
    };
}

-(JobsReturnButtonModelByString _Nonnull)makeLeftCellDataByUnSelect{
//    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nullable(__kindof NSString *_Nullable data){
//        @jobs_strongify(self)
        return jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
            model.backgroundImage = JobsIMG(data.add(未点击));
            model.title = @"";
            model.subTitle = @"";
            model.baseBackgroundColor = JobsClearColor;
        });
    };
}

-(jobsByNSUIntegerBlock _Nonnull)actionBy{
    @jobs_weakify(self)
    return ^(NSUInteger index){
        @jobs_strongify(self)
        self.thisIndex = index;
        self.getGoodsClassByPid(self.rightViewCurrentSelectModel.idField,index);
        if (self.rightDataArray.count) self.rightViewCurrentSelectModel = self.rightDataArray.objectAt(index);
        if (self.leftDataArray.count) self.leftViewCurrentSelectModel = self.leftDataArray.objectAt(index);
        self.collectionView.setContentOffsetByYES(CGPointMake(0, JobsWidth(-5)));
        for (int i = 0; i < self.leftCellDataMutArr.count; i++) {
            self.leftCellDataMutArr[i].backgroundImage = JobsIMG(self.cellTitleMutArr[i].add(未点击));
        }
        self.leftCellDataMutArr[index].backgroundImage = JobsIMG(self.cellTitleMutArr[index].add(已点击));
        self.tableView.reloadDatas();
    };
}

-(jobsByVoidBlock _Nonnull)refreshLeftView{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.tableView.reloadDatas();
        if (self.leftDataArray.count){
            @jobs_weakify(self)
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                [self.tableView selectRowAtIndexPath:jobsMakeIndexPathZero()
                                            animated:NO
                                      scrollPosition:UITableViewScrollPositionNone];
                if ([self.tableView.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]){
                    [self.tableView.delegate tableView:self.tableView
                               didSelectRowAtIndexPath:jobsMakeIndexPathZero()];
                }
            });
        }
    };
}
/// 预算高度
-(JobsReturnCGFloatByArrBlock _Nonnull)getCellHeight{
    @jobs_weakify(self)
    return ^(NSMutableArray *_Nullable data){
        @jobs_strongify(self)
        /// 获取cell 的高度
        return self.tempCell.getCollectionHeight(data);
    };
}
/// 根据一级目录的id 获取二三级的分类数据
-(jobsByStringAndNSUIntegerBlock _Nonnull)getGoodsClassByPid{
    @jobs_weakify(self)
    return ^(__kindof NSString *_Nullable data1,NSUInteger data2){
        @jobs_strongify(self)
        self.rightDataArray.clean();
        self.cellDataMutArr.clean();
        self.cellDataMutArr = nil;
        /// 每个子页面的section个数
        for (int i = 0; i < self.cellDataMutArr.count; i++){
            self.rightDataArray.add(self.createTwoModel(data2,i));
        }self.collectionView.reloadDatas();
        if (self.rightDataArray.count){
            [self.collectionView scrollToItemAtIndexPath:jobsMakeIndexPathZero()
                                        atScrollPosition:UICollectionViewScrollPositionTop
                                                animated:NO];
        }
    };
}
/// 暂时没用到
-(jobsByVoidBlock _Nonnull)loadData{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        /// 这里可以调用接口去获取一级目录分类的数据
        for (int i = 0; i < self.leftCellDataMutArr.count; i++){
            self.leftDataArray.add(self.createOneModel(i));
        }
    };
}
/// 暂时没用到
-(JobsReturnGoodsClassModelByIntBlock _Nonnull)createOneModel{
//    @jobs_weakify(self)
    return ^__kindof GoodsClassModel *_Nullable(int iflag){
        return jobsMakeGoodsClassModel(^(GoodsClassModel * _Nullable model) {
//            @jobs_strongify(self)
            model.idField = toStringByInt(iflag);
            model.pid = @"0";
            model.name = JobsInternationalization(@"一级目录").add(toStringByInt(iflag));
            model.textModel.text = @"";
        });
    };
}

-(JobsReturnGoodsClassModelByInt2Block _Nonnull)createTwoModel{
    @jobs_weakify(self)
    return ^__kindof GoodsClassModel *_Nullable(NSUInteger data1,int iFlag){
        return jobsMakeGoodsClassModel(^(GoodsClassModel * _Nullable model) {
            @jobs_strongify(self)
            model.idField = toStringByInt(iFlag);
            model.pid = toStringByInt(iFlag);
            model.name = JobsInternationalization(@"随机").add(JobsDash).add(toStringByInt(iFlag));
            model.textModel.text = @"1234";
            model.subTextModel.text = toStringByInt(iFlag).add(JobsInternationalization(@"球桌球"));
            model.bgImage = self.cellDataMutArr[iFlag].backgroundImage;
            model.title = self.cellTitleMutArr[data1];
            /// ViewModel
            model.imageUrl = @"https://zh.wikipedia.org/wiki/File:Jiang_Zemin_2002.jpg".jobsUrl;
            model.text = JobsInternationalization(@"FlementalLinkFire");
            model.image = JobsIMG(@"点赞");
            JobsLog(@"%@",model.bgImage);
            model.childrenList = jobsMakeMutArr(^(__kindof NSMutableArray <GoodsClassModel *>*_Nullable arr) {
                @jobs_strongify(self)
                /// 每个section里面的item数量
                for (int i = 0; i < 9; i++){
                    arr.add(self.createThreeModel(i,model.title));
                }
            });JobsLog(@"LKL = %ld",model.childrenList.count);
        });
    };
}

-(JobsReturnGoodsClassModelByIntStringBlock _Nonnull)createThreeModel{
    return ^__kindof GoodsClassModel *_Nullable(int iflag,NSString *_Nullable string){
        return jobsMakeGoodsClassModel(^(GoodsClassModel * _Nullable model) {
            model.idField = toStringByInt(iflag);
            model.pid = toStringByInt(iflag);
            model.name = string.add(JobsDot)
                .add(JobsInternationalization(@"三级目录")).add(JobsDot)
                .add(toStringByInt(iflag));
        });
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(__kindof UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.leftCellDataMutArr.count;
}

-(__kindof UITableViewCell *)tableView:(__kindof UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBtnStyleTBVCell *cell = JobsBtnStyleTBVCell.cellStyleDefaultWithTableView(tableView);
    cell.contentEdgeInsets = jobsMakeSameEdgeInset(JobsWidth(3));
    cell.JobsRichViewByModel2(self.leftCellDataMutArr[indexPath.row]);
    return cell;
}

-(CGFloat)tableView:(__kindof UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return LeftCell.cellHeightByModel(nil);
}

-(void)tableView:(__kindof UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    self.actionBy(indexPath.row);
}
#pragma mark —— UICollectionViewDelegate,UICollectionViewDataSource
-(__kindof UICollectionViewCell *)collectionView:(__kindof UICollectionView *)collectionView
                          cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ThreeClassCell *cell = [ThreeClassCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    cell.minimumInteritemSpacing = JobsWidth(3);
    cell.cellCls = FMGameCVCell.class;
    cell.data = @(SourceType_Home);
    self.rightViewCurrentSelectModel = self.rightDataArray.objectAt(indexPath.section);
    cell.getCollectionHeight((NSMutableArray <NSObject *>*)self.rightViewCurrentSelectModel.childrenList);
    cell.JobsRichViewByModel2(self.rightDataArray);/// GoodsClassModel
    cell.reloadDatas();
//    @jobs_weakify(self)
    [cell actionObjBlock:^(GoodsClassModel *model) {
//        @jobs_strongify(self)
        toast(model.name);
        JobsLog(@"选中的id : %@", model.idField);
    }];return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(__kindof UICollectionView *)collectionView{
    return self.rightDataArray.count;
}

- (NSInteger)collectionView:(__kindof UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return 1;
}

- (__kindof UICollectionReusableView *)collectionView:(__kindof UICollectionView *)collectionView
                    viewForSupplementaryElementOfKind:(NSString *)kind
                                          atIndexPath:(NSIndexPath *)indexPath{
    if (kind.isEqualToString(UICollectionElementKindSectionHeader)){
        UICollectionReusableView *headerView = [collectionView UICollectionElementKindSectionHeaderClass:UICollectionReusableView.class
                                                                                            forIndexPath:indexPath];
        UILabel *label = headerView.viewWithTag(666);
        if (!label){
            label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
                label.frame = CGRectMake(10,
                                         20,
                                         headerView.width - 20.f,
                                         17.f);
                label.font = JobsFontBold(JobsWidth(12));
                label.textColor = JobsGrayColor;
                label.tag = 666;
            });headerView.addSubview(label);
        }
        
        GoodsClassModel *rightModel = self.rightDataArray.objectAt(indexPath.section);
        label.text = rightModel.name ? : JobsInternationalization(@"");
        
        return headerView;
    }else if (kind.isEqualToString(UICollectionElementKindSectionFooter)){
        /// 底部视图
        UICollectionReusableView *footView = [collectionView UICollectionElementKindSectionFooterClass:UICollectionReusableView.class
                                                                                          forIndexPath:indexPath];
        return footView;
    }return nil;
}

- (CGSize)collectionView:(__kindof UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.collectionView.width, JobsWidth(40.f));
}

- (CGSize)collectionView:(__kindof UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForFooterInSection:(NSInteger)section{
    return section == self.rightDataArray.count ? CGSizeMake(CGRectGetWidth(self.collectionView.frame), JobsWidth(40.f)) : CGSizeZero;
}

- (CGSize)collectionView:(__kindof UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.collectionView.width,
                      self.getCellHeight([self.rightDataArray objectAtIndex:indexPath.section].childrenList));
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView){
        @jobs_weakify(self)
        _tableView = self.addSubview(jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.dataLink(self);
            tableView.bounces = NO;
            tableView.backgroundColor = JobsClearColor;
            tableView.showsVerticalScrollIndicator = NO;
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            tableView.frame = CGRectMake(0,
                                          0,
                                          TableViewWidth,
                                          JobsWidth(300));
        }));
    }return _tableView;
}
/// BaseViewProtocol
@synthesize collectionView = _collectionView;
-(UICollectionView *)collectionView{
    if (!_collectionView){
        _collectionView = UICollectionView.initByLayout(jobsMakeVerticalCollectionViewFlowLayout(^(UICollectionViewFlowLayout * _Nullable data) {}));
        _collectionView.dataLink(self);
        _collectionView.frame = CGRectMake(self.tableView.right,
                                           self.tableView.top,
                                           JobsMainScreen_WIDTH() - self.tableView.width,
                                           JobsWidth(300));
        _collectionView.backgroundColor = ThreeClassCellBgCor;
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.registerCollectionViewClass();
//        collectionView.registerCollectionViewCellClass(ThreeClassCell.class);
//        collectionView.registerCollectionElementKindSectionHeaderClass(UICollectionReusableView.class);
//        collectionView.registerCollectionElementKindSectionFooterClass(UICollectionReusableView.class);
        self.addSubview(_collectionView);
    }return _collectionView;
}

-(ThreeClassCell *)tempCell{
    if (!_tempCell){
        _tempCell = jobsMakeThreeClassCell(^(__kindof ThreeClassCell * _Nullable cell) {
            cell.cellCls = FMGameCVCell.class;
            cell.data = @(SourceType_Home);
            cell.minimumInteritemSpacing = JobsWidth(3);
            cell.frame = CGRectMake(0,
                                    0,
                                    ThreeClassCell.cellSizeByModel(nil).width,
                                    ThreeClassCell.cellSizeByModel(nil).height);
        });
    }return _tempCell;
}

-(NSMutableArray<UIButtonModel *> *)leftCellDataMutArr{
    if(!_leftCellDataMutArr){
        @jobs_weakify(self)
        _leftCellDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <UIButtonModel *>* _Nullable arr) {
            @jobs_strongify(self)
            for (int i = 0; i < 16; i++) {
                arr.add(self.makeLeftCellDataByUnSelect(self.cellTitleMutArr[i]));
            }
        });
    }return _leftCellDataMutArr;
}

-(NSMutableArray<UIButtonModel *> *)cellDataMutArr{
    if (!_cellDataMutArr) {
        /// 装载假数据
        @jobs_weakify(self)
        _cellDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            @jobs_strongify(self)
            self.makeCellData(arr);
        });
    }return _cellDataMutArr;
}

-(NSMutableArray<NSString *> *)cellTitleMutArr{
    if(!_cellTitleMutArr){
        _cellTitleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>* _Nullable arr) {
            arr.add(@"BTG")
                .add(@"SA")
                .add(@"RTG")
                .add(@"RedTiger")
                .add(@"PP")
                .add(@"PG")
                .add(@"NLC")
                .add(@"NE")
                .add(@"KA")
                .add(@"JILI")
                .add(@"JDB")
                .add(@"FP")
                .add(@"FC")
                .add(@"Ezugi")
                .add(@"EVO")
                .add(@"CQ9");
        });
    }return _cellTitleMutArr;
}

-(NSMutableArray<GoodsClassModel *> *)leftDataArray{
    if (!_leftDataArray) {
        _leftDataArray = NSMutableArray.array;
    }return _leftDataArray;
}

-(NSMutableArray<GoodsClassModel *> *)rightDataArray{
    if (!_rightDataArray) {
        _rightDataArray = NSMutableArray.array;
    }return _rightDataArray;
}

@end
