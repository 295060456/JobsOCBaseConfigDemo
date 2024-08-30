//
//  UITableViewCell+Margin.h
//  JobsIM
//
//  Created by Jobs on 2020/11/13.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "BaseCellProtocol.h"

NS_ASSUME_NONNULL_BEGIN
/// 重设边距
@interface UITableViewCell (Margin)
<
BaseCellProtocol
,UIViewModelProtocol
>
#pragma mark —— 一些公有的功能方法
/// 值打印
-(jobsByVoidBlock)printValue;
/// 修改 UITableViewCell 中默认子控件的frame 【方法一】
-(jobsByVoidBlock)modifySysChildViewFrame1;
/// 修改 UITableViewCell 中默认子控件的frame 【方法二】
-(jobsByVoidBlock)modifySysChildViewFrame2;
/// 取内部类UITableViewCellEditControl,对编辑状态的Cell的点击按钮进行替换成自定义的
-(jobsByVoidBlock)customCellEditStateImage;

@end

NS_ASSUME_NONNULL_END
