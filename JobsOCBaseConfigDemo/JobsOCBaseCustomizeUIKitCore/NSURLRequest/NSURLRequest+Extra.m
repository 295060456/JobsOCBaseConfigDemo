//
//  NSURLRequest+Extra.m
//  FM
//
//  Created by User on 9/12/24.
//

#import "NSURLRequest+Extra.h"

@implementation NSURLRequest (Extra)

+(JobsReturnURLRequestByURLBlock _Nonnull)initBy{
    return ^__kindof NSURLRequest *_Nullable(NSURL *_Nullable url){
        return [NSURLRequest requestWithURL:url];
    };
}
/// 打印NSURLRequest有效内容，并转化为NSMutableURLRequest对外输出
-(JobsReturnMutableURLRequestByVoidBlock _Nonnull)print{
    @jobs_weakify(self)
    return ^NSMutableURLRequest *_Nullable(){
        @jobs_strongify(self)
        JobsPrintURLRequest(self);
        return self.mutableCopy;
    };
}

@end
