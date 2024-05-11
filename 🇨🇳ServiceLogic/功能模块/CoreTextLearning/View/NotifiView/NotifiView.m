//
//  NotifiView.m
//  CoreTextLearning
//
//  Created by alan comb on 2021/4/10.
//

#import "NotifiView.h"

@interface NotifiView()

@property(nonatomic,strong)UILabel* contentLabel;
@property(nonatomic,assign)CGFloat offsetX;
@property(nonatomic,copy)FinishBlock finishBlock;

@end

@implementation NotifiView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.contentLabel];
        self.backgroundColor = [UIColor orangeColor];
        _state = NotifiViewStateInit;
        _offsetX = frame.origin.x;
    }return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (self.state == NotifiViewStateReady ||
        self.state == NotifiViewStateFinish ||
        self.state == NotifiViewStateInit) {
        CGFloat x = 0 - _offsetX - CGRectGetWidth(self.frame);
        CGRect newFrame = self.frame;
        newFrame.origin.x = x;
        self.frame = newFrame;
    }
}

- (void)setData:(NSDictionary *)data{
    _data = data;
    _key = _data[kNotifiViewKey];
    _contentLabel.text = _data[kNotifiViewContent];
}

- (void)updateWithData:(NSDictionary *)data finish:(FinishBlock)finishBlock{
    
    NSString* key = data[kNotifiViewKey];
    if (![key isEqualToString:self.key]) {
        NSLog(@"要更新的View的key与源key不同。更新失败!");
        if (finishBlock) {
            finishBlock(self.key);
        }
        return;
    }
    
    if (self.state == NotifiViewStateShowing) {
        self.data = data;
        [self _cancel];
        [self performSelector:@selector(dismiss) withObject:nil afterDelay:(self.duration - 0.5)];
        
        //show的block保留不能去掉, 在此block上添加当前的finishBlock
        if (self.finishBlock) {
            FinishBlock tmpBlock = [self.finishBlock copy];
            self.finishBlock = ^(NSString *key) {
                if (finishBlock) finishBlock(key);
                tmpBlock(key);
            };
        }else{
            if (finishBlock) finishBlock(self.key);
        }
        return;
    }
    
    //其它情况, 不能执行更新操作
    if (finishBlock) finishBlock(self.key);
}

- (void)showWithData:(NSDictionary*)data finish:(FinishBlock)finishBlock{
    self.data = data;
    self.alpha = 1;
    self.state = NotifiViewStateBegin;
    [UIView animateWithDuration:0.25f animations:^{
        CGRect newFrame = self.frame;
        newFrame.origin.x = self.offsetX;
        self.frame = newFrame;
    } completion:^(BOOL finished) {
        self.state = NotifiViewStateStart;
        [self performSelector:@selector(dismiss) withObject:nil afterDelay:(self.duration - 0.5)];
        self.state = NotifiViewStateShowing;
    }];
    self.finishBlock = finishBlock;
}

- (void)dismiss{
    self.state = NotifiViewStateEnd;
    [UIView animateWithDuration:0.25 animations:^{
        CGFloat x = 0 - self.offsetX - CGRectGetWidth(self.frame);
        CGRect newFrame = self.frame;
        newFrame.origin.x = x;
        self.alpha = 0;
        self.frame = newFrame;
    } completion:^(BOOL finished) {
        self.state = NotifiViewStateFinish;
        [self removeFromSuperview];
        if (self.finishBlock) self.finishBlock(self.key);
    }];
    
}

- (void)cancel{
    if (self.state < NotifiViewStateEnd) {
        [self _cancel];
        [self dismiss];
    }
}

- (void)_cancel{
    [NSObject cancelPreviousPerformRequestsWithTarget:self
                                             selector:@selector(dismiss)
                                               object:nil];
}
#pragma mark —— lazyLoad
- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _contentLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _contentLabel.textColor = [UIColor whiteColor];
        _contentLabel.font = [UIFont systemFontOfSize:20];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
    }return _contentLabel;
}

@end
