//
//  JobsRichTextConfig.h
//  FM
//
//  Created by User on 7/24/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/// 富文本4要素：文字信息、文字颜色、段落、字体
@interface JobsRichTextConfig : NSObject

@property(nonatomic,strong)NSString *targetString;/// 作用文字
@property(nonatomic,strong)UIFont *font;/// 添加字体
@property(nonatomic,strong)UIColor *textCor;/// 添加文字颜色
@property(nonatomic,strong)UIColor *textBgCor;/// 添加文字背景颜色
@property(nonatomic,assign)NSUnderlineStyle underlineStyle;/// 添加下划线
@property(nonatomic,strong,null_resettable)NSMutableParagraphStyle *paragraphStyle;/// 添加段落样式
@property(nonatomic,strong)NSString *urlStr;/// 添加链接可点击
@property(nonatomic,assign)NSRange range;/// 设置作用域

@end

NS_ASSUME_NONNULL_END
