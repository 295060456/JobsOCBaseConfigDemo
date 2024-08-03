//
//  UITextModel.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/17.
//

#import "UITextModel.h"

@implementation UITextModel
UITextModelProtocol_synthesize
UITextModelProtocol_UIViewModelSynthesize
UILocationProtocol_UIViewModelSynthesize
UIViewModelOthersProtocol_synthesize

-(UIColor *)textCor{
    if (!_textCor) {
        _textCor = RGB_SAMECOLOR(51);
    }return _textCor;
}

-(UIFont *)font{
    if (!_font) {
        _font = UIFontWeightRegularSize(12);
    }return _font;
}

-(NSString *)text{
    if (!_text) {
#ifdef DEBUG
        _text = JobsInternationalization(TextModelDataString);
#endif
    }return _text;
}

-(UILabelShowingType)labelShowingType{
    if (!_labelShowingType) {
        /// 默认：一行显示。不定宽、定高、定字体。宽度自适应 【单行：ByFont】
        _labelShowingType = UILabelShowingType_03;
    }return _labelShowingType;
}

@end
