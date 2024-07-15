//
//  XXTools.m
//  Feidegou
//
//  Created by Kite on 2019/11/29.
//  Copyright © 2019 朝花夕拾. All rights reserved.
//

#import "XXTools.h"

@interface  XXTools()

@property(nonatomic,strong)UIImageView *labView;
@property(nonatomic,strong)UILabel *lab2;

@end

@implementation XXTools

- (NSArray *)addMarkLabelWithText:(NSString *)text
                         maxWidth:(CGFloat)width
                        superView:(UIView *)superView
                     cornerRadius:(CGFloat)cornerRadius{
    //1、父视图切角,多余部分不显示
    superView.clipsToBounds = YES;
    //2、展示容器图片
    self.labView.frame = CGRectMake(-width/2,
                                    -width/2,
                                    width,
                                    width);
    self.labView.backgroundColor = JobsYellowColor;
    self.labView.clipsToBounds = YES;
    self.labView.layer.cornerRadius = cornerRadius;
    self.labView.transform = CGAffineTransformMakeRotation(-M_PI_4);
    [superView addSubview:self.labView];
    //3、展示文字
    self.lab2.frame = CGRectMake(-width/4,
                                 -width/4,
                                 width,
                                 width);
    self.lab2.text = text;
    self.lab2.textColor = JobsRedColor;
    self.lab2.textAlignment = NSTextAlignmentCenter;
    if (@available(iOS 8.2, *)) {
        self.lab2.font = [UIFont systemFontOfSize:10 weight:-0.4];
    } else {
        self.lab2.font = [UIFont systemFontOfSize:10 weight:UIFontWeightRegular];
    }
    self.lab2.backgroundColor = JobsClearColor;//lab2 不要颜色
    self.lab2.transform = CGAffineTransformMakeRotation(-M_PI_4);
    [superView addSubview:self.lab2];
    return @[self.labView,self.lab2];
}

#pragma mark —— lazyLoad
-(UIImageView *)labView{
    if (!_labView) {
        _labView = UIImageView.new;
    }return _labView;
}

-(UILabel *)lab2{
    if (!_lab2) {
        _lab2 = UILabel.new;
    }return _lab2;
}

@end

