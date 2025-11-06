//
//  ASNetworkImageNode+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/6/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface ASNetworkImageNode (DSL)

-(instancetype)byInitWithCache:(id<ASImageCacheProtocol> _Nullable)cache
                    downloader:(id<ASImageDownloaderProtocol>)downloader;

-(instancetype)bySetURL:(NSURL * _Nullable)url resetToDefault:(BOOL)reset;

+(jobsByBOOLBlock _Nonnull)byUseMainThreadDelegateCallbacks;

-(JobsRetNetworkImageNodeByDelegateBlock _Nonnull)byDelegate;
-(JobsRetNetworkImageNodeByImageBlock _Nonnull)byImage;
-(JobsRetNetworkImageNodeByImageBlock _Nonnull)byDefaultImage;
-(JobsRetNetworkImageNodeByURLBlock _Nonnull)byURL;
-(JobsRetNetworkImageNodeByBOOLBlock _Nonnull)byShouldCacheImage;
-(JobsRetNetworkImageNodeByBOOLBlock _Nonnull)byShouldRenderProgressImages;
-(JobsRetNetworkImageNodeByBOOLBlock _Nonnull)byShouldRetryImageDownload;

-(CGFloat)by_currentImageQuality;
-(CGFloat)by_renderedImageQuality;
-(CGFloat)by_downloadProgress;


@end

NS_ASSUME_NONNULL_END
