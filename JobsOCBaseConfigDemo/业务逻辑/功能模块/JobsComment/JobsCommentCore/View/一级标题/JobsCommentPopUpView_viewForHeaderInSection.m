//
//  CommentPopUpNonHoveringHeaderView.m
//  My_BaseProj
//
//  Created by Jobs on 2020/10/2.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsCommentPopUpView_viewForHeaderInSection.h"

@interface JobsCommentPopUpView_viewForHeaderInSection ()
/// UI
@property(nonatomic,strong)BaseButton *userInfoBtn;
@property(nonatomic,strong)RBCLikeButton *likeBtn;
/// Data
@property(nonatomic,strong)JobsFirstCommentModel *firstCommentModel;

@end

@implementation JobsCommentPopUpView_viewForHeaderInSection

-(instancetype)init{
    if (self = [super init]) {
        
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    if (self.objectBlock) self.objectBlock(@1);
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)viewHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsCommentConfig.sharedManager.cellHeight;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        self.backgroundColor = JobsClearColor;
        if ([model isKindOfClass:JobsFirstCommentModel.class]) {
            self.firstCommentModel = model;
            self.userInfoBtn.alpha = 1;
            self.likeBtn.alpha = 1;
        }
    };
}
#pragma mark —— lazyLoad
-(BaseButton *)userInfoBtn{
    if(!_userInfoBtn){
        @jobs_weakify(self)
        _userInfoBtn = BaseButton.jobsInit()
            .bgColor(JobsWhiteColor)
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(1)
            .jobsResetBtnTitleCor(JobsCor(@"#EA2918"))
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                x.selected = !x.selected;
                if (self.objectBlock) self.objectBlock(x);
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        /// 很重要，自定义设置UIBotton.imageView
        _userInfoBtn.imageViewFrame = CGRectMake(JobsWidth(15), 0, JobsWidth(45), JobsWidth(45));
        _userInfoBtn.textLabelFrameOffsetX = JobsWidth(0);
        _userInfoBtn.subTextLabelFrameOffsetX = JobsWidth(0);
        
        [self addSubview:_userInfoBtn];
        [_userInfoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(JobsWidth(0));
            make.top.bottom.equalTo(self);
        }];
    }
    
    if (self.firstCommentModel.headImg.jobsCanOpenUrl) {
        self->_userInfoBtn.imageURL(self.firstCommentModel.headImg.jobsUrl)
           .placeholderImage(JobsGifIMG(@"动态头像 尺寸126") ? : JobsIMG(@"头像01"))
           .options(SDWebImageRefreshCached)/// 强制刷新缓存
           .completed(^(UIImage * _Nullable image,
                        NSError * _Nullable error,
                        SDImageCacheType cacheType,
                        NSURL * _Nullable imageURL) {
               if (error) {
                   NSLog(@"图片加载失败: %@-%@", error,imageURL);
               } else {
                   NSLog(@"图片加载成功");
                   self->_userInfoBtn.jobsResetImage(image ? : JobsGifIMG(@"动态头像 尺寸126") ? : JobsIMG(@"头像01"));
               }
           }).normalLoad();
    }else{
        self->_userInfoBtn.jobsResetBtnImage(JobsGifIMG(@"动态头像 尺寸126") ? : JobsIMG(@"头像01"));
    }
    
    _userInfoBtn.jobsResetAttributedTitle([AttributedString initWithString:self.firstCommentModel.nickname
                                                                attributes:@{NSFontAttributeName: JobsCommentConfig.sharedManager.titleFont,
                                                                             NSForegroundColorAttributeName: JobsCommentConfig.sharedManager.titleCor}]);
    _userInfoBtn.jobsResetAttributedSubtitle([AttributedString initWithString:self.firstCommentModel.content
                                                                   attributes:@{NSFontAttributeName: JobsCommentConfig.sharedManager.subTitleFont,
                                                                                NSForegroundColorAttributeName: JobsCommentConfig.sharedManager.subTitleCor}]);
    _userInfoBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
    return _userInfoBtn;
}

-(RBCLikeButton *)likeBtn{
    if(!_likeBtn){
        @jobs_weakify(self)
        _likeBtn = RBCLikeButton.jobsInit()
            .bgColor(JobsWhiteColor)
            .jobsResetBtnImage(_likeBtn.selected ? JobsBuddleIMG(nil, @"RBCLikeButton", nil, @"day_like_red") :JobsBuddleIMG(nil, @"RBCLikeButton", nil, @"day_like"))
            .jobsResetBtnTitleCor(_likeBtn.selected ? JobsRedColor : JobsGrayColor)
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(4))
            .jobsResetBtnTitle((toStringByNSInteger(_likeBtn.thumpNum)))
            .onClick(^(RBCLikeButton *x){
                @jobs_strongify(self)
                x.selected = !x.selected;
                x.jobsResetBtnImage(x.selected ? JobsBuddleIMG(nil, @"RBCLikeButton", nil, @"day_like_red") :JobsBuddleIMG(nil, @"RBCLikeButton", nil, @"day_like"));
    //            [x setThumbWithSelected:x.selected
    //                           thumbNum:x.selected ? x.thumpNum + 1 : x.thumpNum - 1
    //                          animation:YES];
                if(x.selected){
                    x.thumpNum = x.thumpNum + 1;
                }else{
                    x.thumpNum = x.thumpNum - 1;
                }
                x.jobsResetTitle(toStringByNSInteger(x.thumpNum));
                x.jobsResetBtnTitleCor(x.selected ? JobsRedColor : JobsGrayColor);
                if (self.objectBlock) self.objectBlock(x);
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        _likeBtn.thumpNum = 0;
        [self addSubview:_likeBtn];
        [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(55 / 2));
            make.right.equalTo(self).offset(-JobsWidth(13));
            make.centerY.equalTo(self);
        }];
    }
    _likeBtn.selected = self.firstCommentModel.isPraise;
    _likeBtn.thumpNum = self.firstCommentModel.praiseNum;
    _likeBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
    return _likeBtn;
}

@end
