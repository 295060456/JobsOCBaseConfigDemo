//
//  NSBundle+Extra.h
//  FM
//
//  Created by User on 9/1/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (Extra)

+(JobsReturnBundleByStringBlock _Nonnull)initByPath;
+(JobsReturnBundleByURLBlock _Nonnull)initByURL;
+(JobsReturnBundleByClsBlock _Nonnull)initByCls;
+(JobsReturnBundleByStringBlock _Nonnull)initByID;

-(JobsReturnIDByStringBlock _Nonnull)objectForInfoDictionaryKey;

@end

NS_ASSUME_NONNULL_END
