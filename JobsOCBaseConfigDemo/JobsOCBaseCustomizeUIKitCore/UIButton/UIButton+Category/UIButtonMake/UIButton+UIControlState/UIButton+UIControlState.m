//
//  UIButton+UIControlState.m
//  FM
//
//  Created by Admin on 10/12/2024.
//

#import "UIButton+UIControlState.h"

@implementation UIButton (UIControlState)
#pragma mark —— UIButton.image
-(JobsRetImageByNSUIntegerBlock _Nonnull)imageByState{
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

-(JobsRetBtnByImageBlock _Nonnull)normalStateImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateNormal];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)highlightedStateImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateHighlighted];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)disabledStateImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateDisabled];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)selectedStateImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateSelected];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)focusedStateImageBy API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateFocused];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)applicationStateImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateApplication];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)reservedStateImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateReserved];
        return self;
    };
}
#pragma mark —— UIButton.backgroundImage
-(JobsRetImageByNSUIntegerBlock _Nonnull)backgroundImageByState{
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

-(JobsRetBtnByImageBlock _Nonnull)normalStateBackgroundImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)highlightedStateBackgroundImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateHighlighted];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)disabledStateBackgroundImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateDisabled];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)selectedStateBackgroundImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateSelected];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)focusedStateBackgroundImageBy API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateFocused];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)applicationStateBackgroundImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateApplication];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)reservedStateBackgroundImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateReserved];
        return self;
    };
}
#pragma mark —— UIButton.titleColor
-(JobsRetCorByNSUIntegerBlock _Nonnull)titleColorByState{
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

-(JobsRetBtnByCorBlock _Nonnull)normalStateTitleColorBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        return self;
    };
}

-(JobsRetBtnByCorBlock _Nonnull)highlightedStateTitleColorBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateHighlighted];
        return self;
    };
}

-(JobsRetBtnByCorBlock _Nonnull)disabledStateTitleColorBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateDisabled];
        return self;
    };
}

-(JobsRetBtnByCorBlock _Nonnull)selectedStateTitleColorBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateSelected];
        return self;
    };
}

-(JobsRetBtnByCorBlock _Nonnull)focusedStateTitleColorBy API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateFocused];
        return self;
    };
}

-(JobsRetBtnByCorBlock _Nonnull)ApplicationStateTitleColorBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateApplication];
        return self;
    };
}

-(JobsRetBtnByCorBlock _Nonnull)reservedStateTitleColorBy{
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
-(JobsRetStringByUIntegerBlock _Nonnull)titleByState{
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

-(JobsRetBtnByStringBlock _Nonnull)normalStateTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

-(JobsRetBtnByStringBlock _Nonnull)highlightedStateTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateHighlighted];
        return self;
    };
}

-(JobsRetBtnByStringBlock _Nonnull)disabledStateTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateDisabled];
        return self;
    };
}

-(JobsRetBtnByStringBlock _Nonnull)selectedStateTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateSelected];
        return self;
    };
}

-(JobsRetBtnByStringBlock _Nonnull)focusedStateTitleBy API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateFocused];
        return self;
    };
}

-(JobsRetBtnByStringBlock _Nonnull)applicationStateTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateApplication];
        return self;
    };
}

-(JobsRetBtnByStringBlock _Nonnull)reservedStateTitleBy{
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

-(JobsRetAttributedStringByNSUIntegerBlock _Nonnull)attributedTitleByState{
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

-(JobsRetBtnByAttributedStringBlock _Nonnull)selectedAttributedTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateSelected];
        return self;
    };
}

-(JobsRetBtnByAttributedStringBlock _Nonnull)normalStateAttributedTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateNormal];
        return self;
    };
}

-(JobsRetBtnByAttributedStringBlock _Nonnull)highlightedStateAttributedTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateHighlighted];
        return self;
    };
}

-(JobsRetBtnByAttributedStringBlock _Nonnull)disabledStateAttributedTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateDisabled];
        return self;
    };
}

-(JobsRetBtnByAttributedStringBlock _Nonnull)selectedStateAttributedTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateSelected];
        return self;
    };
}

-(JobsRetBtnByAttributedStringBlock _Nonnull)focusedStateAttributedTitleBy API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateFocused];
        return self;
    };
}

-(JobsRetBtnByAttributedStringBlock _Nonnull)applicationStateAttributedTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateApplication];
        return self;
    };
}

-(JobsRetBtnByAttributedStringBlock _Nonnull)reservedStateAttributedTitleBy{
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
