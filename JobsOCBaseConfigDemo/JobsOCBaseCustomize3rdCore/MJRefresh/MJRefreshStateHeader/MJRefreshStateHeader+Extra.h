//
//  MJRefreshStateHeader+Extra.h
//  FMNormal
//
//  Created by Jobs on 2025/5/30.
//

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#import "UIView+Refresh.h"
#import "NSObject+Extras.h"
#import "UILabel+Extra.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface MJRefreshStateHeader (Extra)

-(JobsReturnMJRefreshStateHeaderByRefreshConfigModelBlock _Nonnull)byMJRefreshHeaderConfigModel;

@end

NS_ASSUME_NONNULL_END
