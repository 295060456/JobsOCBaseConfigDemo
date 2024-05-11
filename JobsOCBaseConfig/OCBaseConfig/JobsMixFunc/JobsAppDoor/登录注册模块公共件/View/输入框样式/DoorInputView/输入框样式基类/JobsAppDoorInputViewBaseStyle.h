//
//  JobsAppDoorInputViewBaseStyle.h
//  My_BaseProj
//
//  Created by Jobs on 2020/12/4.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "JobsAppDoorInputViewBaseStyleModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorInputViewTFModel : NSObject

@property(nonatomic,strong)NSString *resString;
@property(nonatomic,strong)NSString *PlaceHolder;

@end

@interface JobsAppDoorInputViewBaseStyle : BaseView
<
JobsDoorInputViewProtocol
,UITextFieldDelegate
>

@property(nonatomic,strong)JobsAppDoorInputViewTFModel *textFieldInputModel;

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
