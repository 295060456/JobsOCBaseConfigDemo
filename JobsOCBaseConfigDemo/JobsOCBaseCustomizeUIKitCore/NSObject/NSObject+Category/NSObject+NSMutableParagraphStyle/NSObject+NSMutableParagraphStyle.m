//
//  NSObject+NSMutableParagraphStyle.m
//  MataShop
//
//  Created by Jobs Hi on 10/7/23.
//

#import "NSObject+NSMutableParagraphStyle.h"

@implementation NSObject (NSMutableParagraphStyle)
/// 居左对齐
-(NSMutableParagraphStyle *)jobsParagraphStyleLeft{
    return jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data) {
        data.alignment = NSTextAlignmentLeft;
    });
}
/// 居中对齐
-(NSMutableParagraphStyle *)jobsParagraphStyleCenter{
    return jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data) {
        data.alignment = NSTextAlignmentCenter;
    });
}
/// 居右对齐
-(NSMutableParagraphStyle *)jobsParagraphStyleRight{
    return jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data) {
        data.alignment = NSTextAlignmentRight;
    });
}
/// 文本两端对齐（文本自动填充到文本框的两侧，可以在每行的开头和结尾添加额外的空格或调整字母间距，以实现两端对齐效果）
-(NSMutableParagraphStyle *)jobsParagraphStyleJustified{
    /**
     通常用于支持两端对齐的文本排版需求，使文本看起来更加整齐和规范。
     这种对齐方式可能会在某些排版场景中使用，但并不常见，因为它需要对文本进行复杂的处理，以使其在每一行的开头和结尾都对齐。
     这种效果在某些书籍、杂志和印刷品中可能会看到，但在移动应用程序和Web页面中相对较少使用
     */
    return jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data) {
        data.alignment = NSTextAlignmentJustified;
    });
}
/// 主要用于支持多语言和本地化的应用，以确保文本对齐方式在不同语言环境下都是合适的。
-(NSMutableParagraphStyle *)jobsParagraphStyleNatural{
    /**
     根据文本的自然语言和阅读习惯来决定文本的对齐方式。
     这意味着文本的对齐方式将根据文本的语言和用户的本地化设置来自动确定。
     */
    return jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data) {
        data.alignment = NSTextAlignmentNatural;
    });
}
/// 通过NSTextAlignment映射NSParagraphStyle *
-(JobsReturnParagraphStyleByTextAlignmentBlock _Nonnull)jobsparagraphStyleByTextAlignment{
    @jobs_weakify(self)
    return ^__kindof NSParagraphStyle *_Nullable(NSTextAlignment textAlignment) {
        @jobs_strongify(self)
        switch (textAlignment) {
            case NSTextAlignmentLeft:{
                return (NSParagraphStyle *)self.jobsParagraphStyleLeft;
            }break;
            case NSTextAlignmentCenter:{
                return (NSParagraphStyle *)self.jobsParagraphStyleCenter;
            }break;
            case NSTextAlignmentRight:{
                return (NSParagraphStyle *)self.jobsParagraphStyleRight;
            }break;
            case NSTextAlignmentJustified:{
                return (NSParagraphStyle *)self.jobsParagraphStyleJustified;
            }break;
            case NSTextAlignmentNatural:{
                return (NSParagraphStyle *)self.jobsParagraphStyleNatural;
            }break;
            default:
                break;
        }
    };
}

@end
