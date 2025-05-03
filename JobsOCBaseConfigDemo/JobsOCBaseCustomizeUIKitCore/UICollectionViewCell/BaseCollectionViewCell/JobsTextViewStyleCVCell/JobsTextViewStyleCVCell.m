//
//  JobsTextViewStyleCVCell.m
//  FMNormal
//
//  Created by Jobs on 2025/4/28.
//

#import "JobsTextViewStyleCVCell.h"

@interface JobsTextViewStyleCVCell ()

@end

@implementation JobsTextViewStyleCVCell
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
/// UIViewModelProtocol
UIViewModelProtocol_synthesize_part1
UIViewModelProtocol_synthesize_part2
/// BaseLayerProtocol
BaseLayerProtocol_synthesize_part3
/// BaseViewProtocol
BaseViewProtocol_synthesize
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
    JobsTextViewStyleCVCell *cell = JobsRegisterDequeueCollectionViewCell(JobsTextViewStyleCVCell);
    // UICollectionViewCell圆切角
//    cell.contentView.layer.cornerRadius = cell.layer.cornerRadius = JobsWidth(8);
//    cell.contentView.layer.borderWidth = cell.layer.borderWidth = JobsWidth(1);
//    cell.contentView.layer.borderColor = cell.layer.borderColor = RGBA_COLOR(255, 225, 144, 1).CGColor;
//    cell.contentView.layer.masksToBounds = cell.layer.masksToBounds = YES;
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
/// TODO
#pragma mark —— lazyLoad
/// 如果需要用其他的自定义的TextView，继承此类并重写-(JobsReturnCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy;
-(__kindof UITextView *)textView{
    if (!_textView) {
        @jobs_weakify(self)
        _textView = jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
            @jobs_strongify(self)
            textView.delegate = self;
            textView.dataDetectorTypes = UIDataDetectorTypeLink; /// 启用链接检测
            textView.editable = NO; /// 禁止编辑。必须 editable = NO 才能点击链接跳转
            textView.selectable = YES; /// 允许选择链接
            textView.linkTextAttributes = self.makeLinkTextAttributes; /// Style for links
            /// 富文本的优先级大于普通文本
            if(self.viewModel.attributedTitle){
                textView.attributedText = self.viewModel.attributedTitle;
                textView.linkTextAttributes = self.makeLinkTextAttributes; /// Style for links
            }else{
                textView.text = self.viewModel.text;
                textView.textAlignment = self.viewModel.textAlignment;
                textView.textColor = self.viewModel.textCor;
                textView.font = self.viewModel.font;
            }[self.contentView.addSubview(textView) mas_makeConstraints:self.masonryBlock];
        });
    }return _textView;
}

-(__kindof SZTextView *)szTextView{
    if (!_szTextView) {
        @jobs_weakify(self)
        _szTextView = jobsMakeSZTextView(^(SZTextView * _Nonnull textView) {
            @jobs_strongify(self)
            textView.delegate = self;
            textView.textColor = JobsBlackColor;
            textView.backgroundColor = JobsCor(@"#F9F9F9");
            textView.returnKeyType = UIReturnKeyDefault;
            textView.keyboardAppearance = UIKeyboardAppearanceDefault;
            textView.keyboardType = UIKeyboardTypeNumberPad;
            textView.placeholder = JobsInternationalization(@"请输入充值金额");
            textView.font = UIFontWeightMediumSize(18);
            textView.placeholderFont = textView.font;
            textView.placeholderColor = JobsCor(@"#AAAAAA");
            textView.linkTextAttributes = self.makeLinkTextAttributes; /// Style for links
            [textView jobsTextViewFilterBlock:^BOOL(id  _Nullable data) {
//                @jobs_strongify(self)
                return YES;
            } subscribeNextBlock:^(id _Nullable x) {
//                @jobs_strongify(self)
            }];[self.contentView.addSubview(textView) mas_makeConstraints:self.masonryBlock];
        });
    }return _textView;
}

-(__kindof JobsTextView *)jobsTextView{
    if(!_jobsTextView){
        @jobs_weakify(self)
        _jobsTextView = makeJobsTextView(^(__kindof JobsTextView * _Nullable textView) {
            @jobs_strongify(self)
            textView.szTextView.delegate = self;
            textView.szTextView.textColor = JobsBlackColor;
            textView.backgroundColor = JobsCor(@"#F9F9F9");
            textView.returnKeyType = UIReturnKeyDefault;
            textView.keyboardAppearance = UIKeyboardAppearanceDefault;
            textView.keyboardType = UIKeyboardTypeNumberPad;
            textView.placeholder = JobsInternationalization(@"请输入充值金额");
            textView.font = UIFontWeightMediumSize(18);
            textView.placeholderFont = textView.font;
            textView.placeholderColor = JobsCor(@"#AAAAAA");
            textView.szTextView.linkTextAttributes = self.makeLinkTextAttributes; /// Style for links
            [textView.szTextView jobsTextViewFilterBlock:^BOOL(id _Nullable data) {
//                @jobs_strongify(self)
                return YES;
            } subscribeNextBlock:^(id _Nullable x) {
//                @jobs_strongify(self)
            }];[self.contentView.addSubview(textView) mas_makeConstraints:self.masonryBlock];
        });
    }return _jobsTextView;
}

-(jobsByMASConstraintMakerBlock _Nullable)masonryBlock{
    @jobs_weakify(self)
    return ^(MASConstraintMaker *_Nonnull make){
        @jobs_strongify(self)
        make.edges.equalTo(self.contentView);
    };
}

@end
