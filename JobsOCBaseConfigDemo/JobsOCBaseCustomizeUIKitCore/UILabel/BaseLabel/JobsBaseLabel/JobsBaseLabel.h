//
//  JobsBaseLabel.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/20.
//

#import "BaseLabel.h"

NS_ASSUME_NONNULL_BEGIN
/// UILabel实现背景图片
@interface JobsBaseLabel : UIView
#pragma mark —— 一些公有方法
-(UIImageView *)getBgImageView;
-(BaseLabel *)getLabel;

@end

NS_ASSUME_NONNULL_END
/**
 
 -(JobsBaseLabel *)titleLab{
     if (!_titleLab) {
         _titleLab = JobsBaseLabel.new;
         _titleLab.jobsRichViewByModel(nil);
         _titleLab.getLabel.offsetY = JobsWidth(-2);
         _titleLab.getLabel.textColor = JobsWhiteColor;
         _titleLab.getLabel.font = UIFontWeightRegularSize(12);
         _titleLab.getLabel.textAlignment = NSTextAlignmentCenter;
         [self.contentView addSubview:_titleLab];
         [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.left.equalTo(self.contentView);
             make.height.mas_equalTo(JobsWidth(26));
         }];
     }
     _titleLab.getLabel.text = JobsInternationalization(@" 真人           ");
     _titleLab.getBgImageView.image = JobsIMG(@"优惠活动背景图_真人");
     
     _titleLab.getLabel.makeLabelByShowingType(UILabelShowingType_03);
     [_titleLab.getLabel appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
     
     return _titleLab;
 }
 
 */
