//
//  JobsCommentConfig.m
//  JobsComment
//
//  Created by Jobs on 2020/11/17.
//

#import "JobsCommentConfig.h"

@interface JobsCommentConfig ()

@property(nonatomic,assign)CGSize headerImageViewSize;/// 发表此评论的用户的头像大小
@property(nonatomic,strong)UIFont *titleFont;/// 发表此评论的用户的名字字体大小
@property(nonatomic,strong)UIFont *subTitleFont;/// 具体的评论内容的字体大小
@property(nonatomic,strong)UIColor *titleCor;/// 发表此评论的用户的名字字体颜色
@property(nonatomic,strong)UIColor *subTitleCor;/// 具体的评论内容的字体颜色
@property(nonatomic,assign)UIColor *bgCor;/// 显示评论的承载cell背景色
@property(nonatomic,assign)CGFloat cellHeight;/// 显示评论的承载cell高度
@property(nonatomic,assign)CGFloat secondLevelCommentOffset;/// 二级标题相对于一级标题控件的偏移量

@end

@implementation JobsCommentConfig
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_jobsCommentConfigOnceToken = 0;
    static_jobsCommentConfig = nil;
}
static JobsCommentConfig *static_jobsCommentConfig = nil;
static dispatch_once_t static_jobsCommentConfigOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_jobsCommentConfigOnceToken, ^{
        static_jobsCommentConfig = JobsCommentConfig.new;
    });return static_jobsCommentConfig;
}
#pragma mark —— lazyload
-(CGSize)headerImageViewSize{
    return CGSizeMake(JobsWidth(50), JobsWidth(50));
}

-(UIFont *)titleFont{
    return JobsFontRegular(13);
}

-(UIFont *)subTitleFont{
    return JobsFontRegular(15);
}

-(UIColor *)titleCor{
    return RGBA_COLOR(131, 145, 175, 1);
}

-(UIColor *)subTitleCor{
    return JobsBlackColor;
}

-(UIColor *)bgCor{
    return JobsWhiteColor;
}

-(CGFloat)cellHeight{
    return JobsWidth(55);
}

-(CGFloat)secondLevelCommentOffset{
    return JobsWidth(50);
}

@end
