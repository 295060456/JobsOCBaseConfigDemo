//
//  UIButton+ImageTitleSpacing.m
//  Intelligent_Fire
//
//  Created by 高磊 on 2016/12/19.
//  Copyright © 2016年 高磊. All rights reserved.
//

#import "UIButton+ImageTitleSpacing.h"

@implementation UIButton (ImageTitleSpacing)

-(void)layoutButtonWithEdgeInsetsStyle:(NSDirectionalRectEdge)style
                          imagePadding:(CGFloat)imagePadding{
    if (self.deviceSystemVersion.floatValue >= 15.0) {
/**
 利用 UIButtonConfiguration 来解决问题，示例：
 -(UIButtonConfiguration *)btnConfig{
     if(!_btnConfig){
         _btnConfig = UIButtonConfiguration.filledButtonConfiguration;
         {// 图片
             _btnConfig.image = JobsIMG(@"入职Mata"); // 替换为你的图像名称
             _btnConfig.imagePlacement = NSDirectionalRectEdgeLeading;// 这里将图像放置在标题的前面
             _btnConfig.imagePadding = 10;// 设置图像与标题之间的间距
         }
         
         {// 一般的文字
             _btnConfig.title = JobsInternationalization(@"入职Mata");
             _btnConfig.subtitle = @"";
             _btnConfig.baseForegroundColor = UIColor.blackColor;// 前景颜色（= 文字颜色）
         }
         
         {// 富文本
             // 设置按钮标题的文本属性
             _btnConfig.titleTextAttributesTransformer = ^NSDictionary<NSAttributedStringKey, id> *(NSDictionary<NSAttributedStringKey, id> *textAttributes) {
                 NSMutableDictionary<NSAttributedStringKey, id> *newTextAttributes = textAttributes.mutableCopy;
                 [newTextAttributes addEntriesFromDictionary:@{
                     NSFontAttributeName:UIFontWeightRegularSize(14), // 替换为你想要的字体和大小
                     NSForegroundColorAttributeName: UIColor.blackColor // 替换为你想要的文本颜色
                 }];
                 return newTextAttributes.copy;
             };
             _btnConfig.attributedTitle = [NSAttributedString.alloc initWithString:JobsInternationalization(@"入职Mata") attributes:@{NSForegroundColorAttributeName:UIColor.blackColor}];
         }
         
         {// 其他
             _btnConfig.baseBackgroundColor = UIColor.whiteColor;// 背景颜色
             _btnConfig.contentInsets = NSDirectionalEdgeInsetsMake(0, 0, 0, 0); // 内边距
         }
     }return _btnConfig;
 }

 -(UIButton *)btn1{
     if(!_btn1){
         if(self.deviceSystemVersion.floatValue >= 15.0){
             _btn1 = [UIButton buttonWithConfiguration:self.btnConfig primaryAction:nil];
         }else{
             _btn1 = UIButton.new;
             _btn1.normalImage = JobsIMG(@"入职Mata");
             _btn1.titleFont = UIFontWeightRegularSize(14);
             _btn1.normalTitle = JobsInternationalization(@"入职Mata");
             _btn1.normalTitleColor = JobsBlackColor;
         }
         // 添加按钮到视图中
         [self addSubview:_btn1];
         [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
             make.size.mas_equalTo(CGSizeMake(JobsWidth(85), JobsWidth(16)));
             make.centerY.equalTo(self);
             make.left.equalTo(self).offset(JobsWidth(6));
         }];
         if(self.deviceSystemVersion.floatValue < 15.0){
             [_btn1 layoutButtonWithEdgeInsetsStyle:NSDirectionalRectEdgeLeading imagePadding:JobsWidth(8)];
         }
     }return _btn1;
 }
 */
    }
    SuppressWdeprecatedDeclarationsWarning(
                                           /**
                                            *  知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
                                            *  如果只有title，那它上下左右都是相对于button的，image也是一样；
                                            *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
                                            */
                                               
                                           // 1、 得到imageView和titleLabel的宽、高
                                           CGFloat imageWith = self.imageView.image.size.width;
                                           CGFloat imageHeight = self.imageView.image.size.height;
                                           
                                           CGFloat labelWidth = 0.0;
                                           CGFloat labelHeight = 0.0;
                                           
                                           /// 由于iOS8中titleLabel的size为0
                                           labelWidth = HDDeviceSystemVersion.floatValue >= 8.0 ? self.titleLabel.intrinsicContentSize.width : self.titleLabel.width;
                                           labelHeight = HDDeviceSystemVersion.floatValue >= 8.0 ? self.titleLabel.intrinsicContentSize.height : self.titleLabel.height;
             
                                           // 2、 声明全局的imageEdgeInsets和labelEdgeInsets
                                           UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
                                           UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
                                           // 3.、根据style和space得到imageEdgeInsets和labelEdgeInsets的值
                                           switch (style) {
                                               case NSDirectionalRectEdgeTop:{
                                                   imageEdgeInsets = UIEdgeInsetsMake(-labelHeight - imagePadding / 2.0,
                                                                                      0,
                                                                                      0,
                                                                                      -labelWidth);
                                                   labelEdgeInsets = UIEdgeInsetsMake(0,
                                                                                      -imageWith,
                                                                                      -imageHeight - imagePadding / 2.0,
                                                                                      0);
                                               }break;
                                               case NSDirectionalRectEdgeLeading:{
                                                   imageEdgeInsets = UIEdgeInsetsMake(0,
                                                                                      -imagePadding / 2.0,
                                                                                      0,
                                                                                      imagePadding / 2.0);
                                                   labelEdgeInsets = UIEdgeInsetsMake(0,
                                                                                      imagePadding / 2.0,
                                                                                      0,
                                                                                      -imagePadding / 2.0);
                                               }break;
                                               case NSDirectionalRectEdgeBottom:{
                                                   imageEdgeInsets = UIEdgeInsetsMake(0,
                                                                                      0,
                                                                                      -labelHeight - imagePadding / 2.0,
                                                                                      -labelWidth);
                                                   labelEdgeInsets = UIEdgeInsetsMake(-imageHeight - imagePadding / 2.0,
                                                                                      -imageWith,
                                                                                      0,
                                                                                      0);
                                               }break;
                                               case NSDirectionalRectEdgeTrailing:{
                                                   imageEdgeInsets = UIEdgeInsetsMake(0,
                                                                                      labelWidth + imagePadding / 2.0,
                                                                                      0,
                                                                                      -labelWidth - imagePadding / 2.0);
                                                   labelEdgeInsets = UIEdgeInsetsMake(0,
                                                                                      -imageWith - imagePadding / 2.0,
                                                                                      0,
                                                                                      imageWith + imagePadding / 2.0);
                                               }break;
                                               default:
                                                   break;
                                           }
                                           // 4、 赋值
                                           self.titleEdgeInsets = labelEdgeInsets;
                                           self.imageEdgeInsets = imageEdgeInsets;
                                           );
}

@end
