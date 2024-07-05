//
//  UIViewModel.m
//  Casino
//
//  Created by Jobs on 2021/11/19.
//

#import "UIViewModel.h"

@implementation UIViewModel

#pragma mark —— UIViewModelProtocol
UIViewModelProtocol_synthesize
#pragma mark —— lazyLoad
-(UITextModel *)textModel{
    if (!_textModel) {
        _textModel = UITextModel.new;
    }return _textModel;
}

-(UITextModel *)subTextModel{
    if (!_subTextModel) {
        _subTextModel = UITextModel.new;
    }return _subTextModel;
}

-(UITextModel *)backBtnTitleModel{
    if (!_backBtnTitleModel) {
        _backBtnTitleModel = UITextModel.new;
        _backBtnTitleModel.text = JobsInternationalization(@"Back");
        _backBtnTitleModel.textCor = HEXCOLOR(0xD3B698);
    }return _backBtnTitleModel;
}

-(UIImage *)backBtnIMG{
    if (!_backBtnIMG) {
        /// 这里修改全局返回箭头
        _backBtnIMG = JobsIMG(@"全局返回箭头");
    }return _backBtnIMG;
}

-(UIColor *)bgCor{
    if (!_bgCor) {
        _bgCor = JobsRandomColor;
    }return _bgCor;
}

-(UIImage *)image{
    if (!_image) {
//        _image = [UIImage imageWithColor:JobsRandomColor];
    }return _image;
}

-(UIImage *)bgImage{
    if (!_bgImage) {
//        _bgImage = [UIImage imageWithColor:JobsRandomColor];
    }return _bgImage;
}

-(CGFloat)cornerRadius{
    if (!_cornerRadius) {
//        _cornerRadius = 3;
    }return _cornerRadius;
}

-(CGFloat)width{
    if (_jobsWidth == 0 && !CGSizeEqualToSize(self.jobsSize, CGSizeZero)) {
        _jobsWidth = self.jobsSize.width;
    }return _jobsWidth;
}

-(CGFloat)height{
    if (_jobsHeight == 0 && !CGSizeEqualToSize(self.jobsSize, CGSizeZero)) {
        _jobsHeight = self.jobsSize.height;
    }return _jobsHeight;
}

-(CGFloat)offsetXForEach{
    if (_offsetXForEach == 0) {
//        _offsetXForEach = 8;
    }return _offsetXForEach;
}

-(CGFloat)offsetYForEach{
    if (_offsetYForEach == 0) {
//        _offsetYForEach = 8;
    }return _offsetYForEach;
}

-(NSIndexPath *)indexPath{
    if (!_indexPath) {
        _indexPath = [NSIndexPath indexPathForRow:self.row
                                        inSection:self.section];
    }return _indexPath;
}

-(NSMutableArray *)jobsDataMutArr{
    if (!_jobsDataMutArr) {
        _jobsDataMutArr = NSMutableArray.array;
    }return _jobsDataMutArr;
}

-(NSMutableSet *)jobsDataMutSet{
    if (!_jobsDataMutSet) {
        _jobsDataMutSet = NSMutableSet.set;
    }return _jobsDataMutSet;
}

-(NSMutableDictionary *)jobsDataMutDic{
    if (!_jobsDataMutDic) {
        _jobsDataMutDic = NSMutableDictionary.dictionary;
    }return _jobsDataMutDic;
}

-(NSTextAlignment)textAlignment{
    if (!_textAlignment) {
        _textAlignment = NSTextAlignmentLeft;
    }return _textAlignment;
}

-(NSLineBreakMode)lineBreakMode{
    if(!_lineBreakMode){
        _lineBreakMode = NSLineBreakByWordWrapping;
    }return _lineBreakMode;
}

-(CGFloat)textLineSpacing{
    if(!_textLineSpacing){
        _textLineSpacing = 0.0f;
    }return _textLineSpacing;
}

-(NSString *)placeholder{
    if(!_placeholder){
        _placeholder = JobsInternationalization(JobsInternationalization(@""));
    }return _placeholder;
}

-(UIColor *)placeholderColor{
    if (!_placeholderColor) {
        _placeholderColor = JobsBlackColor;
    }return _placeholderColor;
}

-(NSInteger)curWordCount{
    if(!_curWordCount){
        _curWordCount = 0;
    }return _curWordCount;
}

-(NSInteger)maxWordCount{
    if(!_maxWordCount){
        _maxWordCount = 0;
    }return _maxWordCount;
}

-(NSString *)text{
    if(!_text){
        _text = JobsInternationalization(JobsInternationalization(@""));
    }return _text;
}

-(UIFont *)font{
    if(!_font){
        _font = JobsFontRegular(17);
    }return _font;
}

-(UIColor *)textCor{
    if(!_textCor){
        _textCor = JobsBlackColor;
    }return _textCor;
}

-(NSAttributedString *)attributedText{
    if(!_attributedText){
        
    }return _attributedText;
}

-(NSMutableArray<RichTextConfig *> *)titleAttributedDataMutArr{
    if(!_titleAttributedDataMutArr){
        
    }return _titleAttributedDataMutArr;
}

-(NSString *)selectedText{
    if(!_selectedText){
        _selectedText = JobsInternationalization(JobsInternationalization(@""));
    }return _selectedText;
}

-(UIFont *)selectedFont{
    if(!_selectedFont){
        
    }return _selectedFont;
}

-(UIColor *)selectedTextCor{
    if(!_selectedTextCor){
        
    }return _selectedTextCor;
}

-(NSAttributedString *)selectedAttributedText{
    if(!_selectedAttributedText){
        
    }return _selectedAttributedText;
}

-(NSMutableArray<RichTextConfig *> *)selectedTitleAttributedDataMutArr{
    if(!_selectedTitleAttributedDataMutArr){
        
    }return _selectedTitleAttributedDataMutArr;
}

-(NSMutableArray<JobsReturnIDByIDBlock> *)jobsBlockMutArr{
    if(!_jobsBlockMutArr){
        _jobsBlockMutArr = NSMutableArray.array;
    }return _jobsBlockMutArr;
}

@end
