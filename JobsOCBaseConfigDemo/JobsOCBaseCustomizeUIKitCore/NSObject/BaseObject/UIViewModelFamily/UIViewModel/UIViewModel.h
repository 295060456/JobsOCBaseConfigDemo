//
//  UIViewModel.h
//  Casino
//
//  Created by Jobs on 2021/11/19.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "UITextModel.h"
#import "UIViewModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

/// 本类是自定义类，但是是对系统类的仿写，目的是承接上下文数据 成一束，方便管理
@interface UIViewModel : NSObject
<
UIViewModelProtocol
>

@end

NS_ASSUME_NONNULL_END
