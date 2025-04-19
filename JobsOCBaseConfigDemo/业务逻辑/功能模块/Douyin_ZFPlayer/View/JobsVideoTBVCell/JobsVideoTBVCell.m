//
//  ZFDouYinCell.m
//  DouYin
//
//  Created by Jobs on 2020/9/28.
//

#import "JobsVideoTBVCell.h"

@interface JobsVideoTBVCell ()
/// UI
Prop_strong()UIImageView *coverImageView;
Prop_strong()JobsRightBtnsView *rbView;
Prop_strong()UIButton *rotation;
/// Data
Prop_strong()VideoModel_Core *core_data;

@end

@implementation JobsVideoTBVCell
@synthesize index = _index;
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsVideoTBVCell *cell = (JobsVideoTBVCell *)tableView.tableViewCellClass(JobsVideoTBVCell.class,@"");
        if (!cell) {
            cell = JobsVideoTBVCell.initTableViewCellWithStyle(UITableViewCellStyleSubtitle);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.contentView.backgroundColor = JobsRandomColor;
        }return cell;
    };
}

+(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        if ([data isKindOfClass:UITableView.class]) {
            UITableView *tbv = (UITableView *)data;
            return tbv.mj_h;
        }return JobsMainScreen_HEIGHT();
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsCellBy{
    @jobs_weakify(self)
    return ^(VideoModel_Core *_Nullable model) {
        @jobs_strongify(self)
        if ([model isKindOfClass:VideoModel_Core.class]) {
            self.data = (VideoModel_Core *)model;
            self.label.text = [NSString stringWithFormat:@"%ld",(long)self.index];
            self.rotation.alpha = 1;
            self.coverImageView
                    .imageURL(self.core_data.videoImg.jobsUrl)
                    .placeholderImage(JobsIMG(@"视频封面"))
                    .options(self.makeSDWebImageOptions)
                    .completed(^(UIImage * _Nullable image,
                                 NSError * _Nullable error,
                                 SDImageCacheType cacheType,
                                 NSURL * _Nullable imageURL) {
                        if (error) {
                            JobsLog(@"aa图片加载失败: %@-%@", error,imageURL);
                        } else {
                            JobsLog(@"图片加载成功");
                        }
                    }).load();
            self.rbView.alpha = 1;
            self.textLabel.text = self.core_data.videoTitle;
            self.textLabel.textColor = JobsRedColor;
//            self.rotation.hidden;// 宽大于高 = 横屏视频，才支持旋转
        }
    };
}
#pragma mark —— lazyLoad
-(UIImageView *)coverImageView{
    if (!_coverImageView) {
        @jobs_weakify(self)
        _coverImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.userInteractionEnabled = YES;
            imageView.tag = kPlayerViewTag;//不写这个光有声音没有图像
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [self.contentView.addSubview(imageView) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.contentView);
            }];
        });
    }return _coverImageView;
}

-(JobsRightBtnsView *)rbView{
    if (!_rbView) {
        _rbView = JobsRightBtnsView.new;
        _rbView.jobsRichViewByModel(nil);
//        @jobs_weakify(self)
        [_rbView actionObjBlock:^(id data) {
//            @jobs_strongify(self)
        }];
        [self.contentView.addSubview(_rbView) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(JobsWidth(-150));
            make.size.mas_equalTo(JobsRightBtnsView.viewSizeByModel(nil));
        }];
    }return _rbView;
}

-(UIButton *)rotation{
    if (!_rotation){
        @jobs_weakify(self)
        _rotation = UIButton.initByNormalImage(JobsIMG(@"zfplayer_rotaiton"))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                JobsLog(@"");
                if ([self.delegate respondsToSelector:@selector(zf_douyinRotation)]) [self.delegate zf_douyinRotation];
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        [self.contentView.addSubview(_rotation) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(50), JobsWidth(50)));
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
        }];
    }return _rotation;
}

@end
