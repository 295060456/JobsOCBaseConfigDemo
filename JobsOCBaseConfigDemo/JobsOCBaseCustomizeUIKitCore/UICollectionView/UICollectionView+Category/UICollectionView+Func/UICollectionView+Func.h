//
//  UICollectionView+Func.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/24.
//

#import <UIKit/UIKit.h>
#import "BaseCollectionViewProtocol.h"
#import "UICollectionViewCell+BaseViewProtocol.h"

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (Func)<BaseCollectionViewProtocol>

@end

NS_ASSUME_NONNULL_END
