//
//  BaiShaETProjPopupView10.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/16.
//

#import "BaiShaETProjPopupView10.h"

@interface BaiShaETProjPopupView10 ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)BaseButton *closeBtn;
@property(nonatomic,strong)UIColor *cor;
@property(nonatomic,strong)BaseButton *cancelBtn;
@property(nonatomic,strong)BaseButton *sureBtn;
@property(nonatomic,strong)UIView *bgView;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;
@property(nonatomic,assign)NSInteger selectedIndex;

@end

@implementation BaiShaETProjPopupView10

#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_popupView10OnceToken = 0;
    static_popupView10 = nil;
}

static BaiShaETProjPopupView10 *static_popupView10 = nil;
static dispatch_once_t static_popupView10OnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_popupView10OnceToken, ^{
        static_popupView10 = BaiShaETProjPopupView10.new;
    });return static_popupView10;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsClearColor;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.dataMutArr = model.data;
        self.selectedIndex = model.index;
        MakeDataNull
        self.titleLab.alpha = 1;
        self.closeBtn.alpha = 1;
        self.bgView.alpha = 1;
        self.cancelBtn.alpha = 1;
        self.sureBtn.alpha = 1;
        [self.collectionView reloadData];
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(322));
    };
}
#pragma mark —— 一些公有方法
-(jobsByBOOLBlock)shakeCell{
    @jobs_weakify(self)
    return ^(BOOL start) {
        @jobs_strongify(self)
        for (UICollectionViewCell *cell in self.collectionView.visibleCells) {
            cell.抖动动画(start);
        }
    };
}
#pragma mark —— UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    JobsBtnStyleCVCell *cell = [JobsBtnStyleCVCell cellWithCollectionView:collectionView
                                                             forIndexPath:indexPath];
    cell.jobsRichElementsInCellWithModel(self.dataMutArr[indexPath.item]);
    if (indexPath.item == self.selectedIndex - 1) {
        cell.btn.backgroundColor = HEXCOLOR(0xFFEABA);
        cell.btn.jobsResetBtnTitleCor(HEXCOLOR(0xAE8330));
    }else{
        cell.btn.backgroundColor = HEXCOLOR(0xF3F3F3);
        cell.btn.jobsResetBtnTitleCor(HEXCOLOR(0x757575));
    }
    cell.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel *_Nullable data) {
        data.layerCor = JobsCor(@"#6E5600");
        data.jobsWidth = JobsWidth(1);
        data.cornerRadius = JobsBtnStyleCVCell.cellSizeByModel(nil).height / 2;
    }));
    return cell;
}

- (NSInteger)collectionView:(nonnull __kindof UICollectionView *)collectionView
numberOfItemsInSection:(NSInteger)section {
    return self.dataMutArr.count;
}

- (UICollectionReusableView *)collectionView:(__kindof UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    if (kind.isEqualToString(UICollectionElementKindSectionHeader)) {
        JobsHeaderFooterView *headerView = [collectionView UICollectionElementKindSectionHeaderClass:JobsHeaderFooterView.class
                                                                                        forIndexPath:indexPath];
        
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.textModel.text = JobsInternationalization(@"拖動按鈕迸行位置調整");
        viewModel.subTextModel.text = JobsInternationalization(@"");
        headerView.jobsRichViewByModel(viewModel);
        headerView.backgroundColor = HEXCOLOR(0xFFFCF7);
        
        [headerView.getTitleBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(headerView);
            make.top.equalTo(self.titleLab.mas_bottom);
            make.height.mas_equalTo(JobsWidth(20));
        }];return headerView;
    }else ReturnBaseCollectionReusableHeaderView;
}
#pragma mark —— UICollectionViewDelegate
/// 允许选中时，高亮
-(BOOL)collectionView:(__kindof UICollectionView *)collectionView
shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
/// 高亮完成后回调
-(void)collectionView:(__kindof UICollectionView *)collectionView
didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
/// 由高亮转成非高亮完成时的回调
-(void)collectionView:(__kindof UICollectionView *)collectionView
didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
/// 设置是否允许选中
-(BOOL)collectionView:(__kindof UICollectionView *)collectionView
shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
/// 设置是否允许取消选中
-(BOOL)collectionView:(__kindof UICollectionView *)collectionView
shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
/// 选中操作
- (void)collectionView:(__kindof UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    /**
     滚动到指定位置
     _collectionView.contentOffset = CGPointMake(0,-100);
     [_collectionView setContentOffset:CGPointMake(0, -200) animated:YES];// 只有在viewDidAppear周期 或者 手动触发才有效
     */
}
/// 取消选中操作
-(void)collectionView:(__kindof UICollectionView *)collectionView
didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
#pragma mark —— UICollectionViewDelegateFlowLayout
/// header 大小
- (CGSize)collectionView:(__kindof UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(16 + 12 + 8));
}

- (CGSize)collectionView:(__kindof UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(JobsWidth(106), JobsWidth(30));
}
/// 定义的是元素垂直之间的间距
- (CGFloat)collectionView:(__kindof UICollectionView *)collectionView
                   layout:(__kindof UICollectionViewLayout *)collectionViewLayout
    minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return JobsWidth(10);
}
/// 定义的是UICollectionViewScrollDirectionVertical下，元素水平之间的间距。
/// UICollectionViewScrollDirectionHorizontal下，垂直和水平正好相反
/// Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
- (CGFloat)collectionView:(__kindof UICollectionView *)collectionView
                   layout:(__kindof UICollectionViewLayout *)collectionViewLayout
    minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return JobsWidth(6);
}
/// 内间距
-(UIEdgeInsets)collectionView:(__kindof UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section {
    return jobsSameEdgeInset(JobsWidth(16));
}
#pragma mark ——  iOS9的新特性实现UICollectionViewCell拖拽
/// 开始移动的时候调用此方法，可以获取相应的datasource方法设置特殊的indexpath 能否移动,如果能移动返回的是YES ,不能移动返回的是NO
-(BOOL)beginInteractiveMovementForItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
/// 更新移动过程的位置
-(void)updateInteractiveMovementTargetPosition:(CGPoint)targetPosition{
    
}
/// 结束移动的时候调用此方法，collectionView 会响应相应的datasource方法，collectionView:moveItemAtIndexPath:toIndexPath: 我们可以在这个方法中将移动的数据源，与目标数据源交互位置。
-(void)endInteractiveMovement{
    
}
/// 取消移动的时候调用，会返回最原始的位置
-(void)cancelInteractiveMovement{
    
}
/// 在开始移动的时候会调用这个方法，如果有特殊的单元格不想被移动可以return NO， 如果没有限制就返回YES
-(BOOL)collectionView:(__kindof UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
/// 移动结束的时候会调用此datasource，想要拖拽完成之后数据正确必须实现此方法，使用新的路径更新数据源，如果不实现此方法，刚刚移动cell中的数据不会重新排列
-(void)collectionView:(__kindof UICollectionView *)collectionView
  moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath
          toIndexPath:(NSIndexPath *)destinationIndexPath{
    /**
     * sourceIndexPath 原始数据 indexpath
     * destinationIndexPath 移动到目标数据的 indexPath
     */
    UIViewModel *viewModel = self.dataMutArr[sourceIndexPath.item];
    [self.dataMutArr removeObject:viewModel];
    [self.dataMutArr insertObject:viewModel atIndex:destinationIndexPath.item];
#ifdef DEBUG
    NSMutableArray <UIViewModel *>*mutArr = NSMutableArray.array;
    for (UIViewModel *viewModel in self.dataMutArr) {
        mutArr.add(viewModel.textModel.text);
    }
    NSLog(@"%@",mutArr);
#endif
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize collectionView = _collectionView;
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = UICollectionView.initByLayout(self.verticalLayout);
        _collectionView.backgroundColor = JobsWhiteColor;
        _collectionView.dataLink(self);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.scrollEnabled = NO;
        
        _collectionView.registerCollectionViewClass();
        
        [self.bgView addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.bgView);
            make.width.mas_equalTo(BaiShaETProjPopupView10.viewSizeByModel(nil).width);
            make.height.mas_equalTo(200);// 需要动态添加
        }];
    
        {
            _collectionView.numberOfTouchesRequired = 1;
            _collectionView.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
            _collectionView.minimumPressDuration = 0.1;
            _collectionView.numberOfTouchesRequired = 1;
            _collectionView.allowableMovement = 1;
            _collectionView.userInteractionEnabled = YES;
            _collectionView.target = self;
            @jobs_weakify(self)
            _collectionView.longPressGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                                                UILongPressGestureRecognizer *_Nullable arg) {
                @jobs_strongify(self)
                self.shakeCell(YES);
                /// 获取此次点击的坐标，根据坐标获取cell对应的indexPath
                BaiShaETProjPopupView10 *popupView = (BaiShaETProjPopupView10 *)target;
                CGPoint point = [arg locationInView:popupView.collectionView];
                NSIndexPath *indexPath = [popupView.collectionView indexPathForItemAtPoint:point];
                //根据长按手势的状态进行处理。
                switch (arg.state) {
                    case UIGestureRecognizerStateBegan:
                        if (indexPath) {
                            /// 开始移动
                            [popupView.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
                        } break;// 当没有点击到cell的时候不进行处理
                    case UIGestureRecognizerStateChanged:
                        /// 移动过程中更新位置坐标
                        [popupView.collectionView updateInteractiveMovementTargetPosition:point];
                        break;
                    case UIGestureRecognizerStateEnded:
                        /// 停止移动调用此方法
                        [popupView.collectionView endInteractiveMovement];
                        break;
                    default:
                        /// 取消移动
                        [popupView.collectionView cancelInteractiveMovement];
                        break;
                }return nil;
            }];
            _collectionView.longPressGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
            _collectionView.tapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id  _Nullable weakSelf,
                                                                                          id  _Nullable arg) {
                NSLog(@"");
                @jobs_strongify(self)
                self.shakeCell(NO);
                return nil;
            }];_collectionView.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
        }
    }return _collectionView;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.userInteractionEnabled = YES;
            label.text = JobsInternationalization(@"全部分類");
            label.textAlignment = NSTextAlignmentCenter;
            label.backgroundColor = self.cor;
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self);
                make.centerX.equalTo(self);
                make.size.mas_equalTo(CGSizeMake(BaiShaETProjPopupView10.viewSizeByModel(nil).width, JobsWidth(44)));
            }];
            self.refresh();
            [label appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                                     cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
        });
    }return _titleLab;
}

-(BaseButton *)closeBtn{
    if (!_closeBtn) {
        _closeBtn = BaseButton.new;
        _closeBtn.jobsResetBtnBgImage(JobsIMG(@"关闭"));
        [self.titleLab addSubview:_closeBtn];
        [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(9.75f), JobsWidth(9.75f)));
            make.centerY.equalTo(self.titleLab);
            make.right.equalTo(self.titleLab.mas_right).offset(JobsWidth(-25.12));
        }];
        @jobs_weakify(self)
        [_closeBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            NSLog(@"关闭");
            @jobs_strongify(self)
            x.selected = !x.selected;
            self.cancelBtnActionForPopView(x);
            self.shakeCell(NO);
            return nil;
        }];
    }return _closeBtn;
}

-(BaseButton *)cancelBtn{
    if (!_cancelBtn) {
        @jobs_weakify(self)
        _cancelBtn = BaseButton
            .initByStyle3(JobsInternationalization(@"恢复默认"),
                          UIFontWeightRegularSize(18)
                          ,HEXCOLOR(0xB0B0B0)
                          ,JobsIMG(@"弹窗取消按钮"))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                x.selected = !x.selected;
                self.cancelBtnActionForPopView(x);
                self.shakeCell(NO);
            })
            .onLongPressGesture(^(id data){
                NSLog(@"");
            });
        [self.bgView addSubview:_cancelBtn];
        [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(JobsWidth(-26));
            make.left.equalTo(self).offset(JobsWidth(24));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(120), JobsWidth(40)));
        }];
    }return _cancelBtn;
}

-(BaseButton *)sureBtn{
    if (!_sureBtn) {
        @jobs_weakify(self)
        _sureBtn = BaseButton
            .initByStyle3(JobsInternationalization(@"完成")
                          ,UIFontWeightRegularSize(18)
                          ,JobsBlackColor
                          ,JobsIMG(@"弹窗提交按钮"))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                x.selected = !x.selected;
                self.cancelBtnActionForPopView(self.dataMutArr);
                self.shakeCell(NO);
            })
            .onLongPressGesture(^(id data){
                NSLog(@"");
            });
        [self.bgView addSubview:_sureBtn];
        [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(JobsWidth(-26));
            make.right.equalTo(self).offset(JobsWidth(-24));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(120), JobsWidth(40)));
        }];
    }return _sureBtn;
}

-(UIView *)bgView{
    if (!_bgView) {
        @jobs_weakify(self)
        _bgView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view.backgroundColor = JobsWhiteColor;
            self.addSubview(view);
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(BaiShaETProjPopupView10.viewSizeByModel(nil).width, BaiShaETProjPopupView10.viewSizeByModel(nil).height - JobsWidth(44)));
                make.centerX.equalTo(self);
                make.top.equalTo(self.titleLab.mas_bottom);
            }];
        });
    }return _bgView;
}

-(UIColor *)cor{
    if (!_cor) {
        _cor = [UIColor gradientCorDataMutArr:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(HEXCOLOR(0xFFEABA));
            data.add(HEXCOLOR(0xF2CD7A));
        })
                                   startPoint:CGPointZero
                                     endPoint:CGPointZero
                                       opaque:NO
                               targetViewRect:CGRectMake(0,
                                                         0,
                                                         BaiShaETProjPopupView10.viewSizeByModel(nil).width,
                                                         JobsWidth(44))];
    }return _cor;
}

@end
