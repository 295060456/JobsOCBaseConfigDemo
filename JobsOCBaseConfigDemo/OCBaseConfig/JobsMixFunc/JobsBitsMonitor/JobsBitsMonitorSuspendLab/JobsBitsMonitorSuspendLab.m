//
//  JobsBitsMonitorSuspendLab.m
//  JobsBitsMonitor
//
//  Created by Jobs on 2020/12/13.
//

#import "JobsBitsMonitorSuspendLab.h"

extern JobsNetworkingEnvir networkingEnvir;

@interface JobsBitsMonitorSuspendLab ()
/// Data
@property(nonatomic,strong)NSMutableArray <NSString *>*operationEnvironMutArr;

@end

@implementation JobsBitsMonitorSuspendLab

-(void)dealloc{
    JobsRemoveNotification(self);;
}

-(instancetype)init{
    if (self = [super init]) {
        /// download
        [JobsNotificationCenter addObserverForName:GSDownloadNetworkSpeedNotificationKey
                                            object:nil
                                             queue:nil
                                        usingBlock:^(NSNotification * _Nonnull notification) {
            
            NSLog(@"%@",notification.object);
        }];
        /// upload
        [JobsNotificationCenter addObserverForName:GSUploadNetworkSpeedNotificationKey
                                            object:nil
                                             queue:nil
                                        usingBlock:^(NSNotification * _Nonnull notification) {
            
            NSLog(@"%@",notification.object);
        }];
        /// UploadAndDownload
        [JobsNotificationCenter addObserverForName:GSUploadAndDownloadNetworkSpeedNotificationKey
                                            object:nil
                                             queue:nil
                                        usingBlock:^(NSNotification * _Nonnull notification) {
            NSLog(@"%@",notification.object);
            self.text = notification.object;
            [self makeLabelByShowingType:UILabelShowingType_03];
        }];
        
        {
            self.numberOfTouchesRequired = 1;
            self.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
            self.minimumPressDuration = 0.1;
            self.numberOfTouchesRequired = 1;
            self.allowableMovement = 1;
            self.userInteractionEnabled = YES;
            @jobs_weakify(self)
            self.target = weak_self;
            self.tapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                               UITapGestureRecognizer *_Nullable arg) {
                @jobs_strongify(self)
                [self showMenu];
                return nil;
            }];self.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
        }
    }return self;
}
#pragma mark —— 一些私有方法
-(void)showMenu{
    ZWPullMenuView *menuView = [ZWPullMenuView pullMenuAnchorView:self
                                                       titleArray:self.operationEnvironMutArr];
    @jobs_weakify(self)
    menuView.blockSelectedMenu = ^(NSInteger menuRow) {
        @jobs_strongify(self)
        NSLog(@"action----->%ld",(long)menuRow);
        networkingEnvir = menuRow;
        if (menuRow + 1 <= self.operationEnvironMutArr.count) {
            [WHToast jobsToastMsg:[JobsInternationalization(@"当前环境") stringByAppendingString:self.operationEnvironMutArr[menuRow]]];
        }else{
            [WHToast jobsToastErrMsg:JobsInternationalization(@"切换环境出现错误")];
        }
    };
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGRect)viewFrameWithModel:(id _Nullable)model{
    return CGRectMake(JobsWidth(20),
                      JobsMainScreen_HEIGHT() - JobsWidth(200),
                      JobsWidth(80),
                      JobsWidth(40));
}
#pragma mark —— lazyLoad
-(NSMutableArray<NSString *> *)operationEnvironMutArr{
    if (!_operationEnvironMutArr) {
        _operationEnvironMutArr = NSMutableArray.array;
        [_operationEnvironMutArr addObject:JobsInternationalization(@"开发环境_01")];
        [_operationEnvironMutArr addObject:JobsInternationalization(@"开发环境_02")];
        [_operationEnvironMutArr addObject:JobsInternationalization(@"开发环境_03")];
        [_operationEnvironMutArr addObject:JobsInternationalization(@"开发环境_04")];
        [_operationEnvironMutArr addObject:JobsInternationalization(@"测试环境")];
        [_operationEnvironMutArr addObject:JobsInternationalization(@"UAT环境")];
        [_operationEnvironMutArr addObject:JobsInternationalization(@"生产环境")];
    }return _operationEnvironMutArr;
}

@end
