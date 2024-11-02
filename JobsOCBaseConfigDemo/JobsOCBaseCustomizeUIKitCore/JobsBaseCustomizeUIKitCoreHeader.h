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
#pragma mark —— NSNotificationCenter
#import "NSNotificationCenter.h"
#pragma mark —— NSAttributedString
#import "JobsAttributedString.h"
#pragma mark —— NSValue
#import "JobsValue.h"
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
#pragma mark —— NSURL
#import "JobsURL.h"
#pragma mark —— NSURLRequest
#import "NSURLRequest+Extra.h"
#pragma mark —— NSURLSessionDataTask
#import "NSURLSessionDataTask+Extra.h"

#pragma mark —— 关于贝塞尔曲线的创建
NS_INLINE __kindof UIBezierPath *_Nonnull jobsMakeBezierPath(jobsByBezierPathBlock _Nonnull block){
    UIBezierPath *data = UIBezierPath.bezierPath;
    if (block) block(data);
    return data;
}
#pragma mark —— 关于Layer的创建
NS_INLINE __kindof CAShapeLayer *_Nonnull jobsMakeCAShapeLayer(jobsByCAShapeLayerBlock _Nonnull block){
    CAShapeLayer *data = CAShapeLayer.layer;
    if (block) block(data);
    return data;
}
#pragma mark —— 关于UIView的创建
NS_INLINE __kindof UIImageView *_Nonnull jobsMakeImageView(jobsByImageViewBlock _Nonnull block){
    UIImageView *data = UIImageView.alloc.init;
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

NS_INLINE __kindof UIScrollView *_Nonnull jobsMakeScrollView(jobsByScrollViewBlock _Nonnull block){
    UIScrollView *data = UIScrollView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIButton *_Nonnull jobsMakeButton(jobsByBtnBlock _Nonnull block){
    UIButton *data = UIButton.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UITableView *_Nonnull jobsMakeTableViewByGrouped(jobsByTableViewBlock _Nonnull block){
    UITableView *data = UITableView.initWithStyleGrouped;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UITableView *_Nonnull jobsMakeTableViewByPlain(jobsByTableViewBlock _Nonnull block){
    UITableView *data = UITableView.initWithStylePlain;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UITableView *_Nonnull jobsMakeTableViewByInsetGrouped(jobsByTableViewBlock _Nonnull block){
    UITableView *data = UITableView.initWithStyleInsetGrouped;
    if (block) block(data);
    return data;
}
#pragma mark —— 关于结构体的创建
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
#pragma mark —— 关于系统的一些配置文件
NS_INLINE __kindof NSDateFormatter *_Nonnull jobsMakeDateFormatter(jobsByDateFormatterBlock _Nonnull block){
    NSDateFormatter *data = NSDateFormatter.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* JobsBaseCustomizeUIKitCoreHeader_h */
