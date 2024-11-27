//
//  UITextView+IndicateWordLimit.m
//  DouDong-II
//
//  Created by Jobs on 2021/2/25.
//

#import "UITextView+IndicateWordLimit.h"

@implementation UITextView (IndicateWordLimit)
#pragma mark —— @property(nonatomic,strong)UILabel *indicateWordLimitLab;
JobsKey(_indicateWordLimitLab)
@dynamic indicateWordLimitLab;
-(UILabel *)indicateWordLimitLab{
    UILabel *IndicateWordLimitLab = Jobs_getAssociatedObject(_indicateWordLimitLab);
    if (!IndicateWordLimitLab) {
        @jobs_weakify(self)
        IndicateWordLimitLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.textColor = RGB_COLOR(132, 134, 140);
            label.textAlignment = NSTextAlignmentCenter;
            label.font = UIFontWeightMediumSize(10);
            label.text = [NSString stringWithFormat:@"   %ld / %ld   ",self.currentWordNum,self.wordLimitNum];
            label.makeLabelByShowingType(UILabelShowingType_03);
            self.addSubview(label);
            label.right = self.width - self.offsetX;
            label.bottom = self.height - self.offsetY;
            Jobs_setAssociatedRETAIN_NONATOMIC(_indicateWordLimitLab, label)
        });
    }return IndicateWordLimitLab;
}

-(void)setIndicateWordLimitLab:(UILabel *)indicateWordLimitLab{
    Jobs_setAssociatedRETAIN_NONATOMIC(_indicateWordLimitLab, indicateWordLimitLab)
}
#pragma mark —— @property(nonatomic,assign)NSInteger currentWordNum;//当前输入的字符数
JobsKey(_currentWordNum)
@dynamic currentWordNum;
-(NSInteger)currentWordNum{
    return [Jobs_getAssociatedObject(_currentWordNum) integerValue];
}

-(void)setCurrentWordNum:(NSInteger)currentWordNum{
    self.indicateWordLimitLab.text = [NSString stringWithFormat:@"   %ld / %ld   ",currentWordNum,self.wordLimitNum];
    self.indicateWordLimitLab.makeLabelByShowingType(UILabelShowingType_03);
    Jobs_setAssociatedRETAIN_NONATOMIC(_currentWordNum, @(currentWordNum))
}
#pragma mark —— @property(nonatomic,assign)NSInteger wordimitNum;//字符输入上限
JobsKey(_wordLimitNum)
@dynamic wordLimitNum;
-(NSInteger)wordLimitNum{
    NSInteger WordLimitNum = [Jobs_getAssociatedObject(_wordLimitNum) integerValue];
    if (!WordLimitNum) {
        WordLimitNum = 500;
        Jobs_setAssociatedRETAIN_NONATOMIC(_wordLimitNum, @(WordLimitNum))
    }return WordLimitNum;
}

-(void)setWordLimitNum:(NSInteger)wordLimitNum{
    Jobs_setAssociatedRETAIN_NONATOMIC(_wordLimitNum, @(wordLimitNum))
}
#pragma mark —— @property(nonatomic,assign)CGFloat offsetX;
JobsKey(_offsetX)
@dynamic offsetX;
-(CGFloat)offsetX{
    CGFloat OffsetX = [Jobs_getAssociatedObject(_offsetX) floatValue];
    if (!OffsetX) {
        OffsetX = JobsWidth(19.1);
        Jobs_setAssociatedRETAIN_NONATOMIC(_offsetX, @(OffsetX))
    }return OffsetX;
}

-(void)setOffsetX:(CGFloat)offsetX{
    Jobs_setAssociatedRETAIN_NONATOMIC(_offsetX, @(offsetX))
}
#pragma mark —— @property(nonatomic,assign)CGFloat offsetY;
JobsKey(_offsetY)
@dynamic offsetY;
-(CGFloat)offsetY{
    CGFloat OffsetY = [Jobs_getAssociatedObject(_offsetY) floatValue];
    if (!OffsetY) {
        OffsetY = JobsWidth(13.1);
        Jobs_setAssociatedRETAIN_NONATOMIC(_offsetY, @(OffsetY))
    }return OffsetY;
}

-(void)setOffsetY:(CGFloat)offsetY{
    Jobs_setAssociatedRETAIN_NONATOMIC(_offsetY, @(offsetY))
}

@end
