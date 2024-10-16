//
//  NSObject+GKPhotoBrowser.h
//  MataShop
//
//  Created by Jobs Hi on 10/15/23.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

#if __has_include(<GKPhotoBrowser/GKPhotoBrowser.h>)
#import <GKPhotoBrowser/GKPhotoBrowser.h>
#else
#import "GKPhotoBrowser.h"
#endif

#import "NSString+Others.h"
#import "NSObject+Extras.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (GKPhotoBrowser)<GKPhotoBrowserDelegate>
/// 针对数据源是UIImage  *的GKPhotoBrowser
-(GKPhotoBrowser *)tapImageWithIndexPath:(NSIndexPath *)indexPath
                         imageDataMutArr:(NSMutableArray <UIImage *>*)imageDataMutArr;
/// 针对数据源是NSURL  *的GKPhotoBrowser
-(GKPhotoBrowser *)tapImageWithIndexPath:(NSIndexPath *)indexPath
                          imageUrlMutArr:(NSMutableArray <NSURL *>*)imageUrlMutArr;
/// 针对数据源是NSString  *的GKPhotoBrowser
-(GKPhotoBrowser *)tapImageWithIndexPath:(NSIndexPath *)indexPath
                       imageUrlStrMutArr:(NSMutableArray <NSString *>*)imageUrlStrMutArr;
@end

NS_ASSUME_NONNULL_END
