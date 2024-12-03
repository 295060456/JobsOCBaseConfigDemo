//
//  UITextField+Placeholder.h
//  Casino
//
//  Created by Jobs on 2021/12/20.
//

#import <UIKit/UIKit.h>
#import "UITextModelProtocol.h"
#import "NSMutableArray+Extra.h"

NS_ASSUME_NONNULL_BEGIN
/// 修改UITextField.Placeholder
@interface UITextField (Placeholder)<UITextModelProtocol>

-(UILabel *)placeholderLabel;

@end

NS_ASSUME_NONNULL_END
