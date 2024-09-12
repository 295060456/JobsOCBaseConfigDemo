//
//  JobsRequestBuilder.h
//  FM
//
//  Created by User on 9/12/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsRequestBuilder : NSObject

@property(nonatomic,strong)NSMutableURLRequest *request;
#pragma mark —— 初始化方法
+(JobsReturnRequestBuilderByURLRequestBlock)initByURLRequest;
-(instancetype)initWithRequest:(NSMutableURLRequest *)request;
#pragma mark —— 设置 HTTP header 字段
-(JobsReturnRequestBuilderByStringBlock)httpHeaderField;
#pragma mark —— 设置 header 字段的值
-(JobsReturnRequestBuilderByStringBlock)value;

@end

NS_ASSUME_NONNULL_END
