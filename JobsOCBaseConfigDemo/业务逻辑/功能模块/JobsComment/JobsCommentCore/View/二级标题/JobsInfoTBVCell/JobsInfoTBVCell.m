//
//  InfoTBVCell.m
//  commentList
//
//  Created by Jobs on 2020/7/14.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsInfoTBVCell.h"

@interface JobsInfoTBVCell ()
/// UI
@property(nonatomic,strong)RBCLikeButton *likeBtn;
/// Data
@property(nonatomic,strong)JobsChildCommentModel *childCommentModel;

@end

@implementation JobsInfoTBVCell
BaseProtocol_synthesize
#pragma mark —— UITableViewCellProtocol
+(instancetype)cellStyleValue1WithTableView:(UITableView *)tableView{
    JobsInfoTBVCell *cell = (JobsInfoTBVCell *)tableView.tableViewCellClass(JobsInfoTBVCell.class,@"");
    if (!cell) {
        cell = [JobsInfoTBVCell initTableViewCellWithStyle:UITableViewCellStyleSubtitle];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.contentView.backgroundColor = JobsCommentConfig.sharedInstance.bgCor;
    }return cell;
}
#pragma mark —— BaseCellProtocol
+(CGFloat)cellHeightWithModel:(id _Nullable)model{
    return JobsCommentConfig.sharedInstance.cellHeight;
}

- (void)richElementsInCellWithModel:(id _Nullable)model{
    if ([model isKindOfClass:JobsChildCommentModel.class]) {
        self.childCommentModel = (JobsChildCommentModel *)model;
        self.likeBtn.alpha = 1;

        self.textLabel.text = self.childCommentModel.nickname;
        self.detailTextLabel.text = self.childCommentModel.content;
        [self.imageView sd_setImageWithURL:self.childCommentModel.headImg.jobsUrl
                          placeholderImage:[UIImage animatedGIFNamed:@"动态头像 尺寸126"] ? : JobsIMG(@"用户默认头像")];
    }
}
#pragma mark —— 复写系统父类方法
- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.size = JobsCommentConfig.sharedInstance.headerImageViewSize;//subTitleOffset
    self.imageView.cornerCutToCircleWithCornerRadius(self.imageView.height / 2);
    self.textLabel.font = JobsCommentConfig.sharedInstance.titleFont;
    self.detailTextLabel.font = JobsCommentConfig.sharedInstance.subTitleFont;
    self.textLabel.textColor = JobsCommentConfig.sharedInstance.titleCor;
    self.detailTextLabel.textColor = JobsCommentConfig.sharedInstance.subTitleCor;
    /// 因为二级评论和一级评论的控件之间存在一定的offset(向右偏)，故这里进行重写约束
    self.imageView.resetOriginX(JobsWidth(50));
    self.imageView.resetOriginY(JobsWidth(0));
    
    self.textLabel.resetOriginX(JobsWidth(110));
    self.textLabel.resetOriginY(JobsWidth(0));
    
    self.detailTextLabel.resetOriginX(JobsWidth(110));
}
#pragma mark —— 一些公有方法
-(RBCLikeButton *)getLikeBtn{
    return _likeBtn;
}
#pragma mark —— lazyLoad
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
        [self.contentView addSubview:_likeBtn];
        [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(55 / 2));
            make.right.equalTo(self.contentView).offset(-JobsWidth(13));
            make.centerY.equalTo(self.contentView);
        }];
    }
    _likeBtn.selected = self.childCommentModel.isPraise.boolValue;
    _likeBtn.thumpNum = self.childCommentModel.praiseNum;    _likeBtn.jobsResetTitle([NSString stringWithFormat:@"%ld",_likeBtn.thumpNum]);
    _likeBtn.jobsResetBtnTitleCor(_likeBtn.selected ? JobsRedColor : JobsGrayColor);
    _likeBtn.jobsResetBtnImage(_likeBtn.selected ? JobsBuddleIMG(nil, @"RBCLikeButton", nil, @"day_like_red") :JobsBuddleIMG(nil, @"RBCLikeButton", nil, @"day_like"));
    _likeBtn.makeBtnLabelByShowingType(UILabelShowingType_03);
    return _likeBtn;
}

@end
