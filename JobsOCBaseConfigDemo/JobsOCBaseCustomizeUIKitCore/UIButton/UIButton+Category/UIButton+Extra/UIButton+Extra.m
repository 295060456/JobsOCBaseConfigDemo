//
//  UIButton+Extra.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/18.
//

#import "UIButton+Extra.h"

@implementation UIButton (Extra)

-(jobsByNSIntegerBlock _Nonnull)makeBtnTitleByShowingType{
    @jobs_weakify(self)
    return ^(UILabelShowingType labelShowingType) {
        @jobs_strongify(self)
        [self.superview layoutIfNeeded];
        self.titleLabel.labelShowingType = labelShowingType;
        switch (labelShowingType) {
            case UILabelShowingType_01:{/// 一行显示。定宽、定高、定字体。多余部分用…表示（省略号的位置由NSLineBreakMode控制）
                self.titleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;// NSLineBreakByTruncatingHead、NSLineBreakByTruncatingMiddle、NSLineBreakByTruncatingTail
            }break;
            case UILabelShowingType_02:{/// 一行显示。定宽、定高、定字体。多余部分scrollerView
                /// 在不全局集成@implementation UILabel (AutoScroll)的前提下
                /// 要求本类是 BaseButton
            }break;
            case UILabelShowingType_03:{/// 一行显示。不定宽、定高、定字体。宽度自适应
                [self buttonAutoWidthByFont];
                self.uninstall(NSLayoutAttributeWidth);
            }break;
            case UILabelShowingType_04:{/// 一行显示。定宽、定高。缩小字体方式全展示
                self.buttonAutoFontByWidth();
            }break;
            case UILabelShowingType_05:{/// 多行显示。定宽、不定高、定字体
                self.titleLabel.numberOfLines = 0;
                self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;/// 自动折行设置【默认】需要提前设置imageTitleSpace
                self.uninstall(NSLayoutAttributeHeight);
                NSLog(@"%f,%f",self.width,self.height);
                NSLog(@"%@",self.titleForNormalState);
                CGSize size = [UILabel sizeWithText:self.titleForNormalState
                                               font:self.titleLabel.font
                                            maxSize:CGSizeMake(self.width, MAXFLOAT)];
                [self mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(size.height + self.imageView.height + self.imageTitleSpace);// 文字 + 图片 + 手动偏移量
                }];
                if (self.objectBlock) self.objectBlock(@(size.height));
            }break;
                
            default:
                break;
        }
    };
}

-(jobsByNSIntegerBlock _Nonnull)makeBtnSubTitleByShowingType{
    @jobs_weakify(self)
    return ^(UILabelShowingType labelShowingType) {
        @jobs_strongify(self)
        [self.superview layoutIfNeeded];
        self.subtitleLabel.labelShowingType = labelShowingType;
        switch (labelShowingType) {
            case UILabelShowingType_01:{/// 一行显示。定宽、定高、定字体。多余部分用…表示（省略号的位置由NSLineBreakMode控制）
                self.subtitleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;// NSLineBreakByTruncatingHead、NSLineBreakByTruncatingMiddle、NSLineBreakByTruncatingTail
            }break;
            case UILabelShowingType_02:{/// 一行显示。定宽、定高、定字体。多余部分scrollerView
                /// 在不全局集成@implementation UILabel (AutoScroll)的前提下
                /// 要求本类是 BaseButton
            }break;
            case UILabelShowingType_03:{/// 一行显示。不定宽、定高、定字体。宽度自适应
                self.buttonAutoWidthByFont();
                self.uninstall(NSLayoutAttributeWidth);
            }break;
            case UILabelShowingType_04:{/// 一行显示。定宽、定高。缩小字体方式全展示
                self.buttonAutoFontByWidth();
            }break;
            case UILabelShowingType_05:{/// 多行显示。定宽、不定高、定字体
                self.subtitleLabel.numberOfLines = 0;
                self.subtitleLabel.lineBreakMode = NSLineBreakByWordWrapping;/// 自动折行设置【默认】需要提前设置imageTitleSpace
                self.uninstall(NSLayoutAttributeHeight);
                NSLog(@"%f,%f",self.width,self.height);
                NSLog(@"%@",self.titleForNormalState);
                CGSize size = [UILabel sizeWithText:self.titleForNormalState
                                               font:self.subtitleLabel.font
                                            maxSize:CGSizeMake(self.width, MAXFLOAT)];
                [self mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(size.height + self.imageView.height + self.imageTitleSpace);// 文字 + 图片 + 手动偏移量
                }];
                if (self.objectBlock) self.objectBlock(@(size.height));
            }break;
                
            default:
                break;
        }
    };
}
#pragma mark —— BaseButtonProtocol
/// 具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)buttonWidthByModel{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.buttonWidthByModel(data);
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)buttonHeightByModel{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.buttonHeightByModel(data);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGSizeByIDBlock _Nonnull)buttonSizeByModel{
    @jobs_weakify(self)
    return ^CGSize(id _Nullable data){
        @jobs_strongify(self)
        return self.class.buttonSizeByModel(data);
    };
}
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGRectByIDBlock _Nonnull)buttonFrameByModel{
    @jobs_weakify(self)
    return ^CGRect(id _Nullable data){
        @jobs_strongify(self)
        return self.class.buttonFrameByModel(data);
    };
}
#pragma mark —— @property(nonatomic,assign)CGFloat imageTitleSpace;
JobsKey(_imageTitleSpace)
@dynamic imageTitleSpace;
-(CGFloat)imageTitleSpace{//默认不显示
    CGFloat ImageTitleSpace = [Jobs_getAssociatedObject(_imageTitleSpace) floatValue];
    return ImageTitleSpace;
}

-(void)setImageTitleSpace:(CGFloat)imageTitleSpace{
    Jobs_setAssociatedCOPY_NONATOMIC(_imageTitleSpace, @(imageTitleSpace))
}

@end
