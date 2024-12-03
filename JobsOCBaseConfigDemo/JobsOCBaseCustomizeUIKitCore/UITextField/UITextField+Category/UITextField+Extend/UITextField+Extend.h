//
//  UITextField+Extend.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/9/15.
//  Copyright © 2020 MonkeyKingVideo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#import "JobsString.h"
#import "JobsBlock.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Extend)

@property(nonatomic,strong)UIButton *customSysClearBtn;
/// RAC 回调封装
-(RACDisposable *)jobsTextFieldEventFilterBlock:(JobsReturnBOOLByIDBlock _Nonnull)filterBlock
                             subscribeNextBlock:(jobsByIDBlock _Nonnull)subscribeNextBlock;
/// 自定义系统的清除按钮
-(JobsReturnStringByStringBlock _Nonnull)getCurrentTextFieldValueByReplacementString;
/// 自定义系统的清除按钮
-(jobsByImageBlock _Nonnull)modifyClearButtonByImage;

@end

NS_ASSUME_NONNULL_END
