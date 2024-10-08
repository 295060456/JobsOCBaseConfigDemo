//
//  NoticePopupView.h
//  UBallLive
//
//  Created by Jobs on 2020/10/26.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"
#import "NSObject+TFPopup.h"

#if __has_include(<TFPopup/TFPopup.h>)
#import <TFPopup/TFPopup.h>
#else
#import "TFPopup.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsNoticePopupView : UIView<BaseViewProtocol>

@end

NS_ASSUME_NONNULL_END
