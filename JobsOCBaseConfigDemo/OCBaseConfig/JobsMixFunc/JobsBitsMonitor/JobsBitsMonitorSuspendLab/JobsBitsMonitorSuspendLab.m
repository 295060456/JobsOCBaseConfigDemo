//
//  JobsBitsMonitorSuspendLab.m
//  JobsBitsMonitor
//
//  Created by Jobs on 2020/12/13.
//

#import "JobsBitsMonitorSuspendLab.h"

@interface JobsBitsMonitorSuspendLab ()
/// Data
Prop_strong()NSMutableArray <NSString *>*operationEnvironMutArr;

@end

@implementation JobsBitsMonitorSuspendLab

-(void)dealloc{
    JobsRemoveNotification(self);
}

-(instancetype)init{
    if (self = [super init]) {
//        /// download
//        [JobsNotificationCenter addObserverForName:GSDownloadNetworkSpeedNotificationKey
//                                            object:nil
//                                             queue:nil
//                                        usingBlock:^(NSNotification * _Nonnull notification) {
//
//            JobsLog(@"%@",notification.object);
//        }];
//        /// upload
//        [JobsNotificationCenter addObserverForName:GSUploadNetworkSpeedNotificationKey
//                                            object:nil
//                                             queue:nil
//                                        usingBlock:^(NSNotification * _Nonnull notification) {
//
//            JobsLog(@"%@",notification.object);
//        }];
//        /// UploadAndDownload
//        [JobsNotificationCenter addObserverForName:GSUploadAndDownloadNetworkSpeedNotificationKey
//                                            object:nil
//                                             queue:nil
//                                        usingBlock:^(NSNotification * _Nonnull notification) {
//            JobsLog(@"%@",notification.object);
//            self.text = notification.object;
//            self.makeLabelByShowingType(UILabelShowingType_03);
//        }];

        {
            self.numberOfTouchesRequired = 1;
            self.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
            self.minimumPressDuration = 0.1;
            self.numberOfTouchesRequired = 1;
            self.allowableMovement = 1;
            self.userInteractionEnabled = YES;
            @jobs_weakify(self)
            self.weak_target = weak_self;
            self.tapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                               UITapGestureRecognizer *_Nullable arg) {
                @jobs_strongify(self)
                ZWPullMenuView *menuView = [ZWPullMenuView pullMenuAnchorView:self
                                                                   titleArray:self.operationEnvironMutArr];
                @jobs_weakify(self)
                menuView.blockSelectedMenu = ^(NSInteger menuRow) {
                    @jobs_strongify(self)
                    JobsLog(@"action----->%ld",(long)menuRow);
                    networkingEnvir(menuRow);
                    if (menuRow + 1 <= self.operationEnvironMutArr.count) {
                        self.jobsToastMsg(JobsInternationalization(@"当前环境").add(self.operationEnvironMutArr[menuRow]));
                    }else self.jobsToastErrMsg(JobsInternationalization(@"切换环境出现错误"));
                };return nil;
            }];self.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
        }

        [self commonInit_JobsBitsMonitorSuspendLab];
    }return self;
}

- (void)commonInit_JobsBitsMonitorSuspendLab {
    // 👉 基础外观，尽量跟你 Swift 悬浮 Lab 的感觉一致
    self.numberOfLines   = 0;
    self.textAlignment   = NSTextAlignmentCenter;
    self.layer.cornerRadius  = 8.0;
    self.layer.masksToBounds = YES;
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    // 默认字体 & 颜色
    self.textColor = [UIColor whiteColor];
    self.font      = [UIFont monospacedDigitSystemFontOfSize:11 weight:UIFontWeightMedium];
    self.displayStyle = JobsBitsMonitorDisplayStylePlainText;
}

-(JobsRetLabelByText _Nonnull)byText{
    @jobs_weakify(self)
    return ^__kindof JobsBitsMonitorSuspendLab *_Nullable(__kindof NSString *_Nullable text){
        @jobs_strongify(self)
        self.displayStyle   = JobsBitsMonitorDisplayStylePlainText;
        self.attributedText = nil;
        self.text           = text;
        // 普通文本可以稍微简单一点
        self.font      = [UIFont systemFontOfSize:11 weight:UIFontWeightRegular];
        self.textColor = [UIColor whiteColor];
        return self;
    };
}

-(JobsRetLabelByAttributedString _Nonnull)byAttributedString{
    @jobs_weakify(self)
    return ^__kindof JobsBitsMonitorSuspendLab *_Nullable(__kindof NSAttributedString *_Nullable attributedString){
        @jobs_strongify(self)
        self.displayStyle = JobsBitsMonitorDisplayStyleRichText;
        self.text         = nil;
        self.attributedText = attributedString;
        // 字体、颜色都由外部富文本控制，这里不再动它
        return self;
    };
}
#pragma mark —— 一些私有方法
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetFrameByIDBlock _Nonnull)viewFrameByModel{
    return ^CGRect(id _Nullable data){
        return CGRectMake(JobsWidth(20),
                          JobsMainScreen_HEIGHT() - JobsWidth(200),
                          JobsWidth(80),
                          JobsWidth(40));
    };
}
#pragma mark —— lazyLoad
-(NSMutableArray<NSString *> *)operationEnvironMutArr{
    if (!_operationEnvironMutArr) {
        _operationEnvironMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(JobsInternationalization(@"开发环境_01"));
            data.add(JobsInternationalization(@"开发环境_02"));
            data.add(JobsInternationalization(@"开发环境_03"));
            data.add(JobsInternationalization(@"开发环境_04"));
            data.add(JobsInternationalization(@"测试环境"));
            data.add(JobsInternationalization(@"UAT环境"));
            data.add(JobsInternationalization(@"生产环境"));
        });
    }return _operationEnvironMutArr;
}

@end
