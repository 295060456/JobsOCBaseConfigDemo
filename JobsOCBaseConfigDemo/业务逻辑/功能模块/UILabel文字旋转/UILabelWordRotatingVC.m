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
    [self.label transformLayer:TransformLayerDirectionLeft];
}
#pragma mark —— LazyLoad
-(UILabel *)label{
    if (!_label) {
        _label = UILabel.new;
        _label.text = @"输入的内容";
        _label.font = UIFontWeightBoldSize(20);
        _label.textColor = UIColor.blueColor;
        _label.frame = CGRectMake(100, 100, 100, 100);
        [self.view addSubview:_label];
    }return _label;
}

@end
