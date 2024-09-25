//
//  NSMutableAttributedString+Extra.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import "NSMutableAttributedString+Extra.h"

@implementation NSMutableAttributedString (Extra)
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
        if(!data.value) return;
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
        if(!data.value) return;
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
        if(!data.value) return;
        [self addAttribute:NSFontAttributeName
                     value:data.value
                     range:data.range];
    };
}
/// 下划线
-(jobsByParagraphStyleModelBlock _Nonnull)addUnderlineStyleAttributeNameByParagraphStyleModel{
    @jobs_weakify(self)
    return ^(__kindof JobsParagraphStyleModel *_Nullable data){
        @jobs_strongify(self)
        if(!data.value) return;
        [self addAttribute:NSFontAttributeName
                     value:data.value
                     range:data.range];
    };
}
/// 超链接
-(jobsByParagraphStyleModelBlock _Nonnull)addLinkAttributeNameByParagraphStyleModel{
    @jobs_weakify(self)
    return ^(__kindof JobsParagraphStyleModel *_Nullable data){
        @jobs_strongify(self)
        if(!data.value) return;
        [self addAttribute:NSLinkAttributeName
                     value:data.value
                     range:data.range];
    };
}

-(jobsByParagraphStyleModelBlock _Nonnull)addkCTKernAttributeNameByParagraphStyleModel{
    @jobs_weakify(self)
    return ^(__kindof JobsParagraphStyleModel *_Nullable data){
        @jobs_strongify(self)
        if(!data.value) return;
        [self addAttribute:(__bridge NSString *)kCTKernAttributeName
                     value:data.value
                     range:data.range];
    };
}

@end
