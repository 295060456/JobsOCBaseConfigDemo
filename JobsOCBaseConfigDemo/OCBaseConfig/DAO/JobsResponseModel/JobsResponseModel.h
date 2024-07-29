//
//  JobsResponseModel.h
//  DouDong-II
//
//  Created by xxx on 2021/1/4.
//

#import <Foundation/Foundation.h>
#import "NetworkingConstant.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsResponseModel : NSObject

@property(nonatomic,assign)HTTPResponseCode code;
@property(nonatomic,copy)NSString *msg;
@property(nonatomic,strong)id data;

@end

NS_ASSUME_NONNULL_END

//if (successBlock) {
//    if ([responseObject isKindOfClass:NSDictionary.class]) {
//        NSDictionary *dataDic = (NSDictionary *)responseObject;
//        JobsResponseModel *model = [JobsResponseModel mj_objectWithKeyValues:dataDic];
//        // 公共请求错误直接抛出
//        if (model.code != HTTPResponseCodeSuccess) {
//            [WHToast jobsToastMsg:model.msg];
//        }else{
//            successBlock(model);
//        }
//    }else{
//        [WHToast jobsToastMsg:[@"异常接口" stringByAppendingString:NSObject.userInfoSelectVideoCountPOST.funcName]];
//    }
//}
