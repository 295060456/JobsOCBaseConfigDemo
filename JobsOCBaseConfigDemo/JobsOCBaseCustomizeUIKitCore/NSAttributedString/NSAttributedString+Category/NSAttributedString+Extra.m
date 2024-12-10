//
//  NSAttributedString+Extra.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import "NSAttributedString+Extra.h"

@implementation NSAttributedString (Extra)
/// 对系统方法 initWithString 的二次封装
+(JobsReturnAttributedStringByStringBlock _Nonnull)initByString{
    return ^__kindof NSAttributedString *_Nullable(NSString *_Nullable data){
        return [NSAttributedString.alloc initWithString:data];
    };
}
/// 获取 NSAttributedString.文本字体
-(JobsReturnFontByVoidBlock _Nonnull)attributedStringFont{
    @jobs_weakify(self)
    return ^UIFont * _Nullable() {
        @jobs_strongify(self)
        return [self attribute:NSFontAttributeName atIndex:0 effectiveRange:NULL];
    };
}
/// 获取 NSAttributedString.文本颜色
-(JobsReturnFontByVoidBlock _Nonnull)attributedStringTextCor{
    @jobs_weakify(self)
    return ^UIFont * _Nullable() {
        @jobs_strongify(self)
        return [self attribute:NSForegroundColorAttributeName atIndex:0 effectiveRange:NULL];
    };
}
/// 获取 NSAttributedString.段落信息
-(JobsReturnParagraphStyleByVoidBlock _Nonnull)attributedStringParagraphStyle{
    @jobs_weakify(self)
    return ^NSParagraphStyle * _Nullable() {
        @jobs_strongify(self)
        NSRange range = NSMakeRange(0, self.length);
        NSDictionary *attributes = [self attributesAtIndex:0 effectiveRange:&range];
        NSParagraphStyle *paragraphStyle = attributes[NSParagraphStyleAttributeName];
        return paragraphStyle;
    };
}
/// 将富文本的颜色统一进行设置
-(JobsReturnAttributedStringByColorBlock _Nonnull)changeTextColorBy{
    return ^__kindof NSAttributedString *_Nullable(UIColor *_Nonnull data){
        if (!data) data = JobsWhiteColor;
        NSMutableAttributedString *mutableAttributedText = NSMutableAttributedString.initByAttributedString(self);
        [mutableAttributedText enumerateAttributesInRange:NSMakeRange(0, self.length)
                                                  options:0
                                               usingBlock:^(NSDictionary<NSAttributedStringKey, id>  *_Nonnull attrs,
                                                            NSRange range,
                                                            BOOL *_Nonnull stop) {
            NSMutableDictionary<NSAttributedStringKey, id> *newAttributes = attrs.mutableCopy;
            newAttributes[NSForegroundColorAttributeName] = data;
            if (newAttributes[NSLinkAttributeName]) newAttributes[NSForegroundColorAttributeName] = data;/// 检查超链接属性
            [mutableAttributedText setAttributes:newAttributes range:range];
        }];return mutableAttributedText.copy;
    };
}
/// 移除超链接属性
-(NSAttributedString *_Nonnull)removeHyperlinks{
    NSMutableAttributedString *mutableAttributedText = NSMutableAttributedString.initByAttributedString(self);
    [mutableAttributedText enumerateAttributesInRange:NSMakeRange(0, self.length)
                                              options:0
                                           usingBlock:^(NSDictionary<NSAttributedStringKey, id> *_Nonnull attrs,
                                                        NSRange range,
                                                        BOOL * _Nonnull stop) {
        // 如果存在超链接属性
        if (attrs[NSLinkAttributeName]) {
            NSMutableDictionary<NSAttributedStringKey, id> *newAttributes = attrs.mutableCopy;
            [newAttributes removeObjectForKey:NSLinkAttributeName]; /// 移除超链接属性
            [mutableAttributedText setAttributes:newAttributes range:range];
        }
    }];return mutableAttributedText.copy;
}

@end
