//
//  JobsSearchBar.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import <UIKit/UIKit.h>
#import "JobsDoorInputViewProtocol.h"
#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchBar : BaseView
<
JobsDoorInputViewProtocol
,UITextFieldDelegate
>

@end

NS_ASSUME_NONNULL_END
