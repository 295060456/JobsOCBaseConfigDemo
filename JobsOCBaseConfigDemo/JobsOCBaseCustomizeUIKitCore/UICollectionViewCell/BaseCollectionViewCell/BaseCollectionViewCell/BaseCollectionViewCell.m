//
//  BaseCollectionViewCell.m
//  FM
//
//  Created by User on 8/3/24.
//

#import "BaseCollectionViewCell.h"

@interface BaseCollectionViewCell ()

@end

@implementation BaseCollectionViewCell

@synthesize viewModel = _viewModel;
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        [self richElementsInCellWithModel:nil];
    }return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    BaseCollectionViewCell *cell = (BaseCollectionViewCell *)[collectionView collectionViewCellClass:BaseCollectionViewCell.class forIndexPath:indexPath];
    if (!cell) {
        collectionView.registerCollectionViewCellClass(BaseCollectionViewCell.class);
        cell = (BaseCollectionViewCell *)[collectionView collectionViewCellClass:BaseCollectionViewCell.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell圆切角
//    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
//    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
//    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
//    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;

    cell.indexPath = indexPath;
    
    return cell;
}
#pragma mark —— 复写父类相关方法和属性
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(351), JobsWidth(200));
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
}
#pragma mark —— <UIViewModelProtocol> 协议属性合成set & get方法
@synthesize indexPath = _indexPath;
-(void)setIndexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
}

-(NSIndexPath *)indexPath{
    return _indexPath;
}
@synthesize index = _index;
-(NSInteger)index{
    return _index;
}

-(void)setIndex:(NSInteger)index{
    _index = index;
}
#pragma mark —— lazyLoad

@end
