//
//  JXCategoryIndicatorView+Extra.m
//  FMNormal
//
//  Created by Jobs on 2025/5/29.
//

#import "JXCategoryIndicatorView+Extra.h"

@implementation JXCategoryIndicatorView (Extra)

-(JobsReturnCategoryIndicatorViewByViewsBlock _Nonnull)byIndicators{
    @jobs_weakify(self)
    return ^__kindof JXCategoryBaseView *_Nullable(__kindof NSArray <__kindof UIView <JXCategoryIndicatorProtocol>*>* _Nullable arr){
        @jobs_strongify(self)
        self.indicators = arr;
        return self;
    };
}

@end
