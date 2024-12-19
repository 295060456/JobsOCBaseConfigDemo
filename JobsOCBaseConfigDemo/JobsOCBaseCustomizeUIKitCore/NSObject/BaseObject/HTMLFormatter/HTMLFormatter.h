//
//  HTMLFormatter.h
//  FM
//
//  Created by Admin on 19/12/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTMLFormatter : NSObject<NSXMLParserDelegate>

@property(nonatomic,copy)NSMutableString *formattedHTML;
@property(nonatomic,assign)NSInteger indentLevel;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof HTMLFormatter *_Nonnull jobsMakeHTMLFormatter(jobsByHTMLFormatterBlock _Nonnull block){
    HTMLFormatter *data = HTMLFormatter.alloc.init;
    if (block) block(data);
    return data;
}
