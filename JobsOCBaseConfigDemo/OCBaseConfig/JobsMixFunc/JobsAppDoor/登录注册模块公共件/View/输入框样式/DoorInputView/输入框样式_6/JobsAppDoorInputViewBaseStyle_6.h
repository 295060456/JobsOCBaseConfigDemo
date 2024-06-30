//
//  JobsAppDoorInputViewBaseStyle_6.h
//  DouDong-II
//
//  Created by Jobs on 2020/12/20.
//

#import "BaseViewProtocol.h"
#import "JobsDoorInputViewProtocol.h"
#import "JobsAppDoorInputViewBaseStyleModel.h"
#import "JobsAppDoorInputViewBaseStyle.h"
#import "ImageCodeView.h"
#import "JobsMagicTextField.h"
#import "AuthCodeLab.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorInputViewBaseStyle_6 : JobsAppDoorInputViewBaseStyle

/**
 
 * 其实并不建议用init方法,而是期望带参数初始化，比如对应BaseViewProtocol里面的 - (instancetype)initWithSize:(CGSize)thisViewSize
 * 因为本类在大多数情况下是依附于一个父视图执行的，这样可以有效的避免过程值对环境的影响
 * 因为父视图在没有进行展开的时候，子视图是不展开的。那么存在生命周期的过程，会影响布局结果
    
 * 如果以后需要强行禁用init或者new，那么:
 - (instancetype)init NS_UNAVAILABLE;
 - (instancetype)new NS_UNAVAILABLE;
 
 */

@end

NS_ASSUME_NONNULL_END
