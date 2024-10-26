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
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsInfoTBVCell *cell = (JobsInfoTBVCell *)tableView.tableViewCellClass(JobsInfoTBVCell.class,@"");
        if (!cell) {
            cell = JobsInfoTBVCell.initTableViewCellWithStyle(UITableViewCellStyleSubtitle);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.contentView.backgroundColor = JobsCommentConfig.sharedManager.bgCor;
        }return cell;
    };
}
#pragma mark —— BaseCellProtocol
+(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsCommentConfig.sharedManager.cellHeight;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        if ([model isKindOfClass:JobsChildCommentModel.class]) {
            self.childCommentModel = (JobsChildCommentModel *)model;
            self.likeBtn.alpha = 1;
            self.textLabel.text = self.childCommentModel.nickname;
            self.detailTextLabel.text = self.childCommentModel.content;
            self.imageView
                .imageURL(self.childCommentModel.headImg.imageURLPlus.jobsUrl)
                .placeholderImage(JobsGifIMG(@"动态头像 尺寸126") ? : JobsIMG(@"用户默认头像"))
                .options(self.makeSDWebImageOptions)
                .completed(^(UIImage * _Nullable image,
                             NSError * _Nullable error,
                             SDImageCacheType cacheType,
                             NSURL * _Nullable imageURL) {
                    if (error) {
                        NSLog(@"aa图片加载失败: %@-%@", error,imageURL);
                    } else {
                        NSLog(@"图片加载成功");
                    }
                }).load();
        }
    };
}
#pragma mark —— 复写系统父类方法
- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.Size = JobsCommentConfig.sharedManager.headerImageViewSize;//subTitleOffset
    self.imageView.cornerCutToCircleWithCornerRadius(self.imageView.height / 2);
    self.textLabel.font = JobsCommentConfig.sharedManager.titleFont;
    self.detailTextLabel.font = JobsCommentConfig.sharedManager.subTitleFont;
    self.textLabel.textColor = JobsCommentConfig.sharedManager.titleCor;
    self.detailTextLabel.textColor = JobsCommentConfig.sharedManager.subTitleCor;
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
    _likeBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
    return _likeBtn;
}

@end
