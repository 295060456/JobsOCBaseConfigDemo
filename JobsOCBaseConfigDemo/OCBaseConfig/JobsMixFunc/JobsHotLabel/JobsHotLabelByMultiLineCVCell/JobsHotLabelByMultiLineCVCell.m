//
//  JobsHotLabelWithMultiLineCVCell.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/15.
//

#import "JobsHotLabelByMultiLineCVCell.h"

@interface JobsHotLabelByMultiLineCVCell ()

Prop_strong()UILabel *textLab;

@end

@implementation JobsHotLabelByMultiLineCVCell
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}
#pragma mark —— BaseViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    return self.viewModel;
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    JobsHotLabelByMultiLineCVCell *cell = JobsRegisterDequeueCollectionViewCell(JobsHotLabelByMultiLineCVCell);
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
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        [self.textLab removeFromSuperview];
        self->_textLab = nil;
        self.viewModel = model;
        if (self.viewModel) self.textLab.alpha = 1;
        return self;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)cellSizeByModel{
    return ^CGSize(UIViewModel *_Nullable data){
        return jobsZeroSizeValue(data.jobsSize) ?
        [UILabel sizeWithText:data.textModel.text
                         font:data.textModel.font
                      maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)] : data.jobsSize;
    };
}
#pragma mark —— lazyLoad
-(UILabel *)textLab{
    if (!_textLab) {
        @jobs_weakify(self)
        _textLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.backgroundColor = self.viewModel.bgCor;
            label.textColor = self.viewModel.textModel.textCor;
            label.textAlignment = NSTextAlignmentCenter;
            label.text = self.viewModel.textModel.text;
            label.font = self.viewModel.textModel.font;
            [self.contentView.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.contentView);
            }];
        });
    }return _textLab;
}

@end
