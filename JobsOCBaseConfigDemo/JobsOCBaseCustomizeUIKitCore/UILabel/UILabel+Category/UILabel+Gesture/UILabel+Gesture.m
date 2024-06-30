//
//  UILabel+Gesture.m
//  SelectorBlock
//
//  Created by Jobs on 2021/4/3.
//

#import "UILabel+Gesture.h"

@implementation UILabel (Gesture)

-(void)makeLabelGesture{
    NSLog(@"给UILabel的子类加手势");
    
    self.numberOfTouchesRequired = 1;
    self.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
    self.minimumPressDuration = 0.1;
    self.numberOfTouchesRequired = 1;
    self.allowableMovement = 1;
    self.userInteractionEnabled = YES;
    self.target = self;
    self.longPressGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                             UILongPressGestureRecognizer *_Nullable arg) {
        NSLog(@"UILabel 的 长按 手势");
        return nil;
    }];
    self.longPressGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
    
    self.tapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                       UITapGestureRecognizer *_Nullable arg) {
        NSLog(@"UILabel 的 Tap 手势");
        [self clickLink];
        return nil;
    }];
    self.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
}

// 点击文本处理链接跳转
-(void)clickLink{
    NSError *error = nil;
    NSDataDetector *detector = [NSDataDetector.alloc initWithTypes:NSTextCheckingTypeLink error:&error];
    if (error) {
        [WHToast jobsToastMsg:JobsInternationalization(@"出现错误")];
        return;
    }
    //通过检测字符串最后几位是否是.com .cn...来进行判定
    NSArray *checkArr = [detector matchesInString:self.text
                                          options:0
                                            range:NSMakeRange(0, self.text.length)];
    //判断有没有链接
    if(checkArr.count > 0) {
        if (checkArr.count > 1) { //网址多于1个时让用户选择跳哪个链接
            [WHToast jobsToastMsg:JobsInternationalization(@"多于1个链接")];
        }else {//一个链接直接打开
            [WHToast jobsToastMsg:JobsInternationalization(@"只有1个链接")];
        }
    }else{
        [WHToast jobsToastMsg:JobsInternationalization(@"没有链接")];
    }
}

@end


