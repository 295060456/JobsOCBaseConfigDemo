//
//  CasinoCustomerServiceView.h
//  Casino
//
//  Created by Jobs on 2021/12/24.
//

#import "BaseView.h"
#import "JobsHotLabelWithSingleLine.h"
#import "AppToolsProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface CasinoCustomerServiceView : BaseView<AppToolsProtocol>

+(instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
