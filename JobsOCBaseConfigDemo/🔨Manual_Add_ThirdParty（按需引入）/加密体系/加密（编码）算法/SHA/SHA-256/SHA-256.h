//
//  Header.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/9/14.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

//亲测，可以适配iOS13并且兼容之前系统
static inline NSString *SHA_256(NSString *string){
    const char *s = [string cStringUsingEncoding:NSUTF8StringEncoding];

    NSData *keyData = [NSData dataWithBytes:s length:strlen(s)];

    uint8_t digest[CC_SHA256_DIGEST_LENGTH] = {0};
    CC_SHA256(keyData.bytes, (CC_LONG)keyData.length, digest);
    NSData *out = [NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];

    const unsigned *hashBytes = [out bytes];
    NSString *hash = [NSString stringWithFormat:@"%08x%08x%08x%08x%08x%08x%08x%08x",
    ntohl(hashBytes[0]), ntohl(hashBytes[1]), ntohl(hashBytes[2]),
    ntohl(hashBytes[3]), ntohl(hashBytes[4]), ntohl(hashBytes[5]),
    ntohl(hashBytes[6]), ntohl(hashBytes[7])];
    return hash;
}
