//
//  JXCategoryListContainerView+Extra.m
//  FMNormal
//
//  Created by Jobs on 2025/5/29.
//

#import "JXCategoryListContainerView+Extra.h"

@implementation JXCategoryListContainerView (Extra)

-(JobsReturnCategoryListContainerViewByNSIntegerBlock _Nonnull)byDefaultSelectedIndex{
    @jobs_weakify(self)
    return ^__kindof JXCategoryListContainerView *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.defaultSelectedIndex = data;
        return self;
    };
}

@end
