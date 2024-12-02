//
//  NSData+Base64.h
//  Gurpartap Singh
//
//  Created by Gurpartap Singh on 06/05/12.
//  Copyright (c) 2012 Gurpartap Singh. All rights reserved.
//

#import "NSData+Base64.h"

@implementation NSData (Base64)
#pragma mark —— NSData ==> Base64
///【类方法】NSData 转换成 以Base64编码的字符串
+(JobsReturnStringByDataBlock _Nonnull)base64StringFromData{
    return ^__kindof NSString *_Nullable(NSData *_Nullable data){
        return [data base64EncodedStringWithOptions:0];
    };
}
///【实例方法】NSData 转换成 以Base64编码的字符串
-(NSString *_Nullable)base64StringFromData{
    return NSData.base64StringFromData(self);
}
#pragma mark —— Base64 ==> NSData
///【类方法】将给定的以Base64编码的字符串 转换为 NSData对象。实现了将Base64字符串解码为原始二进制数据的过程。
+(JobsReturnDataByStringBlock _Nonnull)dataByBase64String{
    /**
     具体来说，该方法遍历输入的Base64字符串中的字符，并根据Base64编码规则将其转换为相应的二进制数据。
     在遍历过程中，将每4个Base64字符（24比特）转换为3个字节的二进制数据，然后将这些二进制数据追加到NSMutableData对象中。
     在处理过程中，会跳过一些特殊字符，如'='、'/'等，并根据实际情况确定解码的终止条件。
     
     最终，方法返回解码后的NSData对象，其中包含了Base64字符串所表示的原始二进制数据。
     */
    return ^NSData *_Nullable(__kindof NSString *_Nullable string){
        unsigned long ixtext, lentext;
        unsigned char ch, inbuf[4], outbuf[3];
        short i, ixinbuf;
        Boolean flignore, flendtext = false;
        const unsigned char *tempcstring;
        NSMutableData *theData;
        if (!string) return [NSData data];
        ixtext = 0;
        tempcstring = (const unsigned char *)string.UTF8String;
        lentext = [string length];
        theData = [NSMutableData dataWithCapacity: lentext];
        ixinbuf = 0;
        while (true) {
            if (ixtext >= lentext) break;
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
              }if (flbreak) break;
            }
        }return theData;
    };
}
///【实例方法】将给定的以Base64编码的字符串 转换为 NSData对象。实现了将Base64字符串解码为原始二进制数据的过程。
-(JobsReturnDataByStringBlock _Nonnull)dataByBase64String{
    return ^NSData *_Nullable(__kindof NSString *_Nullable string){
        return NSData.dataByBase64String(string);
    };
}

@end
