//
//  JobsTextFieldStyleCVCell.m
//  MataShop
//
//  Created by Jobs Hi on 10/13/23.
//

#import "JobsTextFieldStyleCVCell.h"

@interface JobsTextFieldStyleCVCell ()

@end

@implementation JobsTextFieldStyleCVCell
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
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    JobsTextFieldStyleCVCell *cell = JobsRegisterDequeueCollectionViewCell(JobsTextFieldStyleCVCell);
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
        self.textField.alpha = 1;
        return self;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)cellSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(327), JobsWidth(48));
    };
}
#pragma mark —— 一些公有方法
-(ZYTextField *)getTextField{
    return self.textField;
}
#pragma mark —— 一些私有方法
-(void)textFieldBlock:(ZYTextField *)textField
       textFieldValue:(NSString *)value{
    
//    self.textFieldInputModel.resString = value;
//    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeHolderStr;
//    textField.requestParams = self.textFieldInputModel;
//
    if (self.objBlock) self.objBlock(textField);// 对外统一传出TF
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize textField = _textField;
-(ZYTextField *)textField{
    if (!_textField) {
        @jobs_weakify(self)
        _textField = self.contentView.addSubview(jobsMakeZYTextField(^(ZYTextField * _Nullable textField) {
            @jobs_strongify(self)
            textField.delegate = self;
            textField.textColor = JobsBlackColor;
            textField.backgroundColor = JobsCor(@"#F9F9F9");
            textField.returnKeyType = UIReturnKeyDefault;
            textField.keyboardAppearance = UIKeyboardAppearanceDefault;
            textField.keyboardType = UIKeyboardTypeNumberPad;
            textField.placeholder = JobsInternationalization(@"请输入充值金额");
            textField.font = UIFontWeightMediumSize(18);
            textField.placeholderFont = textField.font;
            textField.placeholderColor = JobsCor(@"#AAAAAA");
            [textField jobsTextFieldEventFilterBlock:^BOOL(id data) {
    //            @jobs_strongify(self)
                return YES;
            } subscribeNextBlock:^(NSString * _Nullable x) {
                @jobs_strongify(self)
                [self textFieldBlock:textField textFieldValue:x];
            }];
        })).masonryBy(^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.edges.equalTo(self.contentView);
        });
    }return _textField;
}

@end
