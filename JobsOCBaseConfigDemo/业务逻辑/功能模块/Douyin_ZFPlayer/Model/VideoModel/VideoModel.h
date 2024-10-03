//
//  VideoModel.h
//  DouYin
//
//  Created by Jobs on 2020/9/24.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface VideoModel_Core : NSObject
#pragma mark —— Jobs的数据源
@property(nonatomic,strong)NSString *isPraise;/// 是否点赞
@property(nonatomic,strong)NSString *authorId;/// 视频作者ID
@property(nonatomic,strong)NSString *videoSort;/// 视频分类
@property(nonatomic,strong)NSString *headImage;/// 作者头像
@property(nonatomic,strong)NSString *praiseNum;/// 点赞数
@property(nonatomic,strong)NSString *author;/// 作者花名
@property(nonatomic,strong)NSString *videoId;/// 视频ID
@property(nonatomic,strong)NSString *videoSize;/// 视频尺寸
@property(nonatomic,strong)NSString *isVip;/// 是否是VIP
@property(nonatomic,strong)NSString *commentNum;/// 评论数
@property(nonatomic,strong)NSString *isAttention;/// 是否关注
@property(nonatomic,strong)NSString *areSelf;/// 视频是否是本人发布
@property(nonatomic,strong)NSString *publishTime;/// 视频的发布时间
@property(nonatomic,strong)NSString *playNum;/// 视频的播放次数
@property(nonatomic,strong)NSString *videoTime;/// 视频持续时间
/// 以下是几个最主要的属性
@property(nonatomic,strong)NSString *videoTitle;/// 视频标题
@property(nonatomic,strong)NSString *videoImg;/// 图
@property(nonatomic,strong)NSString *videoIdcUrl;/// 视频地址
#pragma mark —— ZFPlayer作者的数据源
@property(nonatomic,copy)NSString *nick_name;
@property(nonatomic,copy)NSString *head;
@property(nonatomic,assign)NSInteger agree_num;
@property(nonatomic,assign)NSInteger share_num;
@property(nonatomic,assign)NSInteger post_num;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,assign)CGFloat thumbnail_width;
@property(nonatomic,assign)CGFloat thumbnail_height;
@property(nonatomic,assign)CGFloat video_duration;
@property(nonatomic,assign)CGFloat video_width;
@property(nonatomic,assign)CGFloat video_height;
@property(nonatomic,copy)NSString *thumbnail_url;
@property(nonatomic,copy)NSString *video_url;
#pragma mark —— 本地数据：data.json的数据源 (备注释的是已经被上面所定义的)
@property(nonatomic,copy)NSString *abtest_tag;
//@property(nonatomic,copy)NSString *agree_num;
@property(nonatomic,assign)NSInteger auditing;
@property(nonatomic,copy)NSString *create_time;
@property(nonatomic,copy)NSString *extra;
@property(nonatomic,copy)NSString *first_post_id;
@property(nonatomic,copy)NSString *forum_id;
@property(nonatomic,copy)NSString *freq_num;
@property(nonatomic,copy)NSString *has_agree;
//@property(nonatomic,copy)NSString *head;
//@property(nonatomic,copy)NSString *nick_name;
@property(nonatomic,copy)NSString *origin_video_url;
@property(nonatomic,copy)NSString *play_count;
//@property(nonatomic,copy)NSString *post_num;
//@property(nonatomic,copy)NSString *share_num;
@property(nonatomic,copy)NSString *source;
@property(nonatomic,copy)NSString *thread_id;
//@property(nonatomic,copy)NSString *thumbnail_height;
@property(nonatomic,copy)NSString *thumbnail_picid;
//@property(nonatomic,copy)NSString *thumbnail_url;
//@property(nonatomic,copy)NSString *thumbnail_width;
//@property(nonatomic,copy)NSString *title;
//@property(nonatomic,copy)NSString *video_duration;
@property(nonatomic,copy)NSString *video_format;
@property(nonatomic,copy)NSString *video_from;
//@property(nonatomic,copy)NSString *video_height;
@property(nonatomic,copy)NSString *video_length;
@property(nonatomic,copy)NSString *video_log_id;
@property(nonatomic,copy)NSString *video_md5;
@property(nonatomic,copy)NSString *video_size;
@property(nonatomic,copy)NSString *video_type;
//@property(nonatomic,copy)NSString *video_url;
//@property(nonatomic,copy)NSString *video_width;
@property(nonatomic,copy)NSString *weight;

@end

@interface VideoModel : BaseModel

@property(nonatomic,strong)NSMutableArray <VideoModel_Core *>*listMutArr;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof VideoModel_Core *_Nonnull jobsMakeVideoModelCore(jobsByVideoModelCoreBlock _Nonnull block){
    VideoModel_Core *data = VideoModel_Core.alloc.init;
    if (block) block(data);
    return data;
}
