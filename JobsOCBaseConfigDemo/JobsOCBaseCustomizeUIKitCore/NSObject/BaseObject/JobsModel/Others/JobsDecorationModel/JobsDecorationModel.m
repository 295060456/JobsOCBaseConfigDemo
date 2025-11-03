//
//  JobsDecorationModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Admin on 20/11/2024.
//

#import "JobsDecorationModel.h"

@implementation JobsDecorationModel
/// 主标题
-(NSString *)title{
    if(!_title){
        _title = @"";
    }return _title;
}
/// 副标题
-(NSString *)subTitle{
    if (!_subTitle) {
        _subTitle = @"";
    }return _subTitle;
}

-(JobsReturnDecorationModelByClsBlock _Nonnull)byCls{
    @jobs_weakify(self)
    return ^__kindof JobsDecorationModel * (Class _Nullable cls) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.cls = cls;
        return self;
    };
}

-(JobsReturnDecorationModelByStringBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof JobsDecorationModel * (NSString * _Nullable title) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.title = title;
        return self;
    };
}

-(JobsReturnDecorationModelByStringBlock _Nonnull)bySubTitle{
    @jobs_weakify(self)
    return ^__kindof JobsDecorationModel * (NSString * _Nullable subTitle) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.subTitle = subTitle;
        return self;
    };
}

-(JobsReturnDecorationModelByIDBlock _Nonnull)byRequestParams{
    @jobs_weakify(self)
    return ^__kindof JobsDecorationModel * (id _Nullable requestParams) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.requestParams = requestParams;
        return self;
    };
}

@end
