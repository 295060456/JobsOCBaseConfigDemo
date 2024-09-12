//
//  JobsRequestBuilder.m
//  FM
//
//  Created by User on 9/12/24.
//

#import "JobsRequestBuilder.h"

@interface JobsRequestBuilder ()

@property(nonatomic,copy)NSString *currentKey;

@end

@implementation JobsRequestBuilder
#pragma mark —— 初始化方法
+(JobsReturnRequestBuilderByURLRequestBlock)initByURLRequest{
    @jobs_weakify(self)
    return ^JobsRequestBuilder *(__kindof NSURLRequest *_Nonnull data){
        @jobs_strongify(self)
        return [self.class.alloc initWithRequest:data];
    };
}

-(instancetype)initWithRequest:(NSMutableURLRequest *)request {
    if (self = [super init]) {
        self.request = request;
    }return self;
}
#pragma mark —— 设置 HTTP header 字段
-(JobsReturnRequestBuilderByStringBlock)httpHeaderField{
    @jobs_weakify(self)
    return ^JobsRequestBuilder *(NSString *_Nonnull key){
        @jobs_strongify(self)
        self.currentKey = key;  // 暂存当前 key
        return self;  // 返回自身实现链式调用
    };
}
#pragma mark —— 设置 header 字段的值
-(JobsReturnRequestBuilderByStringBlock)value{
    @jobs_weakify(self)
    return ^JobsRequestBuilder *(NSString *_Nonnull value){
        @jobs_strongify(self)
        if (self.currentKey) {
            [self.request setValue:value forHTTPHeaderField:self.currentKey];
        }return self;
    };
}

@end
