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
Prop_copy()NSString *isPraise;/// 是否点赞
Prop_copy()NSString *authorId;/// 视频作者ID
Prop_copy()NSString *videoSort;/// 视频分类
Prop_copy()NSString *headImage;/// 作者头像
Prop_copy()NSString *praiseNum;/// 点赞数
Prop_copy()NSString *author;/// 作者花名
Prop_copy()NSString *videoId;/// 视频ID
Prop_copy()NSString *videoSize;/// 视频尺寸
Prop_copy()NSString *isVip;/// 是否是VIP
Prop_copy()NSString *commentNum;/// 评论数
Prop_copy()NSString *isAttention;/// 是否关注
Prop_copy()NSString *areSelf;/// 视频是否是本人发布
Prop_copy()NSString *publishTime;/// 视频的发布时间
Prop_copy()NSString *playNum;/// 视频的播放次数
Prop_copy()NSString *videoTime;/// 视频持续时间
/// 以下是几个最主要的属性
Prop_copy()NSString *videoTitle;/// 视频标题
Prop_copy()NSString *videoImg;/// 图
Prop_copy()NSString *videoIdcUrl;/// 视频地址
#pragma mark —— ZFPlayer作者的数据源
Prop_copy()NSString *nick_name;
Prop_copy()NSString *head;
Prop_assign()NSInteger agree_num;
Prop_assign()NSInteger share_num;
Prop_assign()NSInteger post_num;
Prop_copy()NSString *title;
Prop_assign()CGFloat thumbnail_width;
Prop_assign()CGFloat thumbnail_height;
Prop_assign()CGFloat video_duration;
Prop_assign()CGFloat video_width;
Prop_assign()CGFloat video_height;
Prop_copy()NSString *thumbnail_url;
Prop_copy()NSString *video_url;
#pragma mark —— 本地数据：data.json的数据源 (备注释的是已经被上面所定义的)
Prop_copy()NSString *abtest_tag;
//Prop_copy()NSString *agree_num;
Prop_assign()NSInteger auditing;
Prop_copy()NSString *create_time;
Prop_copy()NSString *extra;
Prop_copy()NSString *first_post_id;
Prop_copy()NSString *forum_id;
Prop_copy()NSString *freq_num;
Prop_copy()NSString *has_agree;
//Prop_copy()NSString *head;
//Prop_copy()NSString *nick_name;
Prop_copy()NSString *origin_video_url;
Prop_copy()NSString *play_count;
//Prop_copy()NSString *post_num;
//Prop_copy()NSString *share_num;
Prop_copy()NSString *source;
Prop_copy()NSString *thread_id;
//Prop_copy()NSString *thumbnail_height;
Prop_copy()NSString *thumbnail_picid;
//Prop_copy()NSString *thumbnail_url;
//Prop_copy()NSString *thumbnail_width;
//Prop_copy()NSString *title;
//Prop_copy()NSString *video_duration;
Prop_copy()NSString *video_format;
Prop_copy()NSString *video_from;
//Prop_copy()NSString *video_height;
Prop_copy()NSString *video_length;
Prop_copy()NSString *video_log_id;
Prop_copy()NSString *video_md5;
Prop_copy()NSString *video_size;
Prop_copy()NSString *video_type;
//Prop_copy()NSString *video_url;
//Prop_copy()NSString *video_width;
Prop_copy()NSString *weight;

@end

@interface VideoModel : BaseModel

Prop_copy()NSMutableArray <VideoModel_Core *>*listMutArr;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof VideoModel_Core *_Nonnull jobsMakeVideoModelCore(jobsByVideoModelCoreBlock _Nonnull block){
    VideoModel_Core *data = VideoModel_Core.alloc.init;
    if (block) block(data);
    return data;
}
