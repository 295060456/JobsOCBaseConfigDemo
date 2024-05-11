//
//  CollectionReusableView.h
//  UBallLive
//
//  Created by Jobs on 2020/10/12.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"
#import "BaseProtocol.h"
#import "JobsBlock.h"
#import "MacroDef_Func.h"

#if __has_include(<ReactiveObjC/RACmetamacros.h>)
#import <ReactiveObjC/RACmetamacros.h>
#else
#import "RACmetamacros.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTScope.h>)
#import <ReactiveObjC/RACEXTScope.h>
#else
#import "RACEXTScope.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTKeyPathCoding.h>)
#import <ReactiveObjC/RACEXTKeyPathCoding.h>
#else
#import "RACEXTKeyPathCoding.h"
#endif

//#if __has_include(<ReactiveObjC/RACEXTRuntimeExtensions.h>)
//#import <ReactiveObjC/RACEXTRuntimeExtensions.h>
//#else
//#import "RACEXTRuntimeExtensions.h"
//#endif

NS_ASSUME_NONNULL_BEGIN
/// 更多自定义，移步 JobsHeaderFooterView
@interface BaseCollectionReusableView : UICollectionReusableView
<
BaseViewProtocol
,BaseProtocol
>

@end

NS_ASSUME_NONNULL_END

