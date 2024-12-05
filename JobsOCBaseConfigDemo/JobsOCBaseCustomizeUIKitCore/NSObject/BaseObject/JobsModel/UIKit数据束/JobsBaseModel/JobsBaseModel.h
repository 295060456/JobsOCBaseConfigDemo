//
//  JobsBaseModel.h
//  FM
//
//  Created by Admin on 8/11/2024.
//

#import "UIViewModel.h"
#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

NS_ASSUME_NONNULL_BEGIN
#warning 此类禁止使用 mj_keyValues。因为如果一旦有未实现的属性，所有使用到的BaseModel.mj_keyValues将会崩溃
@interface JobsBaseModel : UIViewModel<NSCoding>

@end

NS_ASSUME_NONNULL_END
