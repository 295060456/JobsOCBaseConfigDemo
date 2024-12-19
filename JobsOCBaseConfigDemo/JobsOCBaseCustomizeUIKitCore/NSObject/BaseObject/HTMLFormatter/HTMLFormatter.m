//
//  HTMLFormatter.m
//  FM
//
//  Created by Admin on 19/12/2024.
//

#import "HTMLFormatter.h"

@interface HTMLFormatter ()

@end

@implementation HTMLFormatter

-(instancetype)init{
    if (self = [super init]) {

    }return self;
}
#pragma mark —— 一些私有方法
- (void)appendIndentation {
    for (NSInteger i = 0; i < self.indentLevel; i++) {
        self.formattedHTML.add(@"    ");// 每个缩进 4 个空格
    }
}
#pragma mark —— NSXMLParserDelegate
//-(void)parser:(NSXMLParser *)parser
//didStartElement:(NSString *)elementName
//  namespaceURI:(NSString *)namespaceURI
// qualifiedName:(NSString *)qualifiedName
//    attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
//    [self appendIndentation];
//    [self.formattedHTML appendFormat:@"<%@", elementName];
//    // 如果有属性，处理并添加
//    for (NSString *key in attributeDict) {
//        [self.formattedHTML appendFormat:@" %@=\"%@\"", key, attributeDict[key]];
//    }self.formattedHTML.add(@">");
//    // 增加缩进
//    self.indentLevel++;
//}
//
//-(void)parser:(NSXMLParser *)parser
//didEndElement:(NSString *)elementName
// namespaceURI:(NSString *)namespaceURI
//qualifiedName:(NSString *)qualifiedName{
//    // 减少缩进
//    self.indentLevel--;
//    [self appendIndentation];
//    [self.formattedHTML appendFormat:@"</%@>\n", elementName];
//}
//
//-(void)parser:(NSXMLParser *)parser
//foundCharacters:(NSString *)string{
//    [self appendIndentation];
//    self.formattedHTML.add(string);
//}
-(void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string {
    self.formattedHTML.add(string);
}
#pragma mark —— LazyLoad
-(NSMutableString *)formattedHTML{
    if(!_formattedHTML){
        _formattedHTML = NSMutableString.string;
    }return _formattedHTML;
}

@end
