//
//  ZMJCell+CustomView.m
//  Casino
//
//  Created by Jobs on 2021/12/8.
//

#import "ZMJCell+CustomView.h"

@implementation ZMJCell (CustomView)
#pragma mark —— @property(nonatomic,strong)UIButton *btn;
JobsKey(_btn)
@dynamic btn;
-(void)setBtn:(UIButton *)btn{
    Jobs_setAssociatedRETAIN_NONATOMIC(_btn, btn);
}

-(UIButton *)btn{
    UIButton *Btn = Jobs_getAssociatedObject(_btn);
    if (!Btn) {
        Btn = UIButton.new;
        Btn.frame = self.bounds;
        Btn.userInteractionEnabled = NO;//❤️cell上加button，要相应cell协议就要关闭button的userInteractionEnabled，如果要相应Button则需要打开
        Btn.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        Btn.titleLabel.font = [UIFont boldSystemFontOfSize:10.f];
        Btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        Btn.titleLabel.numberOfLines = 0;
        [self.contentView addSubview:Btn];
        Jobs_setAssociatedRETAIN_NONATOMIC(_btn, Btn);
    }return Btn;
}
#pragma mark —— @property(nonatomic,strong)UIView *colorBarView;
JobsKey(_colorBarView)
@dynamic colorBarView;
-(void)setColorBarView:(UIView *)colorBarView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_colorBarView, colorBarView);
}

-(UIView *)colorBarView{
    UIView *ColorBarView = Jobs_getAssociatedObject(_colorBarView);
    if (!ColorBarView) {
        @jobs_weakify(self)
        ColorBarView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view.backgroundColor = self.color;
            view.frame = CGRectInset(self.bounds, 2, 2);
            [self.contentView addSubview:view];
        });Jobs_setAssociatedRETAIN_NONATOMIC(_colorBarView, ColorBarView);
    }return ColorBarView;
}
#pragma mark —— @property(nonatomic,strong)UIColor *color;
JobsKey(_color)
@dynamic color;
-(void)setColor:(UIColor *)color{
    Jobs_setAssociatedRETAIN_NONATOMIC(_color, color);
}

-(UIColor *)color{
    UIColor *Color = Jobs_getAssociatedObject(_color);
    if (!Color) {
        Color = JobsBlueColor;
        Jobs_setAssociatedRETAIN_NONATOMIC(_color, Color);
    }return Color;
}

@end

