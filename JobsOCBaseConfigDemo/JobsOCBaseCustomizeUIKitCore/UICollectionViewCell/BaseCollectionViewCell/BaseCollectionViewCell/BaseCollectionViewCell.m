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
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
#pragma mark —— 复写父类相关方法和属性
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

    }return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    BaseCollectionViewCell *cell = JobsRegisterDequeueCollectionViewCell(BaseCollectionViewCell);
    cell.contentView.layer
        .cornerRadiusBy(JobsWidth(8))
        .borderWidthBy(JobsWidth(1))
        .borderColorBy(RGBA_COLOR(255, 225, 144, 1))
        .masksToBoundsBy(YES);
    cell.layer
        .cornerRadiusBy(JobsWidth(8))
        .borderWidthBy(JobsWidth(1))
        .borderColorBy(RGBA_COLOR(255, 225, 144, 1))
        .masksToBoundsBy(YES);
    cell.indexPath = indexPath;
    return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)cellSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(351), JobsWidth(200));
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        return self;
    };
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
