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
NS_INLINE __kindof NSDateComponents *_Nonnull
jobsMakeDateComponents(jobsByDateComponentsBlock _Nonnull block){
    NSDateComponents *data = NSDateComponents.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSDateFormatter *_Nonnull
jobsMakeDateFormatter(jobsByDateFormatterBlock _Nonnull block){
    NSDateFormatter *data = NSDateFormatter.alloc.init;
    if (block) block(data);
    return data;
}
#pragma mark —— 关于贝塞尔曲线的创建
NS_INLINE __kindof UIBezierPath *_Nonnull
jobsMakeBezierPath(jobsByBezierPathBlock _Nonnull block){
    UIBezierPath *data = UIBezierPath.bezierPath;
    if (block) block(data);
    return data;
}
#pragma mark —— 关于动画
NS_INLINE __kindof CABasicAnimation *_Nonnull
jobsMakeCABasicAnimationBy(NSString *_Nonnull data){
    return data.basicAnimation;
}

NS_INLINE __kindof CABasicAnimation *_Nonnull
jobsMakeCABasicAnimation(jobsByCABasicAnimationBlock _Nonnull block){
    CABasicAnimation *data = CABasicAnimation.animation;
    if (block) block(data);
    return data;
}
#pragma mark —— 关于Layer
NS_INLINE __kindof CAEmitterLayer *_Nonnull
jobsMakeCAEmitterLayer(jobsByCAEmitterLayerBlock _Nonnull block){
    CAEmitterLayer *layer = CAEmitterLayer.layer;
    if (block) block(layer);
    return layer;
}

NS_INLINE __kindof CAShapeLayer *_Nonnull
jobsMakeCAShapeLayer(jobsByCAShapeLayerBlock _Nonnull block){
    CAShapeLayer *data = CAShapeLayer.layer;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof CALayer *_Nonnull
jobsMakeCALayer(jobsByCALayerBlock _Nonnull block){
    CALayer *data = CALayer.layer;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof CAGradientLayer *_Nonnull
jobsMakeCAGradientLayer(jobsByCAGradientLayerBlock _Nonnull block){
    CAGradientLayer *data = CAGradientLayer.layer;
    if (block) block(data);
    return data;
}
#pragma mark —— 关于动画
NS_INLINE __kindof CATransition *_Nonnull
jobsMakeCATransition(jobsByCATransitionBlock _Nonnull block){
    CATransition *data = CATransition.animation;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof CAKeyframeAnimation *_Nonnull
jobsMakeCAKeyframeAnimation(jobsByCAKeyframeAnimationBlock _Nonnull block){
    CAKeyframeAnimation *data = CAKeyframeAnimation.animation;
    if (block) block(data);
    return data;
}
#pragma mark —— 关于手势的创建
/// Tap Gesture (点击手势)
NS_INLINE __kindof UITapGestureRecognizer *_Nonnull
jobsMakeTapGesture(jobsByTapGestureRecognizerBlock _Nullable block) {
    UITapGestureRecognizer *gesture = UITapGestureRecognizer.alloc.init;
    if (block) block(gesture);
    return gesture;
}
/// Long Press Gesture (长按手势)
NS_INLINE __kindof UILongPressGestureRecognizer *_Nonnull
jobsMakeLongPressGesture(jobsByLongPressGestureRecognizerBlock _Nullable block) {
    UILongPressGestureRecognizer *gesture = UILongPressGestureRecognizer.alloc.init;
    if (block) block(gesture);
    return gesture;
}
/// Swipe Gesture (滑动手势)
NS_INLINE __kindof UISwipeGestureRecognizer *_Nonnull
jobsMakeSwipeGesture(jobsBySwipeGestureRecognizerBlock _Nullable block) {
    UISwipeGestureRecognizer *gesture = UISwipeGestureRecognizer.alloc.init;
    if (block) block(gesture);
    return gesture;
}
/// Pan Gesture (拖动手势)
NS_INLINE __kindof UIPanGestureRecognizer *_Nonnull
jobsMakePanGesture(jobsByPanGestureRecognizerBlock _Nullable block) {
    UIPanGestureRecognizer *gesture = UIPanGestureRecognizer.alloc.init;
    if (block) block(gesture);
    return gesture;
}
/// Pinch Gesture (捏合手势)
NS_INLINE __kindof UIPinchGestureRecognizer *_Nonnull
jobsMakePinchGesture(jobsByPinchGestureRecognizerBlock _Nullable block) {
    UIPinchGestureRecognizer *gesture = UIPinchGestureRecognizer.alloc.init;
    if (block) block(gesture);
    return gesture;
}
/// Rotation Gesture (旋转手势)
NS_INLINE __kindof UIRotationGestureRecognizer *_Nonnull
jobsMakeRotationGesture(jobsByRotationGestureRecognizerBlock _Nullable block) {
    UIRotationGestureRecognizer *gesture = UIRotationGestureRecognizer.alloc.init;
    if (block) block(gesture);
    return gesture;
}

NS_INLINE __kindof UIScreenEdgePanGestureRecognizer *_Nonnull
jobsMakeScreenEdgePanGestureRecognizer(jobsByScreenEdgePanGestureRecognizerBlock _Nullable block) {
    UIScreenEdgePanGestureRecognizer *gesture = UIScreenEdgePanGestureRecognizer.alloc.init;
    if (block) block(gesture);
    return gesture;
}
#pragma mark —— 关于 UIButtonConfiguration 的创建
NS_INLINE __kindof UIButtonConfiguration *_Nonnull
jobsMakePlainBtnConfig(jobsByBtnConfigBlock _Nullable block)
API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos)
{
    UIButtonConfiguration *config = UIButtonConfiguration.plainButtonConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull
jobsMakeTintedBtnConfig(jobsByBtnConfigBlock _Nullable block)
API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos)
{
    UIButtonConfiguration *config = UIButtonConfiguration.tintedButtonConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull
jobsMakeGrayBtnConfig(jobsByBtnConfigBlock _Nullable block)
API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos)
{
    UIButtonConfiguration *config = UIButtonConfiguration.grayButtonConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull
jobsMakeFilledBtnConfig(jobsByBtnConfigBlock _Nullable block)
API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos)
{
    UIButtonConfiguration *config = UIButtonConfiguration.filledButtonConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull
jobsMakeBorderlessBtnConfig(jobsByBtnConfigBlock _Nullable block)
API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos)
{
    UIButtonConfiguration *config = UIButtonConfiguration.borderlessButtonConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull
jobsMakeBorderedBtnConfig(jobsByBtnConfigBlock _Nullable block)
API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos)
{
    UIButtonConfiguration *config = UIButtonConfiguration.borderedButtonConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull
jobsMakeBorderedTintedBtnConfig(jobsByBtnConfigBlock _Nullable block)
API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos)
{
    UIButtonConfiguration *config = UIButtonConfiguration.borderedTintedButtonConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull
jobsMakeBorderedProminentBtnConfig(jobsByBtnConfigBlock _Nullable block)
API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos)
{
    UIButtonConfiguration *config = UIButtonConfiguration.borderedProminentButtonConfiguration;
    if (block) block(config);
    return config;
}
#pragma mark —— 关于 UIBackgroundConfiguration 的创建
NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull
jobsMakeClearConfiguration(jobsByBackgroundConfigBlock _Nullable block)
API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos)
{
    UIBackgroundConfiguration *config = UIBackgroundConfiguration.clearConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull
jobsMakeListPlainCellConfiguration(jobsByBackgroundConfigBlock _Nullable block)
API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos)
{
    UIBackgroundConfiguration *config = UIBackgroundConfiguration.listPlainCellConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIBackgroundConfiguration * _Nonnull
jobsMakeListPlainHeaderFooterConfiguration(jobsByBackgroundConfigBlock _Nullable block)
API_DEPRECATED("Use +listHeaderConfiguration or +listFooterConfiguration", ios(14.0, 18.0)) API_UNAVAILABLE(watchos)
{
    // ✅ 用消息语法，别用点号访问类方法
    UIBackgroundConfiguration *config = UIBackgroundConfiguration.listPlainHeaderFooterConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull
jobsMakeListGroupedCellConfiguration(jobsByBackgroundConfigBlock _Nullable block)
API_DEPRECATED_WITH_REPLACEMENT("listCellConfiguration", ios(14.0, 18.0)) API_UNAVAILABLE(watchos)
{
    UIBackgroundConfiguration *config = UIBackgroundConfiguration.listGroupedCellConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull
jobsMakeListCellConfiguration(jobsByBackgroundConfigBlock _Nullable block)
API_AVAILABLE(ios(18.0), tvos(18.0), visionos(2.0)) API_UNAVAILABLE(watchos)
{
    UIBackgroundConfiguration *config = UIBackgroundConfiguration.listCellConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull
jobsMakeListHeaderConfiguration(jobsByBackgroundConfigBlock _Nullable block)
API_AVAILABLE(ios(18.0), tvos(18.0), visionos(2.0)) API_UNAVAILABLE(watchos)
{
    UIBackgroundConfiguration *config = UIBackgroundConfiguration.listHeaderConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull
jobsMakeListFooterConfiguration(jobsByBackgroundConfigBlock _Nullable block)
API_AVAILABLE(ios(18.0), tvos(18.0), visionos(2.0)) API_UNAVAILABLE(watchos)
{
    UIBackgroundConfiguration *config = UIBackgroundConfiguration.listFooterConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull
jobsMakeListGroupedHeaderFooterConfiguration(jobsByBackgroundConfigBlock _Nullable block)
API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos)
{
    UIBackgroundConfiguration *config = UIBackgroundConfiguration.listGroupedHeaderFooterConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull
jobsMakeListSidebarHeaderConfiguration(jobsByBackgroundConfigBlock _Nullable block)
API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos)
{
    UIBackgroundConfiguration *config = UIBackgroundConfiguration.listSidebarHeaderConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull
jobsMakeListSidebarCellConfiguration(jobsByBackgroundConfigBlock _Nullable block)
API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos)
{
    UIBackgroundConfiguration *config = UIBackgroundConfiguration.listSidebarCellConfiguration;
    if (block) block(config);
    return config;
}

NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull
jobsMakeListAccompaniedSidebarCellConfiguration(jobsByBackgroundConfigBlock _Nullable block)
API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos)
{
    UIBackgroundConfiguration *config = UIBackgroundConfiguration.listAccompaniedSidebarCellConfiguration;
    if (block) block(config);
    return config;
}
#pragma mark —— 关于 UIView 的创建
NS_INLINE __kindof UIImageView *_Nonnull
jobsMakeImageView(jobsByImageViewBlock _Nonnull block){
    UIImageView *data = UIImageView.alloc.init;
    data.userInteractionEnabled = YES;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UITextView *_Nonnull
jobsMakeTextView(jobsByTextViewBlock _Nonnull block){
    UITextView *data = UITextView.alloc.init;
    data.linkTextAttributes = NSObject.linkTextAttributes;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UITextField *_Nonnull
jobsMakeTextField(jobsByTextFieldBlock _Nonnull block){
    UITextField *data = UITextField.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UICollectionView *_Nonnull
jobsMakeCollectionView(jobsByCollectionViewBlock _Nonnull block){
    UICollectionView *data = UICollectionView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIWindow *_Nonnull
jobsMakeWindow(jobsByWindowBlock _Nonnull block){
    UIWindow *data = UIWindow.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIWindow *_Nonnull
jobsMakeAppDelegateWindow(jobsByWindowBlock _Nonnull block){
    UIWindow *data = JobsAppTools.sharedManager.makeAppDelegateWindow;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIView *_Nonnull
jobsMakeView(jobsByViewBlock _Nonnull block){
    UIView *data = UIView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UILabel *_Nonnull
jobsMakeLabel(jobsByLabelBlock _Nonnull block){
    UILabel *data = UILabel.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UINavigationBarAppearance *_Nonnull
jobsMakeNavigationBarAppearance(jobsByNavigationBarAppearanceBlock _Nonnull block){
    UINavigationBarAppearance *data = UINavigationBarAppearance.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UINavigationBar *_Nonnull
jobsMakeNavigationBar(jobsByNavigationBarBlock _Nonnull block){
    UINavigationBar *data = UINavigationBar.appearance;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIRefreshControl *_Nonnull
jobsMakeRefreshControl(jobsByRefreshCtrlBlock _Nonnull block){
    UIRefreshControl *data = UIRefreshControl.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof PDFView *_Nonnull
jobsMakePDFView(jobsByPDFViewBlock _Nonnull block){
    PDFView *data = PDFView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIPageControl *_Nonnull
jobsMakePageControl(jobsByPageControlBlock _Nonnull block){
    UIPageControl *data = UIPageControl.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIStackView *_Nonnull
jobsMakeStackView(jobsByStackViewBlock _Nonnull block){
    UIStackView *data = UIStackView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof CAEmitterCell *_Nonnull
jobsMakeCAEmitterCell(jobsByCAEmitterCellBlock _Nonnull block){
    CAEmitterCell *cell = CAEmitterCell.emitterCell;
    if (block) block(cell);
    return cell;
}

NS_INLINE __kindof WKWebView *_Nonnull
jobsMakeWKWebView(jobsByWKWebViewBlock _Nonnull block){
    WKWebView *data = WKWebView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UISwitch *_Nonnull
jobsMakeSwitch(jobsBySwitchBlock _Nonnull block){
    UISwitch *data = UISwitch.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIProgressView *_Nonnull
jobsMakeProgressView(jobsByProgressViewBlock _Nonnull block){
    UIProgressView *data = UIProgressView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIScrollView *_Nonnull
jobsMakeScrollView(jobsByScrollViewBlock _Nonnull block){
    UIScrollView *data = UIScrollView.alloc.init;
    if (block) block(data);
    return data;
}
#pragma mark —— 关于控制器的创建
NS_INLINE __kindof UIImagePickerController *_Nonnull
jobsMakeImagePickerController(jobsByImagePickerCtrlBlock _Nonnull block){
    UIImagePickerController *data = UIImagePickerController.alloc.init;
    if (block) block(data);
    return data;
}
#pragma mark —— 其他
NS_INLINE __kindof WKUserContentController *_Nonnull
jobsMakeUserContentController(jobsByUserContentControllerBlock _Nonnull block){
    WKUserContentController *data = WKUserContentController.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof WKWebViewConfiguration *_Nonnull
jobsMakeWebViewConfiguration(jobsByWKWebViewConfigBlock _Nonnull block){
    WKWebViewConfiguration *data = WKWebViewConfiguration.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof PHFetchOptions *_Nonnull
jobsMakePHFetchOptions(jobsByPHFetchOptionsBlock _Nonnull block){
    PHFetchOptions *data = PHFetchOptions.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof PHVideoRequestOptions *_Nonnull
jobsMakePHVideoRequestOptions(jobsByPHVideoRequestOptionsBlock _Nonnull block){
    PHVideoRequestOptions *data = PHVideoRequestOptions.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof PHImageManager *_Nonnull
jobsMakePHImageManager(jobsByPHImageManagerBlock _Nonnull block){
    PHImageManager *data = PHImageManager.defaultManager;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof PHImageRequestOptions *_Nonnull
jobsMakePHImageRequestOptions(jobsByPHImageRequestOptionsBlock _Nonnull block){
    PHImageRequestOptions *data = PHImageRequestOptions.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSRunLoop *_Nonnull
jobsMakeMainRunLoop(jobsByRunLoopBlock _Nonnull block) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0)){
    NSRunLoop *data = NSRunLoop.mainRunLoop;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSRunLoop *_Nonnull
jobsMakeCurrentRunLoop(jobsByRunLoopBlock _Nonnull block) NS_SWIFT_UNAVAILABLE_FROM_ASYNC("currentRunLoop cannot be used from async contexts."){
    NSRunLoop *data = NSRunLoop.currentRunLoop;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NEVPNManager *_Nonnull
jobsMakeVPNManager(jobsByNEVPNManagerBlock _Nonnull block){
    NEVPNManager *data = NEVPNManager.sharedManager;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NEVPNProtocolIKEv2 *_Nonnull
jobsMakeNEVPNProtocolIKEv2(jobsByNEVPNProtocolIKEv2Block _Nonnull block){
    NEVPNProtocolIKEv2 *data = NEVPNProtocolIKEv2.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSShadow *_Nonnull
jobsMakeShadow(jobsByShadowBlock _Nonnull block){
    NSShadow *data = NSShadow.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIMenuController *_Nonnull
jobsMakeMenuController(jobsByMenuCtrlBlock _Nonnull block){
    UIMenuController *data = UIMenuController.sharedMenuController;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UITabBarItem *_Nonnull
jobsMakeTabBarItem(jobsByTabBarItemBlock _Nonnull block){
    UITabBarItem *data = UITabBarItem.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UINavigationItem *_Nonnull
jobsMakeNavigationItem(jobsByNavigationItemBlock _Nonnull block){
    UINavigationItem *data = UINavigationItem.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSMutableData *_Nonnull
jobsMakeMutData(jobsByMutableDataBlock _Nonnull block){
    NSMutableData *data = NSMutableData.data;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSSet *_Nonnull
jobsMakeMutSet(jobsByMutableSetBlock _Nonnull block){
    NSMutableSet *data = NSMutableSet.set;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSArray *_Nonnull
jobsMakeMutArr(jobsByMutArrBlock _Nonnull block){
    NSMutableArray *data = NSMutableArray.array;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSMutableDictionary *_Nonnull
jobsMakeMutDic(jobsByMutableDictBlock _Nonnull block){
    NSMutableDictionary *data = NSMutableDictionary.dictionary;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSMutableString *_Nonnull
jobsMakeMutString(jobsByMutableStringBlock _Nonnull block){
    NSMutableString *data = NSMutableString.string;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIPasteboard *_Nonnull
jobsMakePasteboard(jobsByPasteboardBlock _Nonnull block){
    UIPasteboard *data = UIPasteboard.generalPasteboard;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UNUserNotificationCenter *_Nonnull
jobsMakeUNUserNotificationCenter(jobsByUNUserNotificationCenterBlock _Nonnull block){
    UNUserNotificationCenter *data = UNUserNotificationCenter.currentNotificationCenter;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UNMutableNotificationContent *_Nonnull
jobsMakeUNMutableNotificationContent(jobsByUNMutableNotificationContentBlock _Nonnull block){
    UNMutableNotificationContent *data = UNMutableNotificationContent.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JSContext *_Nonnull
jobsMakeJSContext(jobsByJSContextBlock _Nonnull block){
    JSContext *data = JSContext.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof NSLock *_Nonnull
jobsMakeLock(jobsByLockBlock _Nullable block){
    NSLock *data = NSLock.alloc.init;
    if (block) block(data);
    return data;
}
#pragma mark —— 关于 Texture 的创建
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import <AsyncDisplayKit/ASDisplayNode+Subclasses.h> // ⚠️ 必须引入子类化接口
#import <AVFoundation/AVFoundation.h> // ASVideoNode 需要
#import "TDDrawingNode.h"
NS_INLINE __kindof ASDisplayNode * _Nonnull
jobsMakeNode(Class _Nonnull nodeClass, jobsByDisplayNodeBlock _Nullable block) {
    NSCParameterAssert([nodeClass isSubclassOfClass:ASDisplayNode.class]);
    ASDisplayNode *node = [nodeClass new];
    if (block) block(node);
    return node;
}

NS_INLINE __kindof ASDisplayNode * _Nonnull
jobsMakeDisplayNode(jobsByDisplayNodeBlock _Nullable block) {
    ASDisplayNode *node = ASDisplayNode.alloc.init;
    if (block) block(node);
    return node;
}

NS_INLINE __kindof ASTextNode * _Nonnull
jobsMakeTextNode(jobsByTextNodeBlock _Nullable block) {
    ASTextNode *node = ASTextNode.alloc.init;
    if (block) block(node);
    return node;
}

NS_INLINE __kindof ASEditableTextNode * _Nonnull
jobsMakeEditableTextNode(jobsByEditableTextNodeBlock _Nullable block) {
    ASEditableTextNode *node = ASEditableTextNode.alloc.init;
    if (block) block(node);
    return node;
}

NS_INLINE __kindof ASImageNode * _Nonnull
jobsMakeImageNode(jobsByImageNodeBlock _Nullable block) {
    ASImageNode *node = ASImageNode.alloc.init;
    if (block) block(node);
    return node;
}

NS_INLINE __kindof ASNetworkImageNode * _Nonnull
jobsMakeNetworkImageNode(jobsByNetworkImageNodeBlock _Nullable block) {
    ASNetworkImageNode *node = ASNetworkImageNode.alloc.init;
    if (block) block(node);
    return node;
}

NS_INLINE __kindof ASMapNode * _Nonnull
jobsMakeMapNode(jobsByMapNodeBlock _Nullable block) {
    ASMapNode *node = ASMapNode.alloc.init;
    if (block) block(node);
    return node;
}

NS_INLINE __kindof ASVideoNode * _Nonnull
jobsMakeVideoNode(jobsByVideoNodeBlock _Nullable block) {
    ASVideoNode *node = ASVideoNode.alloc.init;
    if (block) block(node);
    return node;
}

NS_INLINE __kindof ASCollectionNode * _Nonnull
jobsMakeCollectionNode(jobsByCollectionNodeBlock _Nullable block) {
    // 默认用 FlowLayout；需要自定义可以在 block 里替换 layout
    ASCollectionNode *node = [ASCollectionNode.alloc initWithCollectionViewLayout:UICollectionViewFlowLayout.alloc.init];
    if (block) block(node);
    return node;
}

NS_INLINE __kindof ASTableNode * _Nonnull
jobsMakeTableNode(jobsByTableNodeBlock _Nullable block) {
    ASTableNode *node = ASTableNode.alloc.init;
    if (block) block(node);
    return node;
}

NS_INLINE __kindof ASScrollNode * _Nonnull
jobsMakeScrollNode(jobsByScrollNodeBlock _Nullable block) {
    ASScrollNode *node = ASScrollNode.alloc.init;
    if (block) block(node);
    return node;
}

NS_INLINE __kindof ASCellNode * _Nonnull
jobsMakeCellNode(jobsByCellNodeBlock _Nullable block) {
    ASCellNode *node = ASCellNode.alloc.init;
    if (block) block(node);
    return node;
}

NS_INLINE __kindof ASButtonNode * _Nonnull
jobsMakeButtonNode(jobsByButtonNodeBlock _Nullable block) {
    ASButtonNode *node = ASButtonNode.alloc.init;
    if (block) block(node);
    return node;
}

NS_INLINE __kindof TDDrawingNode * _Nonnull
jobsMakeDrawingNode(jobsByDrawingNodeBlock _Nullable block) {
    TDDrawingNode *node = TDDrawingNode.alloc.init;
    if (block) block(node);
    return node;
}

NS_INLINE __kindof ASStackLayoutSpec * _Nonnull
jobsMakeStackLayoutSpec(jobsByStackLayoutSpecBlock _Nullable block) {
    ASStackLayoutSpec *stackLayoutSpec = ASStackLayoutSpec.alloc.init;
    if (block) block(stackLayoutSpec);
    return stackLayoutSpec;
}

NS_INLINE __kindof ASStackLayoutSpec * _Nonnull
jobsMakeVerticalStackLayoutSpec(jobsByStackLayoutSpecBlock _Nullable block) {
    ASStackLayoutSpec *stackLayoutSpec = ASStackLayoutSpec.alloc.init;
    stackLayoutSpec.direction = ASStackLayoutDirectionVertical;
    if (block) block(stackLayoutSpec);
    return stackLayoutSpec;
}

NS_INLINE __kindof ASStackLayoutSpec * _Nonnull
jobsMakeHorizontalStackLayoutSpec(jobsByStackLayoutSpecBlock _Nullable block) {
    ASStackLayoutSpec *stackLayoutSpec = ASStackLayoutSpec.alloc.init;
    stackLayoutSpec.direction = ASStackLayoutDirectionHorizontal;
    if (block) block(stackLayoutSpec);
    return stackLayoutSpec;
}

#pragma clang diagnostic pop

#endif /* JobsMakes_h */
