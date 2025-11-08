//
//  GTMBase64.h
//
//  Copyright 2006-2008 Google Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License"); you may not
//  use this file except in compliance with the License.  You may obtain a copy
//  of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
//  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
//  License for the specific language governing permissions and limitations under
//  the License.
//

#import <Foundation/Foundation.h>
#import "CommonCrypto/CommonDigest.h"
#import "GTMDefines.h"
#import "JobsBlock.h"

// GTMBase64
//
/// Helper for handling Base64 and WebSafeBase64 encodings
//
/// The webSafe methods use different character set and also the results aren't
/// always padded to a multiple of 4 characters.  This is done so the resulting
/// data can be used in urls and url query arguments without needing any
/// encoding.  You must use the webSafe* methods together, the data does not
/// interop with the RFC methods.
//
@interface GTMBase64 : NSObject
//
// Standard Base64 (RFC) handling
//
+(JobsRetDataByDataBlock _Nonnull)encodeData;
+(JobsRetDataByDataBlock _Nonnull)decodeData;
+(NSData *)encodeBytes:(const void *)bytes length:(NSUInteger)length;
+(NSData *)decodeBytes:(const void *)bytes length:(NSUInteger)length;
+(JobsRetStrByDataBlock _Nonnull)stringByEncodingData;
+(NSString *)stringByEncodingBytes:(const void *)bytes length:(NSUInteger)length;
+(NSData *)decodeString:(NSString *)string;
//
// Modified Base64 encoding so the results can go onto urls.
//
// The changes are in the characters generated and also the result isn't
// padded to a multiple of 4.
// Must use the matching call to encode/decode, won't interop with the
// RFC versions.
//
+(NSData *)webSafeEncodeData:(NSData *)data padded:(BOOL)padded;
+(NSData *)webSafeDecodeData:(NSData *)data;
+(NSData *)webSafeEncodeBytes:(const void *)bytes
                       length:(NSUInteger)length
                       padded:(BOOL)padded;
+(NSData *)webSafeDecodeBytes:(const void *)bytes length:(NSUInteger)length;
+(NSString *)stringByWebSafeEncodingData:(NSData *)data padded:(BOOL)padded;
+(NSString *)stringByWebSafeEncodingBytes:(const void *)bytes
                                   length:(NSUInteger)length
                                   padded:(BOOL)padded;
+(JobsRetDataByStrBlock _Nonnull)webSafeDecodeString;
#pragma mark —— base64
+(JobsRetStrByStrBlock _Nonnull)md5_base64;
+(JobsRetStrByStrBlock _Nonnull)encodeBase64String;
+(JobsRetStrByStrBlock _Nonnull)decodeBase64String;
+(JobsRetStrByDataBlock _Nonnull)encodeBase64Data;
+(JobsRetStrByDataBlock _Nonnull)decodeBase64Data;

@end
