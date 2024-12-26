//
//  JobsOCBaseCustomize3rdCore.h
//  FM
//
//  Created by Admin on 25/11/2024.
//

#ifndef JobsOCBaseCustomize3rdCore_h
#define JobsOCBaseCustomize3rdCore_h

#if __has_include(<SZTextView/SZTextView.h>)
#import <SZTextView/SZTextView.h>
#else
#import "SZTextView.h"
#endif

#if __has_include(<HXPhotoPicker/HXPhotoPicker.h>)
#import <HXPhotoPicker/HXPhotoPicker.h>
#else
#import "HXPhotoPicker.h"
#endif

#if __has_include(<BRPickerView/BRPickerView.h>)
#import <BRPickerView/BRPickerView.h>
#else
#import "BRPickerView.h"
#endif

#if __has_include(<Reachability/Reachability.h>)
#import <Reachability/Reachability.h>
#else
#import "Reachability.h"
#endif

#if __has_include(<IQKeyboardManager/IQKeyboardManager.h>)
#import <IQKeyboardManager/IQKeyboardManager.h>
#else
#import "IQKeyboardManager.h"
#endif

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#elif __has_include("AFNetworking.h")
#import "AFNetworking.h"
#elif __has_include("AFNetworking-umbrella.h")
#import "AFNetworking-umbrella.h"
#else
#error "AFNetworking header not found"
#endif

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#if __has_include(<HTMLReader/HTMLReader.h>)
#import <HTMLReader/HTMLReader.h>
#else
#import "HTMLReader.h"
#endif

#if __has_include(<SocketRocket/SocketRocket.h>)
#import <SocketRocket/SocketRocket.h>
#else
#import "SocketRocket.h"
#endif

#import "AFSecurityPolicy+Extra.h"
#import "IQKeyboardManager+Extra.h"
#import "Reachability+Extra.h"
#import "BRStringPickerView+Extra.h"
#import "HXPhotoManager+Extra.h"
#import "HXPhotoView+Extra.h"
#import "SZTextView+Extra.h"
#import "HTMLDocument+Extra.h"
#import "SRWebSocket+Extra.h"

#endif /* JobsOCBaseCustomize3rdCore_h */

NS_INLINE __kindof YTKNetworkConfig *_Nonnull jobsMakeYTKNetworkConfig(jobsByYTKNetworkConfigBlock _Nonnull block){
    YTKNetworkConfig *data = YTKNetworkConfig.sharedConfig;
    if (block) block(data);
    return data;
}
