//
//  MD5.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/9/14.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>
#import "NSString+Judgment.h"
/// MD5  信息摘要
/// @param salt  MD5 加盐
/// @param string 被摘要的字符串
/// @param isLowercase 是否大小写
/// @param bit 加密长度
/// @param useBase64 是否用Base64 进行二次加密
NS_INLINE NSString *MD5_32bits(NSString *salt,
                                   NSString *string,
                                   BOOL isLowercase,
                                   int bit,
                                   BOOL useBase64){
    if (bit == CC_MD5_DIGEST_LENGTH ||
        bit == 32 ||
        bit == CC_MD5_BLOCK_BYTES) {
        
        if (isValue(salt)) {
            string = string.add(salt);
        }
        
        const char *original_str = string.UTF8String;
        unsigned char result[bit];
        
        CC_MD5(original_str,
               (unsigned int)strlen(original_str),
               result);
        NSString *output = nil;
        if (useBase64) {
            NSData * base64 = [NSData.alloc initWithBytes:result
                                                   length:bit];
            base64 = [GTMBase64 encodeData:base64];
            
            output = [NSString.alloc initWithData:base64 encoding:NSUTF8StringEncoding];
        }else{
            NSMutableString *hash = NSMutableString.string;
            
            for (int i = 0; i < bit; i++){
                [hash appendFormat:@"%02X", result[i]];
            }
            
            output = (NSString *)hash;
        }
        
        NSString *finalStr = Nil;
        finalStr = isLowercase ? output.lowercaseString : output.uppercaseString;
        return finalStr.copy;
    }return nil;
}
/// HmacMD5加密，使用秘钥
NS_INLINE NSString *hMacMD5String(NSString *string,
                                      NSString *keyStr,
                                      BOOL isLowercase,
                                      int bit){
    if (bit == CC_MD5_DIGEST_LENGTH ||
        bit == 32 ||
        bit == CC_MD5_BLOCK_BYTES) {
        const char *cKey  = [keyStr cStringUsingEncoding:NSUTF8StringEncoding];
        const char *cData = [string cStringUsingEncoding:NSUTF8StringEncoding];
        const unsigned int blockSize = CC_MD5_BLOCK_BYTES;
        char ipad[blockSize];
        char opad[blockSize];
        char keypad[blockSize];
        unsigned int keyLen = (unsigned int)strlen(cKey);
        
        CC_MD5_CTX ctxt;
        if (keyLen > blockSize) {
            CC_MD5_Init(&ctxt);
            CC_MD5_Update(&ctxt, cKey, keyLen);
            CC_MD5_Final((unsigned char *)keypad, &ctxt);
            keyLen = bit;
        }
        else {
            memcpy(keypad,
                   cKey,
                   keyLen);
        }
        
        memset(ipad, 0x36, blockSize);
        memset(opad, 0x5c, blockSize);
        
        int i;
        for (i = 0; i < keyLen; i++) {
            ipad[i] ^= keypad[i];
            opad[i] ^= keypad[i];
        }
        
        CC_MD5_Init(&ctxt);
        CC_MD5_Update(&ctxt, ipad, blockSize);
        CC_MD5_Update(&ctxt, cData, (CC_LONG)strlen(cData));
        unsigned char md5[bit];
        CC_MD5_Final(md5, &ctxt);
        
        CC_MD5_Init(&ctxt);
        CC_MD5_Update(&ctxt, opad, blockSize);
        CC_MD5_Update(&ctxt, md5, bit);
        CC_MD5_Final(md5, &ctxt);
        
        const unsigned int hex_len = bit*2+2;
        char hex[hex_len];
        for(i = 0; i < bit; i++) {
            snprintf(&hex[i*2], hex_len-i*2, "%02x", md5[i]);
        }
        
        NSData *HMAC = [NSData.alloc initWithBytes:hex length:strlen(hex)];
        NSString *hash = [NSString.alloc initWithData:HMAC encoding:NSUTF8StringEncoding];
        
        NSString *finalStr = isLowercase ? hash.lowercaseString : hash.uppercaseString;
        return finalStr;
    } return nil;
}

