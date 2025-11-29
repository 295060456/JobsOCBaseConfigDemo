//
//  BaiShaETProjCollectionHeaderView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/10.
//

#import "BaiShaETProjCollectionHeaderView.h"

@interface BaiShaETProjCollectionHeaderView ()
/// UI
Prop_strong()UIButton *userHeaderBtn;
Prop_strong()UIProgressView *progressView;
Prop_strong()UILabel *leftLab;
Prop_strong()UILabel *rightLab;
Prop_strong()JobsAnimationLabel *animationLab;
/// Data
Prop_strong()NSMutableArray <NSString *>*richTextMutArr;
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;

Prop_strong()NSMutableArray <NSMutableArray <NSString *>*>*richTextMutArr2;
Prop_strong()NSMutableArray <NSMutableArray <JobsRichTextConfig *>*>*richTextConfigMutArr2;

@end

@implementation BaiShaETProjCollectionHeaderView
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
/// UIViewModelProtocol
@synthesize imageViewFrame = _imageViewFrame;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_collectionHeaderViewOnceToken = 0;
    static_collectionHeaderView = nil;
}

static BaiShaETProjCollectionHeaderView *static_collectionHeaderView = nil;
static dispatch_once_t static_collectionHeaderViewOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_collectionHeaderViewOnceToken, ^{
        static_collectionHeaderView = BaiShaETProjCollectionHeaderView.new;
    });return static_collectionHeaderView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— UIScrollViewDelegate
- (void)scrollViewDidScrollWithContentOffsetY:(CGFloat)contentOffsetY {
    if (self.isZoom) {
//        CGRect frame = self.imageViewFrame;
//        frame.size.height -= contentOffsetY;
//        frame.origin.y = contentOffsetY;
//        self.imageView.frame = frame;
    }
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsRedColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        MakeDataNull
        self.userHeaderBtn.byVisible(YES);
        self.progressView.byVisible(YES);
        self.animationLab.byVisible(YES);
        self.leftLab.byVisible(YES);
        self.rightLab.byVisible(YES);
        self.tableView.byShow(self);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(190));
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(JobsWidth(58) / self.dataMutArr.count);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsBaseTableViewCell.cellStyleValue1WithTableView(tableView)
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .byIndexPath(indexPath)
        .byContentViewBgCor(HEXCOLOR(0xFFFCF7))
        .byTextLabelTextCor(HEXCOLOR(0x757575))
        .byTextLabelFrameOffsetY(JobsWidth(-2))
        .byDetailTextLabelOffsetY(JobsWidth(-2))
        .byTextLabelFont(UIFontWeightRegularSize(16))
        .jobsRichElementsTableViewCellBy(self.dataMutArr[indexPath.row])
        .JobsBlock1(^(id _Nullable data) {
             
        }).byBgColor(HEXCOLOR(0xFFFCF7));
}
#pragma mark —— lazyLoad
-(UIButton *)userHeaderBtn{
    if (!_userHeaderBtn) {
        @jobs_weakify(self)
        _userHeaderBtn = UIButton.jobsInit()
        .jobsResetBtnTitle(self.readUserInfo.userName
                                         .add(JobsSpace)
                                         .add(@"VIP".tr.add(JobsSpace).add(@"0")))
        .jobsResetBtnImage(@"默认头像".img)
        .jobsResetBtnTitleCor(HEXCOLOR(0xAE8330))
        .jobsResetBtnTitleFont(UIFontWeightBoldSize(16));
        JobsLog(@"%@",_userHeaderBtn.titleForNormalState);
        [self.addSubview(_userHeaderBtn) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(JobsWidth(43));
        }];
        _userHeaderBtn.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable model) {
            @jobs_strongify(self)
            model.jobsWidth = 1.f;
            model.layerCor = HEXCOLOR(0xEEE2C8);
            model.cornerRadiusValue = self->_userHeaderBtn.imageView.image.jobsHeight / 2;
        }));
        _userHeaderBtn.imageTitleSpace = JobsWidth(12);
        _userHeaderBtn.makeBtnTitleByShowingType(UILabelShowingType_05);
        _userHeaderBtn.jobsResetImagePlacement_Padding(NSDirectionalRectEdgeTop,_userHeaderBtn.imageTitleSpace);
    }return _userHeaderBtn;
}

-(UIProgressView *)progressView{
    if (!_progressView) {
        @jobs_weakify(self)
        jobsMakeProgressView(^(__kindof UIProgressView * _Nullable progressView) {
            @jobs_strongify(self)
            [progressView
                .byProgressTintColor(HEXCOLOR(0xAE8330))
                .byTrackTintColor(HEXCOLOR(0xEEE2C8))
                .byProgressViewStyle(UIProgressViewStyleDefault)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.height.mas_equalTo(JobsWidth(4));
                    make.width.mas_equalTo(JobsWidth(343));
                    make.centerX.equalTo(self);
                    make.top.equalTo(self.userHeaderBtn.mas_bottom).offset(JobsWidth(58));
                }) animateWithDuration:1 progress:0.8];
        });
    }return _progressView;
}

-(JobsAnimationLabel *)animationLab{
    if (!_animationLab) {
        _animationLab = JobsAnimationLabel.new.byTextCor(JobsBlackColor);
        _animationLab.value = 12;
        _animationLab.lastValue = 19.93;
        @jobs_weakify(self)
        [_animationLab animationTextStartValue:_animationLab.value
                                      endValue:_animationLab.lastValue
                                      duration:1.0
                                      complete:^(UILabel *label, CGFloat value) {
            @jobs_strongify(self)
            if (self.richTextMutArr.count > 2) [self.richTextMutArr removeObjectAtIndex:1];
            [self.richTextMutArr insertObject:[NSString stringWithFormat:@"%f", value] atIndex:1];
            label.attributedText = [self richTextWithDataConfigMutArr:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
                data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                    @jobs_strongify(self)
                    data1.font = UIFontWeightRegularSize(12);
                    data1.textCor = HEXCOLOR(0x3D4A58);
                    data1.targetString = self.richTextMutArr[0];
                }))
                .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                    @jobs_strongify(self)
                    data1.font = UIFontWeightBoldSize(18);
                    data1.textCor = HEXCOLOR(0x3D4A58);
                    data1.targetString = self.richTextMutArr[1];
                }))
                .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                    @jobs_strongify(self)
                    data1.font = UIFontWeightRegularSize(12);
                    data1.textCor = HEXCOLOR(0x3D4A58);
                    data1.targetString = self.richTextMutArr[2];
                }));
            })paragraphStyle:nil];
            
            label.value = value;
            label.lastValue = (label.value * 3);
        }];
        _animationLab.addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.bottom.equalTo(self.progressView).offset(JobsWidth(-12));
                make.left.equalTo(self.progressView);
            });
    }return _animationLab;
}

-(UILabel *)leftLab{
    if (!_leftLab) {
        @jobs_weakify(self)
        _leftLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(@"Lv".tr.add(@" ").add(@"0"))
            .byTextCor(HEXCOLOR(0x757575))
            .byFont(UIFontWeightRegularSize(12))
            .byTextAlignment(NSTextAlignmentCenter)
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.left.equalTo(self.animationLab);
                make.top.equalTo(self.animationLab.mas_bottom).offset(JobsWidth(22));
                make.height.mas_equalTo(JobsWidth(12));
            })
            .makeLabelByShowingType(UILabelShowingType_03);
        });
    }return _leftLab;
}

-(UILabel *)rightLab{
    if (!_rightLab) {
        @jobs_weakify(self)
        _rightLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(@"Lv".tr.add(@" ").add(@"1"))
                .byTextCor(HEXCOLOR(0x757575))
                .byTextAlignment(NSTextAlignmentCenter)
                .byFont(UIFontWeightRegularSize(12))
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.right.equalTo(self).offset(JobsWidth(-16));
                    make.top.equalTo(self.animationLab.mas_bottom).offset(JobsWidth(22));
                    make.height.mas_equalTo(JobsWidth(12));
                })
                .makeLabelByShowingType(UILabelShowingType_03);
        });
    }return _rightLab;
}
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .byRegisterTableViewClass(nil)
                .bySeparatorColor(HEXCOLOR(0xEEEEEE))
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .byShowsVerticalScrollIndicator(NO)
                .byScrollEnabled(YES)
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsWhiteColor)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.centerX.equalTo(self);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(343), JobsWidth(58)));
                    make.bottom.equalTo(self).offset(JobsWidth(-24));
                });
        });
    }return _tableView;
}

-(NSMutableArray<NSString *> *)richTextMutArr{
    if (!_richTextMutArr) {
        _richTextMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(@"當前晉級進度".tr).add(JobsSpace.add(JobsPercent));
        });
    }return _richTextMutArr;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        @jobs_weakify(self)
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                @jobs_strongify(self)
                data1.textModel.text = @"當前存款".tr;
                data1.subTextModel.attributedTitle = [self richTextWithDataConfigMutArr:self.richTextConfigMutArr2[0]
                                                                        paragraphStyle:nil];
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                @jobs_strongify(self)
                data1.textModel.text = @"當前流水".tr;
                data1.subTextModel.attributedTitle = [self richTextWithDataConfigMutArr:self.richTextConfigMutArr2[1]
                                                                        paragraphStyle:nil];
            }));
        });
    }return _dataMutArr;
}

-(NSMutableArray<NSMutableArray<NSString *>*>*)richTextMutArr2{
    if (!_richTextMutArr2) {
        _richTextMutArr2 = jobsMakeMutArr(^(__kindof NSMutableArray <NSMutableArray<NSString *>*>*_Nullable data) {
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data1) {
                data1.add(@"7.00 ").add(@"/ ".add(@"40,000.00"));
            }))
            .add(jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data1) {
                data1.add(@"1.00 ").add(@"/ ".add(@"20,000.00"));
            }));
        });
    }return _richTextMutArr2;
}

-(NSMutableArray<NSMutableArray<JobsRichTextConfig *> *> *)richTextConfigMutArr2{
    if (!_richTextConfigMutArr2) {
        @jobs_weakify(self)
        _richTextConfigMutArr2 = jobsMakeMutArr(^(__kindof NSMutableArray <JobsRichTextConfig *>*_Nullable data) {
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data1) {
                data1.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data2) {
                    @jobs_strongify(self)
                    data2.font = UIFontWeightRegularSize(12);
                    data2.textCor = HEXCOLOR(0x3D4A58);
                    data2.targetString = self.richTextMutArr2[0][0];
                }))
                .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data2) {
                    @jobs_strongify(self)
                    data2.font = UIFontWeightBoldSize(12);
                    data2.textCor = HEXCOLOR(0x3D4A58);
                    data2.targetString = self.richTextMutArr2[0][1];
                }));
            }));
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray <JobsRichTextConfig *>*_Nullable data1) {
                data1.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data2) {
                    @jobs_strongify(self)
                    data2.font = UIFontWeightRegularSize(12);
                    data2.textCor = HEXCOLOR(0x3D4A58);
                    data2.targetString = self.richTextMutArr2[1][0];
                }))
                .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data2) {
                    @jobs_strongify(self)
                    data2.font = UIFontWeightBoldSize(12);
                    data2.textCor = HEXCOLOR(0x3D4A58);
                    data2.targetString = self.richTextMutArr2[1][1];
                }));
            }));
        });
    }return _richTextConfigMutArr2;
}

@end
