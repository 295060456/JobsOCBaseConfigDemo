//
//  LeftCell.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/15.
//

#import "LeftCell.h"

@interface LeftCell()
/// UI
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIView *flagView;
@property(nonatomic,strong)UILabel *titleLabel;

@end

@implementation LeftCell
@synthesize viewModel = _viewModel;
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleDefaultWithTableView{
    return ^(UITableView * _Nonnull tableView) {
        LeftCell *cell = (LeftCell *)tableView.tableViewCellClass(LeftCell.class,@"");
        if (!cell) {
            cell = LeftCell.initTableViewCellWithStyle(UITableViewCellStyleDefault);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }return cell;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model ? : UIViewModel.new;
    
    self.bgView.alpha = 1;
    self.titleLabel.alpha = 1;
    self.flagView.alpha = 1;
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)cellHeightWithModel:(UIViewModel *_Nullable)model{
    return LeftCell_Height;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]){
    }return self;
}
#pragma mark —— 一些私有方法
- (void)setSelected:(BOOL)selected
           animated:(BOOL)animated{
    [super setSelected:selected
              animated:animated];
    if (selected){
        self.bgView.backgroundColor = ThreeClassCellBgCor;
        self.flagView.backgroundColor = JobsWhiteColor;
        self.titleLabel.textColor = HEXCOLOR(0xAE8330);
        self.titleLabel.font = UIFontWeightBoldSize(14);
    }else{
        self.bgView.backgroundColor = HEXCOLOR(0xFCFBFB);
        self.flagView.backgroundColor = HEXCOLOR(0xFCFBFB);
        self.titleLabel.textColor = HEXCOLOR(0xB0B0B0);
        self.titleLabel.font = UIFontWeightRegularSize(14);
    }
}

- (void)setHighlighted:(BOOL)highlighted
              animated:(BOOL)animated{
    if (highlighted){
        self.bgView.backgroundColor = ThreeClassCellBgCor;
        self.flagView.backgroundColor = JobsWhiteColor;
        self.titleLabel.textColor = HEXCOLOR(0xB0B0B0);
        self.titleLabel.font = UIFontWeightBoldSize(14);
    }else{
        self.bgView.backgroundColor = HEXCOLOR(0xFCFBFB);
        self.flagView.backgroundColor = HEXCOLOR(0xFCFBFB);
        self.titleLabel.textColor = HEXCOLOR(0xB0B0B0);
        self.titleLabel.font = UIFontWeightRegularSize(14);
    }
}
#pragma mark —— lazyLoad
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = UIView.new;
        _bgView.frame = CGRectMake(0,
                                   0,
                                   LeftCell_Width,
                                   LeftCell_Height);
        _bgView.backgroundColor = HEXCOLOR(0xFCFBFB);
        [self.contentView addSubview:_bgView];
    }return _bgView;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = UILabel.new;
        _titleLabel.text = self.viewModel.textModel.text;
        _titleLabel.frame = CGRectMake(5,
                                       JobsWidth(20),
                                       LeftCell_Width - 10.f,
                                       17.f);
        _titleLabel.textColor = HEXCOLOR(0xB0B0B0);
        _titleLabel.font = [UIFont systemFontOfSize:12.f];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
    }
    _titleLabel.text = self.viewModel.textModel.text;
    return _titleLabel;
}

-(UIView *)flagView{
    if (!_flagView) {
        _flagView = UIView.new;
        _flagView.frame = CGRectMake(0,
                                     0,
                                     3,
                                     LeftCell_Height);
        _flagView.backgroundColor = HEXCOLOR(0xFCFBFB);
        [self.contentView addSubview:_flagView];
    }return _flagView;
}

@end
