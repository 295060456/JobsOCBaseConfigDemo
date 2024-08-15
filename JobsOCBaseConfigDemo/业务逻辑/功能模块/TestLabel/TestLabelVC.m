//
//  TestLabelVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/18.
//

#import "TestLabelVC.h"

@interface TestLabelVC ()

@property(nonatomic,strong)UIScrollView *scrollView;
/// 富文本
@property(nonatomic,strong)NSMutableArray <JobsRichTextConfig *>*richLabelDataStringsMutArr;
@property(nonatomic,strong)NSMutableParagraphStyle *paragtaphStyle;
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
    //    JobsRemoveNotification(self);;
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    
    {
        self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
        self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
        self.viewModel.textModel.font = UIFontWeightRegularSize(16);
        
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    //    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
        self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
        self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsYellowColor;
    self.setGKNav(nil);
    self.setGKNavBackBtn(nil);
    
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
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = UIScrollView.new;
        _scrollView.contentSize = CGSizeMake(JobsMainScreen_WIDTH(), 2 * JobsMainScreen_HEIGHT());
        [self.view addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom);
            make.left.right.bottom.equalTo(self.view);
        }];
    }return _scrollView;
}
#pragma mark —— 富文本
-(NSMutableArray<JobsRichTextConfig *> *)richLabelDataStringsMutArr{
    if (!_richLabelDataStringsMutArr) {
        _richLabelDataStringsMutArr = NSMutableArray.array;
        
        JobsRichTextConfig *config_01 = JobsRichTextConfig.new;
        config_01.font = [UIFont systemFontOfSize:JobsWidth(12) weight:UIFontWeightRegular];
        config_01.textCor = JobsBlueColor;
        
        config_01.targetString = JobsInternationalization(@"编译器自动管理内存地址").add(@"\n");
        config_01.textBgCor = JobsBrownColor;
        config_01.paragraphStyle = self.paragtaphStyle;
        
        JobsRichTextConfig *config_02 = JobsRichTextConfig.new;
        config_02.font = [UIFont systemFontOfSize:JobsWidth(13) weight:UIFontWeightMedium];
        config_02.textCor = JobsWhiteColor;
        config_02.targetString = JobsInternationalization(@"让程序员更加专注于").add(@"\n");
        config_02.textBgCor = JobsBrownColor;
        config_02.paragraphStyle = self.paragtaphStyle;
        
        JobsRichTextConfig *config_03 = JobsRichTextConfig.new;
        config_03.font = [UIFont systemFontOfSize:JobsWidth(14) weight:UIFontWeightSemibold];
        config_03.textCor = JobsGreenColor;
        config_03.targetString = JobsInternationalization(@"APP的业务。");
        config_03.textBgCor = JobsBrownColor;
        config_03.paragraphStyle = self.paragtaphStyle;
        
        _richLabelDataStringsMutArr.jobsAddObject(config_01);
        _richLabelDataStringsMutArr.jobsAddObject(config_02);
        _richLabelDataStringsMutArr.jobsAddObject(config_03);
        
    }return _richLabelDataStringsMutArr;
}

-(NSMutableParagraphStyle *)paragtaphStyle{
    if (!_paragtaphStyle) {
        _paragtaphStyle = NSMutableParagraphStyle.new;
        _paragtaphStyle.alignment = NSTextAlignmentJustified;
        _paragtaphStyle.paragraphSpacing = 0;//段距，取值 float
        _paragtaphStyle.paragraphSpacingBefore = 0;//段首空间，取值 float
        _paragtaphStyle.firstLineHeadIndent = 0.0;//首行缩进，取值 float
        _paragtaphStyle.headIndent = 0.0;//整体缩进(首行除外)，取值 float
        _paragtaphStyle.lineSpacing = 0;//行距，取值 float
        
/**
 
 常见的属性及说明
 alignment               对齐方式，取值枚举常量 NSTextAlignment
 firstLineHeadIndent     首行缩进，取值 float
 headIndent              缩进，取值 float
 tailIndent              尾部缩进，取值 float
 ineHeightMultiple       可变行高,乘因数，取值 float
 maximumLineHeight       最大行高，取值 float
 minimumLineHeight       最小行高，取值 float
 lineSpacing             行距，取值 float
 paragraphSpacing        段距，取值 float
 paragraphSpacingBefore  段首空间，取值 float

 baseWritingDirection    句子方向，取值枚举常量 NSWritingDirection
 lineBreakMode           断行方式，取值枚举常量 NSLineBreakMode
 hyphenationFactor       连字符属性，在iOS，唯一支持的值分别为0和1
 
 */
        
    }return _paragtaphStyle;
}
@synthesize attributedText = _attributedText;
-(NSAttributedString *)attributedText{
    if (!_attributedText) {
        _attributedText = self.richTextWithDataConfigMutArr(self.richLabelDataStringsMutArr);
    }return _attributedText;
}
#pragma mark —— BaseLabel
/// 一行显示普通文本。定宽、定高、定字体。多余部分用…表示（省略号的位置由NSLineBreakMode控制）
-(BaseLabel *)lab1{
    if (!_lab1) {
        _lab1 = BaseLabel.new;
        _lab1.backgroundColor = JobsRedColor;
        _lab1.text = JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。");
        [self.scrollView addSubview:_lab1];
        [_lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 20));
            make.top.equalTo(self.scrollView).offset(20);
            make.centerX.equalTo(self.scrollView);
        }];
    }return _lab1;
}
/// 一行显示普通文本。定宽、定高、定字体。多余部分scrollerView ❤️集成@implementation UILabel (AutoScroll)❤️
-(BaseLabel *)lab2{
    if (!_lab2) {
        _lab2 = BaseLabel.new;
        _lab2.backgroundColor = JobsRedColor;
        _lab2.text = JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。");
        [self.scrollView addSubview:_lab2];
        [_lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 20));
            make.top.equalTo(self.lab1.mas_bottom).offset(20);
            make.centerX.equalTo(self.scrollView);
        }];
    }return _lab2;
}
/// 一行显示普通文本。不定宽、定高、定字体。宽度自适应
-(BaseLabel *)lab3{
    if (!_lab3) {
        _lab3 = BaseLabel.new;
        _lab3.backgroundColor = JobsRedColor;
        _lab3.text = JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。");
        [self.scrollView addSubview:_lab3];
        [_lab3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(20);
            make.top.equalTo(self.lab2.mas_bottom).offset(20);
            make.centerX.equalTo(self.scrollView);
        }];
    }return _lab3;
}
/// 一行显示普通文本。定宽、定高。缩小字体方式全展示
-(BaseLabel *)lab4{
    if (!_lab4) {
        _lab4 = BaseLabel.new;
        _lab4.backgroundColor = JobsRedColor;
        _lab4.text = JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。");
        [self.scrollView addSubview:_lab4];
        [_lab4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 20));
            make.top.equalTo(self.lab3.mas_bottom).offset(20);
            make.centerX.equalTo(self.scrollView);
        }];
    }return _lab4;
}
/// 多行显示普通文本。定宽、不定高、定字体
-(BaseLabel *)lab5{
    if (!_lab5) {
        _lab5 = BaseLabel.new;
        _lab5.backgroundColor = JobsRedColor;
        _lab5.text = JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。");
        [self.scrollView addSubview:_lab5];
        [_lab5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(100);
            make.top.equalTo(self.lab4.mas_bottom).offset(20);
            make.centerX.equalTo(self.scrollView);
        }];
    }return _lab5;
}
/// 多行显示普通文本，手动\n提行。定宽（宽要足够长，否则就面临自动提行）、定字体
-(BaseLabel *)lab6{
    if (!_lab6) {
        _lab6 = BaseLabel.new;
        _lab6.backgroundColor = JobsRedColor;
        _lab6.text = JobsInternationalization(@"编译器自动管理内存地址")
            .add(@"，\n")
            .add(JobsInternationalization(@"让程序员更加专注于"))
            .add(@"\n")
            .add(@"APP的业务。");
        [self.scrollView addSubview:_lab6];
        [_lab6 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(JobsMainScreen_WIDTH());
            make.top.equalTo(self.lab5.mas_bottom).offset(20);
            make.centerX.equalTo(self.scrollView);
        }];
    }return _lab6;
}
/// 多行显示富文本，手动\n提行。定宽（宽要足够长，否则就面临自动提行）、定字体
-(BaseLabel *)lab7{
    if (!_lab7) {
        _lab7 = BaseLabel.new;
        _lab7.backgroundColor = JobsRedColor;
        _lab7.attributedText = self.attributedText;
        [self.scrollView addSubview:_lab7];
        [_lab7 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(JobsMainScreen_WIDTH());
            make.top.equalTo(self.lab6.mas_bottom).offset(20);
            make.centerX.equalTo(self.scrollView);
        }];
    }return _lab7;
}
#pragma mark —— BaseButton
/// 一行显示普通文本。定宽、定高、定字体。多余部分用…表示（省略号的位置由NSLineBreakMode控制）
-(BaseButton *)btn1{
    if (!_btn1) {
        _btn1 = BaseButton.new;
        _btn1.backgroundColor = JobsBrownColor;
        _btn1.normalTitle(JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。"));
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
        _btn2.normalTitle(JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。"));
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
        _btn3.normalTitle(JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。"));
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
        _btn4.normalTitle(JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。"));
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
        _btn5.normalTitle(JobsInternationalization(@"编译器自动管理内存地址，让程序员更加专注于APP的业务。"));
        _btn5.titleLabel.numberOfLines = 0;
        [_btn5 labelAutoWidthByFont];
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
        _btn6.normalTitle(JobsInternationalization(@"编译器自动管理内存地址，\n让程序员更加专注于\nAPP的业务。"));
        _btn6.titleLabel.numberOfLines = 0;
        [_btn6 labelAutoWidthByFont];
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
        _btn7.normalAttributedTitle(self.attributedText);
        /**
         【特别说明】
         1、_btn7.backgroundColor = JobsBrownColor;// 如果使用富文本，那么背景颜色这个属性无效
         2、_btn7.titleLabel.numberOfLines = 0;//写不写都一样
         3、富文本以后的btn的frame要做出调整，btn是从中心向四周发散开的，这也就是下文的k位置为什么是40而不是20的原因
         4、定宽 > 富文本文字的真正所需宽度 => 富文本文字的真正所需宽度
         */
        [_btn7 labelAutoWidthByFont];
        [self.scrollView addSubview:_btn7];
        [_btn7 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH(), 20));
            make.top.equalTo(self.btn6.mas_bottom).offset(40);//K
            make.centerX.equalTo(self.scrollView);
        }];
    }return _btn7;
}

@end
