//
//  JobsHotLabelWithMultiLineCVCell.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/15.
//

#import "JobsHotLabelWithMultiLineCVCell.h"

@interface JobsHotLabelWithMultiLineCVCell ()

@property(nonatomic,strong)UILabel *textLab;

@end

@implementation JobsHotLabelWithMultiLineCVCell
@synthesize viewModel = _viewModel;
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}
#pragma mark —— JobsDoorInputViewProtocol
-(UILabel *_Nullable)getTextLab{
    return self.textLab;
}

-(UIViewModel *_Nullable)getViewModel{
    return self.viewModel;
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    JobsHotLabelWithMultiLineCVCell *cell = (JobsHotLabelWithMultiLineCVCell *)[collectionView collectionViewCellClass:JobsHotLabelWithMultiLineCVCell.class forIndexPath:indexPath];
    if (!cell) {
        collectionView.registerCollectionViewCellClass(JobsHotLabelWithMultiLineCVCell.class,@"");
        cell = (JobsHotLabelWithMultiLineCVCell *)[collectionView collectionViewCellClass:JobsHotLabelWithMultiLineCVCell.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell圆切角
//    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
//    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
//    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
//    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;

    cell.indexPath = indexPath;
    
    return cell;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        [self.textLab removeFromSuperview];
        self->_textLab = nil;
        self.viewModel = model;
        if (self.viewModel) {
            self.textLab.alpha = 1;
        }
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeEqualToSize(model.jobsSize, CGSizeZero) ? [UILabel sizeWithText:model.textModel.text
                                                                            font:model.textModel.font
                                                                         maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)] : model.jobsSize;
}
#pragma mark —— lazyLoad
-(UILabel *)textLab{
    if (!_textLab) {
        _textLab = UILabel.new;
        _textLab.backgroundColor = self.viewModel.bgCor;
        _textLab.textColor = self.viewModel.textModel.textCor;
        _textLab.textAlignment = NSTextAlignmentCenter;
        _textLab.text = self.viewModel.textModel.text;
        _textLab.font = self.viewModel.textModel.font;
        [self.contentView addSubview:_textLab];
        [_textLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _textLab;
}

@end
