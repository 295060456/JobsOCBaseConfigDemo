//
//  IQKeyboardManager+Extra.h
//  FM
//
//  Created by Admin on 25/11/2024.
//

#import <Foundation/Foundation.h>

#if __has_include(<IQKeyboardManager/IQKeyboardManager.h>)
#import <IQKeyboardManager/IQKeyboardManager.h>
#else
#import "IQKeyboardManager.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface IQKeyboardManager (Extra)

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof IQKeyboardManager *_Nonnull jobsMakeIQKeyboardManager(jobsByIQKeyboardManagerBlock _Nonnull block){
    IQKeyboardManager *data = IQKeyboardManager.sharedManager;
    if (block) block(data);
    return data;
}
