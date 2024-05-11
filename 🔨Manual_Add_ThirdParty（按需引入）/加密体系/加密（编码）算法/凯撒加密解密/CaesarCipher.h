//
//  CaesarCipher.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/9/14.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>
///凯撒加密
static inline NSString *caesardDecode(NSString *string){
    NSString *originalStr = string;
    NSMutableArray *arr = [NSMutableArray array];
    for (int i=0 ;i <originalStr.length; i++){
        unichar asciiCode = [originalStr characterAtIndex:i];
        //右偏移3个单位
       asciiCode += 3;
        //注意：此处必须使用%C 不能用%c，否则会有乱码！
        NSString *encryptStr = [NSString stringWithFormat:@"%C", asciiCode];
        [arr addObject:encryptStr];
    }
    // //加密结果
    NSString *encodeStr = [arr componentsJoinedByString:@""];
    return encodeStr;
}
///凯撒解密
static inline NSString *caesarEncrypt(NSString *encodeStr){
    NSMutableArray *arr = [NSMutableArray array];
    for (int i=0 ;i < encodeStr.length; i++){
        unichar asciiCode = [encodeStr characterAtIndex:i];
        //左偏移3个单位（和加密相反即可）
        asciiCode -= 3;
        //注意：此处必须使用%C 不能用%c，否则会有乱码！
        NSString *encryptStr = [NSString stringWithFormat:@"%C", asciiCode];
        [arr addObject:encryptStr];
    }
    //解密结果
    NSString *decodeStr = [arr componentsJoinedByString:@""];
    return decodeStr;
}

