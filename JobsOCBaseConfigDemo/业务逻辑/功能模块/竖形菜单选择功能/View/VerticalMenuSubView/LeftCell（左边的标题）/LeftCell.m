//
//  LeftCell.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/15.
//

#import "LeftCell.h"

@interface LeftCell()
/// UI
@property(nonatomic,strong)UIView *flagView;
@property(nonatomic,strong)UILabel *titleLabel;

@end

@implementation LeftCell
UITableViewCellProtocol_synthesize
UITableViewCell_UIViewModelProtocolSynthesize
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
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model ? : UIViewModel.new;

        self.titleLabel.alpha = 1;
        self.flagView.alpha = 1;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return LeftCell_Height;
    };
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]){
    }return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.printValue();
    /// 取内部类UITableViewCellEditControl,对编辑状态的Cell的点击按钮进行替换成自定义的
    self.customCellEditStateImage();
    
    self.modifySysChildViewFrame1();
    // 或者
    self.modifySysChildViewFrame2();
    
    if(self.accessoryView){
        self.accessoryView.resetOriginXByOffset(20);
    }
}

- (void)setSelected:(BOOL)selected
           animated:(BOOL)animated{
    [super setSelected:selected
              animated:animated];
    if (selected){
        self.contentView.backgroundColor = ThreeClassCellBgCor;
        self.flagView.backgroundColor = JobsWhiteColor;
        self.titleLabel.textColor = HEXCOLOR(0xAE8330);
        self.titleLabel.font = UIFontWeightBoldSize(14);
    }else{
        self.contentView.backgroundColor = HEXCOLOR(0xFCFBFB);
        self.flagView.backgroundColor = HEXCOLOR(0xFCFBFB);
        self.titleLabel.textColor = HEXCOLOR(0xB0B0B0);
        self.titleLabel.font = UIFontWeightRegularSize(14);
    }
}

- (void)setHighlighted:(BOOL)highlighted
              animated:(BOOL)animated{
    if (highlighted){
        self.contentView.backgroundColor = ThreeClassCellBgCor;
        self.flagView.backgroundColor = JobsWhiteColor;
        self.titleLabel.textColor = HEXCOLOR(0xB0B0B0);
        self.titleLabel.font = UIFontWeightBoldSize(14);
    }else{
        self.contentView.backgroundColor = HEXCOLOR(0xFCFBFB);
        self.flagView.backgroundColor = HEXCOLOR(0xFCFBFB);
        self.titleLabel.textColor = HEXCOLOR(0xB0B0B0);
        self.titleLabel.font = UIFontWeightRegularSize(14);
    }
}
#pragma mark —— lazyLoad
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        @jobs_weakify(self)
        _titleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.textColor = HEXCOLOR(0xB0B0B0);
            label.font = bayonRegular(JobsWidth(14));
            label.textAlignment = NSTextAlignmentCenter;
            self.contentView.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView).offset(JobsWidth(5));
                make.centerY.equalTo(self.contentView);
            }];label.makeLabelByShowingType(UILabelShowingType_03);
        });
    }_titleLabel.text = self.viewModel.textModel.text;
    return _titleLabel;
}

-(UIView *)flagView{
    if (!_flagView) {
        @jobs_weakify(self)
        _flagView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view.frame = CGRectMake(0,
                                    0,
                                    3,
                                    LeftCell_Height);
            view.backgroundColor = HEXCOLOR(0xFCFBFB);
            self.contentView.addSubview(view);
        });
    }return _flagView;
}

@end
