//
//  UIView+BackgroundImage.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2021/1/22.
//  Copyright © 2021 MonkeyKingVideo. All rights reserved.
//

#import "UIView+BackgroundImage.h"

@implementation UIView (BackgroundImage)
/**
 【特别指出】
 如果self 是 诸如UICollectionViewCell 或者UITableViewCell,即：
 存在 self.contentView
 如果上面覆盖一个按钮，则需要[self.contentView addSubview:self.backgroundImageView];
 否则按钮点击事件被截断
 */
#pragma mark —— @property(nonatomic,strong)UIImageView *backgroundImageView;
JobsKey(_backgroundImageView)
@dynamic backgroundImageView;
-(UIImageView *)backgroundImageView{
    UIImageView *BackgroundImageView = Jobs_getAssociatedObject(_backgroundImageView);
    if (!BackgroundImageView) {
        @jobs_weakify(self)
        BackgroundImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.userInteractionEnabled = YES;
            imageView.contentMode = UIViewContentModeScaleToFill;
            self.backgroundColor = JobsClearColor;
            if ([self isKindOfClass:UICollectionViewCell.class]) {
                UICollectionViewCell *cell = (UICollectionViewCell *)self;
                cell.contentView.addSubview(imageView);
                [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(cell.contentView);
                }];
            }else if ([self isKindOfClass:UITableViewCell.class]){
                UITableViewCell *cell = (UITableViewCell *)self;
                cell.contentView.addSubview(imageView);
                [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(cell.contentView);
                }];
            }else{
                self.addSubview(BackgroundImageView);
                [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                }];
            }imageView.layer.zPosition = -1;// 设置层级关系
            Jobs_setAssociatedRETAIN_NONATOMIC(_backgroundImageView, imageView)
        });
    }return BackgroundImageView;
}

-(void)setBackgroundImageView:(UIImageView *)backgroundImageView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_backgroundImageView, backgroundImageView)
}

@end
