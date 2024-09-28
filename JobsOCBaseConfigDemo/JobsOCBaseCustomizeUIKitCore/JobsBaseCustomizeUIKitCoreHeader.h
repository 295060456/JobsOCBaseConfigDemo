//
//  JobsBaseCustomizeUIKitCoreHeader.h
//  JobsBaseCustomizeUIKit
//
//  Created by Jobs on 2021/4/19.
//

#ifndef JobsBaseCustomizeUIKitCoreHeader_h
#define JobsBaseCustomizeUIKitCoreHeader_h

#pragma mark —— BaseProtocol
#import "JobsBaseProtocolHeader.h"
#pragma mark —— Debug
#import "JobsDebug.h"
#pragma mark —— CALayer
#import "JobsCALayer.h"
#pragma mark —— NSCache
#import "JobsCache.h"
#pragma mark —— NSMutableDictionary
#import "JobsMutableDictionary.h"
#pragma mark —— NSDictionary
#import "JobsDictionary.h"
#pragma mark —— NSArray
#import "JobsArray.h"
#import "NSMutableArray+Extra.h"
#pragma mark —— NSMutableSet
#import "NSMutableSet+Extra.h"
#pragma mark —— NSBundle
#import "JobsBundle.h"
#pragma mark —— NSLocale
#import "JobsLocale.h"
#pragma mark —— NSObject
#import "JobsObject.h"
#pragma mark —— NSNumber
#import "JobsNumber.h"
#pragma mark —— NSString
#import "JobsString.h"
#pragma mark —— NSUserDefaults
#import "JobsUserDefaults.h"
#pragma mark —— NSURL
#import "JobsURL.h"
#pragma mark —— NSNotificationCenter
#import "NSNotificationCenter.h"
#pragma mark —— NSAttributedString
#import "JobsAttributedString.h"
#pragma mark —— NSData
#import "JobsData.h"
#pragma mark —— NSDate
#import "NSDate+Extra.h"
#pragma mark —— UIColor
#import "JobsColor.h"
#pragma mark —— UIDevice
#import "JobsDevice.h"
#pragma mark —— UIFont
#import "JobsFont.h"
#pragma mark —— UIImage
#import "JobsImage.h"
#pragma mark —— UIControl
#import "JobsControl.h"
#pragma mark —— UIScrollView
#import "JobsScrollView.h"
#pragma mark —— UITableView
#import "JobsTableView.h"
#pragma mark —— UITableViewCell
#import "JobsTableViewCell.h"
#pragma mark —— UITableViewHeaderFooterView
#import "JobsTableViewHeaderFooterView.h"
#pragma mark —— UICollectionReusableView
#import "JobsCollectionReusableView.h"
#pragma mark —— UICollectionView
#import "JobsCollectionView.h"
#pragma mark —— UICollectionViewCell
#import "JobsCollectionViewCell.h"
#pragma mark —— 实现类似于UItableView.tableHeaderView的头部视图
#import "UICollectionHeaderFooterView.h"
#pragma mark —— UICollectionViewFlowLayout
#import "JobsCollectionViewFlowLayout.h"
#pragma mark —— UIBezierPath
#import "JobsBezierPath.h"
#pragma mark —— UIProgressView
#import "JobsProgressView.h"
#pragma mark —— UITextField
#import "JobsTextFieldExtra.h"
#pragma mark —— UITextView
#import "JobsTextViews.h"
#pragma mark —— UIView
#import "JobsView.h"
#pragma mark —— UIImageView
#import "JobsImageView.h"
#pragma mark —— UILabel
#import "JobsLabel.h"
#pragma mark —— UIButton
#import "JobsButton.h"
#pragma mark —— UISwitch
#import "JobsSwitch.h"
#pragma mark —— JobsSlider
#import "JobsSlider.h"
#pragma mark —— UIViewController
#import "JobsViewController.h"
#pragma mark —— UINavigationController
#import "JobsNavigationController.h"
#pragma mark —— UINavigationBar
#import "JobsNavigationBar.h"
#pragma mark —— UIWindow
#import "UIWindow+Extra.h"
#pragma mark —— AVURLAsset
#import "AVURLAsset+Extra.h"
#pragma mark —— NSRunLoop
#import "NSRunLoop+Extra.h"
#pragma mark —— UIBarButtonItem
#import "JobsBarButtonItem.h"
#pragma mark —— NSFormatter
#import "JobsFormatter.h"
#pragma mark —— NSURLRequest
#import "NSURLRequest+Extra.h"
#pragma mark —— NSValue
#import "JobsValue.h"

static inline __kindof UIImageView *_Nonnull jobsMakeImageView(jobsByImageViewBlock _Nonnull block){
    UIImageView *data = UIImageView.alloc.init;
    if (block) block(data);
    return data;
}

static inline __kindof UITextView *_Nonnull jobsMakeTextView(jobsByTextViewBlock _Nonnull block){
    UITextView *data = UITextView.alloc.init;
    if (block) block(data);
    return data;
}

static inline __kindof UITextField *_Nonnull jobsMakeTextField(jobsByTextFieldBlock _Nonnull block){
    UITextField *data = UITextField.alloc.init;
    if (block) block(data);
    return data;
}

static inline __kindof UICollectionView *_Nonnull jobsMakeCollectionView(jobsByCollectionViewBlock _Nonnull block){
    UICollectionView *data = UICollectionView.alloc.init;
    if (block) block(data);
    return data;
}

static inline __kindof UIWindow *_Nonnull jobsMakeWindow(jobsByWindowBlock _Nonnull block){
    UIWindow *data = UIWindow.alloc.init;
    if (block) block(data);
    return data;
}

static inline __kindof UIView *_Nonnull jobsMakeView(jobsByViewBlock _Nonnull block){
    UIView *data = UIView.alloc.init;
    if (block) block(data);
    return data;
}

static inline __kindof UILabel *_Nonnull jobsMakeLabel(jobsByLabelBlock _Nonnull block){
    UILabel *data = UILabel.alloc.init;
    if (block) block(data);
    return data;
}

static inline __kindof UIScrollView *_Nonnull jobsMakeScrollView(jobsByScrollViewBlock _Nonnull block){
    UIScrollView *data = UIScrollView.alloc.init;
    if (block) block(data);
    return data;
}

static inline __kindof UIButton *_Nonnull jobsMakeButton(jobsByBtnBlock _Nonnull block){
    UIButton *data = UIButton.alloc.init;
    if (block) block(data);
    return data;
}

static inline __kindof UITableView *_Nonnull jobsMakeTableViewByGrouped(jobsByTableViewBlock _Nonnull block){
    UITableView *data = UITableView.initWithStyleGrouped;
    if (block) block(data);
    return data;
}

static inline __kindof UITableView *_Nonnull jobsMakeTableViewByPlain(jobsByTableViewBlock _Nonnull block){
    UITableView *data = UITableView.initWithStylePlain;
    if (block) block(data);
    return data;
}

static inline __kindof UITableView *_Nonnull jobsMakeTableViewByInsetGrouped(jobsByTableViewBlock _Nonnull block){
    UITableView *data = UITableView.initWithStyleInsetGrouped;
    if (block) block(data);
    return data;
}

#endif /* JobsBaseCustomizeUIKitCoreHeader_h */
