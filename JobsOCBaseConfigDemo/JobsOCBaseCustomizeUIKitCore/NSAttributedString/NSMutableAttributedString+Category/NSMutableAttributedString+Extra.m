//
//  NSMutableAttributedString+Extra.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import "NSMutableAttributedString+Extra.h"

@implementation NSMutableAttributedString (Extra)
/// 对系统方法 initWithAttributedString 的二次封装
+(JobsReturnAttributedStringByAttributedStringBlock _Nonnull)initByAttributedString{
    return ^__kindof NSAttributedString *_Nullable(NSAttributedString *_Nonnull data){
        return [NSMutableAttributedString.alloc initWithAttributedString:data];
    };
}
/// 对系统方法 initWithString 的二次封装
+(JobsReturnAttributedStringByStringBlock _Nonnull)initByString{
    return ^__kindof NSAttributedString *_Nullable(NSString *_Nullable data){
        return [NSMutableAttributedString.alloc initWithString:data];
    };
}
/// OC富文本字符串拼接
-(JobsReturnAttributedStringByAttributedStringBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^NSMutableAttributedString * _Nullable(NSAttributedString * _Nonnull data) {
        @jobs_strongify(self)
        if(!data) data = JobsAttributedString(@"");
        [self appendAttributedString:data];
        return self;
    };
}
/// 段落
-(jobsByParagraphStyleModelBlock _Nonnull)addAttributeNameByParagraphStyleModel{
    @jobs_weakify(self)
    return ^(__kindof JobsParagraphStyleModel *_Nullable data){
        @jobs_strongify(self)
        /// 检查 data 是否有效
        if (!data) return;/// data 为空
        /// 检查 value 是否有效
        if (!data.value) return;/// data.value 无效
        /// 检查 range 是否有效
        NSRange range = data.range;
        if (range.location == NSNotFound || NSMaxRange(range) > self.length) return;/// range 无效
        [self addAttribute:NSParagraphStyleAttributeName
                     value:data.value
                     range:data.range];
    };
}
/// 颜色
-(jobsByParagraphStyleModelBlock _Nonnull)addForegroundColorAttributeNameByParagraphStyleModel{
    @jobs_weakify(self)
    return ^(__kindof JobsParagraphStyleModel *_Nullable data){
        @jobs_strongify(self)
        /// 校验 data 是否有效
        if (!data || !data.value || ![data.value isKindOfClass:UIColor.class]) return;/// 无效的 data 或 value
        /// 校验 range 是否有效
        NSRange range = data.range;
        if (range.location == NSNotFound || NSMaxRange(range) > self.length) return;/// 无效的 range
        [self addAttribute:NSForegroundColorAttributeName
                     value:data.value
                     range:data.range];
    };
}
/// 字体
-(jobsByParagraphStyleModelBlock _Nonnull)addFontAttributeNameByParagraphStyleModel{
    @jobs_weakify(self)
    return ^(__kindof JobsParagraphStyleModel *_Nullable data){
        @jobs_strongify(self)
        /// 校验数据
        if (!data || !data.value || ![data.value isKindOfClass:UIFont.class]) return;/// 字体属性无效
        /// 校验 range
        NSRange range = data.range;
        if (range.location == NSNotFound || NSMaxRange(range) > self.length)  return;/// 字体属性 range 无效
        [self addAttribute:NSFontAttributeName
                     value:data.value
                     range:data.range];
    };
}
/// 设置下划线
-(jobsByParagraphStyleModelBlock _Nonnull)addUnderlineStyleAttributeNameByParagraphStyleModel{
    @jobs_weakify(self)
    return ^(__kindof JobsParagraphStyleModel *_Nullable data){
        @jobs_strongify(self)
        if(!data.value) return;
        /// 校验数据
        if (!data || !data.value || ![data.value isKindOfClass:NSNumber.class]) return;/// 下划线属性无效
        /// 校验 range
        NSRange range = data.range;
        if (range.location == NSNotFound || NSMaxRange(range) > self.length) return;/// 下划线属性 range 无效
        [self addAttribute:NSUnderlineStyleAttributeName
                     value:data.value
                     range:data.range];
    };
}
/// 设置下划线的颜色
-(jobsByParagraphStyleModelBlock _Nonnull)addUnderlineColorAttributeNameByParagraphStyleModel{
    @jobs_weakify(self)
    return ^(__kindof JobsParagraphStyleModel *_Nullable data){
        @jobs_strongify(self)
        if(!data.value) return;
        /// 校验数据
        if (!data || !data.value || ![data.value isKindOfClass:NSNumber.class]) return;/// 下划线属性无效
        /// 校验 range
        NSRange range = data.range;
        if (range.location == NSNotFound || NSMaxRange(range) > self.length) return;/// 下划线属性 range 无效
        [self addAttribute:NSUnderlineColorAttributeName
                     value:data.value
                     range:data.range];
    };
}
/// 超链接
-(jobsByParagraphStyleModelBlock _Nonnull)addLinkAttributeNameByParagraphStyleModel{
    @jobs_weakify(self)
    return ^(__kindof JobsParagraphStyleModel *_Nullable data){
        @jobs_strongify(self)
        /// 校验数据
        if (!data || !data.value) return;/// 超链接属性无效
        /// 校验 range
        NSRange range = data.range;
        if (range.location == NSNotFound || NSMaxRange(range) > self.length) return;/// 超链接属性 range 无效
        [self addAttribute:NSLinkAttributeName
                     value:data.value
                     range:data.range];
    };
}
/// 设置富文本的字符间距
-(jobsByParagraphStyleModelBlock _Nonnull)addkCTKernAttributeNameByParagraphStyleModel{
    @jobs_weakify(self)
    return ^(__kindof JobsParagraphStyleModel *_Nullable data){
        @jobs_strongify(self)
        if(!data.value) return;
        /// kCTKernAttributeName 是 Core Text 框架中的一个属性，用于控制字符之间的间距（字距）。
        [self addAttribute:(__bridge NSString *)kCTKernAttributeName
                     value:data.value
                     range:data.range];
    };
}

@end
