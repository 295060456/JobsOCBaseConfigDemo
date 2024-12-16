//
//  MacroDef_AppDeviceScreenSize.h
//  DouDong-II
//
//  Created by Jobs on 2021/3/20.
//

#ifndef MacroDef_AppDeviceScreenSize_h
#define MacroDef_AppDeviceScreenSize_h
/// 定义屏幕模式
#ifndef CurrentModeSize
#define CurrentModeSize UIScreen.mainScreen.currentMode.size
#endif /* CurrentModeSize */
#ifndef CurrentModeRespondSelector
#define CurrentModeRespondSelector (UIScreen.mainScreen.currentMode != nil)
#endif /* CurrentModeRespondSelector */
#pragma mark —— 判断iPhone
/// 判断 【iPhone 6】、【iPhone 6s】、【iPhone 7】、【iPhone 8】
#ifndef iPh6_6s_7_8
#define iPh6_6s_7_8 (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(750, 1334), CurrentModeSize) && !isPad : NO)
#endif /* iPh6_6s_7_8 */
/// 判断 【iPhone 6Plus】、【iPhone 6sPlus】、【iPhone 7Plus】、【iPhone 8Plus】
#ifndef iPh6_6s_7_8PlusSeries
#define iPh6_6s_7_8PlusSeries (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1242, 2208), CurrentModeSize) && !isPad : NO)
#endif /* iPh6_6s_7_8PlusSeries */
/// 判断 【iPhone X】
#ifndef iPhX
#define iPhX (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1125, 2436), CurrentModeSize) && !isPad : NO)
#endif /* iPhX */
/// 判断 【iPhone XR】
#ifndef iPhXR
#define iPhXR (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(828, 1792), CurrentModeSize) && !isPad : NO)
#endif /* iPhXR */
/// 判断 【iPhone XS】
#ifndef iPhXS
#define iPhXS (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1125, 2436), CurrentModeSize) && !isPad : NO)
#endif /* iPhXS */
/// 判断 【iPhone XS Max】
#ifndef iPhXS_Max
#define iPhXS_Max (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1242, 2688), CurrentModeSize) && !isPad : NO)
#endif /* iPhXS_Max */
/// 判断 【iPhone SE (第一代)】
#ifndef iPhSE_1
#define iPhSE_1 (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(640, 1136), CurrentModeSize) && !isPad : NO)
#endif /* iPhSE_1 */
/// 判断 【iPhone SE (第二代)】
#ifndef iPhSE_2
#define iPhSE_2 (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(750, 1334), CurrentModeSize) && !isPad : NO)
#endif /* iPhSE_2 */
/// 判断 【iPhone 11】
#ifndef iPh11
#define iPh11 (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(828, 1792), CurrentModeSize) && !isPad : NO)
#endif /* iPh11 */
/// 判断 【iPhone 11 Pro】
#ifndef iPh11Pro
#define iPh11Pro (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1125, 2436), CurrentModeSize) && !isPad : NO)
#endif /* iPh11Pro */
/// 判断 【iPhone 11 Pro Max】
#ifndef iPh11ProMax
#define iPh11ProMax (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1242, 2688), CurrentModeSize) && !isPad : NO)
#endif /* iPh11ProMax */
/// 判断 【iPhone 12 Mini】
#ifndef iPh12Mini
#define iPh12Mini (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1080, 2340), CurrentModeSize) && !isPad : NO)
#endif /* iPh12Mini */
/// 判断 【iPhone 12】
#ifndef iPh12
#define iPh12 (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1170, 2532), CurrentModeSize) && !isPad : NO)
#endif /* iPh12 */
/// 判断 【iPhone 12 Pro】
#ifndef iPh12Pro
#define iPh12Pro (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1170, 2532), CurrentModeSize) && !isPad : NO)
#endif /* iPh12Pro */
/// 判断 【iPhone 12 Pro Max】
#ifndef iPh12ProMax
#define iPh12ProMax (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1284, 2778), CurrentModeSize) && !isPad : NO)
#endif /* iPh12ProMax */
/// 判断 【iPhone 13 Mini】
#ifndef iPh13Mini
#define iPh13Mini (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1080, 2340), CurrentModeSize) && !isPad : NO)
#endif /* iPh13Mini */
/// 判断 【iPhone 13】
#ifndef iPh13
#define iPh13 (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1170, 2532), CurrentModeSize) && !isPad : NO)
#endif /* iPh13 */
/// 判断 【iPhone 13 Pro】
#ifndef iPh13Pro
#define iPh13Pro (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1170, 2532), CurrentModeSize) && !isPad : NO)
#endif /* iPh13Pro */
/// 判断 【iPhone 13 Pro Max】
#ifndef iPh13ProMax
#define iPh13ProMax (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1284, 2778), CurrentModeSize) && !isPad : NO)
#endif /* iPh13ProMax */
/// 判断 【iPhone 14】
#ifndef iPh14
#define iPh14 (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1170, 2532), CurrentModeSize) && !isPad : NO)
#endif /* iPh14 */
/// 判断 【iPhone 14 Plus】
#ifndef iPh14Plus
#define iPh14Plus (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1284, 2778), CurrentModeSize) && !isPad : NO)
#endif /* iPh14Plus */
/// 判断 【iPhone 14 Pro】
#ifndef iPh14Pro
#define iPh14Pro (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1179, 2556), CurrentModeSize) && !isPad : NO)
#endif /* iPh14Pro */
/// 判断 【iPhone 14 Pro Max】
#ifndef iPh14ProMax
#define iPh14ProMax (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1290, 2796), CurrentModeSize) && !isPad : NO)
#endif /* iPh14ProMax */
/// 判断 【iPhone 15】
#ifndef iPh15
#define iPh15 (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1179, 2556), CurrentModeSize) && !isPad : NO)
#endif /* iPh15 */
/// 判断 【iPhone 15 Plus】
#ifndef iPh15Plus
#define iPh15Plus (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1290, 2796), CurrentModeSize) && !isPad : NO)
#endif /* iPh15Plus */
/// 判断 【iPhone 15 Pro】
#ifndef iPh15Pro
#define iPh15Pro (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1179, 2556), CurrentModeSize) && !isPad : NO)
#endif /* iPh15Pro */
/// 判断 【iPhone 15 Pro Max】
#ifndef iPh15ProMax
#define iPh15ProMax (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1290, 2796), CurrentModeSize) && !isPad : NO)
#endif /* iPh15ProMax */
/// 判断 【iPhone 16】
#ifndef iPh16
#define iPh16 (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1300, 2800), CurrentModeSize) && !isPad : NO)
#endif /* iPh16 */
/// 判断 【iPhone 16 Plus】
#ifndef iPh16Plus
#define iPh16Plus (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1340, 2900), CurrentModeSize) && !isPad : NO)
#endif /* iPh16Plus */
/// 判断 【iPhone 16 Pro】
#ifndef iPh16Pro
#define iPh16Pro (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1284, 2778), CurrentModeSize) && !isPad : NO)
#endif /* iPh16Pro */
/// 判断 【iPhone 16 Pro Max】
#ifndef iPh16ProMax
#define iPh16ProMax (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(1350, 3000), CurrentModeSize) && !isPad : NO)
#endif /* iPh16ProMax */

#pragma mark —— 判断iPad
/// 判断 【iPad mini 7.9】、【iPad 9.7】
#ifndef iPadMini7_9Or9_7
#define iPadMini7_9Or9_7 (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(2048, 1536), CurrentModeSize) && !isiPhone : NO)
#endif /* iPadMini7_9Or9_7 */
/// 判断 【iPad Pro 10.2】
#ifndef iPadPro10_2
#define iPadPro10_2 (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(2160, 1620), CurrentModeSize) && !isiPhone : NO)
#endif /* iPadPro10_2 */
/// 判断 【iPad Pro 10.5】
#ifndef iPadPro10_5
#define iPadPro10_5 (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(2224, 1668), CurrentModeSize) && !isiPhone : NO)
#endif /* iPadPro10_5 */
/// 判断 【iPad Pro 11】
#ifndef iPadPro11
#define iPadPro11 (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(2388, 1668), CurrentModeSize) && !isiPhone : NO)
#endif /* iPadPro11 */
/// 判断 【iPad Pro 12.9】
#ifndef iPadPro12_9
#define iPadPro12_9 (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(2732, 2048), CurrentModeSize) && !isiPhone : NO)
#endif /* iPadPro12_9 */
/// 判断 【iPad mini 6】
#ifndef iPadMini6
#define iPadMini6 (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(2266, 1488), CurrentModeSize) && !isiPhone : NO)
#endif /* iPadMini6 */
/// 判断 【iPad Air 4】
#ifndef iPadAir4
#define iPadAir4 (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(2360, 1640), CurrentModeSize) && !isiPhone : NO)
#endif /* iPadAir4 */
/// 判断 【iPad Air 5】
#ifndef iPadAir5
#define iPadAir5 (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(2360, 1640), CurrentModeSize) && !isiPhone : NO)
#endif /* iPadAir5 */
/// 判断 【iPad 10 (10.2 英寸)】
#ifndef iPad10
#define iPad10 (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(2160, 1620), CurrentModeSize) && !isiPhone : NO)
#endif /* iPad10 */
/// 判断 【iPad Pro 12.9 5代】
#ifndef iPadPro12_9_5th
#define iPadPro12_9_5th (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(2732, 2048), CurrentModeSize) && !isiPhone : NO)
#endif /* iPadPro12_9_5th */
/// 判断 【iPad Pro 11 3代】
#ifndef iPadPro11_3rd
#define iPadPro11_3rd (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(2388, 1668), CurrentModeSize) && !isiPhone : NO)
#endif /* iPadPro11_3rd */
/// 判断 【iPad Pro 12.9 6代】
#ifndef iPadPro12_9_6th
#define iPadPro12_9_6th (CurrentModeRespondSelector ? CGSizeEqualToSize(CGSizeMake(2732, 2048), CurrentModeSize) && !isiPhone : NO)
#endif /* iPadPro12_9_6th */

#endif /* MacroDef_AppDeviceScreenSize_h */
