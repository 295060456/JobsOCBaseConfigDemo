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

/**
 *  创建一个左上角的显示标记的markLabel
 *
 *  @param text          要展示的文字
 *  @param width        斜边宽度
 *  @param superView    父视图
 *  @param cornerRadius 圆角弧度
 */
- (NSArray *)addMarkLabelWithText:(NSString *)text
                       maxWidth:(CGFloat)width
                      superView:(UIView *)superView
                   cornerRadius:(CGFloat)cornerRadius;

@end

NS_ASSUME_NONNULL_END
