//
//  PointLabView.h
//  FM
//
//  Created by User on 8/15/24.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
/// 文本前面有个小圆点
@interface PointLabBaseView : BaseView

-(UIView *)pointView;
-(UILabel *)label;

-(void)updatePointViewPositionWithOffsetY:(CGFloat)y;
-(void)updateLabelPositionWithOffsetX:(CGFloat)x;

@end

NS_ASSUME_NONNULL_END
/**
 -(void)layoutSubviews{
     [super layoutSubviews];
     [self.tipsLab updatePointViewPositionWithOffsetY:10];
     [self.tipsLab updateLabelPositionWithOffsetX:20];
 }
 
 -(PointLabView *)tipsLab{
     if(!_tipsLab){
         _tipsLab = PointLabView.new;
         _tipsLab.pointView.backgroundColor = JobsCor(@"#D0D0D0");
         _tipsLab.pointView.cornerCutToCircleWithCornerRadius(JobsWidth(4));
         _tipsLab.label.text = JobsInternationalization(@"Your deposit will be successfully credited to your wallet once the transaction completed.");
         _tipsLab.label.textColor = JobsCor(@"#D0D0D0");
         _tipsLab.label.font = UIFontWeightRegularSize(JobsWidth(12));
         _tipsLab.label.textAlignment = NSTextAlignmentLeft;
         _tipsLab.label.numberOfLines = 0;
         _tipsLab.label.lineBreakMode = NSLineBreakByWordWrapping;
         _tipsLab.label.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
         _tipsLab.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
         [self addSubview:_tipsLab];
         [_tipsLab mas_makeConstraints:^(MASConstraintMaker *make) {
             make.centerX.equalTo(self);
             make.top.equalTo(self.tableView.mas_bottom).offset(JobsWidth(0));
             make.width.mas_equalTo(JobsWidth(256));
         }];
         _tipsLab.label.makeLabelByShowingType(UILabelShowingType_05);
     }return _tipsLab;
 }
 
 */
