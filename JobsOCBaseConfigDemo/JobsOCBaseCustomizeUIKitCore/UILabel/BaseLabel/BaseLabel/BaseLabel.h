//
//  AutoScrollLabel.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/18.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "BaseViewProtocol.h"
#import "UILocationProtocol.h"
#import "UIView+Extras.h"
#import "UILabel+Extra.h"
#import "NSString+Others.h"

NS_ASSUME_NONNULL_BEGIN
/**
 1、自定义UILabel 实现显示偏移量和内边距
 2、自定义UILabel 实现添加长按手势和点击手势
 https://www.jianshu.com/p/541ef795a1f2
 */
@interface BaseLabel : UILabel
<
BaseViewProtocol,
UILocationProtocol,
UIGestureRecognizerDelegate
>

@property(nonatomic,assign)UIEdgeInsets edgeInsets;

#pragma mark —— 一些公有方法
/// UILabel文字的复制
-(jobsByStringBlock _Nonnull)copyText;
/// 弹出系统菜单控件
-(jobsByStringBlock _Nonnull)makeMenuCtrl;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof BaseLabel *_Nonnull jobsMakeBaseLabel(jobsByBaseLabelBlock _Nonnull block){
    BaseLabel *data = BaseLabel.alloc.init;
    if (block) block(data);
    return data;
}
