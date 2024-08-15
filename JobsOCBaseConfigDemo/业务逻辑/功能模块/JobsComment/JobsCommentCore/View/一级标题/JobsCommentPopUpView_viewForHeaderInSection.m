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
+(CGFloat)viewHeightWithModel:(id _Nullable)model{
    return JobsCommentConfig.sharedInstance.cellHeight;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(id _Nullable)model{
    self.backgroundColor = JobsClearColor;
    if ([model isKindOfClass:JobsFirstCommentModel.class]) {
        self.firstCommentModel = model;
        self.userInfoBtn.alpha = 1;
        self.likeBtn.alpha = 1;
    }
}
#pragma mark —— lazyLoad
-(BaseButton *)userInfoBtn{
    if(!_userInfoBtn){
        @jobs_weakify(self)
        _userInfoBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                         background:nil
                                         buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                      textAlignment:NSTextAlignmentCenter
                                                   subTextAlignment:NSTextAlignmentCenter
                                                        normalImage:nil
                                                     highlightImage:nil
                                                    attributedTitle:nil
                                            selectedAttributedTitle:nil
                                                 attributedSubtitle:nil
                                                              title:nil
                                                           subTitle:nil
                                                          titleFont:UIFontWeightBoldSize(12)
                                                       subTitleFont:nil
                                                           titleCor:JobsCor(@"#EA2918")
                                                        subTitleCor:nil
                                                 titleLineBreakMode:NSLineBreakByWordWrapping
                                              subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                baseBackgroundColor:JobsWhiteColor
                                                    backgroundImage:nil
                                                       imagePadding:JobsWidth(0)
                                                       titlePadding:JobsWidth(5)
                                                     imagePlacement:NSDirectionalRectEdgeLeading
                                         contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                           contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                      contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                  cornerRadiusValue:JobsWidth(0)
                                                    roundingCorners:UIRectCornerAllCorners
                                               roundingCornersRadii:CGSizeZero
                                                     layerBorderCor:nil
                                                        borderWidth:JobsWidth(0)
                                                      primaryAction:nil
                                         longPressGestureEventBlock:nil
                                                    clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
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
    
    {
        @jobs_weakify(self)
        if (self.firstCommentModel.headImg.jobsCanOpenUrl) {
            [self->_userInfoBtn.imageView sd_setImageWithURL:self.firstCommentModel.headImg.jobsUrl
                                            placeholderImage:[UIImage animatedGIFNamed:@"动态头像 尺寸126"] ? : JobsIMG(@"头像01")
                                                   completed:^(UIImage * _Nullable image,
                                                               NSError * _Nullable error,
                                                               SDImageCacheType cacheType,
                                                               NSURL * _Nullable imageURL) {
                @jobs_strongify(self)
                self->_userInfoBtn.jobsResetImage(image ? : [UIImage animatedGIFNamed:@"动态头像 尺寸126"] ? : JobsIMG(@"头像01"));
            }];
        }else{
            self->_userInfoBtn.jobsResetBtnImage([UIImage animatedGIFNamed:@"动态头像 尺寸126"] ? : JobsIMG(@"头像01"));
        }
    }
    
    _userInfoBtn.jobsResetAttributedTitle([NSMutableAttributedString.alloc initWithString:self.firstCommentModel.nickname
                                                                               attributes:@{NSFontAttributeName: JobsCommentConfig.sharedInstance.titleFont,
                                                                                            NSForegroundColorAttributeName: JobsCommentConfig.sharedInstance.titleCor}]);
    _userInfoBtn.jobsResetAttributedSubtitle([NSMutableAttributedString.alloc initWithString:self.self.firstCommentModel.content
                                                                                  attributes:@{NSFontAttributeName: JobsCommentConfig.sharedInstance.subTitleFont,
                                                                                               NSForegroundColorAttributeName: JobsCommentConfig.sharedInstance.subTitleCor}]);
    _userInfoBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
    return _userInfoBtn;
}

-(RBCLikeButton *)likeBtn{
    if(!_likeBtn){
        @jobs_weakify(self)
        _likeBtn = [RBCLikeButton.alloc jobsInitBtnByConfiguration:nil
                                                        background:nil
                                        buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                     textAlignment:NSTextAlignmentCenter
                                                  subTextAlignment:NSTextAlignmentCenter
                                                       normalImage:nil
                                                    highlightImage:nil
                                                   attributedTitle:nil
                                           selectedAttributedTitle:nil
                                                attributedSubtitle:nil
                                                             title:nil
                                                          subTitle:nil
                                                         titleFont:UIFontWeightRegularSize(4)
                                                      subTitleFont:nil
                                                          titleCor:nil
                                                       subTitleCor:nil
                                                titleLineBreakMode:NSLineBreakByWordWrapping
                                             subtitleLineBreakMode:NSLineBreakByWordWrapping
                                               baseBackgroundColor:JobsWhiteColor
                                                   backgroundImage:nil
                                                      imagePadding:JobsWidth(3)
                                                      titlePadding:JobsWidth(0)
                                                    imagePlacement:NSDirectionalRectEdgeLeading
                                        contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                          contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                     contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                 cornerRadiusValue:JobsWidth(0)
                                                   roundingCorners:UIRectCornerAllCorners
                                              roundingCornersRadii:CGSizeZero
                                                    layerBorderCor:nil
                                                       borderWidth:JobsWidth(0)
                                                     primaryAction:nil
                                        longPressGestureEventBlock:nil
                                                   clickEventBlock:^id(RBCLikeButton *x) {
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
            x.jobsResetTitle([NSString stringWithFormat:@"%ld",x.thumpNum]);
            x.jobsResetBtnTitleCor(x.selected ? JobsRedColor : JobsGrayColor);
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
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
    _likeBtn.jobsResetTitle([NSString stringWithFormat:@"%ld",_likeBtn.thumpNum]);
    _likeBtn.jobsResetBtnTitleCor(_likeBtn.selected ? JobsRedColor : JobsGrayColor);
    _likeBtn.jobsResetBtnImage(_likeBtn.selected ? JobsBuddleIMG(nil, @"RBCLikeButton", nil, @"day_like_red") :JobsBuddleIMG(nil, @"RBCLikeButton", nil, @"day_like"));
    _likeBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
    return _likeBtn;
}

@end
