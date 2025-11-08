//
//  JSValue+Extra.h
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import <JavaScriptCore/JavaScriptCore.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface JSValue (Extra)
/// 随时传入一段 JavaScript 代码，并获取执行的结果
-(JobsRetJSValueByStrBlock _Nonnull)evaluateScript;

@end

NS_ASSUME_NONNULL_END
