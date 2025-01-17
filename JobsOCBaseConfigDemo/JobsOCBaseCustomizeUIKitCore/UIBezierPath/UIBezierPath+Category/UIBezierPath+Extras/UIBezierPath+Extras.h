//
//  UIBezierPath+Extras.h
//  test
//
//  Created by zwwuchn on 2017/1/2.
//  Copyright © 2017 zwwuchn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "JobsAttributedString.h"
#import "JobsDefineAllEnumHeader.h" /// 此文件用来存储记录全局的一些枚举
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIBezierPath (Extras)
/// 将指定的文本（text）转换成一个 UIBezierPath 对象，可以用于自定义文本的绘制效果
+(UIBezierPath *)bezierPathWithText:(NSString *)text
                               font:(UIFont *)font
                   andWithDirection:(TransformLayerDirectionType)textDirection;
/// addLineToPoint
-(jobsByPointBlock _Nonnull)add;
/// moveToPoint
-(jobsByPointBlock _Nonnull)moveTo;
/// 对系统方法 bezierPathWithRect
+(JobsReturnBezierPathByCGRectBlock _Nonnull)initByRect;

@end

NS_ASSUME_NONNULL_END
