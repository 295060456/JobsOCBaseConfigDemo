//
//  JobsBtnsStyleCVCell.m
//  FM
//
//  Created by User on 8/18/24.
//

#import "JobsBtnsStyleCVCell.h"

@interface JobsBtnsStyleCVCell ()
/// UI
Prop_strong()BaseButton *leftBtn;
Prop_strong()BaseButton *rightBtn;
/// Data
Prop_strong()UIButtonModel *leftBtnVM;
Prop_strong()UIButtonModel *rightBtnVM;

@end

@implementation JobsBtnsStyleCVCell
/// UIViewModelProtocol
UIViewModelProtocol_synthesize_part1
UIViewModelProtocol_synthesize_part2
/// BaseLayerProtocol
BaseLayerProtocol_synthesize_part3
#pragma mark —— 复写父类相关方法和属性
-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    JobsBtnsStyleCVCell *cell = JobsRegisterDequeueCollectionViewCell(JobsBtnsStyleCVCell);
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
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        self.leftBtnVM = self.viewModel.data;
        self.rightBtnVM = self.viewModel.requestParams;
        
        self.leftBtn.alpha = 1;
        self.rightBtn.alpha = 1;
        return self;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(55);
    };
}
#pragma mark —— BaseViewProtocol
/// 获取绑定的数据源
-(UIViewModel *)getViewModel{
    return self.viewModel;
}
#pragma mark —— lazyLoad
-(BaseButton *)leftBtn{
    if(!_leftBtn){
        @jobs_weakify(self)
        _leftBtn = self.contentView.addSubview(BaseButton
                                               .jobsInit()
                                               .onClickBy(^(UIButton *x){
                                                   @jobs_strongify(self)
                                                   if (self.objBlock) self.objBlock(x);
                                               }).onLongPressGestureBy(^(id data){
                                                   JobsLog(@"");
                                               })).byAdd(^(MASConstraintMaker *make) {
                                                   @jobs_strongify(self)
                                                   make.centerY.equalTo(self.contentView);
                                                   make.left.equalTo(self.contentView).offset(self.leftBtnVM.jobsOffsetX);
                                                   make.height.mas_equalTo(self.leftBtnVM.jobsWidth);
                                               });
        _leftBtn.tag = 1;
    }
    
    _leftBtn.data = self.leftBtnVM;
    if(self.leftBtnVM.attributedTitle){
        _leftBtn.jobsResetAttributedTitle(self.leftBtnVM.attributedTitle);
    }else{
        if(self.leftBtnVM.title){
            _leftBtn.jobsResetBtnTitle(self.leftBtnVM.title);
            _leftBtn.jobsResetTitleFont(self.leftBtnVM.titleFont);
            _leftBtn.jobsResetBtnTitleCor(self.leftBtnVM.titleCor);
        }
    }
    
    if(self.leftBtnVM.attributedSubTitle){
        _leftBtn.jobsResetAttributedTitle(self.leftBtnVM.attributedSubTitle);
    }else{
        if(self.leftBtnVM.subTitle){
            _leftBtn.jobsResetBtnTitle(self.leftBtnVM.subTitle);
            _leftBtn.jobsResetTitleFont(self.leftBtnVM.subTitleFont);
            _leftBtn.jobsResetBtnTitleCor(self.leftBtnVM.subTitleCor);
        }
    }
    
    _leftBtn.selected = self.leftBtnVM.jobsSelected;
    
    if(self.leftBtnVM.normalImage){
        _leftBtn.jobsResetBtnImage(_rightBtn.selected ? self.leftBtnVM.highlightImage : self.leftBtnVM.normalImage);
        _leftBtn.jobsResetImagePlacement(NSDirectionalRectEdgeLeading);
        _leftBtn.jobsResetImagePadding(JobsWidth(5));
    }
    _leftBtn.makeBtnTitleByShowingType(self.leftBtnVM.titleShowingType);
    _leftBtn.jobsResetBtnBgCor(self.leftBtnVM.baseBackgroundColor);
    
    return _leftBtn;
}

-(BaseButton *)rightBtn{
    if(!_rightBtn){
        @jobs_weakify(self)
        _rightBtn = self.contentView.addSubview(BaseButton
                                                .jobsInit()
                                                .onClickBy(^(UIButton *x){
                                                    @jobs_strongify(self)
                                                    if (self.objBlock) self.objBlock(x);
                                            }).onLongPressGestureBy(^(id data){
                                                JobsLog(@"");
                                            })).byAdd(^(MASConstraintMaker *make) {
                                                @jobs_strongify(self)
                                                make.centerY.equalTo(self.contentView);
                                                make.right.equalTo(self.contentView).offset(-self.rightBtnVM.jobsOffsetX);
                                                make.height.mas_equalTo(self.rightBtnVM.jobsHeight);
                                            });
        _rightBtn.tag = 2;
    }
    
    _rightBtn.data = self.rightBtnVM;
    if(self.rightBtnVM.attributedTitle){
        _rightBtn.jobsResetAttributedTitle(self.rightBtnVM.attributedTitle);
    }else{
        if(self.rightBtnVM.title){
            _rightBtn.jobsResetBtnTitle(self.rightBtnVM.title);
            _rightBtn.jobsResetTitleFont(self.rightBtnVM.titleFont);
            _rightBtn.jobsResetBtnTitleCor(self.rightBtnVM.titleCor);
        }
    }
    
    if(self.rightBtnVM.attributedSubTitle){
        _rightBtn.jobsResetAttributedTitle(self.rightBtnVM.attributedSubTitle);
    }else{
        if(self.rightBtnVM.subTitle){
            _rightBtn.jobsResetBtnSubTitle(self.rightBtnVM.subTitle);
            _rightBtn.jobsResetSubTitleFont(self.rightBtnVM.subTitleFont);
            _rightBtn.jobsResetSubTitleBaseForegroundColor(self.rightBtnVM.subTitleCor);
        }
    }
    
    _rightBtn.jobsResetSubTitleTextAlignment(NSTextAlignmentRight);
    
    _rightBtn.selected = self.rightBtnVM.jobsSelected;
    
    if(self.rightBtnVM.normalImage){
        _rightBtn.jobsResetBtnImage(_rightBtn.selected ? self.rightBtnVM.highlightImage : self.rightBtnVM.normalImage);
        _rightBtn.jobsResetImagePlacement(NSDirectionalRectEdgeLeading);
        _rightBtn.jobsResetImagePadding(JobsWidth(5));
    }
    
    _rightBtn.makeBtnTitleByShowingType(self.rightBtnVM.titleShowingType);
    _rightBtn.jobsResetBtnBgCor(self.rightBtnVM.baseBackgroundColor);
    
    return _rightBtn;
}

@end
