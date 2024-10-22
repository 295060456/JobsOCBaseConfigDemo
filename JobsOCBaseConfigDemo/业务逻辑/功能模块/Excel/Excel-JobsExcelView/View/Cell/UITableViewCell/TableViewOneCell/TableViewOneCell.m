//
//  TableViewOneCell.m
//  BlankProject
//
//  Created by mac on 17/6/15.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import "TableViewOneCell.h"

@interface TableViewOneCell()
/// UI
@property(nonatomic,strong)UIBezierPath *linePath;
@property(nonatomic,strong)CAShapeLayer *lineLayer;
@property(nonatomic,strong)UIImageView *bgImageView_;
/// Data
@property(nonatomic,strong)JobsExcelConfigureViewModel *viewModel_;
@property(nonatomic,assign)CGSize size;

@end

@implementation TableViewOneCell

+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView{
    @jobs_weakify(self)
    return ^(UITableView * _Nonnull tableView) {
        @jobs_strongify(self)
        JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)tableView.tableViewCellClass(self.class,@"");
        if (!cell) {
            cell = [self initTableViewCell:self
                                 withStyle:UITableViewCellStyleValue1];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = JobsWhiteColor;
        }return cell;
    };
}
#pragma mark —— BaseCellProtocol
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(JobsExcelConfigureViewModel *_Nullable viewModel) {
        @jobs_strongify(self)
        self.viewModel_ = viewModel;
        self.bgImageView_.alpha = 1;
        CGSize size = CGSizeMake(viewModel.itemW, viewModel.itemH);
        if (!CGSizeEqualToSize(self.size, size)) {
            self.size = size;
            [self drawLineWithSize:size];
        }
    };
}

-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel2{
//    @jobs_weakify(self)
    return ^(UIButtonModel *_Nullable model) {
//        @jobs_strongify(self)
        super.jobsRichElementsInCellWithModel(model);
    };
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

    [self.btn.layer addSublayer:self.lineLayer];
}
#pragma mark —— lazyLoad
-(UIImageView *)bgImageView_{
    if(!_bgImageView_){
        _bgImageView_ = UIImageView.new;
        _bgImageView_.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
//        _bgImageView_.image = JobsIMG(@"投注记录");
        [self.contentView addSubview:_bgImageView_];
        [_bgImageView_ mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }return _bgImageView_;
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
        _lineLayer.lineWidth = self.viewModel_.LineWidth;
        _lineLayer.strokeColor = self.viewModel_.cor6.CGColor;
        _lineLayer.path = self.linePath.CGPath;
        _lineLayer.fillColor = JobsClearColor.colorWithAlphaComponent(0).CGColor;
    }return _lineLayer;
}

@end
