//
//  LuckyWheelDemoVC.m
//  JobsOCBaseConfigDemo
//

#import "LuckyWheelDemoVC.h"
#import "LuckyWheelView.h"

@interface LuckyWheelDemoVC ()

@property (nonatomic, strong) LuckyWheelView *wheelView;

@end

@implementation LuckyWheelDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor systemBackgroundColor];

    [self setupWheel];
    [self setupNav];
}

- (void)setupWheel {
    NSMutableArray<LuckyWheelSegment *> *segments = [NSMutableArray array];

    // 一等奖
    {
        LuckyWheelSegment *seg = [[LuckyWheelSegment alloc] initWithText:@"一等奖"
                                                                textFont:[UIFont systemFontOfSize:12 weight:UIFontWeightMedium]
                                                               textColor:[UIColor blackColor]
                                                          attributedText:nil
                                                         backgroundColor:[self randomColor]
                                                        placeholderImage:[UIImage systemImageNamed:@"globe"]
                                                          imageURLString:@"https://picsum.photos/30"];
        [segments addObject:seg];
    }
    // 二等奖
    {
        LuckyWheelSegment *seg = [[LuckyWheelSegment alloc] initWithText:@"二等奖"
                                                                textFont:[UIFont systemFontOfSize:12 weight:UIFontWeightMedium]
                                                               textColor:[UIColor blackColor]
                                                          attributedText:nil
                                                         backgroundColor:[self randomColor]
                                                        placeholderImage:[UIImage systemImageNamed:@"plus"]
                                                          imageURLString:@"https://picsum.photos/30"];
        [segments addObject:seg];
    }
    // 三等奖
    {
        LuckyWheelSegment *seg = [[LuckyWheelSegment alloc] initWithText:@"三等奖"
                                                                textFont:[UIFont systemFontOfSize:12 weight:UIFontWeightMedium]
                                                               textColor:[UIColor blackColor]
                                                          attributedText:nil
                                                         backgroundColor:[self randomColor]
                                                        placeholderImage:[UIImage systemImageNamed:@"message"]
                                                          imageURLString:@"https://picsum.photos/30"];
        [segments addObject:seg];
    }
    // 谢谢参与
    {
        LuckyWheelSegment *seg = [[LuckyWheelSegment alloc] initWithText:@"谢谢参与"
                                                                textFont:[UIFont systemFontOfSize:12 weight:UIFontWeightMedium]
                                                               textColor:[UIColor blackColor]
                                                          attributedText:nil
                                                         backgroundColor:[self randomColor]
                                                        placeholderImage:[UIImage systemImageNamed:@"tray"]
                                                          imageURLString:@"https://picsum.photos/30"];
        [segments addObject:seg];
    }

    LuckyWheelView *wheel = [[LuckyWheelView alloc] initWithFrame:CGRectZero];
    wheel.translatesAutoresizingMaskIntoConstraints = NO;
    [[wheel bySegments:segments]
        byPointerDirection:LuckyWheelPointerDirectionRight];
    [[wheel bySpinDuration:3.0] byInitialVelocity:25.0];
    [wheel byPanRotationEnabled:YES];

    __weak typeof(self) weakSelf = self;
    [wheel onSegmentTap:^(LuckyWheelSegment * _Nonnull segment) {
        __strong typeof(weakSelf) self = weakSelf;
        if (!self) return;
        NSString *msg = [NSString stringWithFormat:@"🍀 短按 / 停止命中：%@", segment.text ?: @""];
        // 这里改成你自己项目里的 toast
        NSLog(@"%@", msg);
    }];

    [wheel onSegmentLongPress:^(LuckyWheelSegment * _Nonnull segment,
                                UILongPressGestureRecognizer * _Nonnull gr) {
        if (gr.state == UIGestureRecognizerStateBegan) {
            NSString *msg = [NSString stringWithFormat:@"👆 长按开始：%@", segment.text ?: @""];
            NSLog(@"%@", msg);
        }
    }];

    [self.view addSubview:wheel];
    self.wheelView = wheel;

    [NSLayoutConstraint activateConstraints:@[
        [wheel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [wheel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        [wheel.widthAnchor constraintEqualToConstant:300.0],
        [wheel.heightAnchor constraintEqualToConstant:300.0],
    ]];
}

- (void)setupNav {
    self.title = @"抽奖转盘";

    UIBarButtonItem *pauseItem = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"pause.circle.fill"]
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(handlePauseTap:)];
    self.navigationItem.rightBarButtonItem = pauseItem;

    // 如果你有 jobsSetupGKNav: 等封装，可以在这里替换
}

- (void)handlePauseTap:(UIBarButtonItem *)item {
    [self.wheelView stopSpin];
}

#pragma mark - Helpers

- (UIColor *)randomColor {
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

@end
