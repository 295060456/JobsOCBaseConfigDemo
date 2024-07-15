//
//  BaiShaETProjCollectionHeaderView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/10.
//

#import "BaiShaETProjCollectionHeaderView.h"

@interface BaiShaETProjCollectionHeaderView ()
/// UI
@property(nonatomic,strong)UIButton *userHeaderBtn;
@property(nonatomic,strong)UIProgressView *progressView;
@property(nonatomic,strong)UILabel *leftLab;
@property(nonatomic,strong)UILabel *rightLab;
@property(nonatomic,strong)JobsAnimationLabel *animationLab;
@property(nonatomic,strong)UITableView *tableView;
/// Data
@property(nonatomic,assign)CGRect imageViewFrame;
@property(nonatomic,strong)NSMutableAttributedString *attributedStringData;
@property(nonatomic,strong)NSMutableArray <NSString *>*richTextMutArr;
@property(nonatomic,strong)NSMutableArray <RichTextConfig *>*richTextConfigMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;

@property(nonatomic,strong)NSMutableArray <NSMutableArray <NSString *>*>*richTextMutArr2;
@property(nonatomic,strong)NSMutableArray <NSMutableArray <RichTextConfig *>*>*richTextConfigMutArr2;

@end

@implementation BaiShaETProjCollectionHeaderView

@synthesize viewModel = _viewModel;

#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_collectionHeaderViewOnceToken = 0;
    static_collectionHeaderView = nil;
}

static BaiShaETProjCollectionHeaderView *static_collectionHeaderView = nil;
static dispatch_once_t static_collectionHeaderViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_collectionHeaderViewOnceToken, ^{
        static_collectionHeaderView = BaiShaETProjCollectionHeaderView.new;
    });return static_collectionHeaderView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = UIColor.whiteColor;
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
        self.backgroundColor = UIColor.redColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    MakeDataNull
    self.userHeaderBtn.alpha = 1;
    self.progressView.alpha = 1;
    self.animationLab.alpha = 1;
    self.leftLab.alpha = 1;
    self.rightLab.alpha = 1;
    
    self.tableView.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(190));
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(58 / self.dataMutArr.count);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)[JobsBaseTableViewCell cellStyleValue1WithTableView:tableView];
    
    cell.textLabelFrameOffsetY -= JobsWidth(2);
    cell.detailTextLabelOffsetY -= JobsWidth(2);
    
    cell.contentView.backgroundColor = cell.backgroundColor = HEXCOLOR(0xFFFCF7);
    [cell richElementsInCellWithModel:self.dataMutArr[indexPath.row]];
    return cell;
}
#pragma mark —— lazyLoad
-(UIButton *)userHeaderBtn{
    if (!_userHeaderBtn) {
        _userHeaderBtn = UIButton.new;
        _userHeaderBtn.normalTitle = [self.readUserInfo.userName stringByAppendingString:JobsInternationalization(@"    VIP 0")];
        NSLog(@"%@",_userHeaderBtn.titleForNormalState);
        _userHeaderBtn.normalImage = JobsIMG(@"默认头像");
        _userHeaderBtn.normalTitleColor = HEXCOLOR(0xAE8330);
        _userHeaderBtn.titleFont = notoSansBold(16);
        [self addSubview:_userHeaderBtn];
        [_userHeaderBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(JobsWidth(43));
        }];
        [_userHeaderBtn.imageView cornerCutToCircleWithCornerRadius:_userHeaderBtn.imageView.image.jobsHeight / 2];
        [_userHeaderBtn.imageView layerBorderCor:HEXCOLOR(0xEEE2C8) andBorderWidth:JobsWidth(1)];
        
        _userHeaderBtn.imageTitleSpace = JobsWidth(12);
        [_userHeaderBtn makeBtnLabelByShowingType:UILabelShowingType_05];
        [_userHeaderBtn layoutButtonWithEdgeInsetsStyle:NSDirectionalRectEdgeTop
                                           imagePadding:_userHeaderBtn.imageTitleSpace];
        
    }return _userHeaderBtn;
}

-(UIProgressView *)progressView{
    if (!_progressView) {
        _progressView = UIProgressView.new;
        _progressView.progressTintColor = HEXCOLOR(0xAE8330);
        _progressView.trackTintColor = HEXCOLOR(0xEEE2C8);
        _progressView.progressViewStyle = UIProgressViewStyleDefault;
        [self addSubview:_progressView];
        [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(4));
            make.width.mas_equalTo(JobsWidth(343));
            make.centerX.equalTo(self);
            make.top.equalTo(self.userHeaderBtn.mas_bottom).offset(JobsWidth(58));
        }];
        [_progressView animateWithDuration:1
                                  progress:0.8];
    }return _progressView;
    
}

-(JobsAnimationLabel *)animationLab{
    if (!_animationLab) {
        _animationLab = JobsAnimationLabel.new;
        _animationLab.textColor = JobsBlackColor;

        _animationLab.value = 12;
        _animationLab.lastValue = 19.93;
        @jobs_weakify(self)
        [_animationLab animationTextStartValue:_animationLab.value
                                      endValue:_animationLab.lastValue
                                      duration:1.0
                                      complete:^(UILabel *label, CGFloat value) {
            @jobs_strongify(self)
            if (self.richTextMutArr.count > 2) {
                [self.richTextMutArr removeObjectAtIndex:1];
            }
            [self.richTextMutArr insertObject:[NSString stringWithFormat:@"%f", value] atIndex:1];
            
            label.attributedText = self.attributedStringData;
            
            label.value = value;
            label.lastValue = (label.value * 3);
        }];
        
        [self addSubview:_animationLab];
        [_animationLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.progressView).offset(JobsWidth(-12));
            make.left.equalTo(self.progressView);
        }];
    }return _animationLab;
}

-(UILabel *)leftLab{
    if (!_leftLab) {
        _leftLab = UILabel.new;
        _leftLab.text = JobsInternationalization(@"Lv 0");
        _leftLab.textColor = HEXCOLOR(0x757575);
        _leftLab.font = notoSansRegular(12);
        _leftLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_leftLab];
        [_leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.animationLab);
            make.top.equalTo(self.animationLab.mas_bottom).offset(JobsWidth(22));
            make.height.mas_equalTo(JobsWidth(12));
        }];
        [_leftLab makeLabelByShowingType:UILabelShowingType_03];
    }return _leftLab;
}

-(UILabel *)rightLab{
    if (!_rightLab) {
        _rightLab = UILabel.new;
        _rightLab.text = JobsInternationalization(@"Lv 1");
        _rightLab.textColor = HEXCOLOR(0x757575);
        _rightLab.textAlignment = NSTextAlignmentCenter;
        _rightLab.font = notoSansRegular(12);
        [self addSubview:_rightLab];
        [_rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(JobsWidth(-16));
            make.top.equalTo(self.animationLab.mas_bottom).offset(JobsWidth(22));
            make.height.mas_equalTo(JobsWidth(12));
        }];
        [_rightLab makeLabelByShowingType:UILabelShowingType_03];
    }return _rightLab;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.initWithStylePlain;
        _tableView.backgroundColor = JobsWhiteColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = YES;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.separatorColor = HEXCOLOR(0xEEEEEE);
        [_tableView registerTableViewClass];
        if(@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(343), JobsWidth(58)));
            make.bottom.equalTo(self).offset(JobsWidth(-24));
        }];

    }return _tableView;
}

-(NSMutableAttributedString *)attributedStringData{
    if (!_attributedStringData) {
        _attributedStringData = [self richTextWithDataConfigMutArr:self.richTextConfigMutArr
                                                    paragraphStyle:nil];
    }return _attributedStringData;
}

-(NSMutableArray<NSString *> *)richTextMutArr{
    if (!_richTextMutArr) {
        _richTextMutArr = NSMutableArray.array;
        [_richTextMutArr addObject:JobsInternationalization(@"當前晉級進度")];
        [_richTextMutArr addObject:JobsInternationalization(@" %")];
    }return _richTextMutArr;
}

-(NSMutableArray<RichTextConfig *> *)richTextConfigMutArr{
    if (!_richTextConfigMutArr) {
        _richTextConfigMutArr = NSMutableArray.array;

        RichTextConfig *config_01 = RichTextConfig.new;
        config_01.font = notoSansRegular(12);
        config_01.textCor = HEXCOLOR(0x3D4A58);
        config_01.targetString = self.richTextMutArr[0];
        [_richTextConfigMutArr addObject:config_01];

        RichTextConfig *config_02 = RichTextConfig.new;
        config_02.font = notoSansBold(18);
        config_02.textCor = HEXCOLOR(0x3D4A58);
        config_02.targetString = self.richTextMutArr[1];
        [_richTextConfigMutArr addObject:config_02];
        
        RichTextConfig *config_03 = RichTextConfig.new;
        config_03.font = notoSansRegular(12);
        config_03.textCor = HEXCOLOR(0x3D4A58);
        config_03.targetString = self.richTextMutArr[2];
        [_richTextConfigMutArr addObject:config_03];

    }return _richTextConfigMutArr;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = JobsInternationalization(@"當前存款");
            viewModel.subTextModel.attributedText = [self richTextWithDataConfigMutArr:self.richTextConfigMutArr2[0]
                                                                        paragraphStyle:nil];
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = JobsInternationalization(@"當前流水");
            viewModel.subTextModel.attributedText = [self richTextWithDataConfigMutArr:self.richTextConfigMutArr2[1]
                                                                        paragraphStyle:nil];
            [_dataMutArr addObject:viewModel];
        }
    }return _dataMutArr;
}

-(NSMutableArray<NSMutableArray<NSString *> *> *)richTextMutArr2{
    if (!_richTextMutArr2) {
        _richTextMutArr2 = NSMutableArray.array;
        {
            NSMutableArray *mutArr = NSMutableArray.array;
            [mutArr addObject:JobsInternationalization(@"7.00 ")];
            [mutArr addObject:JobsInternationalization(@"/ 40,000.00")];
            [_richTextMutArr2 addObject:mutArr];
        }
        
        {
            NSMutableArray *mutArr = NSMutableArray.array;
            [mutArr addObject:JobsInternationalization(@"1.00 ")];
            [mutArr addObject:JobsInternationalization(@"/ 20,000.00")];
            [_richTextMutArr2 addObject:mutArr];
        }
    }return _richTextMutArr2;
}

-(NSMutableArray<NSMutableArray<RichTextConfig *> *> *)richTextConfigMutArr2{
    if (!_richTextConfigMutArr2) {
        _richTextConfigMutArr2 = NSMutableArray.array;
        {
            NSMutableArray *mutArr = NSMutableArray.array;
            RichTextConfig *config_01 = RichTextConfig.new;
            config_01.font = notoSansRegular(12);
            config_01.textCor = HEXCOLOR(0x3D4A58);
            config_01.targetString = self.richTextMutArr2[0][0];
            [mutArr addObject:config_01];

            RichTextConfig *config_02 = RichTextConfig.new;
            config_02.font = notoSansBold(12);
            config_02.textCor = HEXCOLOR(0x3D4A58);
            config_02.targetString = self.richTextMutArr2[0][1];
            [mutArr addObject:config_02];
            
            [_richTextConfigMutArr2 addObject:mutArr];
        }
        
        {
            NSMutableArray *mutArr = NSMutableArray.array;
            RichTextConfig *config_01 = RichTextConfig.new;
            config_01.font = notoSansRegular(12);
            config_01.textCor = HEXCOLOR(0x3D4A58);
            config_01.targetString = self.richTextMutArr2[1][0];
            [mutArr addObject:config_01];

            RichTextConfig *config_02 = RichTextConfig.new;
            config_02.font = notoSansBold(12);
            config_02.textCor = HEXCOLOR(0x3D4A58);
            config_02.targetString = self.richTextMutArr2[1][1];
            [mutArr addObject:config_02];
            
            [_richTextConfigMutArr2 addObject:mutArr];
        }
    }return _richTextConfigMutArr2;
}

@end
