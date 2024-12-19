//
//  HTMLDocument+Extra.m
//  FM
//
//  Created by Admin on 19/12/2024.
//

#import "HTMLDocument+Extra.h"

@implementation HTMLDocument (Extra)

+(JobsReturnHTMLDocumentByStringBlock _Nonnull)initBy{
    return ^HTMLDocument *_Nullable(__kindof NSString *_Nullable string){
        return [HTMLDocument documentWithString:string];
    };
}

@end
