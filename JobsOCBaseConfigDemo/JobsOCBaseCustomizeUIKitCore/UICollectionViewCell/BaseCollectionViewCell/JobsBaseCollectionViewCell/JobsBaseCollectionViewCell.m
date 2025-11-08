//
//  JobsBaseCollectionViewCell.m
//  UBallLive
//
//  Created by Jobs on 2020/10/18.
//

#import "JobsBaseCollectionViewCell.h"

@interface JobsBaseCollectionViewCell ()

@end

@implementation JobsBaseCollectionViewCell
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
/// UIMarkProtocol
@synthesize indexPath = _indexPath;
@synthesize index = _index;
/// UITextFieldProtocol
UITextFieldProtocol_synthesize_part2
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
    JobsBaseCollectionViewCell *cell = JobsRegisterDequeueCollectionViewCell(JobsBaseCollectionViewCell);
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
+(JobsRetCGSizeByIDBlock _Nonnull)cellSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(351), JobsWidth(200));
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(UIViewModel *_Nonnull model) {
        @jobs_strongify(self)
        self.viewModel = model;
        return self;
    };
}
#pragma mark —— lazyLoad

@end
