//
//  WMZCodeView.m
//  WMZCode
//
//  Created by wmz on 2018/12/14.
//  Copyright © 2018年 wmz. All rights reserved.
//

#import "WMZCodeView.h"

@interface WMZCodeView(){
    dispatch_source_t timer; //定时器
}
/// UI
@property(nonatomic,strong)UILabel *tipLabel;                 //提示文本
@property(nonatomic,strong)UIImageView *mainImage;            //背景图片
@property(nonatomic,strong)UIImageView *moveImage;            //可移动图片
@property(nonatomic,strong)CAShapeLayer *maskLayer;           //遮罩层layer
@property(nonatomic,strong)UIButton *refresh;                 //刷新按钮
@property(nonatomic,strong)UIView *maskView;                  //遮罩层
@property(nonatomic,strong)UIView *nineView;                  //九宫格view
@property(nonatomic,strong)WMZSlider *WMZSlider;              //自定义滑动
@property(nonatomic,strong)WMZSlider *slider;                 //滑动
/// Data
@property(nonatomic,strong)NSMutableArray *btnArr;            //按钮数组
@property(nonatomic,copy)NSString *name;                      //文本图片 默认图片“A”
@property(nonatomic,copy)NSString *allChinese;                //所显示的所有中文
@property(nonatomic,copy)NSString *factChinese;               //实际需要点击的中文
@property(nonatomic,copy)NSString *selectChinese;             //点击的中文
@property(nonatomic,assign)CodeType type;                     //类型
@property(nonatomic,assign)int tapCount;                      //点击数量
@property(nonatomic,assign)CGFloat seconds;                   //秒数
@property(nonatomic,assign)CGPoint randomPoint;               //随机位置

@end

@implementation WMZCodeView

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    if (timer) {
        dispatch_source_cancel(timer);
    }
//    JobsRemoveNotification(self);
}
/// 单例化和销毁
+(void)destroySingleton{
    static_codeViewOnceToken = 0;
    static_codeView = nil;
}

static WMZCodeView *static_codeView = nil;
static dispatch_once_t static_codeViewOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_codeViewOnceToken, ^{
        static_codeView = WMZCodeView.new;
    });return static_codeView;
}
/// 调用方法
/// @param type 类型
/// @param name 背景图
/// @param rect frame
- (WMZCodeView*)addCodeViewWithType:(CodeType)type
                      withImageName:(NSString *)name
                          witgFrame:(CGRect)rect{
    self.frame = rect;
    self.name = [name copy];
    self.type = type;
    [self addViewWithType:type];
    return self;
}
/// 根据type不同进行布局
- (void)addViewWithType:(CodeType)type{
    switch (type) {
        case CodeTypeImage:{
            [self CodeTypeImageView];
        }break;
        case CodeTypeLabel:{
            [self CodeTypeLabelView];
        }break;
        case CodeTypeNineLabel:{
            [self CodeTypeLabelView];
        }break;
        case CodeTypeSlider:{
            [self CodeTypeSliderView];
        }break;
    }
}
/// CodeTypeImage
- (void)CodeTypeImageView{
    [self addSubview:({
        self.tipLabel.text = JobsInternationalization(@"拖动下方滑块完成拼图");
        self.tipLabel.frame = CGRectMake(WMZmargin,
                                         WMZmargin,
                                         self.width - WMZmargin * 2,
                                         30);
        self.tipLabel;
    })];
    
    [self addSubview:({
        self.mainImage.frame = CGRectMake(WMZmargin,
                                          CGRectGetMaxY(self.tipLabel.frame) + WMZmargin,
                                          self.width - WMZmargin * 2,
                                          WMZimageHeight);
        self.mainImage.contentMode = UIViewContentModeScaleAspectFill;
        self.mainImage.clipsToBounds = YES;
        self.mainImage;
    })];
    
    [self addSubview:({
        self.slider.frame = CGRectMake(WMZmargin,
                                       CGRectGetMaxY(self.mainImage.frame) + WMZmargin,
                                       self.width - WMZmargin * 2,
                                       30);
        [self.slider addTarget:self action:@selector(buttonAction:forEvent:) forControlEvents:UIControlEventAllTouchEvents];
        self.slider.layer.masksToBounds = YES;
        self.slider.layer.cornerRadius = 15;//UISlider
        self.slider;
    })];
    
    [self addSubview:({
        self.refresh.frame = CGRectMake(self.width - WMZmargin - 50,
                                        CGRectGetMaxY(self.slider.frame) + WMZmargin,
                                        40,
                                        40);
        @jobs_weakify(self)
        [self.refresh jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            [self refreshAction];
            return nil;
        }];
        self.refresh.jobsResetBtnImage(JobsIMG(@"refresh"));
        self.refresh;
    })];
    self.resetHeight(CGRectGetMaxY(self.refresh.frame) + WMZmargin);
    [self refreshAction];
}
//CodeTypeLabel and  CodeTypeNineLabel
- (void)CodeTypeLabelView{
    [self addSubview:({
        [self setMyTipLabetText];
        self.tipLabel.frame = CGRectMake(WMZmargin,
                                         WMZmargin,
                                         self.width - WMZmargin * 2,
                                         30);
        self.tipLabel;
    })];
    
    [self addSubview:({
        self.mainImage.frame = CGRectMake(WMZmargin,
                                          CGRectGetMaxY(self.tipLabel.frame) + WMZmargin,
                                          self.width - WMZmargin * 2,
                                          WMZimageHeight);
        self.mainImage.image = JobsIMG(self.name);
        self.mainImage.contentMode =  UIViewContentModeScaleAspectFill;
        self.mainImage.clipsToBounds = YES;
        self.mainImage.userInteractionEnabled = YES;
        self.mainImage;
    })];
    
    [self addSubview:({
        self.refresh.frame = CGRectMake(self.width - WMZmargin - 50,
                                        CGRectGetMaxY(self.mainImage.frame) + WMZmargin,
                                        40,
                                        40);
        self.refresh.jobsResetBtnImage(JobsIMG(@"refresh"));
        @jobs_weakify(self)
        [self.refresh jobsBtnClickEventBlock:^id(id data) {
            @jobs_strongify(self)
            [self refreshAction];
            return nil;
        }];
        self.refresh;
    })];
    self.resetHeight(CGRectGetMaxY(self.refresh.frame) + WMZmargin);
    [self addLabelImage];
}
/// CodeTypeSlider
- (void)CodeTypeSliderView{
    if (self.height < 40) {
        self.height = 40;
    }
    self.WMZSlider.frame = CGRectMake(WMZmargin - 3,
                                      -3,
                                      self.width - 2 * WMZmargin + 6,
                                      self.height+ 6 );
    self.WMZSlider.minimumTrackTintColor = JobsClearColor;
    self.WMZSlider.maximumTrackTintColor = JobsClearColor;
    UIImage *tempImage = JobsIMG(@"SliderBtn");
    tempImage = [tempImage imageScaleToSize:CGSizeMake(self.height+6, self.height+6)];
    [self.WMZSlider setThumbImage:tempImage forState:UIControlStateNormal];
    [self.WMZSlider setThumbImage:tempImage forState:UIControlStateHighlighted];
    /// 滑块滑动事件
    @jobs_weakify(self)
    [self.WMZSlider jobsSliderValueChangedEventBlock:^(UISlider *x) {
        @jobs_strongify(self)
        [x setValue:x.value animated:NO];
        x.minimumTrackTintColor = x.value > 0 ? JobsRedColor : JobsClearColor;
        if (!x.isTracking && x.value != 1) {
            [x setValue:0 animated:YES];
            x.minimumTrackTintColor = x.value > 0 ? JobsRedColor : JobsClearColor;
        }
        if (!x.isTracking&&x.value==1) {
            [self.layer addAnimation:successAnimal() forKey:@"successAnimal"];
            [self successShow];
        }
    }];
    [self addSubview:self.WMZSlider];
    
    self.WMZSlider.label.frame = CGRectMake(WMZmargin, 0, self.width-2*WMZmargin, self.height);
    [self addSubview:self.WMZSlider.label];
    
    self.WMZSlider.label.layer.masksToBounds = YES;
    self.WMZSlider.label.layer.cornerRadius = (self.height)/2;
    
    self.WMZSlider.layer.masksToBounds = YES;
    self.WMZSlider.layer.cornerRadius = (self.height+6)/2;
}
/// 添加可移动的图片
- (void)addMoveImage{
    UIImage *jobsResetBtnImage = JobsIMG(self.name);
    jobsResetBtnImage = [jobsResetBtnImage dw_RescaleImageToSize:CGSizeMake(self.width-WMZmargin*2, WMZimageHeight)];
    self.mainImage.image = jobsResetBtnImage;
    [self.mainImage addSubview:({
        self.maskView.frame = CGRectMake(self.randomPoint.x,
                                         self.randomPoint.y,
                                         codeSize,
                                         codeSize);
        self.maskView;
    })];
    
    UIBezierPath *path = getCodePath();
    UIImage * thumbImage = [self.mainImage.image dw_SubImageWithRect:self.maskView.frame];
    thumbImage = [thumbImage dw_ClipImageWithPath:path mode:(DWContentModeScaleToFill)];
    [self.mainImage addSubview:({
        self.moveImage.frame = CGRectMake(0,
                                          self.randomPoint.y - WMZoffset,
                                          codeSize+WMZoffset,
                                          codeSize+WMZoffset);
        self.moveImage.image = thumbImage;
        self.moveImage;
    })];
    
    [self.maskView.layer addSublayer:({
        self.maskLayer.frame = CGRectMake(0,
                                          0,
                                          codeSize,
                                          codeSize);
        self.maskLayer.path = path.CGPath;
        self.maskLayer.strokeColor = JobsWhiteColor.CGColor;
        self.maskLayer;
    })];
}
/// 添加随机位置的文本
- (void)addLabelImage{
    NSMutableArray *tempArr = NSMutableArray.array;
    for (int i = 0; i< self.allChinese.length; i++) {
        [tempArr addObject:[self.allChinese substringWithRange:NSMakeRange(i, 1)]];
    }
    NSArray* arr = [NSArray arrayWithArray:tempArr];
    arr = [arr sortedArrayUsingComparator:^NSComparisonResult(NSString *str1, NSString *str2) {
        int seed = arc4random_uniform(2);
        return seed ? [str1 compare:str2] : [str2 compare:str1];
    }];
    
    NSMutableString *string = [NSMutableString.alloc initWithString:JobsInternationalization(@"")];
    for (int i = 0; i< arr.count; i++) {
        [string appendString:arr[i]];
    }
    self.allChinese = [NSString stringWithFormat:@"%@",string];
    CGFloat btnWidth = (self.width-2*WMZmargin-(arr.count-1)*WMZmargin)/arr.count;
    
    if (self.type == CodeTypeNineLabel) {
        btnWidth = 40;
        if (!_nineView) {
            _nineView = UIView.new;
            _nineView.userInteractionEnabled = YES;
            _nineView.backgroundColor = JobsClearColor;
            _nineView.frame = CGRectMake(0, (WMZimageHeight - btnWidth * 3 - WMZmargin * 2) / 2, btnWidth * 3 + WMZmargin * 2, btnWidth * 3 + WMZmargin * 2);
            [_nineView addSubview:self.nineView];
            _nineView.center = CGPointMake(self.mainImage.center.x, self.nineView.center.y);
        }
    }
    
    if (!self.btnArr.count) {
        UIButton *tempBtn = nil;
        for (int i = 0; i < arr.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.backgroundColor = JobsWhiteColor;
            btn.jobsResetBtnTitleCor(JobsBlackColor);
            btn.jobsResetBtnTitle(arr[i]);
            btn.jobsResetBtnTitleFont([UIFont systemFontOfSize:20.0]);
            btn.layer.masksToBounds = YES;
            btn.layer.cornerRadius = btnWidth/2;
            @jobs_weakify(self)
            [btn jobsBtnClickEventBlock:^id(UIButton *x) {
                @jobs_strongify(self)
                [self tapAction:x];
                return nil;
            }];
            CGFloat h = [self getRandomNumber:btnWidth to:WMZimageHeight-WMZmargin];
            if (self.type == CodeTypeLabel) {
                btn.frame = tempBtn ? CGRectMake(CGRectGetMaxX(tempBtn.frame) + WMZmargin, h, btnWidth, btnWidth) : CGRectMake(WMZmargin, h, btnWidth, btnWidth);
                [self addSubview:btn];
                tempBtn = btn;
            }
            if (self.type == CodeTypeNineLabel) {
                CGFloat X = (i % 3) * (btnWidth + WMZmargin);
                CGFloat Y = (i / 3) * (btnWidth + WMZmargin);
                btn.frame = CGRectMake(X, Y, btnWidth, btnWidth);
                [self.nineView addSubview:btn];
            }
            [self.btnArr addObject:btn];
        }
    }else{
         for (int i = 0; i < self.btnArr.count; i++) {
             UIButton *btn = self.btnArr[i];
             btn.jobsResetBtnTitle(arr[i]);
               if (self.type == CodeTypeLabel) {
                 CGFloat h = [self getRandomNumber:btnWidth to:WMZimageHeight-WMZmargin];
                 btn.frame = CGRectMake(btn.frame.origin.x, h, btnWidth, btnWidth);
               }
         }
    }
}
/// 按钮点击事件
- (void)tapAction:(UIButton*)btn{
    if (!self.tapCount) {
        dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        self.seconds = 0;
        timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, global);
        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
        @jobs_weakify(self)
        dispatch_source_set_event_handler(timer, ^{
            @jobs_strongify(self)
            self.seconds += 0.1;
            NSLog(@"%.1f",self.seconds);
        });
        dispatch_resume(timer);
    }
    self.tapCount += 1;
    self.selectChinese = [NSString stringWithFormat:@"%@%@",self.selectChinese?:JobsInternationalization(@""),btn.titleLabel.text];
    btn.backgroundColor = JobsRedColor;
    if (self.tapCount == self.factChinese.length) {
        if (timer) {
            dispatch_source_cancel(timer);
        }
        if ([self.selectChinese isEqualToString:self.factChinese]) {
            [self.layer addAnimation:successAnimal() forKey:@"successAnimal"];
            [self successShow];
        }else{
            [self.layer addAnimation:failAnimal() forKey:@"failAnimal"];
        }
        [self defaultBtnAndData];
    }
}
/// 图片验证滑块的所有事件
- (void)buttonAction:(UISlider *)slider
            forEvent:(UIEvent *)event{
    UITouchPhase phase = event.allTouches.anyObject.phase;
    if (phase == UITouchPhaseBegan) {
        dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        self.seconds = 0;
        timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, global);
        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
        @jobs_weakify(self)
        dispatch_source_set_event_handler(timer, ^{
            @jobs_strongify(self)
            self.seconds += 0.1;
            NSLog(@"%.1f",self.seconds);
        });
        dispatch_resume(timer);
    }else if(phase == UITouchPhaseEnded){
        if (timer) {
            dispatch_source_cancel(timer);
        }
        CGFloat x = self.maskView.frame.origin.x;
        if (fabs(self.moveImage.frame.origin.x-x) <= 5.00) {
            [self.layer addAnimation:successAnimal() forKey:@"successAnimal"];
            [self successShow];
        }else{
            [self.layer addAnimation:failAnimal() forKey:@"failAnimal"];
            [self defaultSlider];
        }
    }else if (phase == UITouchPhaseMoved){
        if (slider.value > self.width - WMZmargin * 2 - codeSize) {
            slider.value = self.width - WMZmargin * 2 - codeSize;
            return;
        }
        [self changeSliderWithVlue:slider.value];
    }
}
/// 设置默认的滑动
-(void)defaultSlider{
    self.slider.value = 0.05;
    [self changeSliderWithVlue:self.slider.value];
}
/// 图片位置随着Slider滑动改变frame
-(void)changeSliderWithVlue:(CGFloat)value{
    self.moveImage.resetOriginX(value * (self.mainImage.frame.size.width) - (value * codeSize));
}
/// 恢复默认数据（CodeTypeLabel,CodeTypeNineLabel ）
-(void)defaultBtnAndData{
    self.selectChinese = JobsInternationalization(@"");
    self.tapCount = 0;
    for (int i = 0; i < self.btnArr.count; i++) {
        UIButton *btn = self.btnArr[i];
        btn.backgroundColor = JobsWhiteColor;
    }
}
/// 刷新按钮事件
- (void)refreshAction{
    self.seconds = 0;
    if (timer) {
        dispatch_source_cancel(timer);
    }
//    self.name = [self getRandomNumber:0 to:1]==1?@"A":@"B";
    if (self.type == CodeTypeImage){
        [self getRandomPoint];
        [self addMoveImage];
        [self defaultSlider];
    }
    if (self.type == CodeTypeSlider) {
        [self.WMZSlider setValue:0 animated:YES];
    }
    if (self.type == CodeTypeLabel||self.type ==CodeTypeNineLabel) {
        self.mainImage.image = JobsIMG(self.name);
        self.factChinese = nil;
        self.allChinese = nil;
        [self setMyTipLabetText];
        [self defaultBtnAndData];
        [self addLabelImage];
    }
}
/// 设置提示文本
-(void)setMyTipLabetText{
    NSString *str = [NSString stringWithFormat:@"按顺序点击‘%@’完成验证",self.factChinese];
    NSMutableAttributedString *attStr = [NSMutableAttributedString.alloc initWithString:str];
    [attStr addAttribute:NSFontAttributeName
                   value:[UIFont systemFontOfSize:WMZfont+2]
                   range:[str rangeOfString:self.factChinese]];
    [attStr addAttribute:NSForegroundColorAttributeName
                   value:JobsRedColor
                   range:[str rangeOfString:self.factChinese]];
    self.tipLabel.attributedText = attStr;
}
/// 成功动画
NS_INLINE CABasicAnimation *successAnimal(void){
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.duration = 0.2;
    animation.autoreverses = YES;
    animation.fromValue = @1;
    animation.toValue = @0;
    animation.removedOnCompletion = YES;
    return animation;
}
/// 失败动画
NS_INLINE CABasicAnimation *failAnimal(void){
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [animation setDuration:0.08];
    animation.fromValue = @(-M_1_PI/16);
    animation.toValue = @(M_1_PI/16);
    animation.repeatCount = 2;
    animation.autoreverses = YES;
    return animation;
}
/// 成功的操作
- (void)successShow{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                 (int64_t)(0.2 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
        if (self.seconds > 0) {
            toast([NSString stringWithFormat:@"耗时%.1fs",self.seconds]);
            self.BOOLBlock(YES);
        }
    });
}
/// 配置滑块贝塞尔曲线
NS_INLINE UIBezierPath *getCodePath(void){
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(codeSize * 0.5 - WMZoffset,0)];
    [path addQuadCurveToPoint:CGPointMake(codeSize * 0.5 + WMZoffset, 0)
                 controlPoint:CGPointMake(codeSize * 0.5, -WMZoffset * 2)];
    [path addLineToPoint:CGPointMake(codeSize, 0)];
    
    
    [path addLineToPoint:CGPointMake(codeSize,codeSize * 0.5-WMZoffset)];
    [path addQuadCurveToPoint:CGPointMake(codeSize, codeSize * 0.5 + WMZoffset)
                 controlPoint:CGPointMake(codeSize + WMZoffset * 2, codeSize * 0.5)];
    [path addLineToPoint:CGPointMake(codeSize, codeSize)];
    
    [path addLineToPoint:CGPointMake(codeSize * 0.5 + WMZoffset,codeSize)];
    [path addQuadCurveToPoint:CGPointMake(codeSize * 0.5 - WMZoffset, codeSize)
                 controlPoint:CGPointMake(codeSize * 0.5, codeSize - WMZoffset * 2)];
    [path addLineToPoint:CGPointMake(0, codeSize)];
    
    [path addLineToPoint:CGPointMake(0,codeSize * 0.5 + WMZoffset)];
    [path addQuadCurveToPoint:CGPointMake(0, codeSize * 0.5 - WMZoffset)
                 controlPoint:CGPointMake(0 + WMZoffset * 2, codeSize * 0.5)];
    [path addLineToPoint:CGPointMake(0, 0)];
    
    [path stroke];
    return path;
}
/// 获取随机位置
- (void)getRandomPoint{
    CGFloat widthMax =  self.mainImage.frame.size.width-WMZmargin-codeSize;
    CGFloat heightMax = self.mainImage.frame.size.height-codeSize*2;
    self.randomPoint = CGPointMake([self getRandomNumber:WMZmargin+codeSize*2 to:widthMax],
                                   [self getRandomNumber:WMZoffset*2 to:heightMax]);
    NSLog(@"%f %f",self.randomPoint.x,self.randomPoint.y);
}
/// 获取一个随机整数，范围在[from, to]，包括from，包括to
- (int)getRandomNumber:(int)from to:(int)to {
    return (int)(from + (arc4random() % (to - from + 1)));
}
/// 获取随机数量中文
-(JobsReturnStringByIntegerBlock _Nonnull)getRandomChineseWithCount{
    return ^__kindof NSString *_Nullable(NSInteger count){
        NSMutableString *mString = JobsMutableString(@"");
        NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
       for (int i = 0; i < count; i++) {
           NSInteger randomH = 0xA1 + arc4random()%(0xFE - 0xA1+1);
           NSInteger randomL = 0xB0 + arc4random()%(0xF7 - 0xB0+1);
           NSInteger number = (randomH << 8) + randomL;
           NSData *data = [NSData dataWithBytes:&number length:2];
           NSString *string = [NSString.alloc initWithData:data encoding:gbkEncoding];
           if (string) mString.add(string);
       }return [NSString stringWithFormat:@"%@",mString];
    };
}

- (NSString *)name{
    if (!_name) {
        _name = @"A";
    }return _name;
}

- (UILabel *)tipLabel{
    if (!_tipLabel) {
        _tipLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:WMZfont];
        });
    }return _tipLabel;
}

- (UIImageView *)mainImage{
    if (!_mainImage) {
        _mainImage = UIImageView.new;
    }return _mainImage;
}

- (UIView *)maskView{
    if (!_maskView) {
        _maskView = UIView.new;
        _maskView.alpha = 0.5;
    }return _maskView;
}

- (UIImageView *)moveImage{
    if (!_moveImage) {
        _moveImage = UIImageView.new;
    }return _moveImage;
}

- (WMZSlider *)slider{
    if (!_slider) {
        _slider = WMZSlider.new;
        _slider.thumbTintColor = JobsGreenColor;
    }return _slider;
}

-(UIButton *)refresh{
    if (!_refresh) {
        _refresh = [UIButton buttonWithType:UIButtonTypeCustom];
        [_refresh setAdjustsImageWhenHighlighted:NO];
    }return _refresh;
}

- (CAShapeLayer *)maskLayer{
    if (!_maskLayer) {
        _maskLayer = CAShapeLayer.layer;
    }return _maskLayer;
}

- (WMZSlider *)WMZSlider{
    if (!_WMZSlider) {
        _WMZSlider = WMZSlider.new;
    }return _WMZSlider;
}

- (NSString *)factChinese{
    if (!_factChinese) {
        _factChinese = self.getRandomChineseWithCount(codeLabelCount);
    }return _factChinese;
}

- (NSString *)allChinese{
    if (!_allChinese) {
        _allChinese = self.factChinese.add(self.getRandomChineseWithCount(self.type == CodeTypeNineLabel ? 9 - codeLabelCount:codeAddLabelCount));
    }return _allChinese;
}

- (NSMutableArray *)btnArr{
    if (!_btnArr) {
        _btnArr = NSMutableArray.array;
    }return _btnArr;
}

@end

@implementation WMZSlider
/// 改变滑动条高度
-(CGRect)trackRectForBounds:(CGRect)bounds{
    return CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

-(UILabel *)label{
    if (!_label) {
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.center = self.center;
            label.text = JobsInternationalization(@"按住滑块拖动到最右边");
            label.font = [UIFont systemFontOfSize:WMZfont];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = RGBA_COLOR(193, 193, 193, 1);
            label.layer.masksToBounds = YES;
            label.layer.borderWidth = 1;
            label.layer.borderColor = RGBA_COLOR(193, 193, 193, 1).CGColor;
        });
    }return _label;
}

@end
