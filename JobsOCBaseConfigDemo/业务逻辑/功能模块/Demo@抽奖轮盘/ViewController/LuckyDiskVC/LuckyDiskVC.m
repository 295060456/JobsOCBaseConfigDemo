//
//  LuckyDiskVC.m
//  XLLuckyDrawDemo
//
//  Created by Mac-Qke on 2019/2/11.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "LuckyDiskVC.h"
//屏幕宽
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
//屏幕高
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
//基于iPhone6的屏幕适配像素
#define XT ([[UIScreen mainScreen] bounds].size.width/375)
//RGB
#define XDXColor(r, g, b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]

@interface LuckyDiskVC ()
@property (nonatomic, strong) NSURL *videoURL;
@property (nonatomic, strong) NSString *result;
@property (nonatomic, strong) NSArray *itemTitleArray;
@property (nonatomic, strong) UIImageView *rotaryTable;
@property (nonatomic, strong) UIView *itemBorderView;
@property (nonatomic, strong) NSTimer *itemBorderTimer;
@property (nonatomic, strong) NSTimer *fastTimer;
@property (nonatomic, strong) NSTimer *slowTimer;
@property (nonatomic, assign) NSInteger fastIndex;
@property (nonatomic, assign) NSInteger slowIndex;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UILabel *startLabel;
@property (nonatomic, strong) UIView *lotteryResultView;
@property (nonatomic, strong) UIView *lotteryResultBgView;
@property (nonatomic, strong) UIView *alertView;
@end

@implementation LuckyDiskVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [UIApplication sharedApplication].statusBarHidden = YES;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kScreenHeight>800?-44:-20, kScreenWidth, kScreenHeight+(kScreenHeight>800?44:20))];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    [scrollView setContentSize:CGSizeMake(kScreenWidth, 810*XT)];
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 810*XT)];
    [bgImageView setImage:[UIImage imageNamed:@"LuckDraw_bg"]];
    [scrollView addSubview:bgImageView];
    
    _rotaryTable = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth-366*XT)/2, 218*XT, 366*XT, 318*XT)];
    _rotaryTable.tag = 100;
    [_rotaryTable setImage:[UIImage imageNamed:@"bg_lamp_1"]];
    [scrollView addSubview:_rotaryTable];
    _itemBorderTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(itemBorderTimerEvent) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_itemBorderTimer forMode:NSRunLoopCommonModes];

    UIView *itemView = [[UIView alloc] initWithFrame:CGRectMake(25*XT, 250*XT, kScreenWidth-50*XT, 248*XT)];
    [scrollView addSubview:itemView];
//
    _itemTitleArray = @[@"3跳币",@"嘉年华门票",@"8跳币",@"10朵花",@"128朵花",@"2018跳币",@"528跳币",@"128跳币",@"28朵花",@"88跳币"];
    NSArray *itemImgArray = @[@"LuckDraw_1",@"LuckDraw_2",@"LuckDraw_3",@"LuckDraw_4",@"LuckDraw_10",@"LuckDraw_5",@"LuckDraw_9",@"LuckDraw_8",@"LuckDraw_7",@"LuckDraw_6"];
    for (int i =0 ; i< 4; i++) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(i*82*XT, 0, 78*XT, 80*XT)];
        [img setImage:[UIImage imageNamed:itemImgArray[i]]];
        [itemView addSubview:img];

        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 63*XT, 78*XT, 13*XT)];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:13*XT];
        label.text = _itemTitleArray[i];
        [img addSubview:label];
    }
//
    for (int i =0; i<2; i++) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(i*(78*XT+169*XT), 84*XT, 78*XT, 80*XT)];
        [img setImage:[UIImage imageNamed:itemImgArray[i+4]]];
        [itemView addSubview:img];

        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 63*XT, 78*XT, 13*XT)];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:13*XT];
        label.text = _itemTitleArray[i + 4];
        [img addSubview:label];
    }
    
    for (int i = 0; i < 4; i++) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(i*82*XT, 168*XT, 78*XT, 80*XT)];
        [img setImage:[UIImage imageNamed:itemImgArray[i + 6]]];
        [itemView addSubview:img];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 63*XT, 78*XT, 13*XT)];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:13*XT];
        label.text = _itemTitleArray[i + 6];
        [img addSubview:label];
    }
    
    _itemBorderView = [[UIView alloc] initWithFrame:CGRectMake(-1*XT, -1*XT, 80*XT, 82*XT)];
    _itemBorderView.hidden = YES;
    [_itemBorderView.layer setBorderColor:XDXColor(247, 227, 2).CGColor];
    [_itemBorderView.layer setCornerRadius:12*XT];
    [_itemBorderView.layer setBorderWidth:2*XT];
    [itemView addSubview:_itemBorderView];
    
    _startButton = [[UIButton alloc] initWithFrame:CGRectMake(82.5*XT, 93.5*XT, 160*XT, 60.5*XT)];
    [_startButton setBackgroundImage:[UIImage imageNamed:@"LuckDraw_button"] forState:UIControlStateNormal];
    [_startButton addTarget:self action:@selector(startButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [itemView addSubview:_startButton];
    
    _startLabel = [[UILabel alloc] initWithFrame:CGRectMake(56*XT, 22*XT, 82*XT, 15*XT)];
    _startLabel.font = [UIFont systemFontOfSize:15*XT];
    _startLabel.textColor = XDXColor(65, 155, 9);
    _startLabel.text = @"开始抽奖";
    [_startButton addSubview:_startLabel];
    
}

//- (void)cancelEvent{
//    [_alertView removeFromSuperview];
//    [_lotteryResultBgView removeFromSuperview];
//}
//
//- (void)doneButtonEvent{
//    [_alertView removeFromSuperview];
//    [_lotteryResultBgView removeFromSuperview];
//}

- (void)getLotteryInfo {
    _fastIndex = 0;
    _slowIndex = -1;
    _selectedIndex = arc4random()%10;
    if (_selectedIndex < 4) {
        _result = _itemTitleArray[_selectedIndex];
    }else if (_selectedIndex == 4){
        _result = @"2018跳币";
    }else if (_selectedIndex == 5){
        _result = @"88跳币";
    }else if (_selectedIndex == 6){
        _result = @"28朵花";
    }else if (_selectedIndex == 7){
        _result = @"128跳币";
    }else if (_selectedIndex == 8){
        _result = @"528跳币";
    }else if (_selectedIndex == 9){
        _result = @"128朵花";
    }
    
    _itemBorderView.hidden = NO;
    _fastTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(fastTimerEvent) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_fastTimer forMode:NSRunLoopCommonModes];
}

- (void)startButtonEvent:(UIButton *)sender {
    _startButton.userInteractionEnabled = NO;
    [self getLotteryInfo];
}



// 边框动画
- (void)itemBorderTimerEvent{
    if (_rotaryTable.tag == 100) {
        _rotaryTable.tag = 101;
        [_rotaryTable setImage:[UIImage imageNamed:@"bg_lamp_2"]];
    }else if (_rotaryTable.tag == 101){
        _rotaryTable.tag = 100;
        [_rotaryTable setImage:[UIImage imageNamed:@"bg_lamp_1"]];
    }
}

// 快速移动动画
- (void)fastTimerEvent {
    _fastIndex = _fastIndex + 1;
    if (_fastIndex % 10 == 0) {
        [_itemBorderView setFrame:CGRectMake(-1*XT, -1*XT, 80*XT, 82*XT)];
    }else if (_fastIndex % 10 == 1){
        [_itemBorderView setFrame:CGRectMake(82*XT-1*XT, -1*XT, 80*XT, 82*XT)];
    }else if (_fastIndex % 10 == 2){
        [_itemBorderView setFrame:CGRectMake(2*82*XT-1*XT, -1*XT, 80*XT, 82*XT)];
    }else if (_fastIndex % 10 == 3){
        [_itemBorderView setFrame:CGRectMake(3*82*XT-1*XT, -1*XT, 80*XT, 82*XT)];
    }else if (_fastIndex % 10 == 4){
        [_itemBorderView setFrame:CGRectMake(3*82*XT-1*XT, 84*XT-1*XT, 80*XT, 82*XT)];
    }else if (_fastIndex % 10 == 5){
        [_itemBorderView setFrame:CGRectMake(3*82*XT-1*XT, 2*84*XT-1*XT, 80*XT, 82*XT)];
    }else if (_fastIndex % 10 == 6){
        [_itemBorderView setFrame:CGRectMake(2*82*XT-1*XT, 2*84*XT-1*XT, 80*XT, 82*XT)];
    }else if (_fastIndex % 10 == 7){
        [_itemBorderView setFrame:CGRectMake(82*XT-1*XT, 2*84*XT-1*XT, 80*XT, 82*XT)];
    }else if (_fastIndex % 10 == 8){
        [_itemBorderView setFrame:CGRectMake(-1*XT, 2*84*XT-1*XT, 80*XT, 82*XT)];
    }else if (_fastIndex % 10 == 9){
        [_itemBorderView setFrame:CGRectMake(-1*XT, 84*XT-1*XT, 80*XT, 82*XT)];
    }
    
    if (_fastIndex >=29) {
        [_fastTimer invalidate];
        _slowTimer = [NSTimer scheduledTimerWithTimeInterval:0.45 target:self selector:@selector(slowTimerEvent) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_slowTimer forMode:NSRunLoopCommonModes];
    }
}

// 慢速移动动画
- (void)slowTimerEvent {
    _slowIndex = _slowIndex + 1;
    if (_slowIndex % 10 == 0) {
        [_itemBorderView setFrame:CGRectMake(-1*XT, -1*XT, 80*XT, 82*XT)];
    }else if (_slowIndex % 10 == 1){
        [_itemBorderView setFrame:CGRectMake(82*XT-1*XT, -1*XT, 80*XT, 82*XT)];
    }else if (_slowIndex % 10 == 2){
        [_itemBorderView setFrame:CGRectMake(2*82*XT-1*XT, -1*XT, 80*XT, 82*XT)];
    }else if (_slowIndex % 10 == 3){
        [_itemBorderView setFrame:CGRectMake(3*82*XT-1*XT, -1*XT, 80*XT, 82*XT)];
    }else if (_slowIndex % 10 == 4){
        [_itemBorderView setFrame:CGRectMake(3*82*XT-1*XT, 84*XT-1*XT, 80*XT, 82*XT)];
    }else if (_slowIndex % 10 == 5){
        [_itemBorderView setFrame:CGRectMake(3*82*XT-1*XT, 2*84*XT-1*XT, 80*XT, 82*XT)];
    }else if (_slowIndex % 10 == 6){
        [_itemBorderView setFrame:CGRectMake(2*82*XT-1*XT, 2*84*XT-1*XT, 80*XT, 82*XT)];
    }else if (_slowIndex % 10 == 7){
        [_itemBorderView setFrame:CGRectMake(82*XT-1*XT, 2*84*XT-1*XT, 80*XT, 82*XT)];
    }else if (_slowIndex % 10 == 8){
        [_itemBorderView setFrame:CGRectMake(-1*XT, 2*84*XT-1*XT, 80*XT, 82*XT)];
    }else if (_slowIndex % 10 == 9){
        [_itemBorderView setFrame:CGRectMake(-1*XT, 84*XT-1*XT, 80*XT, 82*XT)];
    }
    
    if (_slowIndex >= _selectedIndex) {
        [_slowTimer invalidate];
        
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5/*延迟执行时间*/ * NSEC_PER_SEC));
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            self.startButton.userInteractionEnabled = YES;
            [self showLotteryResultView];
        });
        
    }
}

- (void)showLotteryResultView{
    _lotteryResultBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _lotteryResultBgView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_lotteryResultBgView];
   
    _lotteryResultView = [[UIView alloc] initWithFrame:CGRectMake(25*XT, kScreenHeight, 325*XT, 386*XT)];
    [self.view addSubview:_lotteryResultView];
    
    UIButton *close = [[UIButton alloc] initWithFrame:CGRectMake(145*XT, 0, 35*XT, 35*XT)];
    [close setImage:[UIImage imageNamed:@"pop_video_close"] forState:UIControlStateNormal];
    [close addTarget:self action:@selector(closeButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [_lotteryResultView addSubview:close];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 45*XT, 325*XT, 341*XT)];
    [imageView  setImage:[UIImage imageNamed:@"bg_video"]];
    [_lotteryResultView addSubview:imageView];
    
    UILabel *resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200*XT, 325*XT, 18*XT)];
    resultLabel.font = [UIFont systemFontOfSize:18*XT weight:1.5*XT];
    resultLabel.textAlignment = NSTextAlignmentCenter;
    resultLabel.textColor =XDXColor(243, 246, 25);
    resultLabel.text = [NSString stringWithFormat:@"恭喜您获得%@!",_result];
    [_lotteryResultView addSubview:resultLabel];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.lotteryResultView setFrame:CGRectMake(25*XT, 130*XT, 325*XT, 386*XT)];
        self.lotteryResultBgView.backgroundColor = [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.7];
    } completion:nil];
    
}

- (void)closeButtonEvent:(UIButton *)sender {
    [_lotteryResultView removeFromSuperview];
    [_lotteryResultBgView removeFromSuperview];
}
@end
