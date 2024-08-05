//
//  TableViewOneCell.m
//  BlankProject
//
//  Created by mac on 17/6/15.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "TableViewOneCell.h"

@interface TableViewOneCell()

@property(nonatomic,strong)XZExcelConfigureViewModel *viewModel;
@property(nonatomic,assign)CGSize size;
@property(nonatomic,strong)UILabel*titleL;
@property(nonatomic,strong)TableModel *model;
@property(nonatomic,strong)UIBezierPath *linePath;
@property(nonatomic,strong)CAShapeLayer *lineLayer;
@property(nonatomic,strong)UIImageView *bgImageView;

@end

@implementation TableViewOneCell

+ (TableViewOneCell*)dequeneCellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"TableViewOneCell";
    TableViewOneCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [TableViewOneCell.alloc initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = JobsWhiteColor;
    }return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.bgImageView.alpha = 1;
        self.titleL.alpha = 1;
    }return self;
}

- (void)cellBindViewModel:(XZExcelConfigureViewModel *)viewModel{
    self.viewModel=viewModel;
    CGSize size=CGSizeMake(viewModel.itemW, viewModel.itemH);
    if (!CGSizeEqualToSize(self.size, size)) {
        self.size = size;
        [self drawLineWithSize:size];
    }
}

- (void)cellBindModel:(TableModel *)model{
    self.model = model;
    self.titleL.text = model.rowTitle;
}

- (void)drawLineWithSize:(CGSize)size{
    // 其他点
    [self.linePath addLineToPoint:CGPointMake(size.width, 0)];
    [self.linePath addLineToPoint:CGPointMake(size.width, size.height)];
    [self.linePath addLineToPoint:CGPointMake(0, size.height)];
    
    [self.linePath stroke];
    
    UIGraphicsBeginImageContext(size);
    [self.linePath stroke];
    UIGraphicsEndImageContext();

    [self.contentView.layer addSublayer:self.lineLayer];
}
#pragma mark —— lazyLoad
-(UIImageView *)bgImageView{
    if(!_bgImageView){
        _bgImageView = UIImageView.new;
        _bgImageView.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
//        _bgImageView.image = JobsIMG(@"投注记录");
        [self.contentView addSubview:_bgImageView];
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }return _bgImageView;
}

- (UILabel *)titleL{
    if (!_titleL) {
        _titleL = UILabel.new;
        _titleL.textColor = JobsWhiteColor;
        _titleL.font = [UIFont systemFontOfSize:15];
        _titleL.textAlignment = NSTextAlignmentCenter;
        [self.bgImageView addSubview:_titleL];
        [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }return _titleL;
}

-(UIBezierPath *)linePath{
    if(!_linePath){
        _linePath = UIBezierPath.bezierPath;
        [_linePath moveToPoint:CGPointMake(0, 0)];
    }return _linePath;
}

-(CAShapeLayer *)lineLayer{
    if(!_lineLayer){
        _lineLayer = CAShapeLayer.layer;
        _lineLayer.lineWidth = LineWidth;
        _lineLayer.strokeColor = LineColor.CGColor;
        _lineLayer.path = self.linePath.CGPath;
        _lineLayer.fillColor = nil; // 默认为blackColor
    }return _lineLayer;
}

@end
