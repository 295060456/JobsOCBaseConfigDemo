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
Prop_strong()UIBezierPath *linePath;
Prop_strong()CAShapeLayer *lineLayer;
Prop_strong()UIImageView *bgImageView_;
/// Data
Prop_strong()JobsExcelConfigureViewModel *excelConfigureData;
Prop_assign()CGSize size;

@end

@implementation TableViewOneCell

+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView{
    @jobs_weakify(self)
    return ^(UITableView * _Nonnull tableView) {
        @jobs_strongify(self)
        JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)tableView.tableViewCellClass(self.class,@"");
        if (!cell) {
            cell = [self initTableViewCell:self withStyle:UITableViewCellStyleValue1];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = JobsWhiteColor;
        }return cell;
    };
}
#pragma mark —— BaseCellProtocol
-(JobsReturnTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UIViewModel *_Nullable viewModel) {
        @jobs_strongify(self)
//        viewModel.buttonModel;
        self.excelConfigureData = viewModel.data;
        self.bgImageView_.alpha = 1;
        CGSize size = CGSizeMake(self.excelConfigureData.itemW, self.excelConfigureData.itemH);
        if (!CGSizeEqualToSize(self.size, size)) {
            self.size = size;
            self.drawLineBySize(size);
        } return self;
    };
}

-(jobsBySizeBlock _Nonnull)drawLineBySize{
    @jobs_weakify(self)
    return ^(CGSize size){
        @jobs_strongify(self)
        // 其他点
        self.linePath.add(CGPointMake(size.width, 0));
        self.linePath.add(CGPointMake(size.width, size.height));
        self.linePath.add(CGPointMake(0, size.height));
        
        [self.linePath stroke];
        
        UIGraphicsBeginImageContext(size);
        [self.linePath stroke];
        UIGraphicsEndImageContext();

        self.button.layer.addSublayer(self.lineLayer);
    };
}
#pragma mark —— lazyLoad
-(UIImageView *)bgImageView_{
    if(!_bgImageView_){
        @jobs_weakify(self)
        _bgImageView_ = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.backgroundColor = JobsClearColor.colorWithAlphaComponentBy(0);
    //        imageView.image = JobsIMG(@"投注记录");
            [self.contentView.addSubview(imageView) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
            }];
        });
    }return _bgImageView_;
}

-(UIBezierPath *)linePath{
    if(!_linePath){
        _linePath = jobsMakeBezierPath(^(__kindof UIBezierPath * _Nullable data) {
            data.moveTo(CGPointZero);
        });
    }return _linePath;
}

-(CAShapeLayer *)lineLayer{
    if(!_lineLayer){
        @jobs_weakify(self)
        _lineLayer = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable data) {
            @jobs_strongify(self)
            data.lineWidth = self.excelConfigureData.LineWidth;
            data.strokeColor = self.excelConfigureData.cor6.CGColor;
            data.path = self.linePath.CGPath;
            data.fillColor = JobsClearColor.colorWithAlphaComponentBy(0).CGColor;
        });
    }return _lineLayer;
}

@end
