//
//  JXCategoryTitleView+Extra.m
//  FMNormal
//
//  Created by Jobs on 2025/5/29.
//

#import "JXCategoryTitleView+Extra.h"

@implementation JXCategoryTitleView (Extra)

-(JobsReturnCategoryTitleViewByCorBlock _Nonnull)byTitleSelectedColor{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleView *_Nullable(__kindof UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.titleSelectedColor = cor;
        return self;
    };
}

-(JobsReturnCategoryTitleViewByCorBlock _Nonnull)byTitleColor{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleView *_Nullable(__kindof UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.titleColor = cor;
        return self;
    };
}


-(JobsReturnCategoryTitleViewByFontBlock _Nonnull)byTitleFont{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleView *_Nullable(UIFont *_Nullable font){
        @jobs_strongify(self)
        self.titleFont = font;
        return self;
    };
}

-(JobsReturnCategoryTitleViewByFontBlock _Nonnull)byTitleSelectedFont{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleView *_Nullable(UIFont *_Nullable font){
        @jobs_strongify(self)
        self.titleSelectedFont = font;
        return self;
    };
}

-(JobsReturnCategoryTitleViewByStringsBlock _Nonnull)byTitles{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleView *_Nullable(__kindof NSArray <__kindof NSString *>* _Nullable strings){
        @jobs_strongify(self)
        self.titles = strings;
        return self;
    };
}

-(JobsReturnCategoryTitleViewByBOOLBlock _Nonnull)byTitleColorGradientEnabled{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.titleColorGradientEnabled = data;
        return self;
    };
}

@end
