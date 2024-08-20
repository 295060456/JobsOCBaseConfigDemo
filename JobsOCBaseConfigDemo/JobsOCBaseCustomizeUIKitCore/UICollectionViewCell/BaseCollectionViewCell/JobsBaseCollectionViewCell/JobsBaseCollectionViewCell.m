//
//  JobsBaseCollectionViewCell.m
//  UBallLive
//
//  Created by Jobs on 2020/10/18.
//

#import "JobsBaseCollectionViewCell.h"

@interface JobsBaseCollectionViewCell ()
/// UI
@property(nonatomic,strong)UITextView *textView;
@property(nonatomic,strong)BaseButton *bgBtn;

@end

@implementation JobsBaseCollectionViewCell
@synthesize viewModel = _viewModel;
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self.jobsRichElementsInCellWithModel(nil);
    }return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
}
#pragma mark —— UICollectionViewCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    JobsBaseCollectionViewCell *cell = (JobsBaseCollectionViewCell *)[collectionView collectionViewCellClass:JobsBaseCollectionViewCell.class forIndexPath:indexPath];
    if (!cell) {
        collectionView.registerCollectionViewCellClass(JobsBaseCollectionViewCell.class,@"");
        cell = (JobsBaseCollectionViewCell *)[collectionView collectionViewCellClass:JobsBaseCollectionViewCell.class forIndexPath:indexPath];
    }
    
    // UICollectionViewCell圆切角
//    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
//    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
//    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
//    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;

    cell.indexPath = indexPath;
    
    return cell;
}

-(UITextView *)getTextView{
    return self.textView;
}

-(UIButton *)getBgBtn{
    return self.bgBtn;
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
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        /// 如果有图片则只显示这个图片，并铺满
        BOOL A = model.bgImage || model.image;
        BOOL B = (![model.textModel.text isEqualToString:JobsInternationalization(TextModelDataString)] && model.textModel.text) || model.textModel.attributedText;

        if (A || self.forceUseBgBtn) {
            self.bgBtn.jobsVisible = A || self.forceUseBgBtn;
            return;
        }
        /// 如果有文字（普通文本 或者富文本）则只显示这个文字（普通文本 或者富文本），并铺满
        if (B || self.forceUsetextView) {
            /// ❤️textView 和 bgBtn不能共存❤️
            self.bgBtn.jobsVisible = !B || self.forceUsetextView;
            self.textView.jobsVisible = B || self.forceUsetextView;
            return;
        }
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
-(BaseButton *)bgBtn{
    if (!_bgBtn) {
        @jobs_weakify(self)
        _bgBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                   background:nil
                                   buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                textAlignment:NSTextAlignmentCenter
                                             subTextAlignment:NSTextAlignmentCenter
                                                  normalImage:nil
                                               highlightImage:nil
                                              attributedTitle:nil
                                      selectedAttributedTitle:nil
                                           attributedSubtitle:nil
                                                        title:nil
                                                     subTitle:nil
                                                    titleFont:nil
                                                 subTitleFont:nil
                                                     titleCor:nil
                                                  subTitleCor:nil
                                           titleLineBreakMode:NSLineBreakByWordWrapping
                                        subtitleLineBreakMode:NSLineBreakByWordWrapping
                                          baseBackgroundColor:nil
                                              backgroundImage:nil
                                                 imagePadding:JobsWidth(0)
                                                 titlePadding:JobsWidth(0)
                                               imagePlacement:NSDirectionalRectEdgeNone
                                   contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                     contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                contentInsets:jobsSameDirectionalEdgeInsets(0)
                                            cornerRadiusValue:JobsWidth(0)
                                              roundingCorners:UIRectCornerAllCorners
                                         roundingCornersRadii:CGSizeZero
                                               layerBorderCor:nil
                                                  borderWidth:JobsWidth(0)
                                                primaryAction:nil
                                   longPressGestureEventBlock:^id(id _Nullable weakSelf,
                                                                id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            return nil;
        }
                                              clickEventBlock:^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
        _bgBtn.userInteractionEnabled = NO;
        [self.contentView addSubview:_bgBtn];
        [_bgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
    _bgBtn.normalImage(self.viewModel.image);
    _bgBtn.normalTitle(self.viewModel.textModel.text);
    _bgBtn.normalBackgroundImage(self.viewModel.bgImage);
    _bgBtn.normalAttributedTitle(self.viewModel.textModel.attributedText);
    _bgBtn.normalTitleColor(self.viewModel.textModel.textCor);
    
    _bgBtn.selectedImage(self.viewModel.selectedImage_);
    _bgBtn.selectedTitle(self.viewModel.textModel.selectedText);
    _bgBtn.selectedBackgroundImage(self.viewModel.bgSelectedImage);
    _bgBtn.selectedAttributedTitle(self.viewModel.textModel.selectedAttributedText);
    _bgBtn.selectedTitleColor(self.viewModel.textModel.selectedTextCor);
    
    _bgBtn.titleFont(self.viewModel.textModel.font);
    _bgBtn.titleAlignment = self.viewModel.textModel.textAlignment;
    _bgBtn.makeNewLineShows(self.viewModel.textModel.lineBreakMode);
    [_bgBtn layoutButtonWithEdgeInsetsStyle:self.viewModel.buttonEdgeInsetsStyle
                               imagePadding:self.viewModel.imageTitleSpace];
    return _bgBtn;
}

-(UITextView *)textView{
    if (!_textView) {
        _textView = UITextView.new;
        _textView.editable = NO;
        _textView.userInteractionEnabled = NO;
        _textView.textColor = self.selected ? self.viewModel.textModel.selectedTextCor : self.viewModel.textModel.textCor;
        [self.contentView addSubview:_textView];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        [self layoutIfNeeded];
//        @jobs_weakify(self)
        [_textView jobsTextViewFilterBlock:^BOOL(id data) {
//            @jobs_strongify(self)
            return YES;
        } subscribeNextBlock:^(id data) {
//            @jobs_strongify(self)
        }];
    }
    NSLog(@"SSS = %d,self = %@",self.selected,self);
//    _textView.attributedText = self.viewModel.textModel.attributedText;
    _textView.font = self.viewModel.textModel.font;
    _textView.textAlignment = self.viewModel.textModel.textAlignment;
    _textView.text = self.viewModel.textModel.text;
    [_textView contentSizeToFitByFont:_textView.font];
    NSLog(@"textView.text = %@",_textView.text);
    return _textView;
}

@end
