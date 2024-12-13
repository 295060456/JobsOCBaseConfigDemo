//
//  XProtocol.h
//  FM
//
//  Created by Admin on 13/12/2024.
//

#import <Foundation/Foundation.h>

#import "BaseLayerProtocol.h"
#import "UILocationProtocol.h"
#import "UIMarkProtocol.h"
#import "UIPictureAndBackGroundCorProtocol.h"
#import "UITextModelProtocol.h"
#import "UIViewModelOthersProtocol.h"
#import "BaseButtonProtocol.h"
#import "UITextFieldProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol XProtocol
<
NSObject,
BaseLayerProtocol, /// <NSObject>：BaseLayerProtocol_synthesize、BaseLayerProtocol_dynamic
UILocationProtocol, /// <NSObject>：UILocationProtocol_synthesize、UILocationProtocol_dynamic
UIMarkProtocol, /// <NSObject>：UIMarkProtocol_synthesize、UIMarkProtocol_dynamic
UIPictureAndBackGroundCorProtocol, /// <NSObject>： UIPictureAndBackGroundCorProtocol_synthesize、UIPictureAndBackGroundCorProtocol_dynamic
UITextModelProtocol, /// <NSObject>：UITextModelProtocol_synthesize、UITextModelProtocol_dynamic
UIViewModelOthersProtocol, /// <NSObject>：UIViewModelOthersProtocol_synthesize、UIViewModelOthersProtocol_dynamic
BaseButtonProtocol, /// <NSObject>：
UITextFieldProtocol /// <NSObject>：
>

@end

NS_ASSUME_NONNULL_END
