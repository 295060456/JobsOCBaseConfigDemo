//
//  DES.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/9/14.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>

//DES 加密
static inline NSData *encryptUseDES(NSData *plainText,
                                    Byte *key){
    NSData *textData = plainText;
    NSUInteger dataLength = [textData length];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionECBMode,
                                          key,
                                          kCCKeySizeDES,
                                          nil,
                                          [textData bytes],
                                          dataLength,
                                          buffer,
                                          1024,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer
                                      length:(NSUInteger)numBytesEncrypted];
        return data;
    }return nil;
}
//DES 解密
static inline NSData *decrypUseDES(NSData *plainText,
                                   Byte *key){
    NSData *cipherdata = plainText;
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionECBMode,
                                          key,
                                          kCCKeySizeDES,
                                          nil,
                                          [cipherdata bytes],
                                          [cipherdata length],
                                          buffer,
                                          1024,
                                          &numBytesDecrypted);
    if(cryptStatus == kCCSuccess){
        NSData *plaindata = [NSData dataWithBytes:buffer
                                           length:(NSUInteger)numBytesDecrypted];
        return plaindata;
    }return nil;
}
