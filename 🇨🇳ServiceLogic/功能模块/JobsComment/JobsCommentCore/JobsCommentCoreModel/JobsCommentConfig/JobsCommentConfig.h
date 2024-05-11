//
//  JobsCommentConfig.h
//  JobsComment
//
//  Created by Jobs on 2020/11/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsCommentConfig : NSObject

@property(nonatomic,assign,readonly)CGSize headerImageViewSize;/// 发表此评论的用户的头像大小
@property(nonatomic,strong,readonly)UIFont *titleFont;/// 发表此评论的用户的名字字体大小
@property(nonatomic,strong,readonly)UIFont *subTitleFont;/// 具体的评论内容的字体大小
@property(nonatomic,strong,readonly)UIColor *titleCor;/// 发表此评论的用户的名字字体颜色
@property(nonatomic,strong,readonly)UIColor *subTitleCor;/// 具体的评论内容的字体颜色
@property(nonatomic,assign,readonly)UIColor *bgCor;/// 显示评论的承载cell背景色
@property(nonatomic,assign,readonly)CGFloat cellHeight;/// 显示评论的承载cell高度
@property(nonatomic,assign,readonly)CGFloat secondLevelCommentOffset;/// 二级标题相对于一级标题控件的偏移量

+(instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
