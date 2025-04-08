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
#pragma mark —— 关于UIColor的创建
@class JobsCorModel;
NS_INLINE __kindof UIColor *_Nonnull jobsMakeCor(jobsByCorModelBlock _Nonnull block){
    JobsCorModel *data = JobsCorModel.alloc.init;
    if (block) block(data);
    return [UIColor colorWithRed:data.red
                           green:data.green
                            blue:data.blue
                           alpha:data.alpha];
}

NS_INLINE __kindof UIColor *_Nonnull jobsMakeCor2(jobsByCorModelBlock _Nonnull block){
    JobsCorModel *data = JobsCorModel.alloc.init;
    if (block) block(data);
    return [UIColor colorWithHue:data.hue
                      saturation:data.saturation
                      brightness:data.brightness
                           alpha:data.alpha];
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

NS_INLINE __kindof CAGradientLayer *_Nonnull jobsMakeCAGradientLayer(jobsByCAGradientLayerBlock _Nonnull block){
    CAGradientLayer *data = CAGradientLayer.layer;
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
#pragma mark —— 关于UIView的创建
NS_INLINE __kindof UIImageView *_Nonnull jobsMakeImageView(jobsByImageViewBlock _Nonnull block){
    UIImageView *data = UIImageView.alloc.init;
    data.userInteractionEnabled = YES;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UITextView *_Nonnull jobsMakeTextView(jobsByTextViewBlock _Nonnull block){
    UITextView *data = UITextView.alloc.init;
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

NS_INLINE __kindof NSLock *_Nonnull jobsMakeLock(jobsByLockBlock _Nullable block){
    NSLock *data = NSLock.alloc.init;
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

NS_INLINE __kindof UIPageControl *_Nonnull jobsMakePageControl(jobsByPageControlBlock _Nonnull block){
    UIPageControl *data = UIPageControl.alloc.init;
    if (block) block(data);
    return data;
}

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

NS_INLINE __kindof UIStackView *_Nonnull jobsMakeStackView(jobsByStackViewBlock _Nonnull block){
    UIStackView *data = UIStackView.alloc.init;
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

NS_INLINE __kindof CAEmitterCell *_Nonnull jobsMakeCAEmitterCell(jobsByCAEmitterCellBlock _Nonnull block){
    CAEmitterCell *cell = CAEmitterCell.emitterCell;
    if (block) block(cell);
    return cell;
}

NS_INLINE __kindof CAEmitterLayer *_Nonnull jobsMakeCAEmitterLayer(jobsByCAEmitterLayerBlock _Nonnull block){
    CAEmitterLayer *layer = CAEmitterLayer.layer;
    if (block) block(layer);
    return layer;
}

NS_INLINE __kindof UIMenuController *_Nonnull jobsMakeMenuController(jobsByMenuControllerBlock _Nonnull block){
    UIMenuController *data = UIMenuController.sharedMenuController;
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

NS_INLINE __kindof WKWebView *_Nonnull jobsMakeWKWebView(jobsByWKWebViewBlock _Nonnull block){
    WKWebView *data = WKWebView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JSContext *_Nonnull jobsMakeJSContext(jobsByJSContextBlock _Nonnull block){
    JSContext *data = JSContext.alloc.init;
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
#pragma mark —— 关于结构体的创建
@class JobsLocationModel;
#pragma mark —— NSIndexPath
NS_INLINE NSIndexPath *_Nonnull jobsMakeIndexPathByLocationModelBlock(jobsByLocationModelBlock _Nonnull block){
    JobsLocationModel *data = JobsLocationModel.alloc.init;
    if (block) block(data);
    return [NSIndexPath indexPathForRow:data.row inSection:data.section];
}
#pragma mark —— UIEdgeInsets
NS_INLINE UIEdgeInsets jobsMakeEdgeInsetsByLocationModelBlock(jobsByLocationModelBlock _Nonnull block){
    JobsLocationModel *data = JobsLocationModel.alloc.init;
    if (block) block(data);
    return UIEdgeInsetsMake(data.jobsTop,
                            data.jobsLeft,
                            data.jobsBottom,
                            data.jobsRight);
}
/// 构建一个四边距离相等的 UIEdgeInsets
NS_INLINE UIEdgeInsets jobsSameEdgeInset(CGFloat insets){
    return jobsMakeEdgeInsetsByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
        data.jobsTop = insets;
        data.jobsLeft = insets;
        data.jobsBottom = insets;
        data.jobsRight = insets;
    });
}
#pragma mark —— NSDirectionalEdgeInsets
NS_INLINE NSDirectionalEdgeInsets jobsMakeDirectionalEdgeInsetsByLocationModelBlock(jobsByLocationModelBlock _Nonnull block){
    JobsLocationModel *data = JobsLocationModel.alloc.init;
    if (block) block(data);
    return NSDirectionalEdgeInsetsMake(data.jobsTop,
                                       data.jobsLeft,
                                       data.jobsBottom,
                                       data.jobsRight);
}
/// 构建一个内边距相等的 NSDirectionalEdgeInsets
NS_INLINE NSDirectionalEdgeInsets jobsSameDirectionalEdgeInsets(CGFloat x){
    return jobsMakeDirectionalEdgeInsetsByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
        data.jobsTop = x;
        data.jobsLeft = x;
        data.jobsBottom = x;
        data.jobsRight = x;
    });
}
#pragma mark —— CGRect
NS_INLINE CGRect jobsMakeCGRectByLocationModelBlock(jobsByLocationModelBlock _Nonnull block){
    JobsLocationModel *data = JobsLocationModel.alloc.init;
    if (block) block(data);
    return CGRectMake(data.jobsX,
                      data.jobsY,
                      data.jobsWidth,
                      data.jobsHeight);
}

NS_INLINE CGRect jobsMakeFrameByLocationModelBlock(jobsByLocationModelBlock _Nonnull block){
    return jobsMakeCGRectByLocationModelBlock(block);
}
#pragma mark —— CGPoint
NS_INLINE CGPoint jobsMakeCGPointByLocationModelBlock(jobsByLocationModelBlock _Nonnull block){
    JobsLocationModel *data = JobsLocationModel.alloc.init;
    if (block) block(data);
    return CGPointMake(data.jobsX, data.jobsY);
}
#pragma mark —— CGSize
NS_INLINE CGSize jobsMakeCGSizeByLocationModelBlock(jobsByLocationModelBlock _Nonnull block){
    JobsLocationModel *data = JobsLocationModel.alloc.init;
    if (block) block(data);
    return CGSizeMake(data.jobsWidth, data.jobsHeight);
}
#pragma mark —— NSRange
NS_INLINE NSRange jobsMakeRangeByLocationModelBlock(jobsByLocationModelBlock _Nonnull block){
    JobsLocationModel *data = JobsLocationModel.alloc.init;
    if (block) block(data);
    return NSMakeRange(data.location, data.length);
}

#pragma clang diagnostic pop

#endif /* JobsMakes_h */
