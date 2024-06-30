//
//  UIBezierPath+TextPath.h
//  test
//
//  Created by zwwuchn on 2017/1/2.
//  Copyright © 2017 zwwuchn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, TransformLayerDirectionType) {
    TransformLayerDirectionUp = 0, /// 文字方向朝上(默认正常)
    TransformLayerDirectionLeft,/// 文字方向朝左
    TransformLayerDirectionDown,/// 文字方向朝下
    TransformLayerDirectionRight/// 文字方向朝右
};

@interface UIBezierPath (TextPath)

+ (UIBezierPath *)bezierPathWithText:(NSString *)text
                                font:(UIFont *)font
                    andWithDirection:(TransformLayerDirectionType)textDirection;

@end

NS_ASSUME_NONNULL_END
