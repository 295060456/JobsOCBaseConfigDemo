//
//  UITextField+Placeholder.m
//  Casino
//
//  Created by Jobs on 2021/12/20.
//

#import "UITextField+Placeholder.h"

@implementation UITextField (Placeholder)
/// 修改Placeholder亦可以通过富文本来完成
-(NSAttributedString *)defaultAttributedPlaceholder{
    return self.richTextWithDataConfigMutArr(self.defaultAttributedDataForPlaceHolderMutArr);
}

-(UILabel *)placeholderLabel{
    //placeholder为nil或者为JobsInternationalization(@""),placeholderLabel均为nil
    if (!self.placeholder.length || !self.placeholder) {
        self.placeholder = @" ";
    }
    Ivar ivar = class_getInstanceVariable(UITextField.class, "_placeholderLabel");
    UILabel *placeholderLabel = object_getIvar(self, ivar);
    placeholderLabel.numberOfLines = 0;/// 默认折行处理
    return placeholderLabel;
}
#pragma mark —— @property(nonatomic,strong)UIColor *placeholderColor;
JobsKey(_placeholderColor)
@dynamic placeholderColor;
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
@dynamic placeholderFont;
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
#pragma mark —— @property(nonatomic,strong)NSMutableArray <JobsRichTextConfig *>*defaultAttributedDataMutArr;
JobsKey(_defaultAttributedDataForPlaceHolderMutArr)
@dynamic defaultAttributedDataForPlaceHolderMutArr;
-(NSMutableArray<JobsRichTextConfig *> *)defaultAttributedDataForPlaceHolderMutArr{
    NSMutableArray *DefaultAttributedDataMutArr = Jobs_getAssociatedObject(_defaultAttributedDataForPlaceHolderMutArr);
    if (!DefaultAttributedDataMutArr) {
        DefaultAttributedDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                data1.targetString = self.placeholder;
                data1.font = UIFontWeightRegularSize(10);
                data1.textCor = JobsBlueColor;
        //        data1.underlineStyle;
        //        data1.paragraphStyle;
        //        data1.urlStr;
                data1.range =  NSMakeRange(0, self.placeholder.length);
            }));
        });
        Jobs_setAssociatedRETAIN_NONATOMIC(_defaultAttributedDataForPlaceHolderMutArr, DefaultAttributedDataMutArr)
    }return DefaultAttributedDataMutArr;
}

-(void)setDefaultAttributedDataForPlaceHolderMutArr:(NSMutableArray<JobsRichTextConfig *> *)defaultAttributedDataMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_defaultAttributedDataForPlaceHolderMutArr, defaultAttributedDataMutArr)
}

@end
