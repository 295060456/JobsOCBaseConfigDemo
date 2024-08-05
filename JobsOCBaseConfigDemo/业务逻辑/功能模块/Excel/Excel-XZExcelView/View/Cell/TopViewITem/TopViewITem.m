//
//  TopViewITem.m
//  XZExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "TopViewITem.h"

@interface TopViewITem()

@property(nonatomic,strong)XZExcelConfigureViewModel *viewModel;
@property(nonatomic,assign)CGSize size;
@property(nonatomic,strong)UILabel *titleL;
@property(nonatomic,strong)UIBezierPath *linePath;
@property(nonatomic,strong)CAShapeLayer *lineLayer;
@property(nonatomic,strong)UIImageView *bgImageView;

@end

@implementation TopViewITem

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.bgImageView.alpha = 1;
        self.titleL.alpha = 1;
    }return self;
}
#pragma mark —— BindViewModelProtocol
- (void)cellBindViewModel:(XZExcelConfigureViewModel *)viewModel{
    self.viewModel = viewModel;
    CGSize size = CGSizeMake(viewModel.itemW, viewModel.itemH);
    if (!CGSizeEqualToSize(self.size, size)) {
        self.size = size;
        [self drawLineWithSize:size];
    }
}

- (void)cellBindModel:(NSString *)model{
    self.titleL.text = model;
}

- (void)drawLineWithSize:(CGSize)size{
    // 其他点
    [self.linePath addLineToPoint:CGPointMake(size.width, 0)];
    [self.linePath addLineToPoint:CGPointMake(size.width, size.height)];
    [self.linePath addLineToPoint:CGPointMake(0, size.height)];
    
    UIGraphicsBeginImageContext(size);
    [self.linePath stroke];
    UIGraphicsEndImageContext();
    
    [self.contentView.layer addSublayer:self.lineLayer];
}
#pragma mark —— lazyLoad
-(UIImageView *)bgImageView{
    if(!_bgImageView){
        _bgImageView = UIImageView.new;
        _bgImageView.image = JobsIMG(@"投注记录");
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
