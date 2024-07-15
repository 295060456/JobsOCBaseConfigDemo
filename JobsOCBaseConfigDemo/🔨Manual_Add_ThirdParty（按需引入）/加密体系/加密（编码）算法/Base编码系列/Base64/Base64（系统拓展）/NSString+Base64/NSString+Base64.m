//
//  NSStringAdditions.m
//  Gurpartap Singh
//
//  Created by Gurpartap Singh on 06/05/12.
//  Copyright (c) 2012 Gurpartap Singh. All rights reserved.
//

#import "NSString+Base64.h"

@implementation NSString (Base64)
#pragma mark —— Base64 <==> NSString
///【类方法】NSString对象 转换成  以Base64 编码的字符串
+(NSString *_Nullable)base64String:(NSString *_Nonnull)nsString{
    NSData *data = [nsString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [data base64EncodedStringWithOptions:0];
    return base64String;
}
///【实例方法】NSString对象 转换成  以Base64 编码的字符串
-(NSString *_Nullable)base64String{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [data base64EncodedStringWithOptions:0];
    return base64String;
}
///【类方法】Base64 编码的字符串  转换成 NSString对象
+(NSString *_Nullable)nsStringByBase64:(NSString *_Nonnull)base64String{
    NSData *data = [NSData.alloc initWithBase64EncodedString:base64String options:0];
    NSString *string = [NSString.alloc initWithData:data
                                           encoding:NSUTF8StringEncoding];
    return string;
}
///【实例方法】Base64 编码的字符串  转换成 NSString对象
-(NSString *_Nullable)nsStringByBase64{
    NSData *data = [NSData.alloc initWithBase64EncodedString:self options:0];
    NSString *string = [NSString.alloc initWithData:data
                                           encoding:NSUTF8StringEncoding];
    return string;
}
#pragma mark —— Base64 <==> UIImage
///【类方法】将以Base64编码的字符串 转换为 UIImage对象
+(UIImage *_Nullable)imageByBase64String:(NSString *_Nonnull)base64String{
    NSData *imageData = [NSData.alloc initWithBase64EncodedString:base64String
                                                          options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *image = [UIImage imageWithData:imageData];
    return image;
}
///【实例方法】将以Base64编码的字符串 转换为 UIImage对象
-(UIImage *_Nullable)imageByBase64String{
    NSData *imageData = [NSData.alloc initWithBase64EncodedString:self
                                                          options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *image = [UIImage imageWithData:imageData];
    return image;
}
#pragma mark —— Base64 <==> NSData
///【类方法】将给定的以Base64编码的字符串 转换为 NSData对象。实现了将Base64字符串解码为原始二进制数据的过程。
+(NSData *_Nullable)dataByBase64String:(NSString *_Nonnull)base64String{
    /**
     具体来说，该方法遍历输入的Base64字符串中的字符，并根据Base64编码规则将其转换为相应的二进制数据。
     在遍历过程中，将每4个Base64字符（24比特）转换为3个字节的二进制数据，然后将这些二进制数据追加到NSMutableData对象中。
     在处理过程中，会跳过一些特殊字符，如'='、'/'等，并根据实际情况确定解码的终止条件。
     
     最终，方法返回解码后的NSData对象，其中包含了Base64字符串所表示的原始二进制数据。
     */
    unsigned long ixtext, lentext;
    unsigned char ch, inbuf[4], outbuf[3];
    short i, ixinbuf;
    Boolean flignore, flendtext = false;
    const unsigned char *tempcstring;
    NSMutableData *theData;
    if (!self) return NSData.data;
    ixtext = 0;
    tempcstring = (const unsigned char *)base64String.UTF8String;
    lentext = base64String.length;
    theData = [NSMutableData dataWithCapacity: lentext];
    ixinbuf = 0;
    while (true) {
    if (ixtext >= lentext) {
        break;
    }
    ch = tempcstring [ixtext++];
    flignore = false;

    if ((ch >= 'A') && (ch <= 'Z')) {
        ch = ch - 'A';
    }else if ((ch >= 'a') && (ch <= 'z')) {
        ch = ch - 'a' + 26;
    }else if ((ch >= '0') && (ch <= '9')) {
        ch = ch - '0' + 52;
    }else if (ch == '+') {
        ch = 62;
    }else if (ch == '=') {
        flendtext = true;
    }else if (ch == '/') {
        ch = 63;
    }else {
        flignore = true;
    }

        if (!flignore) {
            short ctcharsinbuf = 3;
            Boolean flbreak = false;
      
            if (flendtext) {
            if (ixinbuf == 0) {
              break;
            }
            if ((ixinbuf == 1) || (ixinbuf == 2)) {
                ctcharsinbuf = 1;
            }else {
                ctcharsinbuf = 2;
            }
            ixinbuf = 3;
            flbreak = true;
          }
          inbuf [ixinbuf++] = ch;
          if (ixinbuf == 4) {
              ixinbuf = 0;
              outbuf[0] = (inbuf[0] << 2) | ((inbuf[1] & 0x30) >> 4);
              outbuf[1] = ((inbuf[1] & 0x0F) << 4) | ((inbuf[2] & 0x3C) >> 2);
              outbuf[2] = ((inbuf[2] & 0x03) << 6) | (inbuf[3] & 0x3F);
              for (i = 0; i < ctcharsinbuf; i++) {
                  [theData appendBytes: &outbuf[i] length: 1];
              }
          }
          if (flbreak) {
            break;
          }
        }
    }return theData;
}
///【实例方法】将给定的以Base64编码的字符串 转换为 NSData对象。实现了将Base64字符串解码为原始二进制数据的过程。
-(NSData *_Nullable)dataByBase64String{
    /**
     具体来说，该方法遍历输入的Base64字符串中的字符，并根据Base64编码规则将其转换为相应的二进制数据。
     在遍历过程中，将每4个Base64字符（24比特）转换为3个字节的二进制数据，然后将这些二进制数据追加到NSMutableData对象中。
     在处理过程中，会跳过一些特殊字符，如'='、'/'等，并根据实际情况确定解码的终止条件。
     
     最终，方法返回解码后的NSData对象，其中包含了Base64字符串所表示的原始二进制数据。
     */
    unsigned long ixtext, lentext;
    unsigned char ch, inbuf[4], outbuf[3];
    short i, ixinbuf;
    Boolean flignore, flendtext = false;
    const unsigned char *tempcstring;
    NSMutableData *theData;
    if (!self) return NSData.data;
    ixtext = 0;
    tempcstring = (const unsigned char *)self.UTF8String;
    lentext = self.length;
    theData = [NSMutableData dataWithCapacity: lentext];
    ixinbuf = 0;
    while (true) {
    if (ixtext >= lentext) {
        break;
    }
    ch = tempcstring [ixtext++];
    flignore = false;

    if ((ch >= 'A') && (ch <= 'Z')) {
        ch = ch - 'A';
    }else if ((ch >= 'a') && (ch <= 'z')) {
        ch = ch - 'a' + 26;
    }else if ((ch >= '0') && (ch <= '9')) {
        ch = ch - '0' + 52;
    }else if (ch == '+') {
        ch = 62;
    }else if (ch == '=') {
        flendtext = true;
    }else if (ch == '/') {
        ch = 63;
    }else {
        flignore = true;
    }

        if (!flignore) {
            short ctcharsinbuf = 3;
            Boolean flbreak = false;
      
            if (flendtext) {
            if (ixinbuf == 0) {
              break;
            }
            if ((ixinbuf == 1) || (ixinbuf == 2)) {
                ctcharsinbuf = 1;
            }else {
                ctcharsinbuf = 2;
            }
            ixinbuf = 3;
            flbreak = true;
          }
          inbuf [ixinbuf++] = ch;
          if (ixinbuf == 4) {
              ixinbuf = 0;
              outbuf[0] = (inbuf[0] << 2) | ((inbuf[1] & 0x30) >> 4);
              outbuf[1] = ((inbuf[1] & 0x0F) << 4) | ((inbuf[2] & 0x3C) >> 2);
              outbuf[2] = ((inbuf[2] & 0x03) << 6) | (inbuf[3] & 0x3F);
              for (i = 0; i < ctcharsinbuf; i++) {
                  [theData appendBytes: &outbuf[i] length: 1];
              }
          }
          if (flbreak) {
            break;
          }
        }
    }return theData;
}

@end
