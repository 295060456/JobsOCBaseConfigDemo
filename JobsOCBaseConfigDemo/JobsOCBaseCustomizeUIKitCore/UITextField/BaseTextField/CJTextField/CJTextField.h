//
//  CJTextField.h
//  Feidegou
//
//  Created by Kite on 2019/11/24.
//  Copyright © 2019 朝花夕拾. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "UITextField+Extend.h"
#import "NSObject+CurrentDevice.h"

NS_ASSUME_NONNULL_BEGIN
/// iOS监听键盘删除事件
/// 资料来源：https://www.jianshu.com/p/b5100f498f12
@class CJTextField;

@protocol CJTextFieldDeleteDelegate <NSObject>
-(JobsByCJTextFieldBlock _Nonnull)cjTextFieldDeleteBackward;
@end

@interface CJTextField : UITextField

@property(nonatomic,weak)id <CJTextFieldDeleteDelegate>cj_delegate;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof CJTextField *_Nonnull jobsMakeCJTextField(jobsByCJTextField _Nonnull block){
    CJTextField *data = CJTextField.alloc.init;
    if (block) block(data);
    return data;
}
