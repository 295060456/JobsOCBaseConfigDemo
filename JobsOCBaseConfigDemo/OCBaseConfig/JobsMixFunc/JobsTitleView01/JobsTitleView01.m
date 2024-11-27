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
+(instancetype)sharedManager{
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
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model ? : UIViewModel.new;
        MakeDataNull
        self.titleLab.alpha = 1;
        self.leftLab.alpha = 1;
        self.rightLab.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(id _Nullable data){
        return CGSizeZero;
    };
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.text = isNull(self.viewModel.textModel.text) ? JobsInternationalization(@"我是标题") : self.viewModel.textModel.text;
            label.font = [UIFont systemFontOfSize:JobsWidth(12) weight:UIFontWeightRegular];
            label.textColor = HEXCOLOR(0xAE8330);
            label.textAlignment = NSTextAlignmentCenter;
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(self);
            }];label.makeLabelByShowingType(UILabelShowingType_03);
        });
    }return _titleLab;
}

-(UILabel *)leftLab{
    if (!_leftLab) {
        @jobs_weakify(self)
        _leftLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.backgroundColor = HEXCOLOR(0xEEE2C8);
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self);
                make.height.mas_equalTo(JobsWidth(1.5));
                make.left.equalTo(self).offset(JobsWidth(16));
                make.right.equalTo(self.titleLab.mas_left).offset(JobsWidth(-30));
            }];
        });
    }return _leftLab;
}

-(UILabel *)rightLab{
    if (!_rightLab) {
        _rightLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.backgroundColor = HEXCOLOR(0xEEE2C8);
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self);
                make.height.mas_equalTo(JobsWidth(1.5));
                make.right.equalTo(self).offset(JobsWidth(-16));
                make.left.equalTo(self.titleLab.mas_right).offset(JobsWidth(30));
            }];
        });
    }return _rightLab;
}

@end
