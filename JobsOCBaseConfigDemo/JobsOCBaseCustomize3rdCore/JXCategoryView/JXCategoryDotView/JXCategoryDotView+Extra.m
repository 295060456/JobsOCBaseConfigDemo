//
//  JXCategoryDotView+Extra.m
//  FMNormal
//
//  Created by Jobs on 2025/5/29.
//

#import "JXCategoryDotView+Extra.h"

@implementation JXCategoryDotView (Extra)

-(JobsReturnCategoryDotViewByNumbersBlock _Nonnull)byDotStates{
    @jobs_weakify(self)
    return ^__kindof JXCategoryDotView *_Nullable(__kindof NSArray <__kindof NSNumber *>* _Nullable numbers){
        @jobs_strongify(self)
        self.dotStates = numbers;
        return self;
    };
}

-(JobsReturnCategoryDotViewByRelativePositionBlock _Nonnull)byRelativePosition{
    @jobs_weakify(self)
    return ^__kindof JXCategoryDotView *_Nullable(JXCategoryDotRelativePosition relativePosition){
        @jobs_strongify(self)
        self.relativePosition = relativePosition;
        return self;
    };
}

-(JobsReturnCategoryDotViewBySizeBlock _Nonnull)byDotSize{
    @jobs_weakify(self)
    return ^__kindof JXCategoryDotView *_Nullable(CGSize size){
        @jobs_strongify(self)
        self.dotSize = size;
        return self;
    };
}

-(JobsReturnCategoryDotViewByCorBlock _Nonnull)byDotColor{
    @jobs_weakify(self)
    return ^__kindof JXCategoryDotView *_Nullable(__kindof UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.dotColor = cor;
        return self;
    };
}

-(JobsReturnCategoryDotViewByCGFloatBlock _Nonnull)byDotCornerRadius{
    @jobs_weakify(self)
    return ^__kindof JXCategoryDotView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.dotCornerRadius = data;
        return self;
    };
}

-(JobsReturnCategoryDotViewByPointBlock _Nonnull)byDotOffset{
    @jobs_weakify(self)
    return ^__kindof JXCategoryDotView *_Nullable(CGPoint point){
        @jobs_strongify(self)
        self.dotOffset = point;
        return self;
    };
}

@end
