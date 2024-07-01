//
//  PicToStrStoreSubVC.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/24.
//

#import "BaseViewController.h"
#import "Cryptography.h"

#ifndef PIC_TO_STR_STYLE_ENUM_DEFINED
#define PIC_TO_STR_STYLE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, PicToStrStyle) {
    PicToStrStyle_Hexadecimal = 0,/// 图片 转 十六进制
    PicToStrStyle_Base16,/// 图片 转 Base16字符编码
    PicToStrStyle_Base32,/// 图片 转 Base32字符编码
    PicToStrStyle_Base64,/// 图片 转 Base64字符编码
    PicToStrStyle_Base85,/// 图片 转 Base85字符编码
    PicToStrStyle_MIME,/// 图片 转 MIME
};
#endif /* PIC_TO_STR_STYLE_ENUM_DEFINED */

NS_ASSUME_NONNULL_BEGIN

@interface PicToStrStoreSubVC : BaseViewController

@end

NS_ASSUME_NONNULL_END
