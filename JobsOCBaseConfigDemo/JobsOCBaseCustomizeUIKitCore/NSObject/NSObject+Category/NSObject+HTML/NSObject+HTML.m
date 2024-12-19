//
//  NSObject+HTML.m
//  FM
//
//  Created by Admin on 19/12/2024.
//

#import "NSObject+HTML.h"

@implementation NSObject (HTML)

-(jobsByStringBlock _Nonnull)formatAndPrintHTML{
    @jobs_weakify(self)
    return ^(__kindof NSString *_Nullable htmlString){
        @jobs_strongify(self)
        /// 1、使用 HTMLReader 解析 HTML 字符串
        HTMLDocument *document = HTMLDocument.initBy(htmlString);
        /// 2、格式化打印函数
        [self printHTMLElement:document.rootElement level:0];
    };
}

-(void)printHTMLElement:(HTMLElement *)element level:(NSUInteger)level {
    /// 3、 缩进：根据层级打印空格
    NSMutableString *indent = NSMutableString.string;
    for (NSUInteger i = 0; i < level; i++) {
        indent.add(@"  ");/// 每层两个空格
    }
    /// 4、 打印标签名称和属性
    if (element.tagName) {
        NSMutableString *attributes = NSMutableString.string;
        for (NSString *key in element.attributes) {
            [attributes appendFormat:@" %@=\"%@\"", key, element.attributes[key]];
        }JobsLog(@"%@<%@%@>", indent, element.tagName, attributes);
    }
    /// 5、 打印标签内容
    if (element.textContent && element.textContent.length > 0) {
        JobsLog(@"%@  %@", indent, element.textContent);
    }
    /// 6、递归打印子元素
    for (HTMLElement *child in element.childElementNodes) {
        [self printHTMLElement:child level:level + 1];
    }
    /// 7、打印关闭标签
    if (element.tagName) {
        JobsLog(@"%@</%@>", indent, element.tagName);
    }
}

@end
