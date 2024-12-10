//
//  UIButton+UIControlState.m
//  FM
//
//  Created by Admin on 10/12/2024.
//

#import "UIButton+UIControlState.h"

@implementation UIButton (UIControlState)
#pragma mark —— UIButton.image
-(JobsReturnImageByNSUIntegerBlock _Nonnull)imageByState{
    @jobs_weakify(self)
    return ^UIImage *_Nullable(UIControlState data){
        @jobs_strongify(self)
        return [self imageForState:data];
    };
}

-(UIImage *_Nullable)imageByNormalState{
    return self.imageByState(UIControlStateNormal);
}

-(UIImage *_Nullable)imageByHighlightedState{
    return self.imageByState(UIControlStateHighlighted);
}

-(UIImage *_Nullable)imageByDisabledState{
    return self.imageByState(UIControlStateDisabled);
}

-(UIImage *_Nullable)imageBySelectedState{
    return self.imageByState(UIControlStateSelected);
}

-(UIImage *_Nullable)imageByFocusedState API_AVAILABLE(ios(9.0)){
    return self.imageByState(UIControlStateFocused);
}

-(UIImage *_Nullable)imageByApplicationState{
    return self.imageByState(UIControlStateApplication);
}

-(UIImage *_Nullable)imageByReservedState{
    return self.imageByState(UIControlStateReserved);
}

-(JobsReturnButtonByImageBlock _Nonnull)normalStateImage{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateNormal];
        return self;
    };
}

-(JobsReturnButtonByImageBlock _Nonnull)highlightedStateImage{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateHighlighted];
        return self;
    };
}

-(JobsReturnButtonByImageBlock _Nonnull)disabledStateImage{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateDisabled];
        return self;
    };
}

-(JobsReturnButtonByImageBlock _Nonnull)selectedStateImage{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateSelected];
        return self;
    };
}

-(JobsReturnButtonByImageBlock _Nonnull)focusedStateImage API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateFocused];
        return self;
    };
}

-(JobsReturnButtonByImageBlock _Nonnull)applicationStateImage{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateApplication];
        return self;
    };
}

-(JobsReturnButtonByImageBlock _Nonnull)reservedStateImage{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateReserved];
        return self;
    };
}
#pragma mark —— UIButton.backgroundImage
-(JobsReturnImageByNSUIntegerBlock _Nonnull)backgroundImageByState{
    @jobs_weakify(self)
    return ^UIImage *_Nullable(UIControlState data){
        @jobs_strongify(self)
        return [self backgroundImageForState:data];
    };
}

-(UIImage *_Nullable)backgroundImageByNormalState{
    return self.backgroundImageByState(UIControlStateNormal);
}

-(UIImage *_Nullable)backgroundImageByHighlightedState{
    return self.backgroundImageByState(UIControlStateHighlighted);
}

-(UIImage *_Nullable)backgroundImageByDisabledState{
    return self.backgroundImageByState(UIControlStateDisabled);
}

-(UIImage *_Nullable)backgroundImageBySelectedState{
    return self.backgroundImageByState(UIControlStateSelected);
}

-(UIImage *_Nullable)backgroundImageByFocusedState API_AVAILABLE(ios(9.0)){
    return self.backgroundImageByState(UIControlStateFocused);
}

-(UIImage *_Nullable)backgroundImageByApplicationState{
    return self.backgroundImageByState(UIControlStateApplication);
}

-(UIImage *_Nullable)backgroundImageByReservedState{
    return self.backgroundImageByState(UIControlStateReserved);
}

-(JobsReturnButtonByImageBlock _Nonnull)normalStateBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
        return self;
    };
}

-(JobsReturnButtonByImageBlock _Nonnull)highlightedStateBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateHighlighted];
        return self;
    };
}

-(JobsReturnButtonByImageBlock _Nonnull)disabledStateBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateDisabled];
        return self;
    };
}

-(JobsReturnButtonByImageBlock _Nonnull)selectedStateBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateSelected];
        return self;
    };
}

-(JobsReturnButtonByImageBlock _Nonnull)focusedStateBackgroundImage API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateFocused];
        return self;
    };
}

-(JobsReturnButtonByImageBlock _Nonnull)applicationStateBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateApplication];
        return self;
    };
}

-(JobsReturnButtonByImageBlock _Nonnull)reservedStateBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateReserved];
        return self;
    };
}
#pragma mark —— UIButton.titleColor
-(JobsReturnColorByNSUIntegerBlock _Nonnull)titleColorByState{
    @jobs_weakify(self)
    return ^UIColor *_Nullable(UIControlState data){
        @jobs_strongify(self)
        return [self titleColorForState:data];
    };
}

-(UIColor *_Nullable)titleColorByNormalState{
    return self.titleColorByState(UIControlStateNormal);
}

-(UIColor *_Nullable)titleColorByHighlightedState{
    return self.titleColorByState(UIControlStateHighlighted);
}

-(UIColor *_Nullable)titleColorByDisabledState{
    return self.titleColorByState(UIControlStateDisabled);
}

-(UIColor *_Nullable)titleColorBySelectedState{
    return self.titleColorByState(UIControlStateSelected);
}

-(UIColor *_Nullable)titleColorByFocusedState API_AVAILABLE(ios(9.0)){
    return self.titleColorByState(UIControlStateFocused);
}

-(UIColor *_Nullable)titleColorByApplicationState{
    return self.titleColorByState(UIControlStateApplication);
}

-(UIColor *_Nullable)titleColorByReservedState{
    return self.titleColorByState(UIControlStateReserved);
}

-(JobsReturnButtonByColorBlock _Nonnull)normalStateTitleColor{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        return self;
    };
}

-(JobsReturnButtonByColorBlock _Nonnull)highlightedStateTitleColor{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateHighlighted];
        return self;
    };
}

-(JobsReturnButtonByColorBlock _Nonnull)disabledStateTitleColor{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateDisabled];
        return self;
    };
}

-(JobsReturnButtonByColorBlock _Nonnull)selectedStateTitleColor{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateSelected];
        return self;
    };
}

-(JobsReturnButtonByColorBlock _Nonnull)focusedStateTitleColor API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateFocused];
        return self;
    };
}

-(JobsReturnButtonByColorBlock _Nonnull)ApplicationStateTitleColor{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateApplication];
        return self;
    };
}

-(JobsReturnButtonByColorBlock _Nonnull)reservedStateTitleColor{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateReserved];
        return self;
    };
}
#pragma mark —— UIButton.subtitleColor
/// TODO
#pragma mark —— UIButton.title
-(JobsReturnStringByUIntegerBlock _Nonnull)titleByState{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(UIControlState data){
        @jobs_strongify(self)
        return [self titleForState:data];
    };
}

-(NSString *_Nullable)titleByNormalState{
    return self.titleByState(UIControlStateNormal);
}

-(NSString *_Nullable)titleByHighlightedState{
    return self.titleByState(UIControlStateHighlighted);
}

-(NSString *_Nullable)titleByDisabledState{
    return self.titleByState(UIControlStateDisabled);
}

-(NSString *_Nullable)titleBySelectedState{
    return self.titleByState(UIControlStateSelected);
}

-(NSString *_Nullable)titleByFocusedState API_AVAILABLE(ios(9.0)){
    return self.titleByState(UIControlStateFocused);
}

-(NSString *_Nullable)titleByApplicationState{
    return self.titleByState(UIControlStateApplication);
}

-(NSString *_Nullable)titleByReservedState{
    return self.titleByState(UIControlStateReserved);
}

-(JobsReturnButtonByStringBlock _Nonnull)normalStateTitle{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

-(JobsReturnButtonByStringBlock _Nonnull)highlightedStateTitle{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateHighlighted];
        return self;
    };
}

-(JobsReturnButtonByStringBlock _Nonnull)disabledStateTitle{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateDisabled];
        return self;
    };
}

-(JobsReturnButtonByStringBlock _Nonnull)selectedStateTitle{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateSelected];
        return self;
    };
}

-(JobsReturnButtonByStringBlock _Nonnull)focusedStateTitle API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateFocused];
        return self;
    };
}

-(JobsReturnButtonByStringBlock _Nonnull)applicationStateTitle{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateApplication];
        return self;
    };
}

-(JobsReturnButtonByStringBlock _Nonnull)reservedStateTitle{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateReserved];
        return self;
    };
}
#pragma mark —— UIButton.subtitle
-(NSAttributedString *_Nullable)attributedSubtitle{
    return self.subtitleLabel.attributedText;
}
#pragma mark —— UIButton.attributedTitle
-(NSAttributedString *_Nullable)attributedTitle{
    return self.titleLabel.attributedText;
}

-(JobsReturnAttributedStringByNSUIntegerBlock _Nonnull)attributedTitleByState{
    @jobs_weakify(self)
    return ^__kindof NSAttributedString *_Nullable(UIControlState data){
        @jobs_strongify(self)
        return [self attributedTitleForState:data];
    };
}

-(NSAttributedString *_Nullable)attributedTitleByNormalState{
    return self.attributedTitleByState(UIControlStateNormal);
}

-(NSAttributedString *_Nullable)attributedTitleByHighlightedState{
    return self.attributedTitleByState(UIControlStateHighlighted);
}

-(NSAttributedString *_Nullable)attributedTitleByDisabledState{
    return self.attributedTitleByState(UIControlStateDisabled);
}

-(NSAttributedString *_Nullable)attributedTitleBySelectedState{
    return self.attributedTitleByState(UIControlStateSelected);
}

-(NSAttributedString *_Nullable)attributedTitleByFocusedState API_AVAILABLE(ios(9.0)){
    return self.attributedTitleByState(UIControlStateFocused);
}

-(NSAttributedString *_Nullable)attributedTitleByApplicationState{
    return self.attributedTitleByState(UIControlStateApplication);
}

-(NSAttributedString *_Nullable)attributedTitleByReservedState{
    return self.attributedTitleByState(UIControlStateReserved);
}

-(JobsReturnButtonByAttributedStringBlock _Nonnull)selectedAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateSelected];
        return self;
    };
}

-(JobsReturnButtonByAttributedStringBlock _Nonnull)normalStateAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateNormal];
        return self;
    };
}

-(JobsReturnButtonByAttributedStringBlock _Nonnull)highlightedStateAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateHighlighted];
        return self;
    };
}

-(JobsReturnButtonByAttributedStringBlock _Nonnull)disabledStateAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateDisabled];
        return self;
    };
}

-(JobsReturnButtonByAttributedStringBlock _Nonnull)selectedStateAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateSelected];
        return self;
    };
}

-(JobsReturnButtonByAttributedStringBlock _Nonnull)focusedStateAttributedTitle API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateFocused];
        return self;
    };
}

-(JobsReturnButtonByAttributedStringBlock _Nonnull)applicationStateAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateApplication];
        return self;
    };
}

-(JobsReturnButtonByAttributedStringBlock _Nonnull)reservedStateAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateReserved];
        return self;
    };
}
#pragma mark —— UIButton.attributedSubtitle
/// TODO
@end
