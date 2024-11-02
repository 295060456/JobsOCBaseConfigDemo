//
//  UILabelWordRotatingVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/14.
//

#import "UILabelWordRotatingVC.h"

@interface UILabelWordRotatingVC ()

@property(nonatomic,strong)UILabel *label;

@end

@implementation UILabelWordRotatingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label.transformLayer(TransformLayerDirectionLeft);
}
#pragma mark —— LazyLoad
-(UILabel *)label{
    if (!_label) {
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
            @jobs_strongify(self)
            label.text = JobsInternationalization(@"输入的内容");
            label.font = UIFontWeightBoldSize(20);
            label.textColor = JobsBlueColor;
            label.frame = jobsMakeFrameByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
                data.jobsX = data.jobsY = data.jobsWidth = data.jobsHeight = JobsWidth(100);
            });[self.view addSubview:label];
        });
    }return _label;
}

@end
