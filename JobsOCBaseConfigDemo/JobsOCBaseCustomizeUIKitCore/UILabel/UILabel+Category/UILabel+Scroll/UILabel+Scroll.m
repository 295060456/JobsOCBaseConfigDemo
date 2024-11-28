//
//  UILabel+Scroll.m
//  FM
//
//  Created by Admin on 28/11/2024.
//

#import "UILabel+Scroll.h"

@implementation UILabel (Scroll)

-(RACDisposable *)startRACTimerWithDuration:(NSTimeInterval)duration
                                    byBlock:(jobsByVoidBlock _Nonnull)doBlock {
    @jobs_weakify(self)
    if (!self.text.length) return nil; /// 防止空文本崩溃
    /// 获取标签宽度和文本宽度
    CGFloat labelWidth = self.bounds.size.width;
    CGFloat textWidth = [self.text sizeWithAttributes:jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
        @jobs_strongify(self)
        [data setValue:self.font forKey:NSFontAttributeName];
    })].width;
    /// 如果文本的宽度大于标签的宽度，则启动滚动
    if (textWidth > labelWidth) {
        return [[[RACSignal interval:duration
                             onScheduler:RACScheduler.mainThreadScheduler]
                 takeUntil:self.rac_willDeallocSignal]
                subscribeNext:^(NSDate *currentDate) {
            @jobs_strongify(self)
            /// 将文本的第一个字符移动到末尾，实现滚动效果
            if (self.text.length > 0) {
                NSString *firstCharacter = self.text.substringToIndex(1);
                self.text = self.text.substringFromIndex(1);
                self.text = self.text.add(firstCharacter);
            }if (doBlock) doBlock();
        }];
    }return nil;
}

@end
