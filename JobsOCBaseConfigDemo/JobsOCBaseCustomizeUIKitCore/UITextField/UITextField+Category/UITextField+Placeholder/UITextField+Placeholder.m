//
//  UITextField+Placeholder.m
//  Casino
//
//  Created by Jobs on 2021/12/20.
//

#import "UITextField+Placeholder.h"

@implementation UITextField (Placeholder)
UITextModelProtocol_dynamic
/// 修改Placeholder亦可以通过富文本来完成
-(NSAttributedString *)_defaultAttributedPlaceholder{
    return self.richTextWithDataConfigMutArr(self.titleAttributedDataMutArr);
}

-(UILabel *)placeholderLabel{
    if (isNull(self.placeholder)) self.placeholder = @" ";
    Ivar ivar = class_getInstanceVariable(UITextField.class, "_placeholderLabel");
    UILabel *placeholderLabel = object_getIvar(self, ivar);
    placeholderLabel.numberOfLines = 0;/// 默认折行处理
    return placeholderLabel;
}
#pragma mark —— @property(nonatomic,strong)UIColor *placeholderColor;
JobsKey(_placeholderColor)
-(UIColor *)placeholderColor{
    UIColor *PlaceholderColor = Jobs_getAssociatedObject(_placeholderColor);
    if (!PlaceholderColor) {
        PlaceholderColor = self.textColor;
        self.placeholderLabel.textColor = PlaceholderColor;
        Jobs_setAssociatedRETAIN_NONATOMIC(_placeholderColor, PlaceholderColor)
    }return PlaceholderColor;
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    self.placeholderLabel.textColor = placeholderColor;
    Jobs_setAssociatedRETAIN_NONATOMIC(_placeholderColor, placeholderColor)
}
#pragma mark —— @property(nonatomic,strong)UIFont *placeholderFont;
JobsKey(_placeholderFont)
-(UIFont *)placeholderFont{
    UIFont *PlaceholderFont = Jobs_getAssociatedObject(_placeholderFont);
    if (!PlaceholderFont) {
        PlaceholderFont = self.font;
        self.placeholderLabel.font = PlaceholderFont;
        Jobs_setAssociatedRETAIN_NONATOMIC(_placeholderFont, PlaceholderFont)
    }return PlaceholderFont;
}

-(void)setPlaceholderFont:(UIFont *)placeholderFont{
    self.placeholderLabel.font = placeholderFont;
    Jobs_setAssociatedRETAIN_NONATOMIC(_placeholderFont, placeholderFont)
}
#pragma mark —— @property(nonatomic,strong)NSMutableArray <JobsRichTextConfig *>*titleAttributedDataMutArr;
JobsKey(_titleAttributedDataMutArr)
-(NSMutableArray<JobsRichTextConfig *> *)titleAttributedDataMutArr{
    NSMutableArray *TitleAttributedDataMutArr = Jobs_getAssociatedObject(_titleAttributedDataMutArr);
    if (!TitleAttributedDataMutArr) {
        @jobs_weakify(self)
        TitleAttributedDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray *_Nullable data) {
            data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig *_Nullable data1) {
                @jobs_strongify(self)
                data1.targetString = self.placeholder;
                data1.font = UIFontWeightRegularSize(10);
                data1.textCor = JobsBlueColor;
        //        data1.underlineStyle;
        //        data1.paragraphStyle;
        //        data1.urlStr;
                data1.range = NSMakeRange(0, self.placeholder.length);
            }));
        });Jobs_setAssociatedRETAIN_NONATOMIC(_titleAttributedDataMutArr, TitleAttributedDataMutArr)
    }return TitleAttributedDataMutArr;
}

-(void)setTitleAttributedDataMutArr:(NSMutableArray<JobsRichTextConfig *> *)titleAttributedDataMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_titleAttributedDataMutArr, titleAttributedDataMutArr)
}
#pragma mark —— @property(nonatomic,strong,nullable)NSAttributedString *attributedText API_AVAILABLE(ios(6.0));
JobsKey(_attributedText)
-(NSAttributedString *)attributedText{
    NSAttributedString *AttributedText = Jobs_getAssociatedObject(_attributedText);
    if(!AttributedText){
        AttributedText = self.richTextWithDataConfigMutArr(self.titleAttributedDataMutArr);
    }Jobs_setAssociatedRETAIN_NONATOMIC(_attributedText, AttributedText)
    return AttributedText;
}

@end
