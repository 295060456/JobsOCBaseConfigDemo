//
//  UIImage+SYS.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/8/23.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/message.h>
#import "JobsBlock.h"
#import "JobsString.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SYS)
/*
    这里MKImageNamed方法中不能调用imageNamed方法,
    因为imageNamed实质已经是MKImageNamed方法了,
    会出项死循环,
    调用其自己的时候,
    实质是调用imageNamed方法,
    imageNamed中没有代用MKImageNamed,
    这样就不会出现死循环;
*/
+(JobsReturnImageByStringBlock _Nonnull)imageByName;
/// 替换系统的 imageWithData 方法
+(JobsReturnImageByDataBlock _Nonnull)imageByData;

@end

NS_ASSUME_NONNULL_END
