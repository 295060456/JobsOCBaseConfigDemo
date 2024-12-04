//
//  NSObject+Measure.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/8/18.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "NSObject+Measure.h"

@implementation NSObject (Measure)
#pragma mark —— UIViewModelProtocol
/// 方位
@dynamic cornerRadius;
@dynamic jobsWidth;
@dynamic jobsHeight;
@dynamic jobsTop;
@dynamic jobsLeft;
@dynamic jobsRight;
@dynamic jobsBottom;
@dynamic jobsSize;
@dynamic jobsRect;
@dynamic jobsPoint;
@dynamic offsetXForEach;
@dynamic offsetYForEach;
@dynamic offsetHeight;
@dynamic offsetWidth;
@dynamic axis;
@dynamic distribution;
@dynamic alignment;
@dynamic buttonEdgeInsetsStyle;
/// 标记📌
@dynamic indexPath;
@dynamic section;
@dynamic row;
@dynamic item;
@dynamic lastPoint;
@dynamic index;
@dynamic currentPage;
@dynamic pageSize;
/// 已知父控件和子控件的宽度或者高度，当父控件为X轴或者Y轴中心的时候，子控件的X 和 Y 是多少？
/// @param subview 子控件的宽 或者 高
/// @param superview 父控件的宽 或者 高
+(CGFloat)measureSubview:(CGFloat)subview
               superview:(CGFloat)superview{
    return (superview - subview) / 2;
}
#pragma mark —— 几何数据类型的比较
/// 比较 size ？= CGSizeZero
-(JobsReturnBOOLBySizeBlock _Nonnull)isSizeZero{
    return ^BOOL(CGSize size){
        return jobsZeroSizeValue(size);
    };
}
/// 比较 point ？= CGPointZero
-(JobsReturnBOOLByPointBlock _Nonnull)isPointZero{
    return ^BOOL(CGPoint point){
        return jobsZeroPointValue(point);
    };
}
/// 比较 rect ？= CGRectZero
-(JobsReturnBOOLByFrameBlock _Nonnull)isRectZero{
    return ^(CGRect frame){
        return jobsEqualToZeroRect(frame);
    };
}
/// 比较 rect1 ？= rect2
-(BOOL)rect1:(CGRect)rect1
isEqualToRect2:(CGRect)rect2{
    return CGRectEqualToRect(rect1, rect2);
}
/// 比较 point1 ？= point2
-(BOOL)point1:(CGPoint)point1
isEqualToPoint2:(CGPoint)point2{
    return CGPointEqualToPoint(point1, point2);
}
/// 比较 size1 ？= size2
-(BOOL)size1:(CGSize)size1
isEqualToSize2:(CGSize)size2{
    return CGSizeEqualToSize(size1, size2);
}
/// UILabel多行文本的高度（定宽）：根据文本+字体+控件宽度+提行模式，计算高度
-(CGFloat)jobsGetLabelHeightByWidth:(CGFloat)width
                              title:(NSString *)title
                               font:(UIFont *)font{
    return ceil(jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label.frame = CGRectMake(0, 0, width, 0);
        label.text = title;
        label.font = font;
        label.numberOfLines = 0;
        [label sizeToFit];
    }).frame.size.height);
}
/// UILabe单行文本的宽度：根据字体计算单行文本的宽度
-(CGSize)jobsGetLabelWidthWithTitle:(NSString *)title font:(UIFont *)font{
    return [title sizeWithAttributes:jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
        if(font) [data setValue:font forKey:NSFontAttributeName];
    })];
}
/// UILabel多行文本的行数（定宽）：根据文本+字体+控件宽度+提行模式，计算行数
-(NSInteger)jobsGetLineNumsByWidth:(CGFloat)width
                             title:(NSString *)title
                              font:(UIFont *)font{
    UILabel *label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label.frame = CGRectMake(0, 0, width, 0);
        label.text = title;
        label.font = font;
        label.numberOfLines = 0;
        [label sizeToFit];
    });
    CGFloat height = label.frame.size.height;
    /// 先用UILabel的 sizeToFit 计算出最佳大小，然后用高度/lineHeight就是行数，lineHeight为UIFont的属性
    return ceil(height) / label.font.lineHeight;
}

@end
