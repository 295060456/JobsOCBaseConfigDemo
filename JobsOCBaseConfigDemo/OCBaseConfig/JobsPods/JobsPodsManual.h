//
//  JobsPodsManual.h
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#ifndef JobsPodsManual_h
#define JobsPodsManual_h
/// 极大程度上尊重作者，不去污染源代码的基础上，用分类去实现一些功能
#import "ZMJCell+CustomView.h"
#import "FMDatabase+Manager.h"
#import "TKPermissionKit.h"
/// JXCategoryView
#import "JXCategoryTimelineView.h"
#import "JXCategoryTitleBackgroundView.h"
/// RAC_Define
#if __has_include(<ReactiveObjC/RACEXTKeyPathCoding.h>)
#else
#import "RACEXTKeyPathCoding.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTScope.h>)
#else
#import "RACEXTScope.h"
#endif

#if __has_include(<ReactiveObjC/RACmetamacros.h>)
#else
#import "RACmetamacros.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTRuntimeExtensions.h>)
#else
#import "RACEXTRuntimeExtensions.h"
#endif

#if __has_include(<KTVHTTPCache/KTVHTTPCache.h>)
#import <KTVHTTPCache/KTVHTTPCache.h>
#else
#import "KTVHTTPCache.h"
#endif

#if __has_include(<GTCaptcha4/GTCaptcha4.h>)
#import <GTCaptcha4/GTCaptcha4.h>
#else
#import "GTCaptcha4.h"
#endif

#endif /* JobsPodsManual_h */
