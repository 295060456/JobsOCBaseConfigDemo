//
//  JobsUserHeaderDataViewForHeaderInSection.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/20.
//

#import "JobsUserHeaderDataViewForHeaderInSection.h"

@interface JobsUserHeaderDataViewForHeaderInSection ()

@property(nonatomic,strong)UILabel *titleLab;

@end

@implementation JobsUserHeaderDataViewForHeaderInSection

@synthesize viewModel = _viewModel;

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self == [super initWithReuseIdentifier:reuseIdentifier]){

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
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+ (CGFloat)viewHeightWithModel:(UIViewModel *)model{
    return JobsWidth(46);
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.backgroundColor = HEXCOLOR(0xFFFFFF);
        _titleLab.text = self.viewModel.textModel.text.nullString ? JobsInternationalization(@"请设置大标题") : self.viewModel.textModel.text;
        _titleLab.textColor = self.viewModel.textModel.textCor;
        _titleLab.font = [UIFont systemFontOfSize:JobsWidth(20) weight:UIFontWeightRegular];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _titleLab;
}

@end
