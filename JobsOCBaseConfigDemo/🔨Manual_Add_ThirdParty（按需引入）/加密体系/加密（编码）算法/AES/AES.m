//
//  AESCrypt.m
//  Gurpartap Singh
//
//  Created by Gurpartap Singh on 06/05/12.
//  Copyright (c) 2012 Gurpartap Singh
//
//     MIT License
//
//     Permission is hereby granted, free of charge, to any person obtaining
//     a copy of this software and associated documentation files (the
//     "Software"), to deal in the Software without restriction, including
//     without limitation the rights to use, copy, modify, merge, publish,
//     distribute, sublicense, and/or sell copies of the Software, and to
//     permit persons to whom the Software is furnished to do so, subject to
//     the following conditions:
//
//     The above copyright notice and this permission notice shall be
//     included in all copies or substantial portions of the Software.
//
//     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//     LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//     OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//     WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "AES.h"

#import "NSData+Base64.h"
#import "NSString+Base64.h"
#import "NSData+CommonCrypto.h"

@implementation AES

+(NSString *)encrypt:(NSString *)message
            password:(NSString *)password{
    NSError *error = nil;
    NSData *encryptedData = [message.UTF8Encoding AES256EncryptedDataUsingKey:password.UTF8Encoding.SHA256Hash error:&error];
    NSString *base64EncodedString = encryptedData.base64StringFromData;
    if(error){
        JobsLog(@"error = %@",error);
        return @"";
    }else return base64EncodedString;
}

+(NSString *)decrypt:(NSString *)base64EncodedString
            password:(NSString *)password{
    NSError *error = nil;
    NSData *encryptedData = NSData.dataByBase64String(base64EncodedString);
    NSData *decryptedData = [encryptedData decryptedAES256DataUsingKey:password.UTF8Encoding.SHA256Hash
                                                                 error:&error];
    if(error){
        JobsLog(@"error = %@",error);
        return @"";
    }else return NSString.initByUTF8Data(decryptedData);
}

@end
