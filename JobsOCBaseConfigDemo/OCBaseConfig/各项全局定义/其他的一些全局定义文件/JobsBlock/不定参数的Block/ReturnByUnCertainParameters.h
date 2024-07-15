//
//  ReturnByUnCertainParameters.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/27.
//

#ifndef ReturnByUnCertainParameters_h
#define ReturnByUnCertainParameters_h

/* 第一个参数写：有多少个实际参数 */
typedef id(^JobsReturnIDByUnCertainParamBlock)(id firstArg,...);
typedef CGSize(^JobsReturnCGSizeByUnCertainParamBlock)(id firstArg,...);
typedef CGRect(^JobsReturnCGRecByUnCertainParamtBlock)(id firstArg,...);
typedef CGPoint(^JobsReturnCGPointByUnCertainParamBlock)(id firstArg,...);

#endif /* ReturnByUnCertainParameters_h */
