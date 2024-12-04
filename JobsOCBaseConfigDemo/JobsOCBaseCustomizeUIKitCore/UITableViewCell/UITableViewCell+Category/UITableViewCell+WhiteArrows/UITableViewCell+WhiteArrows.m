//
//  UITableViewCell+WhiteArrows.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/7/26.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "UITableViewCell+WhiteArrows.h"

@implementation UITableViewCell (WhiteArrows)
/// 必须 self.accessoryType = UITableViewCellAccessoryDisclosureIndicator; 打开后才可以启用
-(void)customAccessoryView:(jobsByIDBlock)customAccessoryViewBlock{
    /// 不用系统自带的箭头
    if (self.accessoryType == UITableViewCellAccessoryDisclosureIndicator) {
        @jobs_weakify(self)
        BaseButton *btn = BaseButton.initByBackgroundImage(self.img)
            .onClick(^(__kindof UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
                if (customAccessoryViewBlock) customAccessoryViewBlock(self);
        });
        /// 特比注意:如果这个地方是纯view（UIView、UIIMageView...）就可以不用加size，UIButton是因为受到了UIControl，需要接收一个size，否则显示不出来
        btn.sizer = self.arrows_size;
        btn.resetWidthByOffset(JobsWidth(5));
        self.accessoryView = btn;
    }
}
#pragma mark —— @property(nonatomic,strong)UIImage *img;
JobsKey(_img)
@dynamic img;
-(UIImage *)img{
    UIImage *image = Jobs_getAssociatedObject(_img);
    if (!image) {
        image = JobsIMG(@"WhiteRightArrow");
        Jobs_setAssociatedRETAIN_NONATOMIC(_img, image)
    }return image;
}

-(void)setImg:(UIImage *)img{
    Jobs_setAssociatedRETAIN_NONATOMIC(_img, img)
}
#pragma mark —— @property(nonatomic,assign)CGSize arrows_size;
JobsKey(_arrows_size)
@dynamic arrows_size;
-(CGSize)arrows_size{
    CGSize Size = [Jobs_getAssociatedObject(_arrows_size) CGSizeValue];
    if (jobsZeroSizeValue(Size)) {
        Size = CGSizeMake(JobsWidth(10), JobsWidth(18.3));//缺省值
        Jobs_setAssociatedRETAIN_NONATOMIC(_arrows_size, [NSValue valueWithCGSize:Size])
    }return Size;
}

-(void)setArrows_size:(CGSize)arrows_size{
    Jobs_setAssociatedRETAIN_NONATOMIC(_arrows_size, [NSValue valueWithCGSize:arrows_size])
}

@end
