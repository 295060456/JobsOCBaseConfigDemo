//
//  UITextFieldModel.h
//  FM
//
//  Created by Admin on 3/12/2024.
//

#import <Foundation/Foundation.h>
#import "DefineProperty.h"
#import "UITextFieldProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITextFieldModel : NSObject<UITextFieldProtocol>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UITextFieldModel *_Nonnull jobsMakeTextFieldModel(jobsByTextFieldModelBlock _Nonnull block){
    UITextFieldModel *data = UITextFieldModel.alloc.init;
    if (block) block(data);
    return data;
}
