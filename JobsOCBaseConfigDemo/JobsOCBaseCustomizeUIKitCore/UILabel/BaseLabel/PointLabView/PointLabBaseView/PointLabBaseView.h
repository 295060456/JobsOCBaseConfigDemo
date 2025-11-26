//
//  PointLabView.h
//  FM
//
//  Created by User on 8/15/24.
//

#import "BaseView.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
/// 文本前面有个小圆点
@interface PointLabBaseView : BaseView

-(UIView *)pointView;
-(UILabel *)label;

-(jobsByCGFloatBlock _Nonnull)updatePointViewPositionWithOffsetY;
-(jobsByCGFloatBlock _Nonnull)updateLabelPositionWithOffsetX;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof PointLabBaseView *_Nonnull jobsMakePointLabView(jobsByPointLabBaseViewBlock _Nonnull block){
    PointLabBaseView *data = PointLabBaseView.alloc.init;
    if (block) block(data);
    return data;
}
/**
 -(void)layoutSubviews{
     [super layoutSubviews];
     self.tipsLab.updatePointViewPositionWithOffsetY(10);
     self.tipsLab updateLabelPositionWithOffsetX(20);
 }
 
 -(PointLabView *)tipsLab{
     if(!_tipsLab){
         @jobs_weakify(self)
         _tipsLab = jobsMakePointLabView(^(__kindof PointLabBaseView * _Nullable view) {
             @jobs_strongify(self)
             view.pointView.backgroundColor = JobsCor(@"#D0D0D0");
             view.pointView.cornerCutToCircleWithCornerRadius(JobsWidth(4));
             view.label.text = @"Your deposit will be successfully credited to your wallet once the transaction completed.".tr;
             view.label.textColor = JobsCor(@"#D0D0D0");
             view.label.font = UIFontWeightRegularSize(JobsWidth(12));
             view.label.textAlignment = NSTextAlignmentLeft;
             view.label.numberOfLines = 0;
             view.label.lineBreakMode = NSLineBreakByWordWrapping;
             view.label.backgroundColor = JobsClearColor.colorWithAlphaComponentBy(0);
             view.backgroundColor = JobsClearColor.colorWithAlphaComponentBy(0);
             [self.addSubview(_tipsLab) mas_makeConstraints:^(MASConstraintMaker *make) {
                 make.centerX.equalTo(self);
                 make.top.equalTo(self.tableView.mas_bottom).offset(JobsWidth(0));
                 make.width.mas_equalTo(JobsWidth(256));
             }];
             view.label.makeLabelByShowingType(UILabelShowingType_05);
         });
     }return _tipsLab;
 }
 
 */
