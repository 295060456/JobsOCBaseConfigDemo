//
//  ASNetworkImageNode+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/6/25.
//

#import "ASNetworkImageNode+DSL.h"

@implementation ASNetworkImageNode (DSL) 

-(instancetype)byInitWithCache:(id<ASImageCacheProtocol> _Nullable)cache
                    downloader:(id<ASImageDownloaderProtocol>)downloader {
    if (!downloader) { return self; }
    // 重新指定初始化：由于 ASNetworkImageNode 的 designated initializer 不同，
    // 这里采用“就地替换”的方式重建实例（常见于 DSL 里让代码显式可读）。
    return [(ASNetworkImageNode *)ASNetworkImageNode.alloc initWithCache:cache downloader:downloader];
}

-(instancetype)bySetURL:(NSURL * _Nullable)url resetToDefault:(BOOL)reset {
    [self setURL:url resetToDefault:reset];
    return self;
}

+(jobsByBOOLBlock _Nonnull)byUseMainThreadDelegateCallbacks{
    @jobs_weakify(self)
    return ^(BOOL on){
        @jobs_strongify(self)
        self.useMainThreadDelegateCallbacks = on;
    };
}

-(JobsRetNetworkImageNodeByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof ASNetworkImageNode * _Nonnull (id<ASNetworkImageNodeDelegate> _Nullable delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

-(JobsRetNetworkImageNodeByImageBlock _Nonnull)byImage{
    @jobs_weakify(self)
    return ^__kindof ASNetworkImageNode * _Nonnull (UIImage *_Nullable image){
        // 按 Texture 约定，如果你手动设 image，它会当作 ASImageNode 使用；
        // 之后一旦设置 URL，内部会清空再走占位图与下载流程。
        @jobs_strongify(self)
        self.image = image;
        return self;
    };
}

-(JobsRetNetworkImageNodeByImageBlock _Nonnull)byDefaultImage{
    @jobs_weakify(self)
    return ^__kindof ASNetworkImageNode * _Nonnull (UIImage *_Nullable image){
        @jobs_strongify(self)
        self.defaultImage = image;
        return self;
    };
}

-(JobsRetNetworkImageNodeByURLBlock _Nonnull)byURL{
    @jobs_weakify(self)
    return ^__kindof ASNetworkImageNode * _Nonnull(NSURL *_Nullable url){
        @jobs_strongify(self)
        self.URL = url; // copy 语义由属性自身保证
        return self;
    };
}

-(JobsRetNetworkImageNodeByBOOLBlock _Nonnull)byShouldCacheImage{
    @jobs_weakify(self)
    return ^__kindof ASNetworkImageNode * _Nonnull(BOOL on){
        @jobs_strongify(self)
        self.shouldCacheImage = on;
        return self;
    };
}

-(JobsRetNetworkImageNodeByBOOLBlock _Nonnull)byShouldRenderProgressImages{
    @jobs_weakify(self)
    return ^__kindof ASNetworkImageNode * _Nonnull(BOOL on){
        @jobs_strongify(self)
        self.shouldRenderProgressImages = on;
        return self;
    };
}

-(JobsRetNetworkImageNodeByBOOLBlock _Nonnull)byShouldRetryImageDownload{
    @jobs_weakify(self)
    return ^__kindof ASNetworkImageNode * _Nonnull(BOOL on){
        @jobs_strongify(self)
        self.shouldRetryImageDownload = on;
        return self;
    };
}

-(CGFloat)by_currentImageQuality { return self.currentImageQuality; }
-(CGFloat)by_renderedImageQuality { return self.renderedImageQuality; }
-(CGFloat)by_downloadProgress    { return self.downloadProgress; }

@end
