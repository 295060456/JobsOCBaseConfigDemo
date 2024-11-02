//
//  UILabel+Extra.m
//  Casino
//
//  Created by Jobs on 2021/12/27.
//

#import "UILabel+Extra.h"

@implementation UILabel (Extra)
#pragma mark —— 一些公共方法
/// UILabel文字旋转
-(jobsByNSUIntegerBlock _Nonnull)transformLayer{
    @jobs_weakify(self)
    return ^(TransformLayerDirectionType directionType){
        @jobs_strongify(self)
        /**
         资料来源：
         https://www.jianshu.com/p/3a08ef4762ac
         https://github.com/wuzhenweichn/TextDirection
         */
        self.transformLayerDirectionType = directionType;
        [self.layer addSublayer:self.shapeLayer];
        self.textColor = JobsClearColor;
    };
}
/// 通过传入的(UIImage *)bgImage 来设置背景颜色
-(jobsByImageBlock _Nonnull)lbBackgroundImage{
    @jobs_weakify(self)
    return ^(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.backgroundColor = self.byPatternImage(data);
    };
}
/// 设置UILabel的显示样式 【在Masonry以后拿到了frame】
-(jobsByNSIntegerBlock _Nonnull)makeLabelByShowingType{
    @jobs_weakify(self)
    return ^(UILabelShowingType labelShowingType) {
        @jobs_strongify(self)
        /// 先刷新得出Label的frame.及其Size
        [self.superview layoutIfNeeded];
        self.labelShowingType = labelShowingType;
        switch (labelShowingType) {
            case UILabelShowingType_01:{///  一行显示。定宽、定高、定字体。多余部分用…表示（省略号的位置由NSLineBreakMode控制）
                if (self.width && self.height) {
                    self.lineBreakMode = NSLineBreakByTruncatingMiddle;// NSLineBreakByTruncatingHead、NSLineBreakByTruncatingMiddle、NSLineBreakByTruncatingTail
                }
            }break;
            case UILabelShowingType_02:{/// 一行显示。定宽、定高、定字体。多余部分scrollerView
                /// 在不全局集成@implementation UILabel (AutoScroll)的前提下
                /// 要求本类是 BaseLabel
            }break;
            case UILabelShowingType_03:{/// 一行显示。不定宽、不定高、定字体。宽高自适应 【单行：ByFont】 可以不要高
                if (self.height) {
                    self.labelAutoWidthByFont();
                    if (self.width) {
                        self.uninstall(NSLayoutAttributeWidth);// 强制
                    }
                }
            }break;
            case UILabelShowingType_04:{/// 一行显示。定宽、定高。缩小字体方式全展示 【单行：ByWidth】
                if (self.width && self.height) {
                    self.labelAutoFontByWidth();
                }
            }break;
            case UILabelShowingType_05:{/// 多行显示。定宽、不定高、定字体 【多行：ByFont】
                if (self.width) {
                    self.numberOfLines = 0;
                    self.lineBreakMode = NSLineBreakByWordWrapping;/// 自动折行设置【默认】
                    if (self.height) {
                        self.uninstall(NSLayoutAttributeHeight);
                    }
                }
            }break;
                
            default:
                break;
        }
    };
}
#pragma mark —— @property(nonatomic,assign)UILabelShowingType labelShowingType;
JobsKey(_labelShowingType)
@dynamic labelShowingType;
-(UILabelShowingType)labelShowingType{
    return [Jobs_getAssociatedObject(_labelShowingType) integerValue];
}

-(void)setLabelShowingType:(UILabelShowingType)labelShowingType{
    Jobs_setAssociatedRETAIN_NONATOMIC(_labelShowingType, @(labelShowingType))
}
#pragma mark —— @property(nonatomic,assign)CGFloat value;
JobsKey(_value)
@dynamic value;
-(CGFloat)value{
    return [Jobs_getAssociatedObject(_value) floatValue];
}

-(void)setValue:(CGFloat)value{
    Jobs_setAssociatedRETAIN_NONATOMIC(_value, @(value));
}
#pragma mark —— @property(nonatomic,assign)CGFloat lastValue;
JobsKey(_lastValue)
@dynamic lastValue;
-(CGFloat)lastValue{
    return [Jobs_getAssociatedObject(_lastValue) floatValue];
}

-(void)setLastValue:(CGFloat)lastValue{
    Jobs_setAssociatedRETAIN_NONATOMIC(_lastValue, @(lastValue));
}
#pragma mark —— @property(nonatomic,strong)CAShapeLayer *shapeLayer;
JobsKey(_shapeLayer)
@dynamic shapeLayer;
-(CAShapeLayer *)shapeLayer{
    CAShapeLayer *ShapeLayer = Jobs_getAssociatedObject(_shapeLayer);
    if (!ShapeLayer) {
        ShapeLayer = [self.text animateOnView:self
                                       atRect:self.bounds
                                      forFont:self.font
                                    withColor:self.textColor
                                 andDirection:self.transformLayerDirectionType];
        Jobs_setAssociatedRETAIN_NONATOMIC(_shapeLayer, ShapeLayer);
    }return ShapeLayer;
}

-(void)setShapeLayer:(CAShapeLayer *)shapeLayer{
    Jobs_setAssociatedRETAIN_NONATOMIC(_shapeLayer, shapeLayer);
}
#pragma mark —— @property(nonatomic,assign)TransformLayerDirectionType transformLayerDirectionType;
JobsKey(_transformLayerDirectionType)
@dynamic transformLayerDirectionType;
-(TransformLayerDirectionType)transformLayerDirectionType{
    return [Jobs_getAssociatedObject(_transformLayerDirectionType) unsignedIntegerValue];
}

-(void)setTransformLayerDirectionType:(TransformLayerDirectionType)transformLayerDirectionType{
    Jobs_setAssociatedRETAIN_NONATOMIC(_transformLayerDirectionType, @(transformLayerDirectionType))
}

@end
