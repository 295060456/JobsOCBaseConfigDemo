#  JobsLaunch 相关功能点剖析
## 视频【本地资源、远程URL】、支持的格式
## 图片【本地资源（静态图、gif动态图）、远程URL】、启动图来源
## 下载资源下次用
## 点击打开url
## 关闭按钮(X秒以后关闭)

## 需要独立的模块
### 视频播放模块 
https://github.com/renzifeng/ZFPlayer
### FLAnimatedImage + SDWebImage
https://github.com/tiasn/SDWebImageGiF
### 下载模块 
https://juejin.cn/post/6916707043441115143
https://github.com/Phelthas/LXMDownloader
https://github.com/tuxi/OSFiles
https://github.com/agelessman/MCDownloader
https://gitee.com/liuboliu/lbdown-load-manager
### 缓存模块
### 计时模块
### 全局设定模块

## 借鉴的一些东西
/** 程序从后台恢复时,是否需要展示广告(defailt NO) */
@property (nonatomic,assign) BOOL showEnterForeground;
/** 图片广告缩放模式(default UIViewContentModeScaleToFill) */
@property(nonatomic,assign)UIViewContentMode contentMode;
/** 设置GIF动图是否只循环播放一次(YES:只播放一次,NO:循环播放,default NO,仅对动图设置有效) */
@property (nonatomic, assign) BOOL GIFImageCycleOnce;

/** 视频缩放模式(default MPMovieScalingModeAspectFill) */
@property(nonatomic,assign)MPMovieScalingMode scalingMode XHLaunchAdDeprecated("请使用videoGravity");
/** 视频缩放模式(default AVLayerVideoGravityResizeAspectFill) */
@property (nonatomic, copy) AVLayerVideoGravity videoGravity;
/** 设置视频是否只循环播放一次(YES:只播放一次,NO循环播放,default NO) */
@property (nonatomic, assign) BOOL videoCycleOnce;
/** 是否关闭音频(default NO) */
@property (nonatomic, assign) BOOL muted;
/**
 *  缓存类型
 */
typedef NS_OPTIONS(NSUInteger, XHLaunchAdImageOptions) {
    /** 有缓存,读取缓存,不重新下载,没缓存先下载,并缓存 */
    XHLaunchAdImageDefault = 1 << 0,
    /** 只下载,不缓存 */
    XHLaunchAdImageOnlyLoad = 1 << 1,
    /** 先读缓存,再下载刷新图片和缓存 */
    XHLaunchAdImageRefreshCached = 1 << 2 ,
    /** 后台缓存本次不显示,缓存OK后下次再显示(建议使用这种方式)*/
    XHLaunchAdImageCacheInBackground = 1 << 3
};

/**
 *  倒计时类型
 */
typedef NS_ENUM(NSInteger,SkipType) {
    SkipTypeNone      = 1,//无
    /** 方形 */
    SkipTypeTime      = 2,//方形:倒计时
    SkipTypeText      = 3,//方形:跳过
    SkipTypeTimeText  = 4,//方形:倒计时+跳过 (default)
    /** 圆形 */
    SkipTypeRoundTime = 5,//圆形:倒计时
    SkipTypeRoundText = 6,//圆形:跳过
    SkipTypeRoundProgressTime = 7,//圆形:进度圈+倒计时
    SkipTypeRoundProgressText = 8,//圆形:进度圈+跳过
};
