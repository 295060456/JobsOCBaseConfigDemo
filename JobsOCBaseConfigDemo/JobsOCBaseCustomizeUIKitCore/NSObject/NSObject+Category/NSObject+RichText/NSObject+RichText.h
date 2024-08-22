//
//  UILabel+RichText.h
//  UBallLive
//
//  Created by Jobs on 2020/11/4.
//

#import <UIKit/UIKit.h>
#import "MacroDef_Font.h"
#import "JobsRichTextConfig.h"
#import "JobsBlock.h"
#import "NSString+Others.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (RichText)
/// 整合输出富文本，作用于lable.attributedText
/// @param richTextDataConfigMutArr 富文本的配置集合,对该纯文本字符串的释义
/// @param paragraphStyle 段落样式
-(NSMutableAttributedString *_Nullable)richTextWithDataConfigMutArr:(NSArray <JobsRichTextConfig *>*_Nonnull)richTextDataConfigMutArr
                                                     paragraphStyle:(NSMutableParagraphStyle *_Nullable)paragraphStyle;
/// 利用 NSArray <JobsRichTextConfig *>* 形成富文本
-(JobsReturnAttributedStringByRichTextConfigArrayBlock _Nonnull)richTextWithDataConfigMutArr;
/// 字符串中划线
-(JobsReturnMutAttributedStringByStringBlock _Nonnull)jobsHorizontalCentralLineation;
/// 字符串下划线
-(JobsReturnMutAttributedStringByStringBlock _Nonnull)jobsHorizontalBottomLineation;

@end

NS_ASSUME_NONNULL_END

/*
 
 调用示例:
 特别说明：
 1、普通文本和富文本的 左/中/右 段落对齐不是一样的写法
 2、使用 UITextView 实现链接点击跳转的效果;UILabel可以实现效果，但是不支持部分文字点击效果。（支持方法比较麻烦）
 
 // 关于富文本
 @property(nonatomic,strong)UILabel *connectionTipsLab;
 @property(nonatomic,strong)UITextView *connectionTipsTV;
 
 @property(nonatomic,strong)NSMutableAttributedString *attributedStringData;
 @property(nonatomic,strong)NSMutableArray <NSString *>*richTextMutArr;
 @property(nonatomic,strong)NSMutableArray <JobsRichTextConfig *>*richTextConfigMutArr;
 
 -(UILabel *)connectionTipsLab{
     if (!_connectionTipsLab) {
         _connectionTipsLab = UILabel.new;
         _connectionTipsLab.attributedText = self.attributedStringData;
         [self.view addSubview:_connectionTipsLab];
         [_connectionTipsLab mas_makeConstraints:^(MASConstraintMaker *make) {
             make.centerX.equalTo(self.view);
             make.bottom.equalTo(self.view).offset(JobsWidth(-65));
             make.height.mas_equalTo(JobsWidth(12));
         }];
     }return _connectionTipsLab;
 }
 
 -(UITextView *)tipsTextView{
     if (!_tipsTextView) {
         _tipsTextView = UITextView.new;
         _tipsTextView.delegate = self;
         _tipsTextView.editable = NO;/// 必须禁止输入，否则点击将会弹出输入键盘
         _tipsTextView.scrollEnabled = NO;/// 可选的，视具体情况而定
         _tipsTextView.linkTextAttributes = @{NSForegroundColorAttributeName:HEXCOLOR(0xCCB17E)};/// 链接文字颜色
         _tipsTextView.attributedText = self.attributedStringData;
         _tipsTextView.userInteractionEnabled = YES;
         [self.contentView addSubview:_tipsTextView];
         [_tipsTextView mas_makeConstraints:^(MASConstraintMaker *make) {
             make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(30)));
             make.centerX.equalTo(self.contentView);
             make.bottom.equalTo(self.contentView).offset(-JobsWidth(38));
         }];
     }return _tipsTextView;
 }

 -(NSMutableAttributedString *)attributedStringData{
     if (!_attributedStringData) {
         _attributedStringData = self.richTextWithDataConfigMutArr(self.richTextConfigMutArr);
     }return _attributedStringData;
 }

 -(NSMutableArray<NSString *> *)richTextMutArr{
     if (!_richTextMutArr) {
         _richTextMutArr = NSMutableArray.array;
         [_richTextMutArr addObject:JobsInternationalization(@"如需帮助，请联系")];
         [_richTextMutArr addObject:JobsInternationalization(@"专属客服")];
     }return _richTextMutArr;
 }

 -(NSMutableArray<JobsRichTextConfig *> *)richTextConfigMutArr{
     if (!_richTextConfigMutArr) {
         _richTextConfigMutArr = NSMutableArray.array;
         
         JobsRichTextConfig *config_01 = JobsRichTextConfig.new;
         config_01.font = UIFontWeightRegularSize(14);
         config_01.textCor = HEXCOLOR(0x757575);
         config_01.targetString = self.richTextMutArr[0];
         [_richTextConfigMutArr addObject:config_01];

         JobsRichTextConfig *config_02 = JobsRichTextConfig.new;
         config_02.font = UIFontWeightRegularSize(14);
         config_02.textCor = HEXCOLOR(0xAE8330);
         config_02.targetString = self.richTextMutArr[1];
         config_02.urlStr = @"click://"; /// 根据这个属性加链接,点击进行跳转
         [_richTextConfigMutArr addObject:config_02];
         
     }return _richTextConfigMutArr;
 }
 
 #pragma mark —— UITextViewDelegate
 /// 点击事件监听
 - (BOOL)textView:(UITextView *)textView
 shouldInteractWithURL:(NSURL *)URL
          inRange:(NSRange)characterRange
      interaction:(UITextItemInteraction)interaction{
     self.jobsToastMsg(JobsInternationalization(@"专属客服"));
     return YES;
 }
 
 ***/

/**
    富文本的属性介绍
 
    NSFontAttributeName                设置字体属性，默认值：字体：Helvetica(Neue) 字号：12
    NSForegroundColorAttributeNam      设置字体颜色，取值为 UIColor对象，默认值为黑色
    NSBackgroundColorAttributeName     设置字体所在区域背景颜色，取值为 UIColor对象，默认值为nil, 透明色
    NSLigatureAttributeName            设置连体属性，取值为NSNumber 对象(整数)，0 表示没有连体字符，1 表示使用默认的连体字符
    NSKernAttributeName                设定字符间距，取值为 NSNumber 对象（整数），正值间距加宽，负值间距变窄
    NSStrikethroughStyleAttributeName  设置删除线，取值为 NSNumber 对象（整数）
    NSStrikethroughColorAttributeName  设置删除线颜色，取值为 UIColor 对象，默认值为黑色
    NSUnderlineStyleAttributeName      设置下划线，取值为 NSNumber 对象（整数），枚举常量 NSUnderlineStyle中的值，与删除线类似
    NSUnderlineColorAttributeName      设置下划线颜色，取值为 UIColor 对象，默认值为黑色
    NSStrokeWidthAttributeName         设置笔画宽度，取值为 NSNumber 对象（整数），负值填充效果，正值中空效果
    NSStrokeColorAttributeName         填充部分颜色，不是字体颜色，取值为 UIColor 对象
    NSShadowAttributeName              设置阴影属性，取值为 NSShadow 对象
    NSTextEffectAttributeName          设置文本特殊效果，取值为 NSString 对象，目前只有图版印刷效果可用：
    NSBaselineOffsetAttributeName      设置基线偏移值，取值为 NSNumber （float）,正值上偏，负值下偏
    NSObliquenessAttributeName         设置字形倾斜度，取值为 NSNumber （float）,正值右倾，负值左倾
    NSExpansionAttributeName           设置文本横向拉伸属性，取值为 NSNumber （float）,正值横向拉伸文本，负值横向压缩文本
    NSWritingDirectionAttributeName    设置文字书写方向，从左向右书写或者从右向左书写
    NSVerticalGlyphFormAttributeName   设置文字排版方向，取值为 NSNumber 对象(整数)，0 表示横排文本，1 表示竖排文本
    NSLinkAttributeName                设置链接属性，点击后调用浏览器打开指定URL地址
    NSAttachmentAttributeName          设置文本附件,取值为NSTextAttachment对象,常用于文字图片混排
    NSParagraphStyleAttributeName      设置文本段落排版格式，取值为 NSParagraphStyle 对象
 **/

/**
    富文本段落排版格式属性介绍
 
    lineSpacing 字体的行间距
    firstLineHeadIndent  首行缩进
    alignment （两端对齐的）文本对齐方式：（左，中，右，两端对齐，自然）
    lineBreakMode 结尾部分的内容以……方式省略 ( "...wxyz" ,"abcd..." ,"ab...yz")
    headIndent 整体缩进(首行除外)
    tailIndent
    minimumLineHeight 最低行高
    maximumLineHeight 最大行高
    paragraphSpacing 段与段之间的间距
    paragraphSpacingBefore 段首行空白空间
    baseWritingDirection 书写方向（一共三种）
    lineHeightMultiple
    hyphenationFactor 连字属性 在iOS，唯一支持的值分别为0和1
 **/
