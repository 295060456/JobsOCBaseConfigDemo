//
//  NSXMLParser+Extra.m
//  FM
//
//  Created by Admin on 19/12/2024.
//

#import "NSXMLParser+Extra.h"

@implementation NSXMLParser (Extra)

+(JobsReturnNSXMLParserByNSDataBlock _Nonnull)initBy{
    return ^__kindof NSXMLParser *_Nonnull(__kindof NSData *_Nullable data){
        return [NSXMLParser.alloc initWithData:data];
    };
}

@end
