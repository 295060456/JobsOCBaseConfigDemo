//
//  XXTools.h
//  Feidegou
//
//  Created by Kite on 2019/11/29.
//  Copyright © 2019 朝花夕拾. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XXTools : NSObject
/// 创建一个左上角的显示标记的markLabel
/// - Parameters:
///   - text: 要展示的文字
///   - width: 斜边宽度
///   - superView:  父视图
///   - cornerRadius: 圆角弧度
- (NSArray *)addMarkLabelWithText:(NSString *)text
                       maxWidth:(CGFloat)width
                      superView:(UIView *)superView
                   cornerRadius:(CGFloat)cornerRadius;

@end

NS_ASSUME_NONNULL_END
