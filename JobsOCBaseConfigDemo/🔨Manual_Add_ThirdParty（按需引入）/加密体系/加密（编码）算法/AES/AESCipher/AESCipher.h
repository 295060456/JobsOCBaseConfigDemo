//
//  AESCipher.h
//  AESCipher
//
//  Created by Welkin Xie on 8/13/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//
//  https://github.com/WelkinXie/AESCipher-iOS
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

NSString * aesEncryptString(NSString *content,
                            NSString *key);

NSString * aesDecryptString(NSString *content,
                            NSString *key);

