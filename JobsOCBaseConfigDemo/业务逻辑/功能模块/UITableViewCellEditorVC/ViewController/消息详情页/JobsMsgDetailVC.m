//
//  JobsMsgDetailVC.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/7.
//

#import "JobsMsgDetailVC.h"

@interface JobsMsgDetailVC ()
/// UI
Prop_strong()UILabel *titleLab;
Prop_strong()UILabel *subTitleLab;
Prop_strong()UIButton *drawBtn;
Prop_strong()UILabel *lineLab;
Prop_strong()BaseButton *deleteBtn;
/// Data
Prop_strong()JobsMsgDataModel *msgDataModel;

@end

@implementation JobsMsgDetailVC

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        self.msgDataModel = self.viewModel.data;
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = JobsInternationalization(@"消息详情页");
    self.viewModel.textModel.font = UIFontWeightRegularSize(16);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
//    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @jobs_weakify(self)
    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
        @jobs_strongify(self)
//        data.add(UIBarButtonItem.initBy(self.shareBtn));
    });
    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
        @jobs_strongify(self)
        data.add(UIBarButtonItem.initBy(self.deleteBtn));
    });
    self.makeNavByAlpha(1);
    
    
    self.titleLab.alpha = 1;
    self.subTitleLab.alpha = 1;
    self.drawBtn.alpha = 1;
    self.lineLab.alpha = 1;
    self.textView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    JobsLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    JobsLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.text = self.msgDataModel.textModel.text;
            label.font = UIFontWeightBoldSize(16);
            label.textColor = HEXCOLOR(0x3D4A58);
            [self.view.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(28));
                make.left.equalTo(self.view).offset(JobsWidth(16));
                make.width.mas_equalTo(JobsWidth(217));
            }];label.makeLabelByShowingType(UILabelShowingType_05);
        });
    }return _titleLab;
}

-(UILabel *)subTitleLab{
    if (!_subTitleLab) {
        @jobs_weakify(self)
        _subTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.font = UIFontWeightRegularSize(12);
            label.text = self.msgDataModel.time;
            label.textColor = HEXCOLOR(0xB0B0B0);
            [self.view.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(12));
                make.left.equalTo(self.titleLab);
            }];label.makeLabelByShowingType(UILabelShowingType_01);
        });
    }return _subTitleLab;
}

-(UIButton *)drawBtn{
    if (!_drawBtn) {
        _drawBtn = UIButton.jobsInit()
        .jobsResetBtnTitle(self.msgDataModel.isDraw ? JobsSpace.add(JobsInternationalization(@"已领取")).add(JobsSpace) : JobsSpace.add(JobsInternationalization(@"领取")).add(JobsSpace))
        .jobsResetBtnTitleCor(HEXCOLOR(0xAE8330))
        .selectedStateTitleColorBy(HEXCOLOR(0x757575))
        .bgColorBy( HEXCOLOR(0xFFEABA))
        .jobsResetBtnTitleFont(UIFontWeightRegularSize(12));
        [self.view.addSubview(_drawBtn) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(40), JobsWidth(20)));
            make.right.equalTo(self.view).offset(JobsWidth(-16));
            make.top.equalTo(self.view).offset(JobsWidth(28));
        }];
    }return _drawBtn;
}

-(UILabel *)lineLab{
    if (!_lineLab) {
        @jobs_weakify(self)
        _lineLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.backgroundColor = HEXCOLOR(0xEAEBED);
            [self.view.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(343), JobsWidth(2)));
                make.centerX.equalTo(self.view);
                make.top.equalTo(self.subTitleLab.mas_bottom).offset(JobsWidth(24));
            }];
        });
    }return _lineLab;
}
@synthesize textView = _textView;
-(UITextView *)textView{
    if (!_textView) {
        @jobs_weakify(self)
        _textView = jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
            @jobs_strongify(self)
            textView.text = self.msgDataModel.subTextModel.text;
            textView.textColor = HEXCOLOR(0xB0B0B0);
            textView.font = UIFontWeightRegularSize(14);
            [self.view.addSubview(textView) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.view);
                make.top.equalTo(self.lineLab.mas_bottom).offset(JobsWidth(20));
                make.size.mas_equalTo(CGSizeMake(JobsWidth(343), JobsWidth(452)));
            }];
        });
    }return _textView;
}

-(BaseButton *)deleteBtn{
    if (!_deleteBtn) {
        @jobs_weakify(self)
        _deleteBtn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(1)
            .jobsResetBtnImage(@"APPLY NOW".img)
            .jobsResetBtnBgImage(@"APPLY NOW".img)
            .jobsResetBtnTitleCor(HEXCOLOR(0x3D4A58))
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(JobsInternationalization(@"删除"))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                self.backBtnClickEvent(x);
                if (self.objBlock) self.objBlock(self.msgDataModel);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
    }return _deleteBtn;
}

@end

