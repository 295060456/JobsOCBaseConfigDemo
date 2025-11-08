//
//  UILabel+Extra.m
//  Casino
//
//  Created by Jobs on 2021/12/27.
//

#import "UILabel+Extra.h"

@implementation UILabel (Extra)
#pragma mark —— 一些公共方法
/// 将label.text + label.textColor + label.font;包装成富文本
-(__kindof NSMutableAttributedString *)makeAttributedStringBySelfText{
    return NSMutableAttributedString.initByAttributedString([NSAttributedString.alloc initWithString:self.text
                                                                                          attributes:@{
        NSForegroundColorAttributeName: self.textColor,
        NSFontAttributeName: self.font
        }
    ]);
}
/// UILabel文字旋转
-(JobsRetLabelByNSUIntegerBlock _Nonnull)transformLayer{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(TransformLayerDirectionType directionType){
        @jobs_strongify(self)
        /**
         资料来源：
         https://www.jianshu.com/p/3a08ef4762ac
         https://github.com/wuzhenweichn/TextDirection
         */
        self.transformLayerDirectionType = directionType;
        self.layer.addSublayer(self.shapeLayer);
        self.textColor = JobsClearColor;
        return self;
    };
}
/// 通过传入的(UIImage *)bgImage 来设置背景颜色
-(JobsRetLabelByImage _Nonnull)bgImage{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.backgroundColor = self.byPatternImage(data);
        return self;
    };
}
/// 设置UILabel的显示样式 【在Masonry以后拿到了frame】
-(JobsRetLabelByNSUIntegerBlock _Nonnull)makeLabelByShowingType{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(UILabelShowingType labelShowingType) {
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
            case UILabelShowingType_03:{/// 一行显示。不定宽、定高、定字体。宽度自适应 【单行：ByFont】
                if (self.height) {
                    self.labelAutoWidthByFont();
                    if (self.width) self.uninstall(NSLayoutAttributeWidth);// 强制
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
                    if (self.height) self.uninstall(NSLayoutAttributeHeight);
                }
            }break;
            default:break;
        }return self;
    };
}
#pragma mark —— 系统方法链式语法封装
-(JobsRetLabelByAttributedString _Nonnull)byAttributedString{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof NSAttributedString *_Nullable attributedString){
        @jobs_strongify(self)
        self.attributedText = attributedString;
        return self;
    };
}

-(JobsRetLabelByCor _Nonnull)byBgCor{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.backgroundColor = cor;
        return self;
    };
}

-(JobsRetLabelByText _Nonnull)byText{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof NSString *_Nullable str){
        @jobs_strongify(self)
        self.text = str;
        return self;
    };
}

-(JobsRetLabelByText _Nonnull)byNextText{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof NSString *_Nullable str){
        @jobs_strongify(self)
        self.text = self.text.add(str);
        return self;
    };
}

-(JobsRetLabelByAttributedString _Nonnull)byNextAttributedText{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof NSAttributedString *_Nullable attributedString){
        @jobs_strongify(self)
        self.attributedText = self.text.addByAttributedString(attributedString);
        return self;
    };
}

-(JobsRetLabelByAttributedString _Nonnull)byNextAttributedTextWithvalue{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof NSAttributedString *_Nullable attributedString){
        @jobs_strongify(self)
        self.attributedText = self.makeAttributedStringBySelfText.add(attributedString);
        return self;
    };
}

-(JobsRetLabelByCor _Nonnull)byTextCor{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.textColor = cor;
        return self;
    };
}

-(JobsRetLabelByFont _Nonnull)byFont{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof UIFont *_Nullable font){
        @jobs_strongify(self)
        self.font = font;
        return self;
    };
}

-(JobsRetLabelByTextAlignment _Nonnull)byTextAlignment{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(NSTextAlignment textAlignment){
        @jobs_strongify(self)
        self.textAlignment = textAlignment;
        return self;
    };
}
#pragma mark —— Prop_assign()UILabelShowingType labelShowingType;
JobsKey(_labelShowingType)
@dynamic labelShowingType;
-(UILabelShowingType)labelShowingType{
    return [Jobs_getAssociatedObject(_labelShowingType) integerValue];
}

-(void)setLabelShowingType:(UILabelShowingType)labelShowingType{
    Jobs_setAssociatedRETAIN_NONATOMIC(_labelShowingType, @(labelShowingType))
}
#pragma mark —— Prop_assign()CGFloat value;
JobsKey(_value)
@dynamic value;
-(CGFloat)value{
    return [Jobs_getAssociatedObject(_value) floatValue];
}

-(void)setValue:(CGFloat)value{
    Jobs_setAssociatedRETAIN_NONATOMIC(_value, @(value));
}
#pragma mark —— Prop_assign()CGFloat lastValue;
JobsKey(_lastValue)
@dynamic lastValue;
-(CGFloat)lastValue{
    return [Jobs_getAssociatedObject(_lastValue) floatValue];
}

-(void)setLastValue:(CGFloat)lastValue{
    Jobs_setAssociatedRETAIN_NONATOMIC(_lastValue, @(lastValue));
}
#pragma mark —— Prop_strong()CAShapeLayer *shapeLayer;
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
#pragma mark —— Prop_assign()TransformLayerDirectionType transformLayerDirectionType;
JobsKey(_transformLayerDirectionType)
@dynamic transformLayerDirectionType;
-(TransformLayerDirectionType)transformLayerDirectionType{
    return [Jobs_getAssociatedObject(_transformLayerDirectionType) unsignedIntegerValue];
}

-(void)setTransformLayerDirectionType:(TransformLayerDirectionType)transformLayerDirectionType{
    Jobs_setAssociatedRETAIN_NONATOMIC(_transformLayerDirectionType, @(transformLayerDirectionType))
}

@end
