//
//  JobsFileModel.h
//  FM
//
//  Created by Admin on 5/12/2024.
//

#import <Foundation/Foundation.h>
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsFileModel : NSObject

Prop_assign()NSInteger ID; /// 文件ID
Prop_copy()NSString *fileName; /// 文件名
Prop_strong()NSData *file; /// 传输的文件

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsFileModel *_Nonnull jobsMakeFileModel(jobsByFileModelBlock _Nonnull block){
    JobsFileModel *data = JobsFileModel.alloc.init;
    if (block) block(data);
    return data;
}
