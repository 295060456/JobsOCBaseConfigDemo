//
//  JobsLocationModel.h
//  FM
//
//  Created by User on 9/30/24.
//

#import <Foundation/Foundation.h>
#import "UILocationProtocol.h"
#import "BaseViewProtocol.h"
#import "UIMarkProtocol.h"
#import "BaseLayerProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsLocationModel : NSObject
<
UILocationProtocol
,BaseViewProtocol
,UIMarkProtocol
,BaseLayerProtocol
>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsLocationModel *_Nonnull jobsMakeLocationModel(jobsByLocationModelBlock _Nonnull block){
    JobsLocationModel *data = JobsLocationModel.alloc.init;
    if (block) block(data);
    return data;
}
