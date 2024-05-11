//
//  JobsRightBtnsView.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/9/19.
//  Copyright © 2020 MonkeyKingVideo. All rights reserved.
//

#import "BaseView.h"
#import "UIButton+UI.h"
#import "RBCLikeButton.h"
#import "JobsShareView.h"

typedef NS_ENUM(NSUInteger, MKRightBtnViewBtnType) {
    MKRightBtnViewBtnType_loveBtn,///点赞
    MKRightBtnViewBtnType_commentBtn,/// 评论
    MKRightBtnViewBtnType_shareBtn/// 分享
};

NS_ASSUME_NONNULL_BEGIN

@interface JobsRightBtnsView : BaseView

-(NSMutableArray <UIButton *>*)getButtonArr;

@end

NS_ASSUME_NONNULL_END
