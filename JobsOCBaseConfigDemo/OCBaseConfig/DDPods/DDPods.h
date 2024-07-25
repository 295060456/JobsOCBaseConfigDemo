//
//  Pods.h
//  My_BaseProj
//
//  Created by Jobs on 2019/9/26.
//  Copyright © 2019 Corp. All rights reserved.
//

#ifndef Pods_h
#define Pods_h

/// 以下是 Debug 区段
#if DEBUG

#if __has_include(<FLEX/FLEX.h>)
#import <FLEX/FLEX.h>
#else
//#import "FLEX.h"
#endif

#if __has_include(<DoraemonManager/DoraemonManager.h>)
#import <DoraemonKit/DoraemonManager.h>
#else
//#import "DoraemonManager.h"
#endif

//#if __has_include(<FBRetainCycleDetector/FBRetainCycleDetector.h>)
//#import <FBRetainCycleDetector/FBRetainCycleDetector.h>
//#else
//#import "FBRetainCycleDetector.h"
//#endif

#endif
/// 以上是 Debug 区段

#import "UITextView+Placeholder.h"
#import "UIInterface+HXRotation.h"

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#elif __has_include("XYColorOC.h")
#import "XYColorOC.h"
#elif __has_include("XYColorOC-umbrella.h")
#import "XYColorOC-umbrella.h"
#else
#error "XYColorOC header not found"
#endif

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#if __has_include(<WMZCode/WMZCodeView.h>)
#import <WMZCode/WMZCodeView.h>
#else
#import "WMZCodeView.h"
#endif

#if __has_include(<FSCalendar/FSCalendar.h>)
#import <FSCalendar/FSCalendar.h>
#else
#import "FSCalendar.h"
#endif

#if __has_include(<ZMJGanttChart/ZMJGanttChart.h>)
#import <ZMJGanttChart/ZMJGanttChart.h>
#else
#import "ZMJGanttChart.h"
#endif

#if __has_include(<LMJDropdownMenu/LMJDropdownMenu.h>)
#import <LMJDropdownMenu/LMJDropdownMenu.h>
#else
#import "LMJDropdownMenu.h"
#endif

#if __has_include(<WMZBanner/WMZBannerView.h>)
#import <WMZBanner/WMZBannerView.h>
#else
#import "WMZBannerView.h"
#endif

//#if __has_include(<VerifyCode/NTESVerifyCodeManager.h>)
//#import <VerifyCode/NTESVerifyCodeManager.h>
//#else
//#import "NTESVerifyCodeManager.h"
//#endif

#if __has_include(<FMDB/FMDB.h>)
#import <FMDB/FMDB.h>
#else
#import "FMDB.h"
#endif

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<TABAnimated/TABAnimated.h>)
#import <TABAnimated/TABAnimated.h>
#else
#import "TABAnimated.h"
#endif

#if __has_include(<Reachability/Reachability.h>)
#import <Reachability/Reachability.h>
#else
#import "Reachability.h"//检查联网情况
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

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#if __has_include(<XZMRefresh/XZMRefresh.h>)
#import <XZMRefresh/XZMRefresh.h>
#else
#import "XZMRefresh.h"
#endif

#if __has_include(<SPAlertController/SPAlertController.h>)
#import <SPAlertController/SPAlertController.h>
#else
#import "SPAlertController.h"
#endif

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#if __has_include(<BRPickerView/BRPickerView.h>)
#import <BRPickerView/BRPickerView.h>
#else
#import "BRPickerView.h"
#endif

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

#if __has_include(<JXPagingView/JXPagerView.h>)
#import <JXPagingView/JXPagerView.h>
#else
#import "JXPagerView.h"
#endif

#if __has_include(<JPImageresizerView/JPImageresizerView.h>)
#import <JPImageresizerView/JPImageresizerView.h>
#else
#import "JPImageresizerView.h"
#endif

#if __has_include(<GKNavigationBar/GKNavigationBar.h>)
#import <GKNavigationBar/GKNavigationBar.h>
#else
#import "GKNavigationBar.h"
#endif

#if __has_include(<TFPopup/TFPopup.h>)
#import <TFPopup/TFPopup.h>
#else
#import "TFPopup.h"
#endif

#if __has_include(<PPBadgeView/PPBadgeView.h>)
#import <PPBadgeView/PPBadgeView.h>
#else
#import "PPBadgeView.h"
#endif

#if __has_include(<LYEmptyView/LYEmptyViewHeader.h>)
#import <LYEmptyView/LYEmptyViewHeader.h>
#else
#import "LYEmptyViewHeader.h"
#endif

#if __has_include(<WHToast/WHToast.h>)
#import <WHToast/WHToast.h>
#else
#import "WHToast.h"
#endif

#if __has_include(<MGSwipeTableCell/MGSwipeTableCell.h>)
#import <MGSwipeTableCell/MGSwipeTableCell.h>
#else
#import "MGSwipeTableCell.h"
#endif

#if __has_include(<lottie-ios/Lottie.h>)
#import <lottie-ios/Lottie.h>
#else
#import "Lottie.h"
#endif

#if __has_include(<YQImageCompressTool/YQImageCompressTool.h>)
#import <YQImageCompressTool/YQImageCompressTool.h>
#else
#import "YQImageCompressTool.h"
#endif

#if __has_include(<TXFileOperation/TXFileOperation.h>)
#import <TXFileOperation/TXFileOperation.h>
#else
#import "TXFileOperation.h"
#endif

#if __has_include(<OpenUDID/OpenUDID.h>)
#import <OpenUDID/OpenUDID.h>
#else
#import "OpenUDID.h"
#endif

#if __has_include(<AYCheckManager/AYCheckManager.h>)
#import <AYCheckManager/AYCheckManager.h>
#else
#import "AYCheckManager.h"
#endif

#if __has_include(<BEMCheckBox/BEMCheckBox.h>)
#import <BEMCheckBox/BEMCheckBox.h>
#else
#import "BEMCheckBox.h"
#endif

#if __has_include(<Shimmer/FBShimmering.h>)
#import <Shimmer/FBShimmering.h>
#else
#import "FBShimmering.h"
#endif

//#if __has_include(<FMDB/FMDB.h>)
//#import <FMDB/FMDB.h>
//#else
//#import "FMDB.h"
//#endif

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

#if __has_include(<BMLongPressDragCellCollectionView/BMLongPressDragCellCollectionView.h>)
#import <BMLongPressDragCellCollectionView/BMLongPressDragCellCollectionView.h>
#else
#import "BMLongPressDragCellCollectionView.h"
#endif

#if __has_include(<GKPhotoBrowser/GKPhotoBrowser.h>)
#import <GKPhotoBrowser/GKPhotoBrowser.h>
#else
#import "GKPhotoBrowser.h"
#endif

#pragma mark —— ZFPlayer 播放器相关
//Core
#if __has_include(<ZFPlayer/ZFPlayer.h>)
#import <ZFPlayer/ZFPlayer.h>
#else
#import "ZFPlayer.h"
#endif
//AVPlayer
#if __has_include(<ZFPlayer/ZFAVPlayerManager.h>)
#import <ZFPlayer/ZFAVPlayerManager.h>
#else
#import "ZFAVPlayerManager.h"
#endif
//ijkplayer
#if __has_include(<ZFPlayer/ZFIJKPlayerManager.h>)
#import <ZFPlayer/ZFIJKPlayerManager.h>
#else
#import "ZFIJKPlayerManager.h"
#endif
//ControlView
#if __has_include(<ZFPlayer/UIImageView+ZFCache.h>)
#import <ZFPlayer/UIImageView+ZFCache.h>
#else
#import "UIImageView+ZFCache.h"
#endif

#if __has_include(<ZFPlayer/UIView+ZFFrame.h>)
#import <ZFPlayer/UIView+ZFFrame.h>
#else
#import "UIView+ZFFrame.h"
#endif

#if __has_include(<ZFPlayer/ZFLandScapeControlView.h>)
#import <ZFPlayer/ZFLandScapeControlView.h>
#else
#import "ZFLandScapeControlView.h"
#endif

#if __has_include(<ZFPlayer/ZFLoadingView.h>)
#import <ZFPlayer/ZFLoadingView.h>
#else
#import "ZFLoadingView.h"
#endif

#if __has_include(<ZFPlayer/ZFNetworkSpeedMonitor.h>)
#import <ZFPlayer/ZFNetworkSpeedMonitor.h>
#else
#import "ZFNetworkSpeedMonitor.h"
#endif

#if __has_include(<ZFPlayer/ZFPlayerControlView.h>)
#import <ZFPlayer/ZFPlayerControlView.h>
#else
#import "ZFPlayerControlView.h"
#endif

#if __has_include(<ZFPlayer/ZFPortraitControlView.h>)
#import <ZFPlayer/ZFPortraitControlView.h>
#else
#import "ZFPortraitControlView.h"
#endif

#if __has_include(<ZFPlayer/ZFSliderView.h>)
#import <ZFPlayer/ZFSliderView.h>
#else
#import "ZFSliderView.h"
#endif

#if __has_include(<ZFPlayer/ZFSmallFloatControlView.h>)
#import <ZFPlayer/ZFSmallFloatControlView.h>
#else
#import "ZFSmallFloatControlView.h"
#endif

#if __has_include(<ZFPlayer/ZFSpeedLoadingView.h>)
#import <ZFPlayer/ZFSpeedLoadingView.h>
#else
#import "ZFSpeedLoadingView.h"
#endif

#if __has_include(<ZFPlayer/ZFUtilities.h>)
#import <ZFPlayer/ZFUtilities.h>
#else
#import "ZFUtilities.h"
#endif

#if __has_include(<ZFPlayer/ZFVolumeBrightnessView.h>)
#import <ZFPlayer/ZFVolumeBrightnessView.h>
#else
#import "ZFVolumeBrightnessView.h"
#endif

//暂时用不着的、重复的、过时的
//#import "PureLayout.h"
//#import "MyLayout.h"
//#import "TRCustomAlert.h"
//#import "GPUImage.h"
//#import <LKDBHelper.h>
//#import "LBXScanView.h"
//#import <YYText/YYText.h>
//#import "ZXingObjC.h"
//#import "SVProgressHUD.h"//
//#import <AsyncDisplayKit/AsyncDisplayKit.h>
//#import "PGBanner.h"
//#import "PINCache.h"
//#import "PINOperation.h"
//#import "PINRemoteImage.h"//支持带标记的图片后处理。对于同一张图片，当需要不同的后处理方式时（a 界面需要正圆角，b 界面需要小幅度的圆角），尤为有用 https://juejin.im/post/5a96a9b4f265da4e7f35d24e#heading-4

#endif /* Pods_h */
