//
//  JobsDecorationModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Admin on 20/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsDecorationModel : NSObject

Prop_strong(nullable)Class cls;               /// 绑定的class
Prop_copy(nullable)NSString *title;           /// 主标题
Prop_copy(nullable)NSString *subTitle;        /// 副标题
Prop_strong(nullable)id requestParams;        ///【强引用】绑定的数据源，数据类型id

-(JobsReturnDecorationModelByClsBlock _Nonnull)byCls;
-(JobsReturnDecorationModelByStringBlock _Nonnull)byTitle;
-(JobsReturnDecorationModelByStringBlock _Nonnull)bySubTitle;
-(JobsReturnDecorationModelByIDBlock _Nonnull)byRequestParams;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsDecorationModel *_Nonnull jobsMakeDecorationModel(jobsByDecorationModelBlock _Nonnull block){
    JobsDecorationModel *data = JobsDecorationModel.alloc.init;
    if (block) block(data);
    return data;
}
