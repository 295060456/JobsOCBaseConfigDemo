//
//  TestLabelVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/18.
//

#import "TestLabelVC.h"

@interface TestLabelVC ()
/// UILabel
@property(nonatomic,strong)BaseLabel *lab1;///【UILabelShowingType_01】 一行显示。定宽、定字体。多余部分用…表示（省略号的位置由NSLineBreakMode控制）
@property(nonatomic,strong)BaseLabel *lab2;///【UILabelShowingType_02】 一行显示普通文本。定宽、定字体。多余部分scrollerView ❤️集成@implementation UILabel (AutoScroll)❤️
@property(nonatomic,strong)BaseLabel *lab3;///【UILabelShowingType_03】 一行显示普通文本。定字体，不定宽。宽度自适应
@property(nonatomic,strong)BaseLabel *lab4;///【UILabelShowingType_04】 一行显示普通文本。缩小字体方式全展示
@property(nonatomic,strong)BaseLabel *lab5;///【UILabelShowingType_05】 多行显示普通文本，自动提行。定宽、定字体
@property(nonatomic,strong)BaseLabel *lab6;///【UILabelShowingType_05】 多行显示普通文本，手动\n提行。定宽、定字体
@property(nonatomic,strong)BaseLabel *lab7;///【UILabelShowingType_05】 多行显示富文本，手动\n提行。定宽、定字体
/// UIButton
@property(nonatomic,strong)BaseButton *btn1;///【UILabelShowingType_01】 一行显示普通文本。定宽、定字体。多余部分用…表示（省略号的位置由NSLineBreakMode控制）
@property(nonatomic,strong)BaseButton *btn2;///【UILabelShowingType_02】 一行显示普通文本。定宽、定字体。多余部分scrollerView ❤️集成@implementation UILabel (AutoScroll)❤️
@property(nonatomic,strong)BaseButton *btn3;///【UILabelShowingType_03】 一行显示普通文本。定字体，不定宽。宽度自适应
@property(nonatomic,strong)BaseButton *btn4;///【UILabelShowingType_04】 一行显示普通文本。缩小字体方式全展示
@property(nonatomic,strong)BaseButton *btn5;///【UILabelShowingType_05】 多行显示普通文本，自动提行。定宽、定字体
@property(nonatomic,strong)BaseButton *btn6;///【UILabelShowingType_05】 多行显示普通文本，手动\n提行。定宽、定字体
@property(nonatomic,strong)BaseButton *btn7;///【UILabelShowingType_05】 多行显示富文本，手动\n提行。定宽、定字体

@end

@implementation TestLabelVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
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
    self.view.backgroundColor = JobsYellowColor;
    self.makeNavByAlpha(1);
    
    self.scrollView.alpha = 1;
    
    self.lab1.makeLabelByShowingType(UILabelShowingType_01);
    self.lab2.makeLabelByShowingType(UILabelShowingType_02);
    self.lab3.makeLabelByShowingType(UILabelShowingType_03);
    self.lab4.makeLabelByShowingType(UILabelShowingType_04);
    self.lab5.makeLabelByShowingType(UILabelShowingType_05);
    self.lab6.makeLabelByShowingType(UILabelShowingType_05);
    self.lab7.makeLabelByShowingType(UILabelShowingType_05);
    
    self.btn1.makeBtnTitleByShowingType(UILabelShowingType_01);
    self.btn2.makeBtnTitleByShowingType(UILabelShowingType_02);
    self.btn3.makeBtnTitleByShowingType(UILabelShowingType_03);
    self.btn4.makeBtnTitleByShowingType(UILabelShowingType_04);
    self.btn5.makeBtnTitleByShowingType(UILabelShowingType_05);
    self.btn6.makeBtnTitleByShowingType(UILabelShowingType_05);
    self.btn7.makeBtnTitleByShowingType(UILabelShowingType_05);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize scrollView = _scrollView;
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        @jobs_weakify(self)
        _scrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            @jobs_strongify(self)
            scrollView.contentSize = CGSizeMake(JobsMainScreen_WIDTH(), 2 * JobsMainScreen_HEIGHT());
            [self.view addSubview:scrollView];
            [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
                make.left.right.bottom.equalTo(self.view);
            }];
        });
    }return _scrollView;
}
#pragma mark —— 富文本
@synthesize attributedTitle = _attributedTitle;
-(NSAttributedString *)attributedTitle{
    if (!_attributedTitle) {
        @jobs_weakify(self)
        _attributedTitle = self.richTextWithDataConfigMutArr(jobsMakeMutArr(^(__kindof NSMutableArray <JobsRichTextConfig *>*_Nullable data) {
            data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                @jobs_strongify(self)
                data1.font = UIFontWeightRegularSize(JobsWidth(12));
                data1.textCor = JobsBlueColor;
                data1.targetString = JobsInternationalization(@"编译器自动管理内存地址").add(@"\n");
                data1.textBgCor = JobsBrownColor;
                data1.paragraphStyle = self.defaultParagraphStyle;
            }));
            data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                data1.font = UIFontWeightSemiboldSize(JobsWidth(13));
                data1.textCor = JobsWhiteColor;
                data1.targetString = JobsInternationalization(@"让程序员更加专注于").add(@"\n");
                data1.textBgCor = JobsBrownColor;
                data1.paragraphStyle = self.defaultParagraphStyle;
            }));
            data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                @jobs_strongify(self)
                data1.font = UIFontWeightUltraLightSize(JobsWidth(14));
                data1.textCor = JobsGreenColor;
                data1.targetString = JobsInternationalization(@"APP的业务。");
                data1.textBgCor = JobsBrownColor;
                data1.paragraphStyle = self.defaultParagraphStyle;
            }));
        }));
    }return _attributedTitle;
}
#pragma mark —— BaseLabel
/// 一行显示普通文本。定宽、定高、定字体。多余部分用…表示（省略号的位置由NSLineBreakMode控制）
-(BaseLabel *)lab1{
    if (!_lab1) {
        @jobs_weakify(self)
        _lab1 = jobsMakeBaseLabel(^(__kindof BaseLabel * _Nullable label) {
            @jobs_strongify(self)
            label.backgroundColor = JobsRedColor;
            label.text = JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。");
            [self.scrollView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(100, 20));
                make.top.equalTo(self.scrollView).offset(20);
                make.centerX.equalTo(self.scrollView);
            }];
        });
    }return _lab1;
}
/// 一行显示普通文本。定宽、定高、定字体。多余部分scrollerView ❤️集成@implementation UILabel (AutoScroll)❤️
-(BaseLabel *)lab2{
    if (!_lab2) {
        @jobs_weakify(self)
        _lab2 = jobsMakeBaseLabel(^(__kindof BaseLabel * _Nullable label) {
            @jobs_strongify(self)
            label.backgroundColor = JobsRedColor;
            label.text = JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。");
            [self.scrollView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(100, 20));
                make.top.equalTo(self.lab1.mas_bottom).offset(20);
                make.centerX.equalTo(self.scrollView);
            }];
        });
    }return _lab2;
}
/// 一行显示普通文本。不定宽、定高、定字体。宽度自适应
-(BaseLabel *)lab3{
    if (!_lab3) {
        @jobs_weakify(self)
        _lab3 = jobsMakeBaseLabel(^(__kindof BaseLabel * _Nullable label) {
            @jobs_strongify(self)
            label.backgroundColor = JobsRedColor;
            label.text = JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。");
            [self.scrollView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(20);
                make.top.equalTo(self.lab2.mas_bottom).offset(20);
                make.centerX.equalTo(self.scrollView);
            }];
        });
    }return _lab3;
}
/// 一行显示普通文本。定宽、定高。缩小字体方式全展示
-(BaseLabel *)lab4{
    if (!_lab4) {
        @jobs_weakify(self)
        _lab4 = jobsMakeBaseLabel(^(__kindof BaseLabel * _Nullable label) {
            @jobs_strongify(self)
            label.backgroundColor = JobsRedColor;
            label.text = JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。");
            [self.scrollView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(100, 20));
                make.top.equalTo(self.lab3.mas_bottom).offset(20);
                make.centerX.equalTo(self.scrollView);
            }];
        });
    }return _lab4;
}
/// 多行显示普通文本。定宽、不定高、定字体
-(BaseLabel *)lab5{
    if (!_lab5) {
        @jobs_weakify(self)
        _lab5 = jobsMakeBaseLabel(^(__kindof BaseLabel * _Nullable label) {
            @jobs_strongify(self)
            label.backgroundColor = JobsRedColor;
            label.text = JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。");
            [self.scrollView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(100);
                make.top.equalTo(self.lab4.mas_bottom).offset(20);
                make.centerX.equalTo(self.scrollView);
            }];
        });
    }return _lab5;
}
/// 多行显示普通文本，手动\n提行。定宽（宽要足够长，否则就面临自动提行）、定字体
-(BaseLabel *)lab6{
    if (!_lab6) {
        @jobs_weakify(self)
        _lab6 = jobsMakeBaseLabel(^(__kindof BaseLabel * _Nullable label) {
            @jobs_strongify(self)
            label.backgroundColor = JobsRedColor;
            label.text = JobsInternationalization(@"编译器自动管理内存地址")
                .add(@"，\n")
                .add(JobsInternationalization(@"让程序员更加专注于"))
                .add(@"\n")
                .add(JobsInternationalization(@"APP的业务"))
                .add(@".");
            [self.scrollView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(JobsMainScreen_WIDTH());
                make.top.equalTo(self.lab5.mas_bottom).offset(20);
                make.centerX.equalTo(self.scrollView);
            }];
        });
    }return _lab6;
}
/// 多行显示富文本，手动\n提行。定宽（宽要足够长，否则就面临自动提行）、定字体
-(BaseLabel *)lab7{
    if (!_lab7) {
        @jobs_weakify(self)
        _lab7 = jobsMakeBaseLabel(^(__kindof BaseLabel * _Nullable label) {
            @jobs_strongify(self)
            label.backgroundColor = JobsRedColor;
            label.attributedText = self.attributedTitle;
            [self.scrollView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(JobsMainScreen_WIDTH());
                make.top.equalTo(self.lab6.mas_bottom).offset(20);
                make.centerX.equalTo(self.scrollView);
            }];
        });
    }return _lab7;
}
#pragma mark —— BaseButton
/// 一行显示普通文本。定宽、定高、定字体。多余部分用…表示（省略号的位置由NSLineBreakMode控制）
-(BaseButton *)btn1{
    if (!_btn1) {
        _btn1 = BaseButton.new;
        _btn1.backgroundColor = JobsBrownColor;
        _btn1.jobsResetBtnTitle(JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。"));
        [self.scrollView addSubview:_btn1];
        [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 20));
            make.top.equalTo(self.lab7.mas_bottom).offset(20);
            make.centerX.equalTo(self.scrollView);
        }];
    }return _btn1;
}
/// 一行显示普通文本。定宽、定高、定字体。多余部分scrollerView ❤️集成@implementation UILabel (AutoScroll)❤️
-(BaseButton *)btn2{
    if (!_btn2) {
        _btn2 = BaseButton.new;
        _btn2.backgroundColor = JobsBrownColor;
        _btn2.jobsResetBtnTitle(JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。"));
        [self.scrollView addSubview:_btn2];
        [_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 20));
            make.top.equalTo(self.btn1.mas_bottom).offset(20);
            make.centerX.equalTo(self.scrollView);
        }];
    }return _btn2;
}
/// 一行显示普通文本。不定宽、定高、定字体。宽度自适应
-(BaseButton *)btn3{
    if (!_btn3) {
        _btn3 = BaseButton.new;
        _btn3.backgroundColor = JobsBrownColor;
        _btn3.jobsResetBtnTitle(JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。"));
        [self.scrollView addSubview:_btn3];
        [_btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 20));
            make.top.equalTo(self.btn2.mas_bottom).offset(20);
            make.centerX.equalTo(self.scrollView);
        }];
    }return _btn3;
}
/// 一行显示普通文本。定宽、定高。缩小字体方式全展示
-(BaseButton *)btn4{
    if (!_btn4) {
        _btn4 = BaseButton.new;
        _btn4.backgroundColor = JobsBrownColor;
        _btn4.jobsResetBtnTitle(JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。"));
        [self.scrollView addSubview:_btn4];
        [_btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 20));
            make.top.equalTo(self.btn3.mas_bottom).offset(20);
            make.centerX.equalTo(self.scrollView);
        }];
    }return _btn4;
}
/// 多行显示普通文本。定宽、不定高、定字体
-(BaseButton *)btn5{
    if (!_btn5) {
        _btn5 = BaseButton.new;
        _btn5.backgroundColor = JobsBrownColor;
        _btn5.jobsResetBtnTitle(JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。"));
        _btn5.titleLabel.numberOfLines = 0;
        _btn5.labelAutoWidthByFont();
        [self.scrollView addSubview:_btn5];
        [_btn5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 20));
            make.top.equalTo(self.btn4.mas_bottom).offset(20);
            make.centerX.equalTo(self.scrollView);
        }];
    }return _btn5;
}
/// 多行显示普通文本，手动\n提行。定宽（宽要足够长，否则就面临自动提行）、定字体
-(BaseButton *)btn6{
    if (!_btn6) {
        _btn6 = BaseButton.new;
        _btn6.backgroundColor = JobsBrownColor;
        _btn6.jobsResetBtnTitle(JobsInternationalization(@"编译器自动管理内存地址，\n让程序员更加专注于\nAPP的业务。"));
        _btn6.titleLabel.numberOfLines = 0;
        _btn6.labelAutoWidthByFont();
        [self.scrollView addSubview:_btn6];
        [_btn6 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH(), 20));
            make.top.equalTo(self.btn5.mas_bottom).offset(20);
            make.centerX.equalTo(self.scrollView);
        }];
    }return _btn6;
}
/// 多行显示普通文本，手动\n提行。定宽（宽要足够长，否则就面临自动提行）、定字体
-(BaseButton *)btn7{
    if (!_btn7) {
        _btn7 = BaseButton.new;
        _btn7.jobsResetBtnNormalAttributedTitle(self.attributedTitle);
        /**
         【特别说明】
         1、_btn7.backgroundColor = JobsBrownColor;// 如果使用富文本，那么背景颜色这个属性无效
         2、_btn7.titleLabel.numberOfLines = 0;//写不写都一样
         3、富文本以后的btn的frame要做出调整，btn是从中心向四周发散开的，这也就是下文的k位置为什么是40而不是20的原因
         4、定宽 > 富文本文字的真正所需宽度 => 富文本文字的真正所需宽度
         */
        _btn7.labelAutoWidthByFont();
        [self.scrollView addSubview:_btn7];
        [_btn7 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH(), 20));
            make.top.equalTo(self.btn6.mas_bottom).offset(40);//K
            make.centerX.equalTo(self.scrollView);
        }];
    }return _btn7;
}

@end
