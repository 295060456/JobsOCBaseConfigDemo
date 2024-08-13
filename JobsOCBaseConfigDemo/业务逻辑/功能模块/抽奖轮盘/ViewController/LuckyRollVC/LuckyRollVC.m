//
//  LuckyRollVC.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/13/24.
//

#import "LuckyRollVC.h"

@interface LuckyRollVC ()

@property (nonatomic, strong) UIView *wheelView;
@property (nonatomic, assign) CGFloat currentRotationAngle; // 当前旋转角度
@property (nonatomic, assign) CGFloat targetRotationAngle;  // 目标旋转角度
@property (nonatomic, strong) CADisplayLink *displayLink;
@end

@implementation LuckyRollVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建轮盘视图
    self.wheelView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    self.wheelView.center = self.view.center;
    [self.view addSubview:self.wheelView];
    
    // 绘制轮盘
    [self drawWheel];
    
    // 添加点击手势来触发转盘旋转
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(startSpin)];
    [self.view addGestureRecognizer:tap];
}

// 绘制轮盘方法
- (void)drawWheel {
    CAShapeLayer *wheelLayer = [CAShapeLayer layer];
    wheelLayer.frame = self.wheelView.bounds;
    wheelLayer.fillColor = [UIColor clearColor].CGColor;
    wheelLayer.strokeColor = [UIColor redColor].CGColor;
    wheelLayer.lineWidth = 10.0;
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:self.wheelView.bounds];
    wheelLayer.path = circlePath.CGPath;
    
    [self.wheelView.layer addSublayer:wheelLayer];
    
    for (int i = 0; i < 8; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
        label.text = [NSString stringWithFormat:@"%d", i+1];
        label.textAlignment = NSTextAlignmentCenter;
        label.center = CGPointMake(self.wheelView.bounds.size.width/2 + cos(M_PI_4 * i) * 120,
                                   self.wheelView.bounds.size.height/2 + sin(M_PI_4 * i) * 120);
        [self.wheelView addSubview:label];
    }
}

// 开始旋转轮盘
- (void)startSpin {
    self.currentRotationAngle = 0;
    CGFloat randomSection = arc4random_uniform(8); // 随机分区
    CGFloat rotationPerSection = M_PI * 2 / 8; // 每个分区的角度
    
    // 设置目标旋转角度，多转几圈再减速到随机分区
    self.targetRotationAngle = M_PI * 2 * 3 + randomSection * rotationPerSection;
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotateWheel)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

// 旋转轮盘的方法
- (void)rotateWheel {
    CGFloat duration = 4.0; // 总时长
    CGFloat maxSpeed = M_PI_2; // 最大旋转速度
    
    // 根据时间线性减速
    CGFloat speed = maxSpeed * (1 - self.currentRotationAngle / self.targetRotationAngle);
    self.currentRotationAngle += speed;
    
    if (self.currentRotationAngle >= self.targetRotationAngle) {
        [self.displayLink invalidate];
        self.displayLink = nil;
    } else {
        self.wheelView.transform = CGAffineTransformRotate(self.wheelView.transform, speed);
    }
}

@end
