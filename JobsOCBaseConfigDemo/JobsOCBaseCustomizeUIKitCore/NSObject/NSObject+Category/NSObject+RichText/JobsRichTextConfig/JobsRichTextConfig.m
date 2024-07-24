//
//  JobsRichTextConfig.m
//  FM
//
//  Created by User on 7/24/24.
//

#import "JobsRichTextConfig.h"

@implementation JobsRichTextConfig
#pragma mark —— default
-(NSMutableParagraphStyle *)paragraphStyle{
    if (!_paragraphStyle) {
        _paragraphStyle = NSMutableParagraphStyle.new;
        /// 行间距
        _paragraphStyle.lineSpacing = JobsWidth(10);
        /// 段落间距
        _paragraphStyle.paragraphSpacing = JobsWidth(20);
        /// 对齐方式
        _paragraphStyle.alignment = NSTextAlignmentLeft;
        /// 指定段落开始的缩进像素
        _paragraphStyle.firstLineHeadIndent = JobsWidth(30);
        /// 调整全部文字的缩进像素
        _paragraphStyle.headIndent = JobsWidth(10);
    }return _paragraphStyle;
}

-(NSString *)urlStr{
    if (!_urlStr) {
//        _urlStr = @"www.google.com";
    }return _urlStr;
}


@end
