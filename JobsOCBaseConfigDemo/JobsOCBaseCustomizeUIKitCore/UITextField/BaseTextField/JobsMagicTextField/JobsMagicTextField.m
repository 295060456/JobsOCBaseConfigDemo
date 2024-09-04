//
//  JobsMagicTextField.m
//  BHBMagicFieldDemo
//
//  Created by Jobs on 2020/12/6.
//  Copyright © 2020 bihongbo. All rights reserved.
//

#import "JobsMagicTextField.h"

@interface JobsMagicTextField ()

@property(nonatomic,strong)UILabel *placeholderAnimationLbl;

@end

@implementation JobsMagicTextField

-(void)dealloc{
    JobsRemoveNotification(self);
}

- (instancetype)init{
    if (self = [super init]) {
        self.placeholdAnimationable = YES;
        self.placeHolderAlignment = NSTextAlignmentLeft;
        self.clipsToBounds = NO;
        @jobs_weakify(self)
        [self addNotificationName:UITextFieldTextDidChangeNotification
                            block:^(id  _Nullable weakSelf,
                                    id  _Nullable arg) {
            @jobs_strongify(self)
            self.placeholderAnimationLbl.jobsVisible = self.placeholdAnimationable && isValue(self.text);
        }];
    }return self;
}
/// ⚠️当一个TF1->TF2，先获得焦点再失去焦点
/// 这个方法里面，正在获得、但还没有获得焦点，此时的self.isFirstResponder == NO
-(BOOL)becomeFirstResponder{
    [self upAnimation];
    return [super becomeFirstResponder];
}
/// 这个方法里面，正在丢失、但还没有丢失焦点，此时的self.isFirstResponder == YES
-(BOOL)resignFirstResponder{
    [self restoreAnimation];
    return [super resignFirstResponder];
}

-(void)upAnimation{
    if (self.placeholdAnimationable) {
        CGRect targetFrame = self.placeholderAnimationLbl.frame;
        targetFrame.origin.y = -self.moveDistance;
        @jobs_weakify(self)
        [UIView animateWithDuration:self.animationTime
                         animations:^{
            @jobs_strongify(self)
            self.placeholderAnimationLbl.jobsVisible = YES;
            self.placeholderAnimationLbl.frame = targetFrame;
            if (self.attributedPlaceholder && !self.placeholder) {
                self.placeholderAnimationLbl.attributedText = self.attributedPlaceholder;
            }else{
                self.placeholderAnimationLbl.textColor = self.animationColor;
                self.placeholderAnimationLbl.font = self.animationFont;
                
                if (isValue(self.placeholder)) {
                    self.placeholderAnimationLbl.text = self.placeholder;
                }
                
                self.placeholder = JobsInternationalization(@"");
            }
        }];
    }
}

-(void)restoreAnimation{
    if (self.placeholdAnimationable) {
        if (self.text.length > 0 ||
            self.placeholderAnimationLbl.frame.origin.y == 0) {
            return ;
        }
        CGRect targetFrame = self.placeholderAnimationLbl.frame;
        targetFrame.origin.y = 0;
        @jobs_weakify(self)
        [UIView animateWithDuration:self.animationTime
                         animations:^{
            @jobs_strongify(self)
            self.placeholderAnimationLbl.jobsVisible = NO;
            self.placeholderAnimationLbl.frame = targetFrame;
            if (self.attributedPlaceholder && !self.placeholder) {
                self.placeholderAnimationLbl.attributedText = self.attributedPlaceholder;
            }else{
                self.placeholder = self.placeholderAnimationLbl.text;
                self.placeholderAnimationLbl.text = JobsInternationalization(@"");
                self.placeholderAnimationLbl.textColor = self.placeholderColor;
                self.placeholderAnimationLbl.font = self.placeholderFont;
            }
        }];
    }
}

-(void)setText:(NSString *)text{
    [super setText:text];
    if (text.length) {
        [self upAnimation];
    }else{
        [self restoreAnimation];
    }
}
#pragma mark —— lazyLoad
-(UILabel *)placeholderAnimationLbl{
    if (!_placeholderAnimationLbl) {
        _placeholderAnimationLbl = UILabel.new;
        _placeholderAnimationLbl.jobsVisible = YES;
        _placeholderAnimationLbl.frame = CGRectMake(self.placeHolderOffset + self.leftViewOffsetX,
                                                    self.y,
                                                    self.width,
                                                    self.height);
        _placeholderAnimationLbl.backgroundColor = JobsClearColor;
        _placeholderAnimationLbl.textAlignment = self.textAlignment;///❤️
        if (self.attributedPlaceholder && !self.placeholder) {
            _placeholderAnimationLbl.attributedText = self.attributedPlaceholder;
        }else{
            _placeholderAnimationLbl.text = self.placeholder;
            _placeholderAnimationLbl.font = self.font;
        }
        [self addSubview:_placeholderAnimationLbl];
    }return _placeholderAnimationLbl;
}

-(UIColor *)animationColor{
    if (!_animationColor) {
        _animationColor = self.placeholderColor;
    }return _animationColor;
}

-(UIFont *)animationFont{
    if (!_animationFont) {
        _animationFont = self.placeholderFont;
    }return _animationFont;
}

-(CGFloat)moveDistance{
    if (_moveDistance == 0) {
        _moveDistance = self.frame.size.height / 2;
    }return _moveDistance;
}
    
-(NSTimeInterval)animationTime{
    if (!_animationTime) {
        _animationTime = 0.25f;
    }return _animationTime;
}

@end
