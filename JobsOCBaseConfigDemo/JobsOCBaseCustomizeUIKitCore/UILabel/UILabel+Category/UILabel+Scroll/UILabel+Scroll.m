//
//  UILabel+Scroll.m
//  FM
//
//  Created by Admin on 28/11/2024.
//

#import "UILabel+Scroll.h"

@implementation UILabel (Scroll)
#pragma mark ——
/// 不管是否文字超过UILabel的frame.width都是滚动的
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
#pragma mark ——
/// 取出并释放定时器
JobsKey(_stopScrolling)
-(jobsByVoidBlock _Nonnull)stopScrolling{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        RACDisposable *disposable = objc_getAssociatedObject(self, @selector(stopScrolling));
        if (disposable) {
            [disposable dispose];
            Jobs_setAssociatedRETAIN_NONATOMIC(_stopScrolling, nil);
        }
        /// 移除子视图
        for (UIView *subview in self.subviews) {
            if ([subview isKindOfClass:UIScrollView.class]) [subview removeFromSuperview];
        }
    };
}
/// 开始滚动动画，返回一个 RACDisposable 以便手动停止
-(JobsReturnRACDisposableByTimeIntervalBlock _Nonnull)startScrollingIfNeededWithInterval{
    @jobs_weakify(self)
    return ^RACDisposable *_Nonnull(NSTimeInterval data){
        @jobs_strongify(self)
        /// 获取文字内容的宽度
        CGFloat textWidth = [self.text sizeWithAttributes:@{NSFontAttributeName: self.font}].width;
        /// 如果文字宽度小于 UILabel 宽度，则无需滚动
        if (textWidth <= self.bounds.size.width) return nil;
        /// 添加子视图容器
        UIScrollView *scrollView = self.addSubview(jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            @jobs_strongify(self)
            scrollView.frame = self.bounds;
            scrollView.showsHorizontalScrollIndicator = NO;
            scrollView.scrollEnabled = NO;
            /// 创建文字Label
            scrollView.addSubview(jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
                @jobs_strongify(self)
                label.frame = CGRectMake(0, 0, textWidth, self.bounds.size.height);
                label.text = self.text;
                label.font = self.font;
                label.textColor = self.textColor;
                label.textAlignment = NSTextAlignmentLeft;
            }));
            /// 设置ScrollView内容大小
            scrollView.contentSize = CGSizeMake(textWidth, self.bounds.size.height);
        }));
        /// 定时器实现滚动动画
        RACDisposable *disposable = [[RACSignal interval:data
                                             onScheduler:RACScheduler.mainThreadScheduler]
                                    subscribeNext:^(id _Nullable x) {
            @jobs_strongify(self)
            CGFloat offsetX = scrollView.contentOffset.x + 1; /// 每次移动1个单位
            if (offsetX >= textWidth) offsetX = 0; /// 回到起始位置
            self.textColor = JobsClearColor;
            [scrollView setContentOffset:CGPointMake(offsetX, 0) animated:NO];
        }];
        /// 保存 disposable，以便手动停止
        objc_setAssociatedObject(self, @selector(stopScrolling), disposable, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        Jobs_setAssociatedRETAIN_NONATOMIC(_stopScrolling, disposable);
        return disposable;
    };
}

@end
