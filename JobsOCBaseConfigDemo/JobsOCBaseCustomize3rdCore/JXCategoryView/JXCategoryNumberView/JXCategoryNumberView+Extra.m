//
//  JXCategoryNumberView+Extra.m
//  FMNormal
//
//  Created by Jobs on 2025/5/29.
//

#import "JXCategoryNumberView+Extra.h"

@implementation JXCategoryNumberView (Extra)

-(JobsReturnCategoryNumberViewByNumbersBlock _Nonnull)byCounts{
    @jobs_weakify(self)
    return ^__kindof JXCategoryNumberView *_Nullable(__kindof NSArray <__kindof NSNumber *>* _Nullable numbers){
        @jobs_strongify(self)
        self.counts = numbers;
        return self;
    };
}

-(JobsReturnCategoryNumberViewByCGPointBlock _Nonnull)byNumberLabelOffset{
    @jobs_weakify(self)
    return ^__kindof JXCategoryNumberView *_Nullable(CGPoint point){
        @jobs_strongify(self)
        self.numberLabelOffset = point;
        return self;
    };
}

-(JobsReturnCategoryNumberViewByReturnStringByIntegerBlocks _Nonnull)byNumberStringFormatterBlock{
    @jobs_weakify(self)
    return ^__kindof JXCategoryNumberView *_Nullable(JobsReturnStringByIntegerBlock _Nullable block){
        @jobs_strongify(self)
        self.numberStringFormatterBlock = block;
        return self;
    };
}

@end
