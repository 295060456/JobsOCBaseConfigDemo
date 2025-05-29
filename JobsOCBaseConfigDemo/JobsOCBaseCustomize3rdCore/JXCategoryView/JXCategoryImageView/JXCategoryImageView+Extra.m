//
//  JXCategoryImageView+Extra.m
//  FMNormal
//
//  Created by Jobs on 2025/5/29.
//

#import "JXCategoryImageView+Extra.h"

@implementation JXCategoryImageView (Extra)

-(JobsReturnCategoryImageViewByStringsBlock _Nonnull)byImageNames{
    @jobs_weakify(self)
    return ^__kindof JXCategoryImageView *_Nullable(__kindof NSArray <__kindof NSString *>* _Nullable strings){
        @jobs_strongify(self)
        self.imageNames = strings;
        return self;
    };
}

-(JobsReturnCategoryImageViewByStringsBlock _Nonnull)bySelectedImageNames{
    @jobs_weakify(self)
    return ^__kindof JXCategoryImageView *_Nullable(__kindof NSArray <__kindof NSString *>* _Nullable strings){
        @jobs_strongify(self)
        self.selectedImageNames = strings;
        return self;
    };
}

-(JobsReturnCategoryImageViewByStringsBlock _Nonnull)byImageInfoArray{
    @jobs_weakify(self)
    return ^__kindof JXCategoryImageView *_Nullable(__kindof NSArray <__kindof NSString *>* _Nullable strings){
        @jobs_strongify(self)
        self.imageInfoArray = strings;
        return self;
    };
}

-(JobsReturnCategoryImageViewByStringsBlock _Nonnull)bySelectedImageInfoArray{
    @jobs_weakify(self)
    return ^__kindof JXCategoryImageView *_Nullable(__kindof NSArray <__kindof NSString *>* _Nullable strings){
        @jobs_strongify(self)
        self.selectedImageInfoArray = strings;
        return self;
    };
}

-(JobsReturnCategoryImageViewBySizeBlock _Nonnull)byImageSize{
    @jobs_weakify(self)
    return ^__kindof JXCategoryImageView *_Nullable(CGSize size){
        @jobs_strongify(self)
        self.imageSize = size;
        return self;
    };
}

-(JobsReturnCategoryImageViewByCGFloatBlock _Nonnull)byImageCornerRadius{
    @jobs_weakify(self)
    return ^__kindof JXCategoryImageView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.imageCornerRadius = data;
        return self;
    };
}

-(JobsReturnCategoryImageViewByBOOLBlock _Nonnull)byImageZoomEnabled{
    @jobs_weakify(self)
    return ^__kindof JXCategoryImageView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.imageZoomEnabled = data;
        return self;
    };
}

-(JobsReturnCategoryImageViewByNSIntegerBlock _Nonnull)byImageZoomScale{
    @jobs_weakify(self)
    return ^__kindof JXCategoryImageView *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.imageZoomScale = data;
        return self;
    };
}

@end
