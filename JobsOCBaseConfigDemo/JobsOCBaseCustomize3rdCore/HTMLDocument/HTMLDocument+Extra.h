//
//  HTMLDocument+Extra.h
//  FM
//
//  Created by Admin on 19/12/2024.
//

#if __has_include(<HTMLReader/HTMLReader.h>)
#import <HTMLReader/HTMLReader.h>
#else
#import "HTMLReader.h"
#endif

#import "HTMLDocument+Extra.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTMLDocument (Extra)

+(JobsReturnHTMLDocumentByStringBlock _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END
