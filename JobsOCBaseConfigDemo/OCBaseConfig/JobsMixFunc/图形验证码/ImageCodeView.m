//
//  ImageCodeView.m
//  XLVerCodeView
//
//  Created by Mac-Qke on 2019/7/9.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "ImageCodeView.h"

#define CODE_LENGTH 4

@interface ImageCodeView ()

Prop_copy()jobsByIDBlock imageCodeViewBlock;

@end

@implementation ImageCodeView
- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
}

-(instancetype)init{
    if (self = [super init]) {
        [self setupUI];
    }return self;
}
/// 兼容nib使用
-(void)awakeFromNib{
    [super awakeFromNib];
    [self setupUI];
}
///设置默认参数
-(void)setupUI{
    self.backgroundColor = self.bgColor;
    self.addGesture([jobsMakeLongPressGesture(^(UILongPressGestureRecognizer * _Nullable gesture) {
        /// 这里写手势的配置
    }) gestureActionBy:^{
        /// 这里写手势的触发
//        [NSObject getAuthCode_networking:^(id data) {
//            @jobs_strongify(self)
//            if ([data isKindOfClass:NSDictionary.class]) {
//                self.CodeStr = data[@"imgCode"];
//                self.backgroundColor = self.bgColorBy;
//                JobsLog(@"我是验证码：%@",self.CodeStr);
//                [self setNeedsDisplay];
//                if (self.imageCodeViewBlock) {
//                    self.imageCodeViewBlock(data);
//                }
//            }
//        }];
    }]);
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGSize cSize = [@"A" sizeWithAttributes:@{NSFontAttributeName:self.font,
                                              NSForegroundColorAttributeName:self.color}];//计算单个字所需空间
    int width = rect.size.width / self.CodeStr.length - cSize.width;//间距
    int height = rect.size.height - cSize.height;//可浮动高度
    CGPoint point;
    /// 绘码
    float pX, pY;
    for (int i = 0; i < self.CodeStr.length; i++){
        pX = arc4random() % width + rect.size.width / self.CodeStr.length * i;
        pY = arc4random() % height;
        point = CGPointMake(pX, pY);
        unichar c = [self.CodeStr characterAtIndex:i];
        NSString *textC = [NSString stringWithFormat:@"%C", c];
        [textC drawAtPoint:point
            withAttributes:@{NSFontAttributeName:self.font,
                             NSForegroundColorAttributeName:self.color}];
    }
    /// 干扰线
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    for(int cout = 0; cout < 10; cout++){
        CGContextSetStrokeColorWithColor(context, JobsRandomColor.CGColor);
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextMoveToPoint(context, pX, pY);
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextAddLineToPoint(context, pX, pY);
        CGContextStrokePath(context);
    }
}

-(void)actionBlockImageCodeView:(jobsByIDBlock _Nullable)imageCodeViewBlock{
    _imageCodeViewBlock = imageCodeViewBlock;
}

-(void)setCodeStr:(NSString *)CodeStr{
    _CodeStr = CodeStr;
    [self setNeedsDisplay];
}

-(void)setBgColor:(UIColor *)bgColor{
    _bgColor = bgColor;
    self.backgroundColor = _bgColor;
}
#pragma mark —— lazyLoad
@synthesize CodeStr = _CodeStr;
-(NSString *)CodeStr{
    if (!_CodeStr) {
        _CodeStr = self.randomCodeBy(self.CodeArr,CODE_LENGTH);
    }return _CodeStr;
}

-(__kindof NSArray <NSString *>*)CodeArr{
    if (!_CodeArr) {
        _CodeArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            arr.add(@"0").add(@"1").add(@"2").add(@"3").add(@"4").add(@"5")
                .add(@"6").add(@"7").add(@"8").add(@"9")
                .add(@"A").add(@"B").add(@"C").add(@"D").add(@"E").add(@"F")
                .add(@"G").add(@"H").add(@"I").add(@"J").add(@"K").add(@"L")
                .add(@"M").add(@"N").add(@"O").add(@"P").add(@"Q").add(@"R")
                .add(@"S").add(@"T").add(@"U").add(@"V").add(@"W").add(@"X")
                .add(@"Y").add(@"Z")
                .add(@"a").add(@"b").add(@"c").add(@"d").add(@"e").add(@"f")
                .add(@"g").add(@"h").add(@"i").add(@"j").add(@"k").add(@"l")
                .add(@"m").add(@"n").add(@"o").add(@"p").add(@"q").add(@"r")
                .add(@"s").add(@"t").add(@"u").add(@"v").add(@"w").add(@"x")
                .add(@"y").add(@"z");
        });
    }return _CodeArr;
}

-(UIColor *)color{
    if (!_color) {
        _color = JobsWhiteColor;
    }return _color;
}

-(UIFont *)font{
    if (!_font) {
        _font = UIFontWeightRegularSize(JobsWidth(9.6));
    }return _font;
}
@synthesize bgColor = _bgColor;
-(UIColor *)bgColor{
    return _bgColor ? : JobsRandomColor;
}

@end
