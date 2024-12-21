//
//  HTMLDocument+Extra.m
//  FM
//
//  Created by Admin on 19/12/2024.
//

#import "HTMLDocument+Extra.h"

@implementation HTMLDocument (Extra)

+(JobsReturnHTMLDocumentByStringBlock _Nonnull)initBy{
    return ^HTMLDocument *_Nullable(__kindof NSString *_Nullable string){
        return [HTMLDocument documentWithString:string];
    };
}
/// 提取 HTML 里面的有效文字内容
+(JobsReturnStringByStringBlock _Nonnull)formatHTML{
    return ^ __kindof NSString *_Nullable(__kindof NSString *_Nullable htmlString){
        NSError *error = nil;
        // 使用 NSAttributedString 从 HTML 中创建富文本
        NSData *data = htmlString.UTF8Encoding;
        NSDictionary *options = @{
            NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
            NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)};
        NSAttributedString *attributedString = [NSAttributedString.alloc initWithData:data
                                                                              options:options
                                                                   documentAttributes:nil
                                                                                error:&error];
        if (error) {
          NSLog(@"Error parsing HTML: %@", error.localizedDescription);
          return nil;
        }
        // 返回格式化后的 HTML 字符串
        return attributedString.string;
    };
}

@end
