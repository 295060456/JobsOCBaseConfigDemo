//
//  UIProgressView+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 11/29/25.
//

#import "UIProgressView+DSL.h"

@implementation UIProgressView (DSL)
#pragma mark - Style
-(JobsRetProgressViewByStyleBlock _Nonnull)byProgressViewStyle{
    @jobs_weakify(self)
    return ^__kindof UIProgressView *_Nullable(UIProgressViewStyle style){
        @jobs_strongify(self)
        self.progressViewStyle = style;
        return self;
    };
}
#pragma mark - Progress
-(JobsRetProgressViewByFloatBlock _Nonnull)byProgress{
    @jobs_weakify(self)
    return ^__kindof UIProgressView *_Nullable(float progress){
        @jobs_strongify(self)
        self.progress = progress;   // 0.0..1.0，系统会自动 clamp
        return self;
    };
}

-(JobsRetProgressViewByFloatAnimatedBlock _Nonnull)byProgressAnimated{
    @jobs_weakify(self)
    return ^__kindof UIProgressView *_Nullable(float progress, BOOL animated){
        @jobs_strongify(self)
        if (@available(iOS 5.0, *)) {
            [self setProgress:progress animated:animated];
        }else{
            self.progress = progress;
        };return self;
    };
}
#pragma mark - Tint & Image
-(JobsRetProgressViewByColorBlock _Nonnull)byProgressTintColor{
    @jobs_weakify(self)
    return ^__kindof UIProgressView *_Nullable(UIColor * _Nullable color){
        @jobs_strongify(self)
        self.progressTintColor = color;
        return self;
    };
}

-(JobsRetProgressViewByColorBlock _Nonnull)byTrackTintColor{
    @jobs_weakify(self)
    return ^__kindof UIProgressView *_Nullable(UIColor * _Nullable color){
        @jobs_strongify(self)
        self.trackTintColor = color;
        return self;
    };
}

-(JobsRetProgressViewByImageBlock _Nonnull)byProgressImage{
    @jobs_weakify(self)
    return ^__kindof UIProgressView *_Nullable(UIImage * _Nullable image){
        @jobs_strongify(self)
        self.progressImage = image;
        return self;
    };
}

-(JobsRetProgressViewByImageBlock _Nonnull)byTrackImage{
    @jobs_weakify(self)
    return ^__kindof UIProgressView *_Nullable(UIImage * _Nullable image){
        @jobs_strongify(self)
        self.trackImage = image;
        return self;
    };
}
#pragma mark - NSProgress 绑定
-(JobsRetProgressViewByNSProgressBlock _Nonnull)byObservedProgress{
    @jobs_weakify(self)
    return ^__kindof UIProgressView *_Nullable(NSProgress * _Nullable progress){
        @jobs_strongify(self)
        if (@available(iOS 9.0, *)) {
            self.observedProgress = progress;
        };return self;
    };
}

@end
