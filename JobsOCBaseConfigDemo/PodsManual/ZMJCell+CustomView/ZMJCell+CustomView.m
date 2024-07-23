//
//  ZMJCell+CustomView.m
//  Casino
//
//  Created by Jobs on 2021/12/8.
//

#import "ZMJCell+CustomView.h"

@implementation ZMJCell (CustomView)

static char *ZMJCell_CustomView_btn = "ZMJCell_CustomView_btn";
@dynamic btn;

static char *ZMJCell_CustomView_colorBarView = "ZMJCell_CustomView_colorBarView";
@dynamic colorBarView;

static char *ZMJCell_CustomView_color = "ZMJCell_CustomView_color";
@dynamic color;

#pragma mark —— @property(nonatomic,strong)UIButton *btn;
-(UIButton *)btn{
    UIButton *Btn = objc_getAssociatedObject(self, ZMJCell_CustomView_btn);
    if (!Btn) {
        Btn = UIButton.new;
        Btn.frame = self.bounds;
        Btn.userInteractionEnabled = NO;//❤️cell上加button，要相应cell协议就要关闭button的userInteractionEnabled，如果要相应Button则需要打开
        Btn.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        Btn.titleLabel.font = [UIFont boldSystemFontOfSize:10.f];
        Btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        Btn.titleLabel.numberOfLines = 0;
        [self.contentView addSubview:Btn];
        objc_setAssociatedObject(self,
                                 ZMJCell_CustomView_btn,
                                 Btn,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }return Btn;
}

-(void)setBtn:(UIButton *)btn{
    objc_setAssociatedObject(self,
                             ZMJCell_CustomView_btn,
                             btn,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)UIView *colorBarView;
-(UIView *)colorBarView{
    UIView *ColorBarView = objc_getAssociatedObject(self, ZMJCell_CustomView_colorBarView);
    if (!ColorBarView) {
        ColorBarView = UIView.new;
        ColorBarView.backgroundColor = self.color;
        ColorBarView.frame = CGRectInset(self.bounds, 2, 2);
        [self.contentView addSubview:ColorBarView];
        objc_setAssociatedObject(self,
                                 ZMJCell_CustomView_colorBarView,
                                 ColorBarView,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }return ColorBarView;
}

-(void)setColorBarView:(UIView *)colorBarView{
    objc_setAssociatedObject(self,
                             ZMJCell_CustomView_colorBarView,
                             colorBarView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)UIColor *color;
-(UIColor *)color{
    UIColor *Color = objc_getAssociatedObject(self, ZMJCell_CustomView_color);
    if (!Color) {
        Color = JobsBlueColor;
        objc_setAssociatedObject(self,
                                 ZMJCell_CustomView_color,
                                 Color,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }return Color;
}

-(void)setColor:(UIColor *)color{
    objc_setAssociatedObject(self,
                             ZMJCell_CustomView_color,
                             color,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

