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

+(JobsRetBundleByStrBlock _Nonnull)initByPath;
+(JobsRetBundleByURLBlock _Nonnull)initByURL;
+(JobsRetBundleByClsBlock _Nonnull)initByCls;
+(JobsRetBundleByStrBlock _Nonnull)initByID;

-(JobsRetIDByStrBlock _Nonnull)objectForInfoDictionaryKey;

@end

NS_ASSUME_NONNULL_END
