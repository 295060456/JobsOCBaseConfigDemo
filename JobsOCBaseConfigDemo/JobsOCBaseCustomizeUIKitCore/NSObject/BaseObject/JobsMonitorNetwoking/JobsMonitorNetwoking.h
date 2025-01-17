//
//  MonitorNetwoking.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/8/13.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>

#import "JobsSuspendLab.h"

NS_ASSUME_NONNULL_BEGIN
///思路：先获取到总的流量信息，然后用当前的总下行流量减去上一秒的下行流量得到网速！
@interface JobsMonitorNetwoking : NSObject

@property(nonatomic,strong)JobsSuspendLab *rateLabel;

+(JobsMonitorNetwoking *)sharedManager;
-(long long)getInterfaceBytes;
-(void)getInternetface;
-(NSString *)formatNetWork:(long long int)rate;

@end

NS_ASSUME_NONNULL_END

//使用须知
//- (void)dealloc {
//    JobsLog(@"%@",JobsLocalFunc);
//    [self.mytimer invalidate];
//    //别忘了把定时器置为nil,否则定时器依然没有释放掉的
//    self.mytimer  = nil;
//}
//
//-(void)viewDidLoad{
//    self.view.backgroundColor = JobsBlueColor;
//    #ifdef DEBUG
//    self.mytimer = [NSTimer scheduledTimerWithTimeInterval:1.0
//                                                    target:self
//                                                  selector:@selector(makeMonitorNetwoking)
//                                                  userInfo:nil
//                                                   repeats:YES];
//    [self.mytimer fireDate];
//    #endif
//}
//
//#pragma mark - 网络监控
//-(void)makeMonitorNetwoking{
//    [self.monitorNetwoking getInternetface];
//}
