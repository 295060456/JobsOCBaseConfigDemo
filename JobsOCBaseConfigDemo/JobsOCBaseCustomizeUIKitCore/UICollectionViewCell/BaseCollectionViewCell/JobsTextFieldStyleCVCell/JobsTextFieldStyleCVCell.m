//
//  JobsTextFieldStyleCVCell.m
//  MataShop
//
//  Created by Jobs Hi on 10/13/23.
//

#import "JobsTextFieldStyleCVCell.h"

@interface JobsTextFieldStyleCVCell ()
/// UI
@property(nonatomic,strong)ZYTextField *textField;
/// Data

@end

@implementation JobsTextFieldStyleCVCell
@synthesize viewModel = _viewModel;
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}
#pragma mark —— JobsDoorInputViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    return self.viewModel;
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    JobsTextFieldStyleCVCell *cell = (JobsTextFieldStyleCVCell *)[collectionView collectionViewCellClass:JobsTextFieldStyleCVCell.class forIndexPath:indexPath];
    if (!cell) {
        collectionView.registerCollectionViewCellClass(JobsTextFieldStyleCVCell.class,@"");
        cell = (JobsTextFieldStyleCVCell *)[collectionView collectionViewCellClass:JobsTextFieldStyleCVCell.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell圆切角
//    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
//    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
//    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
//    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;

    cell.indexPath = indexPath;
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    self.textField.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)cellSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(327), JobsWidth(48));
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
    if (self.objectBlock) self.objectBlock(textField);// 对外统一传出TF
}
#pragma mark —— lazyLoad
-(ZYTextField *)textField{
    if (!_textField) {
        _textField = ZYTextField.new;
        _textField.delegate = self;
        _textField.textColor = JobsBlackColor;
        _textField.backgroundColor = JobsCor(@"#F9F9F9");
        _textField.returnKeyType = UIReturnKeyDefault;
        _textField.keyboardAppearance = UIKeyboardAppearanceDefault;
        _textField.keyboardType = UIKeyboardTypeNumberPad;
        _textField.placeholder = JobsInternationalization(@"请输入充值金额");
        _textField.font = UIFontWeightMediumSize(18);
        _textField.placeholderFont = _textField.font;
        _textField.placeholderColor = JobsCor(@"#AAAAAA");
        
        @jobs_weakify(self)
        [_textField jobsTextFieldEventFilterBlock:^BOOL(id data) {
//            @jobs_strongify(self)
            return YES;
        } subscribeNextBlock:^(NSString * _Nullable x) {
            @jobs_strongify(self)
            [self textFieldBlock:self->_textField
                  textFieldValue:x];
        }];
        [self.contentView addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _textField;
}

@end
