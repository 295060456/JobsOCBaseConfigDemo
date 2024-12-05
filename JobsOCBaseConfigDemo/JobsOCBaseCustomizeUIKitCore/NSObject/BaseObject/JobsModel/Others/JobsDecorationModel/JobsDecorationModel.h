//
//  JobsDecorationModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Admin on 20/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsDecorationModel : NSObject

@property(nonatomic,strong,nullable)Class cls;/// 绑定的class
@property(nonatomic,copy,nullable)NSString *title;/// 主标题
@property(nonatomic,copy,nullable)NSString *subTitle;/// 副标题
@property(nonatomic,strong,nullable)id requestParams;/// 【强引用】绑定的数据源，数据类型id

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsDecorationModel *_Nonnull jobsMakeDecorationModel(jobsByDecorationModelBlock _Nonnull block){
    JobsDecorationModel *data = JobsDecorationModel.alloc.init;
    if (block) block(data);
    return data;
}
