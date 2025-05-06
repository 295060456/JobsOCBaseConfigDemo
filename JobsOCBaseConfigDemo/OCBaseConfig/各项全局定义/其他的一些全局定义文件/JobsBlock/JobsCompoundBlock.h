//
//  JobsCompoundBlock.h
//  FMNormal
//
//  Created by Jobs on 2025/5/6.
//

#ifndef JobsCompoundBlock_h
#define JobsCompoundBlock_h
/// 定义确定参数的Block
#import "ReturnByCertainParametersBlock.h"
#import "VoidByCertainParametersBlock.h"
/// 定义不确定参数的Block
#import "ReturnByUnCertainParameters.h"
#import "VoidByUnCertainParameters.h"

#import "UIViewModelOthersProtocol.h"

typedef void(^jobsByRetIDByIDBlock) (JobsReturnIDByIDBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsReturnViewByVoidBtnBlock)(jobsByBtnBlock _Nullable block);
typedef JobsReturnIDByIDBlock(^JobsRetIDByIDBlockByViewModelOthersProtocolID)(id<UIViewModelOthersProtocol> data);

#endif /* JobsCompoundBlock_h */
