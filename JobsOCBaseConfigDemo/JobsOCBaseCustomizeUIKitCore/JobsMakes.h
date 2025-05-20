//
//  JobsMakes.h
//  FM
//
//  Created by Admin on 12/11/2024.
//

#ifndef JobsMakes_h
#define JobsMakes_h

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "JobsBlock.h"
#import "NSObject+AttributedStr.h"
#import "NSString+Others.h"
#pragma mark —— 关于时间/日历
NS_INLINE __kindof NSDateComponents *_Nonnull jobsMakeDateComponents(jobsByDateComponentsBlock _Nonnull block){
    NSDateComponents *data = NSDateComponents.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSDateFormatter *_Nonnull jobsMakeDateFormatter(jobsByDateFormatterBlock _Nonnull block){
    NSDateFormatter *data = NSDateFormatter.alloc.init;
    if (block) block(data);
    return data;
}
#pragma mark —— 关于贝塞尔曲线的创建
NS_INLINE __kindof UIBezierPath *_Nonnull jobsMakeBezierPath(jobsByBezierPathBlock _Nonnull block){
    UIBezierPath *data = UIBezierPath.bezierPath;
    if (block) block(data);
    return data;
}
#pragma mark —— 关于动画
NS_INLINE __kindof CABasicAnimation *_Nonnull jobsMakeCABasicAnimationBy(NSString *_Nonnull data){
    return data.basicAnimation;
}

NS_INLINE __kindof CABasicAnimation *_Nonnull jobsMakeCABasicAnimation(jobsByCABasicAnimationBlock _Nonnull block){
    CABasicAnimation *data = CABasicAnimation.animation;
    if (block) block(data);
    return data;
}
#pragma mark —— 关于Layer
NS_INLINE __kindof CAEmitterLayer *_Nonnull jobsMakeCAEmitterLayer(jobsByCAEmitterLayerBlock _Nonnull block){
    CAEmitterLayer *layer = CAEmitterLayer.layer;
    if (block) block(layer);
    return layer;
}

NS_INLINE __kindof CAShapeLayer *_Nonnull jobsMakeCAShapeLayer(jobsByCAShapeLayerBlock _Nonnull block){
    CAShapeLayer *data = CAShapeLayer.layer;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof CALayer *_Nonnull jobsMakeCALayer(jobsByCALayerBlock _Nonnull block){
    CALayer *data = CALayer.layer;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof CAGradientLayer *_Nonnull jobsMakeCAGradientLayer(jobsByCAGradientLayerBlock _Nonnull block){
    CAGradientLayer *data = CAGradientLayer.layer;
    if (block) block(data);
    return data;
}
#pragma mark —— 关于动画
NS_INLINE __kindof CATransition *_Nonnull jobsMakeCATransition(jobsByCATransitionBlock _Nonnull block){
    CATransition *data = CATransition.animation;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof CAKeyframeAnimation *_Nonnull jobsMakeCAKeyframeAnimation(jobsByCAKeyframeAnimationBlock _Nonnull block){
    CAKeyframeAnimation *data = CAKeyframeAnimation.animation;
    if (block) block(data);
    return data;
}
#pragma mark —— 关于手势的创建
/// Tap Gesture (点击手势)
NS_INLINE __kindof UITapGestureRecognizer *_Nonnull jobsMakeTapGesture(jobsByTapGestureRecognizerBlock _Nullable block) {
    UITapGestureRecognizer *gesture = UITapGestureRecognizer.alloc.init;
    if (block) block(gesture);
    return gesture;
}
/// Long Press Gesture (长按手势)
NS_INLINE __kindof UILongPressGestureRecognizer *_Nonnull jobsMakeLongPressGesture(jobsByLongPressGestureRecognizerBlock _Nullable block) {
    UILongPressGestureRecognizer *gesture = UILongPressGestureRecognizer.alloc.init;
    if (block) block(gesture);
    return gesture;
}
/// Swipe Gesture (滑动手势)
NS_INLINE __kindof UISwipeGestureRecognizer *_Nonnull jobsMakeSwipeGesture(jobsBySwipeGestureRecognizerBlock _Nullable block) {
    UISwipeGestureRecognizer *gesture = UISwipeGestureRecognizer.alloc.init;
    if (block) block(gesture);
    return gesture;
}
/// Pan Gesture (拖动手势)
NS_INLINE __kindof UIPanGestureRecognizer *_Nonnull jobsMakePanGesture(jobsByPanGestureRecognizerBlock _Nullable block) {
    UIPanGestureRecognizer *gesture = UIPanGestureRecognizer.alloc.init;
    if (block) block(gesture);
    return gesture;
}
/// Pinch Gesture (捏合手势)
NS_INLINE __kindof UIPinchGestureRecognizer *_Nonnull jobsMakePinchGesture(jobsByPinchGestureRecognizerBlock _Nullable block) {
    UIPinchGestureRecognizer *gesture = UIPinchGestureRecognizer.alloc.init;
    if (block) block(gesture);
    return gesture;
}
/// Rotation Gesture (旋转手势)
NS_INLINE __kindof UIRotationGestureRecognizer *_Nonnull jobsMakeRotationGesture(jobsByRotationGestureRecognizerBlock _Nullable block) {
    UIRotationGestureRecognizer *gesture = UIRotationGestureRecognizer.alloc.init;
    if (block) block(gesture);
    return gesture;
}

NS_INLINE __kindof UIScreenEdgePanGestureRecognizer *_Nonnull jobsMakeScreenEdgePanGestureRecognizer(jobsByScreenEdgePanGestureRecognizerBlock _Nullable block) {
    UIScreenEdgePanGestureRecognizer *gesture = UIScreenEdgePanGestureRecognizer.alloc.init;
    if (block) block(gesture);
    return gesture;
}
#pragma mark —— 关于 UIButtonConfiguration 的创建
NS_INLINE __kindof UIButtonConfiguration *_Nonnull jobsMakePlainBtnConfig(jobsByButtonConfigurationBlock _Nullable block) {
    UIButtonConfiguration *config = UIButtonConfiguration.plainButtonConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull jobsMakeTintedBtnConfig(jobsByButtonConfigurationBlock _Nullable block) {
    UIButtonConfiguration *config = UIButtonConfiguration.tintedButtonConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull jobsMakeGrayBtnConfig(jobsByButtonConfigurationBlock _Nullable block) {
    UIButtonConfiguration *config = UIButtonConfiguration.grayButtonConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull jobsMakeFilledBtnConfig(jobsByButtonConfigurationBlock _Nullable block) {
    UIButtonConfiguration *config = UIButtonConfiguration.filledButtonConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull jobsMakeBorderlessBtnConfig(jobsByButtonConfigurationBlock _Nullable block) {
    UIButtonConfiguration *config = UIButtonConfiguration.borderlessButtonConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull jobsMakeBorderedBtnConfig(jobsByButtonConfigurationBlock _Nullable block) {
    UIButtonConfiguration *config = UIButtonConfiguration.borderedButtonConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull jobsMakeBorderedTintedBtnConfig(jobsByButtonConfigurationBlock _Nullable block) {
    UIButtonConfiguration *config = UIButtonConfiguration.borderedTintedButtonConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull jobsMakeBorderedProminentBtnConfig(jobsByButtonConfigurationBlock _Nullable block) {
    UIButtonConfiguration *config = UIButtonConfiguration.borderedProminentButtonConfiguration;
    if (block) block(config);
    return config;
}
#pragma mark —— 关于 UIBackgroundConfiguration 的创建
NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull jobsMakeClearConfiguration(jobsByBackgroundConfigurationBlock _Nullable block) {
    UIBackgroundConfiguration *config = UIBackgroundConfiguration.clearConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull jobsMakeListCellConfiguration(jobsByBackgroundConfigurationBlock _Nullable block) API_AVAILABLE(ios(18.0), tvos(18.0), visionos(2.0)) API_UNAVAILABLE(watchos){
    UIBackgroundConfiguration *config = UIBackgroundConfiguration.listCellConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull jobsMakeListHeaderConfiguration(jobsByBackgroundConfigurationBlock _Nullable block) API_AVAILABLE(ios(18.0), tvos(18.0), visionos(2.0)) API_UNAVAILABLE(watchos){
    UIBackgroundConfiguration *config = UIBackgroundConfiguration.listHeaderConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull jobsMakeListFooterConfiguration(jobsByBackgroundConfigurationBlock _Nullable block) API_AVAILABLE(ios(18.0), tvos(18.0), visionos(2.0)) API_UNAVAILABLE(watchos){
    UIBackgroundConfiguration *config = UIBackgroundConfiguration.listFooterConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull jobsMakeListAccompaniedSidebarCellConfiguration(jobsByBackgroundConfigurationBlock _Nullable block) API_UNAVAILABLE(tvos, watchos){
    UIBackgroundConfiguration *config = UIBackgroundConfiguration.listAccompaniedSidebarCellConfiguration;
    if (block) block(config);
    return config;
}
#pragma mark —— 关于 UIView 的创建
NS_INLINE __kindof UIImageView *_Nonnull jobsMakeImageView(jobsByImageViewBlock _Nonnull block){
    UIImageView *data = UIImageView.alloc.init;
    data.userInteractionEnabled = YES;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UITextView *_Nonnull jobsMakeTextView(jobsByTextViewBlock _Nonnull block){
    UITextView *data = UITextView.alloc.init;
    data.linkTextAttributes = NSObject.linkTextAttributes;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UITextField *_Nonnull jobsMakeTextField(jobsByTextFieldBlock _Nonnull block){
    UITextField *data = UITextField.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UICollectionView *_Nonnull jobsMakeCollectionView(jobsByCollectionViewBlock _Nonnull block){
    UICollectionView *data = UICollectionView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIWindow *_Nonnull jobsMakeWindow(jobsByWindowBlock _Nonnull block){
    UIWindow *data = UIWindow.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIWindow *_Nonnull jobsMakeAppDelegateWindow(jobsByWindowBlock _Nonnull block){
    UIWindow *data = JobsAppTools.sharedManager.makeAppDelegateWindow;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIView *_Nonnull jobsMakeView(jobsByViewBlock _Nonnull block){
    UIView *data = UIView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UILabel *_Nonnull jobsMakeLabel(jobsByLabelBlock _Nonnull block){
    UILabel *data = UILabel.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof PDFView *_Nonnull jobsMakePDFView(jobsByPDFViewBlock _Nonnull block){
    PDFView *data = PDFView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIPageControl *_Nonnull jobsMakePageControl(jobsByPageControlBlock _Nonnull block){
    UIPageControl *data = UIPageControl.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIStackView *_Nonnull jobsMakeStackView(jobsByStackViewBlock _Nonnull block){
    UIStackView *data = UIStackView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof CAEmitterCell *_Nonnull jobsMakeCAEmitterCell(jobsByCAEmitterCellBlock _Nonnull block){
    CAEmitterCell *cell = CAEmitterCell.emitterCell;
    if (block) block(cell);
    return cell;
}

NS_INLINE __kindof WKWebView *_Nonnull jobsMakeWKWebView(jobsByWKWebViewBlock _Nonnull block){
    WKWebView *data = WKWebView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UISwitch *_Nonnull jobsMakeSwitch(jobsBySwitchBlock _Nonnull block){
    UISwitch *data = UISwitch.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIProgressView *_Nonnull jobsMakeProgressView(jobsByProgressViewBlock _Nonnull block){
    UIProgressView *data = UIProgressView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIScrollView *_Nonnull jobsMakeScrollView(jobsByScrollViewBlock _Nonnull block){
    UIScrollView *data = UIScrollView.alloc.init;
    if (block) block(data);
    return data;
}
#pragma mark —— 关于控制器的创建
NS_INLINE __kindof UIImagePickerController *_Nonnull jobsMakeImagePickerController(jobsByImagePickerControllerBlock _Nonnull block){
    UIImagePickerController *data = UIImagePickerController.alloc.init;
    if (block) block(data);
    return data;
}
#pragma mark —— 其他
NS_INLINE __kindof WKUserContentController *_Nonnull jobsMakeUserContentController(jobsByUserContentControllerBlock _Nonnull block){
    WKUserContentController *data = WKUserContentController.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof WKWebViewConfiguration *_Nonnull jobsMakeWebViewConfiguration(jobsByWKWebViewConfigurationBlock _Nonnull block){
    WKWebViewConfiguration *data = WKWebViewConfiguration.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof PHFetchOptions *_Nonnull jobsMakePHFetchOptions(jobsByPHFetchOptionsBlock _Nonnull block){
    PHFetchOptions *data = PHFetchOptions.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof PHVideoRequestOptions *_Nonnull jobsMakePHVideoRequestOptions(jobsByPHVideoRequestOptionsBlock _Nonnull block){
    PHVideoRequestOptions *data = PHVideoRequestOptions.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof PHImageManager *_Nonnull jobsMakePHImageManager(jobsByPHImageManagerBlock _Nonnull block){
    PHImageManager *data = PHImageManager.defaultManager;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof PHImageRequestOptions *_Nonnull jobsMakePHImageRequestOptions(jobsByPHImageRequestOptionsBlock _Nonnull block){
    PHImageRequestOptions *data = PHImageRequestOptions.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSRunLoop *_Nonnull jobsMakeMainRunLoop(jobsByRunLoopBlock _Nonnull block) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0)){
    NSRunLoop *data = NSRunLoop.mainRunLoop;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSRunLoop *_Nonnull jobsMakeCurrentRunLoop(jobsByRunLoopBlock _Nonnull block) NS_SWIFT_UNAVAILABLE_FROM_ASYNC("currentRunLoop cannot be used from async contexts."){
    NSRunLoop *data = NSRunLoop.currentRunLoop;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NEVPNManager *_Nonnull jobsMakeVPNManager(jobsByNEVPNManagerBlock _Nonnull block){
    NEVPNManager *data = NEVPNManager.sharedManager;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NEVPNProtocolIKEv2 *_Nonnull jobsMakeNEVPNProtocolIKEv2(jobsByNEVPNProtocolIKEv2Block _Nonnull block){
    NEVPNProtocolIKEv2 *data = NEVPNProtocolIKEv2.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSShadow *_Nonnull jobsMakeShadow(jobsByShadowBlock _Nonnull block){
    NSShadow *data = NSShadow.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIMenuController *_Nonnull jobsMakeMenuController(jobsByMenuControllerBlock _Nonnull block){
    UIMenuController *data = UIMenuController.sharedMenuController;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UITabBarItem *_Nonnull jobsMakeTabBarItem(jobsByTabBarItemBlock _Nonnull block){
    UITabBarItem *data = UITabBarItem.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UINavigationItem *_Nonnull jobsMakeNavigationItem(jobsByNavigationItemBlock _Nonnull block){
    UINavigationItem *data = UINavigationItem.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSMutableData *_Nonnull jobsMakeMutData(jobsByMutableDataBlock _Nonnull block){
    NSMutableData *data = NSMutableData.data;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSSet *_Nonnull jobsMakeMutSet(jobsByMutableSetBlock _Nonnull block){
    NSMutableSet *data = NSMutableSet.set;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSArray *_Nonnull jobsMakeMutArr(jobsByMutArrayBlock _Nonnull block){
    NSMutableArray *data = NSMutableArray.array;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSMutableDictionary *_Nonnull jobsMakeMutDic(jobsByMutableDictionarycBlock _Nonnull block){
    NSMutableDictionary *data = NSMutableDictionary.dictionary;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSMutableString *_Nonnull jobsMakeMutString(jobsByMutableStringBlock _Nonnull block){
    NSMutableString *data = NSMutableString.string;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIPasteboard *_Nonnull jobsMakePasteboard(jobsByPasteboardBlock _Nonnull block){
    UIPasteboard *data = UIPasteboard.generalPasteboard;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UNUserNotificationCenter *_Nonnull jobsMakeUNUserNotificationCenter(jobsByUNUserNotificationCenterBlock _Nonnull block){
    UNUserNotificationCenter *data = UNUserNotificationCenter.currentNotificationCenter;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UNMutableNotificationContent *_Nonnull jobsMakeUNMutableNotificationContent(jobsByUNMutableNotificationContentBlock _Nonnull block){
    UNMutableNotificationContent *data = UNMutableNotificationContent.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JSContext *_Nonnull jobsMakeJSContext(jobsByJSContextBlock _Nonnull block){
    JSContext *data = JSContext.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSLock *_Nonnull jobsMakeLock(jobsByLockBlock _Nullable block){
    NSLock *data = NSLock.alloc.init;
    if (block) block(data);
    return data;
}
#pragma clang diagnostic pop

#endif /* JobsMakes_h */
