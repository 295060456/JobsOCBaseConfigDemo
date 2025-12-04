//
//  YTKCustomBaseRequestProtocol.h
//  FM
//
//  Created by Admin on 31/10/2024.
//

#import <Foundation/Foundation.h>
#import "DefineProperty.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@protocol YTKCustomBaseRequestProtocol <NSObject>
@optional
Prop_strong(nullable)id urlParameters;
Prop_strong(nullable)NSMutableDictionary *parameters;
Prop_strong(nullable)NSMutableDictionary *customHTTPHeader;

@end

NS_ASSUME_NONNULL_END

#ifndef YTKCustomBaseRequestProtocol_synthesize
#define YTKCustomBaseRequestProtocol_synthesize \
\
@synthesize urlParameters = _urlParameters;\
@synthesize parameters = _parameters;\
@synthesize customHTTPHeader = _customHTTPHeader;\

#endif /* YTKCustomBaseRequestProtocol_synthesize */

#ifndef YTKCustomBaseRequestProtocol_dynamic
#define YTKCustomBaseRequestProtocol_dynamic \
\
@dynamic urlParameters;\
@dynamic parameters;\
@dynamic customHTTPHeader;\

#endif /* YTKCustomBaseRequestProtocol_dynamic */
