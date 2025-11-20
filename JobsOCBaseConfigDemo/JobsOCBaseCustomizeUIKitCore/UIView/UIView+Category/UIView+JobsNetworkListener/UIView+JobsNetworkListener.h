//
//  UIView+JobsNetworkListener.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 11/19/25.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsBitsMonitorSuspendLab.h"


NS_ASSUME_NONNULL_BEGIN

@interface UIView (JobsNetworkListener)
/// 悬浮网络监听 Label（懒加载＋单例挂在当前 view 上）
/// - 返回 JobsBitsMonitorSuspendLab，方便继续 .byText / .byAttributedString 链式调用
- (JobsBitsMonitorSuspendLab *)makeNetworkListener;

@end

NS_ASSUME_NONNULL_END
#pragma mark - 格式化工具（对应 jobs_formatSpeed）

static NSString * _Nonnull JobsFormatSpeed(uint64_t bytesPerSec) {
    if (bytesPerSec < 1024) {
        return [NSString stringWithFormat:@"%llu B/s", bytesPerSec];
    } else if (bytesPerSec < 1024 * 1024) {
        double kb = (double)bytesPerSec / 1024.0;
        return [NSString stringWithFormat:@"%.1f KB/s", kb];
    } else {
        double mb = (double)bytesPerSec / 1024.0 / 1024.0;
        return [NSString stringWithFormat:@"%.2f MB/s", mb];
    }
}

#pragma mark - 对应 Swift 的 networkNormalListenerBy / networkRichListenerBy

//void JobsNetworkNormalListenerBy(UIView * _Nonnull view) {
//    [JobsNetworkTrafficMonitor.shared
//     byOnUpdate:^(JobsNetworkSource *source,
//                  uint64_t uploadBytesPerSec,
//                  uint64_t downloadBytesPerSec){
//        NSString *upStr   = JobsFormatSpeed(uploadBytesPerSec);
//        NSString *downStr = JobsFormatSpeed(downloadBytesPerSec);
//
//        NSString *text = [NSString stringWithFormat:
//                          @"源: %@\n⬆︎ %@  ⬇︎ %@",
//                          source.displayName, upStr, downStr];
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            view.makeNetworkListener.byText(text);
//        });
//    }].byStartWithInterval(1.0);
//}
//
//void JobsNetworkRichListenerBy(UIView * _Nonnull view) {
//    [[JobsNetworkTrafficMonitor shared]
//     byOnUpdate:^(JobsNetworkSource *source,
//                  uint64_t uploadBytesPerSec,
//                  uint64_t downloadBytesPerSec){
//        NSString *upStr   = JobsFormatSpeed(uploadBytesPerSec);
//        NSString *downStr = JobsFormatSpeed(downloadBytesPerSec);
//
//        NSMutableParagraphStyle *ps = [[NSMutableParagraphStyle alloc] init];
//        ps.alignment   = NSTextAlignmentCenter;
//        ps.lineSpacing = 2.0;
//
//        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] init];
//
//        // "源: "
//        NSAttributedString *line1Prefix =
//        [[NSAttributedString alloc] initWithString:@"源: "
//                                        attributes:@{
//            NSFontAttributeName: [UIFont systemFontOfSize:10 weight:UIFontWeightMedium],
//            NSForegroundColorAttributeName: UIColor.secondaryLabelColor,
//            NSParagraphStyleAttributeName: ps
//        }];
//        [attr appendAttributedString:line1Prefix];
//
//        // 源名称
//        NSAttributedString *line1Source =
//        [[NSAttributedString alloc] initWithString:source.displayName
//                                        attributes:@{
//            NSFontAttributeName: [UIFont systemFontOfSize:11 weight:UIFontWeightSemibold],
//            NSForegroundColorAttributeName: UIColor.whiteColor,
//            NSParagraphStyleAttributeName: ps
//        }];
//        [attr appendAttributedString:line1Source];
//
//        // 换行
//        [attr appendAttributedString:
//         [[NSAttributedString alloc] initWithString:@"\n"
//                                         attributes:@{NSParagraphStyleAttributeName: ps}]];
//
//        // 上行 "⬆︎ "
//        [attr appendAttributedString:
//         [[NSAttributedString alloc] initWithString:@"⬆︎ "
//                                         attributes:@{
//            NSFontAttributeName: [UIFont systemFontOfSize:11],
//            NSForegroundColorAttributeName: UIColor.systemGreenColor,
//            NSParagraphStyleAttributeName: ps
//        }]];
//
//        // 上行数值
//        [attr appendAttributedString:
//         [[NSAttributedString alloc] initWithString:[upStr stringByAppendingString:@"  "]
//                                         attributes:@{
//            NSFontAttributeName: [UIFont monospacedDigitSystemFontOfSize:11
//                                                                  weight:UIFontWeightMedium],
//            NSForegroundColorAttributeName: UIColor.whiteColor,
//            NSParagraphStyleAttributeName: ps
//        }]];
//
//        // 下行 "⬇︎ "
//        [attr appendAttributedString:
//         [[NSAttributedString alloc] initWithString:@"⬇︎ "
//                                         attributes:@{
//            NSFontAttributeName: [UIFont systemFontOfSize:11],
//            NSForegroundColorAttributeName: UIColor.systemRedColor,
//            NSParagraphStyleAttributeName: ps
//        }]];
//
//        // 下行数值
//        [attr appendAttributedString:
//         [[NSAttributedString alloc] initWithString:downStr
//                                         attributes:@{
//            NSFontAttributeName: [UIFont monospacedDigitSystemFontOfSize:11
//                                                                  weight:UIFontWeightMedium],
//            NSForegroundColorAttributeName: UIColor.whiteColor,
//            NSParagraphStyleAttributeName: ps
//        }]];
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            view.makeNetworkListener.byAttributedString(attr);
//        });
//    }]
//    .byStartWithInterval(1.0);
//}
