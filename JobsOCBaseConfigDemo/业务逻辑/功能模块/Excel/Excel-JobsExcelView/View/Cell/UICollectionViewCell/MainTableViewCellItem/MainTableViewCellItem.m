//
//  MainTableViewCellItem.m
//  BlankProject
//
//  Created by mac on 17/6/15.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import "MainTableViewCellItem.h"

@interface MainTableViewCellItem()
/// UI
@property(nonatomic,strong)CATextLayer *textLayer;
@property(nonatomic,strong)UIBezierPath *linePath;
@property(nonatomic,strong)CAShapeLayer *lineLayer;
/// Data
@property(nonatomic,strong)JobsExcelConfigureViewModel *viewModel_;
@property(nonatomic,assign)CGSize size;

@end

@implementation MainTableViewCellItem

+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    MainTableViewCellItem *cell = (MainTableViewCellItem *)[collectionView collectionViewCellClass:MainTableViewCellItem.class
                                                                                      forIndexPath:indexPath];
    if (!cell) {
        collectionView.registerCollectionViewCellClass(MainTableViewCellItem.class,@"");
        cell = (MainTableViewCellItem *)[collectionView collectionViewCellClass:MainTableViewCellItem.class
                                                                   forIndexPath:indexPath];
    }cell.indexPath = indexPath;
    return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(JobsExcelConfigureViewModel *_Nullable viewModel) {
        @jobs_strongify(self)
        self.viewModel_ = viewModel;
        CGSize size = CGSizeMake(viewModel.itemW - 1.0f, viewModel.itemH - 1.0f);
        if (!CGSizeEqualToSize(self.size, size)) {
            self.size = size;
//            [self drawLineWithSize:size];
            self.textLayer.frame = CGRectMake(0, size.height*0.5, size.width, size.height);
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

//- (void)drawLineWithSize:(CGSize)size{
//    // 其他点
//    [self.linePath addLineToPoint:CGPointMake(size.width, 0)];
//    [self.linePath addLineToPoint:CGPointMake(size.width, size.height)];
//    [self.linePath addLineToPoint:CGPointMake(0, size.height)];
//   
//    UIGraphicsBeginImageContext(size);
//    [self.linePath closePath];
//    [self.linePath stroke];
//    UIGraphicsEndImageContext();
//    
//    [self.btn.layer addSublayer:self.lineLayer];
//}
#pragma mark —— lazyLoad
//-(UIBezierPath *)linePath{
//    if(!_linePath){
//        _linePath = UIBezierPath.bezierPath;
//        [_linePath moveToPoint:CGPointMake(0, 0)]; // 起点
//    }return _linePath;
//}
//
//-(CAShapeLayer *)lineLayer{
//    if(!_lineLayer){
//        _lineLayer = CAShapeLayer.layer;
//        _lineLayer.lineWidth = LineWidth;
//        _lineLayer.strokeColor = LineColor.CGColor;
//        _lineLayer.path = self.linePath.CGPath;
//        _lineLayer.fillColor = JobsOrangeColor.CGColor; // 默认为blackColor
//    }return _lineLayer;
//}

@end
