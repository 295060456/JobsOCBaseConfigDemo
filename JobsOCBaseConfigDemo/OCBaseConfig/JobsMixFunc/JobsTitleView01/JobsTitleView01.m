//
//  JobsTitleView01.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/16.
//

#import "JobsTitleView01.h"

@interface JobsTitleView01 ()
/// UI
@property(nonatomic,strong)UILabel *leftLab;
@property(nonatomic,strong)UILabel *rightLab;
@property(nonatomic,strong)UILabel *titleLab;
/// Data

@end

@implementation JobsTitleView01

@synthesize viewModel = _viewModel;

#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_titleView01OnceToken = 0;
    static_titleView01 = nil;
}

static JobsTitleView01 *static_titleView01 = nil;
static dispatch_once_t static_titleView01OnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_titleView01OnceToken, ^{
        static_titleView01 = JobsTitleView01.new;
    });return static_titleView01;
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
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model ? : UIViewModel.new;
    MakeDataNull
    self.titleLab.alpha = 1;
    self.leftLab.alpha = 1;
    self.rightLab.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeZero;
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.text = self.viewModel.textModel.text.nullString ? JobsInternationalization(@"我是标题") : self.viewModel.textModel.text;
        _titleLab.font = [UIFont systemFontOfSize:JobsWidth(12) weight:UIFontWeightRegular];
        _titleLab.textColor = HEXCOLOR(0xAE8330);
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
        _titleLab.makeLabelByShowingType(UILabelShowingType_03);
    }return _titleLab;
}

-(UILabel *)leftLab{
    if (!_leftLab) {
        _leftLab = UILabel.new;
        _leftLab.backgroundColor = HEXCOLOR(0xEEE2C8);
        [self addSubview:_leftLab];
        [_leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.height.mas_equalTo(JobsWidth(1.5));
            make.left.equalTo(self).offset(JobsWidth(16));
            make.right.equalTo(self.titleLab.mas_left).offset(JobsWidth(-30));
        }];
    }return _leftLab;
}

-(UILabel *)rightLab{
    if (!_rightLab) {
        _rightLab = UILabel.new;
        _rightLab.backgroundColor = HEXCOLOR(0xEEE2C8);
        [self addSubview:_rightLab];
        [_rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.height.mas_equalTo(JobsWidth(1.5));
            make.right.equalTo(self).offset(JobsWidth(-16));
            make.left.equalTo(self.titleLab.mas_right).offset(JobsWidth(30));
        }];
    }return _rightLab;
}

@end
