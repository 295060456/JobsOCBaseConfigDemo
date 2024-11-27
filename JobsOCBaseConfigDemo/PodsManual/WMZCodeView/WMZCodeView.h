//
//  WMZCodeView.h
//  WMZCode
//
//  Created by wmz on 2018/12/14.
//  Copyright © 2018年 wmz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMZCodeViewDefine.h"
#import "UIView+Measure.h"
#import "UIButton+UI.h"
#import "UISlider+Extra.h"
#import "MacroDef_Cor.h"
#import "JobsLoadingImage.h"
#import "NSObject+CallBackInfoByBlock.h"
#import "BaseProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface WMZCodeView : UIView<BaseProtocol>
/*
 * 调用方法
 *
 * @param  CodeType  类型
 * @param  name      背景图
 * @param  rect      frame
 * @param  block     回调
 *
 */
- (WMZCodeView*)addCodeViewWithType:(CodeType)type
                      withImageName:(NSString*)name
                          witgFrame:(CGRect)rect;
@end

@interface WMZSlider : UISlider

@property(nonatomic,strong)UILabel *label;

@end

NS_ASSUME_NONNULL_END
