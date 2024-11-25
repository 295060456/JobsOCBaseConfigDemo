//
//  UIAlertController+Extra.h
//  FM
//
//  Created by Admin on 25/11/2024.
//

#import <UIKit/UIKit.h>
#import "JobsAlertModel.h"

NS_ASSUME_NONNULL_BEGIN
/// UIAlertController 的标题和消息属性仅支持简单的字符串 (NSString) 类型，而不直接支持富文本 (NSAttributedString)
@interface UIAlertController (Extra)

-(JobsReturnAlertControllerByActionBlock _Nonnull)add;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UIAlertController *_Nonnull JobsMakeAlertControllerBy(JobsAlertModel *_Nonnull model){
    return [UIAlertController alertControllerWithTitle:model.alertControllerTitle
                                               message:model.message
                                        preferredStyle:model.preferredStyle];
}
/**
 self.getCurrentViewController.comingToPresentVC(self.makeAlertControllerByAlertModel(jobsMakeAlertModel(^(JobsAlertModel * _Nullable data) {
     data.alertControllerTitle = @"主标题";
     data.message = @"副标题";
     data.preferredStyle = UIAlertControllerStyleAlert;
     data.alertActionTitle = @"OK";
     data.alertActionStyle = UIAlertActionStyleDefault;
     data.alertActionBlock = ^(__kindof UIAlertAction * _Nullable action) {
         NSLog(@"OK");
     };
     data.cancelAlertActionTitle = @"取消";
     data.cancelAlertActionStyle = UIAlertActionStyleCancel;
     data.cancelAlertActionBlock = ^(__kindof UIAlertAction * _Nullable action) {
         NSLog(@"Cancel");
     };
 })));
 */
