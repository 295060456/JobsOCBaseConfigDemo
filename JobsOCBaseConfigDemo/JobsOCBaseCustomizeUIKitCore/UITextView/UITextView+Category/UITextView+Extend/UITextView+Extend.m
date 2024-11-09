//
//  UITextView+Extend.m
//  DouDong-II
//
//  Created by Jobs on 2021/3/16.
//

#import "UITextView+Extend.h"

@implementation UITextView (Extend)

-(RACDisposable *)jobsTextViewSubscribeNextBlock:(jobsByIDBlock _Nullable)subscribeNextBlock{
    return [self.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        if (subscribeNextBlock) subscribeNextBlock(x);
    }];
}

-(RACDisposable *)jobsTextViewFilterBlock:(JobsReturnBOOLByIDBlock _Nullable)filterBlock
                       subscribeNextBlock:(jobsByIDBlock _Nullable)subscribeNextBlock{
    return [[self.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
        return filterBlock ? filterBlock(value) : YES;
    }] subscribeNext:^(NSString * _Nullable x) {
        if (subscribeNextBlock) subscribeNextBlock(x);
    }];
}
/**
 IOS UITextView内容垂直居中方法 https://www.jianshu.com/p/5e4cf8488bfd
 原理：由于textView是继承自UIScrollview，所以会有ContentSize属性。
 所以可以通过文字内容的高度（也就是ContentSize）的高度和textView的高度之间的差值，设置内边距，就相当于把内容居中了。
 */
-(jobsByFontBlock _Nonnull)contentSizeToFitByFont{
    @jobs_weakify(self)
    return ^(UIFont *_Nullable font){
        @jobs_strongify(self)
        [self.superview layoutIfNeeded];
        /// 先判断一下有没有文字（没文字就没必要设置居中了）
        if(self.text.length){
            /// textView的contentSize属性
            CGSize contentSize = self.contentSize;
            /// textView的内边距属性
            UIEdgeInsets offset;
            CGSize newSize = contentSize;
            /// 如果文字内容高度没有超过textView的高度
            if(contentSize.height <= self.frame.size.height){
                /// textView的高度减去文字高度除以2就是Y方向的偏移量，也就是textView的上内边距
                offset = UIEdgeInsetsMake((self.frame.size.height - contentSize.height)/2, 0, 0, 0);
            }else{/// 如果文字高度超出textView的高度
                newSize = self.frame.size;
                offset = UIEdgeInsetsZero;
               /// 通过一个while循环，设置textView的文字大小，使内容不超过整个textView的高度（这个根据需要可以自己设置）
                while (contentSize.height > self.frame.size.height){
                    if (!font) {
                        font = [UIFont fontWithName:@"Helvetica Neue" size:18];
                    }
                    [self setFont:font];
                    contentSize = self.contentSize;
                }newSize = contentSize;
            }
            /// 根据前面计算设置textView的ContentSize和Y方向偏移量
            [self setContentSize:newSize];
            [self setContentInset:offset];
        }
    };
}
/**
 如果执行的是删除动作，那么textView.text 去掉最后一个字符向外输出
 否则textView.text + replacementString进行输出
 */
-(JobsReturnStringByStringBlock _Nonnull)getCurrentTextViewValueByReplacementText{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        if (self.text.length) {
            return [data isEqualToString:@""] ? [self.text substringToIndex:(self.text.length - 1)] : self.text.add(data);
        }return self.text;
    };
}
/**
 一般用于终值部分，对应协议方法:textViewDidChange
 因为在- (void)textViewDidChange:(UITextView *)textView里面的textView.text = textView确定值 + 输入法拼音模式下的占位符值
 我们在某些业务场景下需要对此进行区分，也就是只锚点textView的确定值
 @param valueBlock 回调TextView的确定值，以表明占位符有值
 @param invalidBlock 回调占位符无值的状态
 */
-(void)markedTextValue:(jobsByIDBlock _Nullable)valueBlock
          invalidBlock:(jobsByVoidBlock _Nullable)invalidBlock{
    NSString *placeholderValue = [self textInRange:self.markedTextRange];
    if (placeholderValue.length) {//占位符有值
        NSString *str = [self.text stringByReplacingOccurrencesOfString:placeholderValue
                                                             withString:@""];
        if (valueBlock) valueBlock(str);// 回调TextView的确定值
    }else{//占位符无值
        if (invalidBlock) invalidBlock();
    }
}
/**
 一般用于- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
 对提行、删除【包含删除Emoji表情】、正向输入【包含汉字拼音输入法中的占位符】操作进行区分
 */
-(BOOL)replacementText:(NSString *)replacementText
     beginNewLineBlock:(jobsByIDBlock _Nullable)beginNewLineBlock
              delBlock:(jobsByIDBlock _Nullable)delBlock
      normalInputBlock:(jobsByIDBlock _Nullable)normalInputBlock{
    self.replacementText = replacementText;
    if ([replacementText isEqualToString:@"\n"]) {//提行
        if (beginNewLineBlock) beginNewLineBlock(self.text);
        return NO;
    }else if([replacementText isEqualToString:@""]){//删除
        /**
        删除操作是系统接收@“”作为指令内部进行删除操作
         获取需要操作的字符，最后2位，如果是emoji则删除2个字符，否则删除一个字符
         截取 textView.text 最后2位
         */
        NSString *res = JobsInternationalization(@"");
        NSLog(@"MMM = %@",self.text);
        if (self.text.length >= 2) {
            // 这里的emoji判断有点问题，不识别新版本系统的emoji，以前的旧的emoji是可以识别的，我已经给apple提了单让他们给我们写一个api
            if ([[self.text substringFromIndex:self.text.length - 2] validateContainsEmoji]) {
                res = [self.text substringWithRange:NSMakeRange(0, self.text.length - 2)];
                NSLog(@"res = %@",res);
            }else{
                res = [self.text substringWithRange:NSMakeRange(0, self.text.length - 1)];
                NSLog(@"res = %@",res);
            }
        }else if (self.text.length == 1){
            res = [self.text substringWithRange:NSMakeRange(0, self.text.length - 1)];
            NSLog(@"res = %@",res);
        }else{
            res = JobsInternationalization(@"");
            NSLog(@"res = %@",res);
        }
        self.currentWordNum = res.length;
        NSLog(@"SSS = %ld",self.currentWordNum);
        if (delBlock) delBlock(res);
        return YES;
    }else{//正向输入
        if ([replacementText isAllLetterCharacter]) {//还在占位符拼音阶段
            if ([self textInRange:self.markedTextRange].length) {
                if (normalInputBlock) normalInputBlock(self.text.add(replacementText));
            }else{
                NSString *res = @"";
                if (replacementText.length == 1) {//单字母输入
                    res = [self.text stringByAppendingString:replacementText];
                }else{//按下确定键
                    res = replacementText;
                }
                self.currentWordNum = res.length;
                if (normalInputBlock) normalInputBlock(res);
                if (self.currentWordNum - 2 >= self.wordLimitNum) {
                    self.currentWordNum = self.wordLimitNum;
                }
            }
        }else{//最终确定的中文
            NSString *res = [self.text stringByReplacingOccurrencesOfString:[self textInRange:self.markedTextRange]
                                                                 withString:@""].add(replacementText);
            self.currentWordNum = res.length;
            /// 截断，最新输入的截取字符来满足textView到顶抵满
            if (self.currentWordNum + 1 > self.wordLimitNum) {
                self.text = [res substringWithRange:NSMakeRange(0, self.wordLimitNum)];
                self.currentWordNum = self.text.length;
            }
            self.resStr = res;
            if (normalInputBlock) normalInputBlock(res);
        }return self.currentWordNum < self.wordLimitNum;
    }
}
#pragma mark —— @property(nonatomic,strong)NSString *replacementText;
JobsKey(_replacementText)
@dynamic replacementText;
-(NSString *)replacementText{
    return Jobs_getAssociatedObject(_replacementText);
}

-(void)setReplacementText:(NSString *)replacementText{
    Jobs_setAssociatedRETAIN_NONATOMIC(_replacementText, replacementText)
}
#pragma mark —— @property(nonatomic,strong)NSString *resStr;
JobsKey(_resStr)
@dynamic resStr;
-(NSString *)resStr{
    return Jobs_getAssociatedObject(_resStr);
}

-(void)setResStr:(NSString *)resStr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_resStr, resStr);
}

@end
