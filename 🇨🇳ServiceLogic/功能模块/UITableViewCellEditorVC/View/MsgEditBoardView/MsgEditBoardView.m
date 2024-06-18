//
//  MsgEditBoardView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/6.
//

#import "MsgEditBoardView.h"

@interface MsgEditBoardView ()
/// UI
@property(nonatomic,strong)UIButton *allChooseBtn;
@property(nonatomic,strong)UIButton *markToReadBtn;
@property(nonatomic,strong)UIButton *deleteBtn;
/// Data

@end

@implementation MsgEditBoardView

@synthesize viewModel = _viewModel;

#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_msgEditBoardViewOnceToken = 0;
    static_msgEditBoardView = nil;
}

static MsgEditBoardView *static_msgEditBoardView = nil;
static dispatch_once_t static_msgEditBoardViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_msgEditBoardViewOnceToken, ^{
        static_msgEditBoardView = MsgEditBoardView.new;
    });return static_msgEditBoardView;
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
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = UIColor.whiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    MakeDataNull
    self.allChooseBtn.alpha = 1;
    self.deleteBtn.alpha = 1;
    self.markToReadBtn.alpha = 1;
}
/// 具体由子类进行复写【FrameY的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)viewChangeYWithModel:(id _Nullable)model{
    return JobsWidth(50) + JobsBottomSafeAreaHeight();
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(),
                      [MsgEditBoardView viewChangeYWithModel:nil]);
}
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGRect)viewFrameWithModel:(id _Nullable)model{
    return CGRectMake(0,
                      JobsMainScreen_HEIGHT(),
                      [MsgEditBoardView viewSizeWithModel:nil].width,
                      [MsgEditBoardView viewSizeWithModel:nil].height);
}
#pragma mark —— 一些公有方法
-(void)appearByView:(UIView * _Nonnull)view{
    @jobs_weakify(self)
    [UIView animateWithDuration:.5f
                     animations:^{
        @jobs_strongify(self)
        CGRect rect = [MsgEditBoardView viewFrameWithModel:nil];
        rect.origin.y -= [MsgEditBoardView viewChangeYWithModel:nil];
        self.frame = rect;
        [view addSubview:self];
    } completion:nil];
}

-(void)disappearByView:(UIView * _Nullable)view{
    @jobs_weakify(self)
    [UIView animateWithDuration:.5f
                     animations:^{
        @jobs_strongify(self)
        self.frame = [MsgEditBoardView viewFrameWithModel:nil];
    } completion:^(BOOL finished) {
        @jobs_strongify(self)
        [self removeFromSuperview];
    }];
}

-(UIButton *)getAllChooseBtn{
    return _allChooseBtn;
}

-(UIButton *)getMarkToReadBtn{
    return _markToReadBtn;
}

-(UIButton *)getDeleteBtn{
    return _deleteBtn;
}
#pragma mark —— lazyLoad
-(UIButton *)allChooseBtn{
    if (!_allChooseBtn) {
        _allChooseBtn = UIButton.new;
        _allChooseBtn.normalImage = JobsIMG(@"按钮未选中");
        _allChooseBtn.selectedImage = JobsIMG(@"按钮已选中");
        _allChooseBtn.normalTitleColor = HEXCOLOR(0x3D4A58);
        _allChooseBtn.titleFont = notoSansBold(14);
        _allChooseBtn.normalTitle = JobsInternationalization(@"全選");
        _allChooseBtn.selectedTitle = JobsInternationalization(@"取消");
        [self addSubview:_allChooseBtn];
        [_allChooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(28 + 14 + 12), JobsWidth(14)));
            make.left.equalTo(self).offset(JobsWidth(16));
            make.top.equalTo(self).offset(JobsWidth(18));
        }];
        [_allChooseBtn layoutButtonWithEdgeInsetsStyle:NSDirectionalRectEdgeLeading
                                          imagePadding:JobsWidth(12)];
        @jobs_weakify(self)
        [_allChooseBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
    }return _allChooseBtn;
}

-(UIButton *)markToReadBtn{
    if (!_markToReadBtn) {
        _markToReadBtn = UIButton.new;
        _markToReadBtn.normalTitleColor = HEXCOLOR(0xAE8330);
        _markToReadBtn.titleFont = notoSansBold(14);
        _markToReadBtn.normalTitleColor = HEXCOLOR(0xAE8330);
        _markToReadBtn.normalTitle = JobsInternationalization(@"標記為已讀");
        _markToReadBtn.enabledBlock(NO);
        [self addSubview:_markToReadBtn];
        [_markToReadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.allChooseBtn);
            make.right.equalTo(self.deleteBtn.mas_left).offset(JobsWidth(-36));
            make.height.mas_equalTo(JobsWidth(14));
        }];
        @jobs_weakify(self)
        [_markToReadBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
    }return _markToReadBtn;
}

-(UIButton *)deleteBtn{
    if (!_deleteBtn) {
        _deleteBtn = UIButton.new;
        _deleteBtn.normalTitle = JobsInternationalization(@"删除");
        _deleteBtn.normalTitleColor = HEXCOLOR(0xEB677F);
        _deleteBtn.titleFont = notoSansBold(14);
        _deleteBtn.enabledBlock(NO);
        [self addSubview:_deleteBtn];
        [_deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.allChooseBtn);
            make.right.equalTo(self).offset(JobsWidth(-18));
            make.height.mas_equalTo(JobsWidth(14));
        }];
        [_deleteBtn makeBtnLabelByShowingType:UILabelShowingType_03];
        @jobs_weakify(self)
        [_deleteBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
    }return _deleteBtn;
}

@end
