//
//  JobsScrollYView.m
//  MataShop
//
//  Created by Jobs Hi on 9/19/23.
//

#import "JobsScrollYView.h"

@interface JobsScrollYView ()

@property(nonatomic,assign)CGPoint initialTouchPoint;

@end

@implementation JobsScrollYView
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_scrollYViewOnceToken = 0;
    static_scrollYView = nil;
}

static JobsScrollYView *static_scrollYView = nil;
static dispatch_once_t static_scrollYViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_scrollYViewOnceToken, ^{
        static_scrollYView = JobsScrollYView.new;
    });return static_scrollYView;
}
#pragma mark —— 系统初始化方法
-(instancetype)init{
    if (self = [super init]) {
        
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        @jobs_weakify(self)
        JobsAddNotification(self,
                        selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                  id _Nullable arg){
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:NSNumber.class]){
                NSNumber *b = notification.object;
                NSLog(@"SSS = %d",b.boolValue);
            }
            @jobs_strongify(self)
            NSLog(@"通知传递过来的 = %@",notification.object);
            return nil;
        },nil, self),JobsLanguageSwitchNotification,nil);
    }return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock)jobsRichElementsInViewWithModel{
    @jobs_weakify(self)
    return ^(id _Nullable data) {
        @jobs_strongify(self)
        [self setupGesture];
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsMainScreen_HEIGHT());
}
#pragma mark —— 一些私有方法
- (void)setupGesture {
    self.userInteractionEnabled = YES;
    self.target = self;
    @jobs_weakify(self)
    self.panGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id _Nullable weakSelf,
                                                                       UIPanGestureRecognizer *_Nullable sender) {
        @jobs_strongify(self)
        CGPoint translation = [sender translationInView:self.superview];
        self.jobsPoint = translation;
        
        if (sender.state == UIGestureRecognizerStateBegan) {
            self.initialTouchPoint = self.center;
        }

        if (sender.state == UIGestureRecognizerStateChanged) {
            CGFloat maxH = JobsMainScreen_HEIGHT() / 2 + 初始位置;
            CGFloat minH = JobsMainScreen_HEIGHT() / 2 + 终点位置;
            // 计算新的位置
            CGFloat newY = self.initialTouchPoint.y + translation.y;
            // 限制在 minY 和 maxY 之间
            newY = MAX(minH, newY);
            newY = MIN(maxH, newY);
            self.center = CGPointMake(self.initialTouchPoint.x, newY);
        }
        if (sender.state == UIGestureRecognizerStateEnded) {
            NSLog(@"translation = %f",translation.y);// 向上为负、向下为正
            NSLog(@"fdfd = %f",self.center.y);//541.333328 703.666672
            // 在手势结束时，检查视图的位置并执行你想要的操作
            if(self.objectBlock) self.objectBlock(self);
        }return nil;
    }];self.panGR.enabled = YES;
}
#pragma mark —— lazyLoad

@end
