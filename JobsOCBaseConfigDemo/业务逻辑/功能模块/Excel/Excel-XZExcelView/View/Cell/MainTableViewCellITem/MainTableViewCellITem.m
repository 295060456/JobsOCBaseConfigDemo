//
//  MainTableViewCellITem.m
//  BlankProject
//
//  Created by mac on 17/6/15.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "MainTableViewCellITem.h"

@interface MainTableViewCellITem()

@property(nonatomic,strong)XZExcelConfigureViewModel *viewModel;
@property(nonatomic,assign)CGSize size;
@property(nonatomic,strong)UILabel*titleL;
@property(nonatomic,strong)ItemModel *model;
@property(nonatomic,strong)CATextLayer *textLayer;
@property(nonatomic,strong)UIBezierPath *linePath;
@property(nonatomic,strong)CAShapeLayer *lineLayer;

@end

@implementation MainTableViewCellITem

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = JobsWhiteColor;
        self.titleL.alpha = 1;
    }return self;
}

- (void)cellBindViewModel:(XZExcelConfigureViewModel *)viewModel{
    self.viewModel = viewModel;
    CGSize size = CGSizeMake(viewModel.itemW - 1.0f, viewModel.itemH - 1.0f);
    if (!CGSizeEqualToSize(self.size, size)) {
        self.size = size;
        [self drawLineWithSize:size];
        self.textLayer.frame = CGRectMake(0, size.height*0.5, size.width, size.height);
    }
}

- (void)cellBindModel:(ItemModel *)model{
    self.model = model;
    self.titleL.text = model.contentStr;
}

- (void)drawLineWithSize:(CGSize)size{
    // 其他点
    [self.linePath addLineToPoint:CGPointMake(size.width, 0)];
    [self.linePath addLineToPoint:CGPointMake(size.width, size.height)];
    [self.linePath addLineToPoint:CGPointMake(0, size.height)];
   
    UIGraphicsBeginImageContext(size);
    [self.linePath closePath];
    [self.linePath stroke];
    UIGraphicsEndImageContext();
    
    [self.contentView.layer addSublayer:self.lineLayer];
}
#pragma mark —— lazyLoad
- (UILabel *)titleL{
    if (!_titleL) {
        _titleL = UILabel.new;
        _titleL.font = [UIFont systemFontOfSize:15];
        _titleL.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleL];
        [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }return _titleL;
}

-(UIBezierPath *)linePath{
    if(!_linePath){
        _linePath = UIBezierPath.bezierPath;
        // 起点
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
