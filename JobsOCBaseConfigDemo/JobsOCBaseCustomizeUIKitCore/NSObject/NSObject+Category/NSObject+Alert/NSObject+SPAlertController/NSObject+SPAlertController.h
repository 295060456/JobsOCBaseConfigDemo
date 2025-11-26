//
//  NSObject+SPAlertController.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/9/12.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "NSObject+Extras.h"
#import "NSObject+WHToast.h"//提示
#import "JobsString.h"
#import "JobsDefineAllEnumHeader.h"            // 此文件用来存储记录全局的一些枚举
#import "SPAlertControllerConfig.h"

#if __has_include(<SPAlertController/SPAlertController.h>)
#import <SPAlertController/SPAlertController.h>
#else
#import "SPAlertController.h"
#endif

#if __has_include(<WHToast/WHToast.h>)
#import <WHToast/WHToast.h>
#else
#import "WHToast.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// pod 'SPAlertController'# https://github.com/SPStore/SPAlertController 深度定制AlertController
@interface NSObject (SPAlertController)
/// 自定义的Alert
/// @param config 配置文件
/// @param alertVCBlock alertVCBlock
/// @param completionBlock completionBlock
+(SPAlertController *)showSPAlertControllerConfig:(SPAlertControllerConfig *)config
                                     alertVCBlock:(jobsByTwoIDBlock _Nullable)alertVCBlock
                                  completionBlock:(jobsByVoidBlock _Nullable)completionBlock;

@end

NS_ASSUME_NONNULL_END

/**
 
 普通用法
 
 -(void)makeChannelURL:(SPAlertAction *)action{
     JobsLog(@"1234");
 }

 -(void)makeChannelURL{
     JobsLog(@"1234");
 }

 -(UIButton *)channelBtn{
     if (!_channelBtn) {
         _channelBtn = UIButton.new;
         [_channelBtn setTitle:@"渠道切换点我就行" forState:UIControlStateNormal];
         [_channelBtn setTitleColor:JobsRedColor forState:UIControlStateNormal];
         _channelBtn.backgroundColor = JobsYellowColor;
         @jobs_weakify(self)
         [[_channelBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIButton * _Nullable x) {
             @jobs_strongify(self)
             SPAlertControllerConfig *config = SPAlertControllerConfig.new;
             config.SPAlertControllerInitType = NSObject_SPAlertControllerInitType_2;
             config.title = @"提示";
             config.message = @"审核通过后可查看，是否删除";//@"视频审核未通过，是否删除？"
             config.preferredStyle = SPAlertControllerStyleActionSheet;
             config.animationType = SPAlertAnimationTypeDefault;
             config.alertActionTitleArr = self.channelMutArr;
             //  配置按钮样式
             NSMutableArray <NSNumber *>*alertActionStyleArr = NSMutableArray.array;
             for (int i = 0; i < self.channelMutArr.count; i++) {
                 [alertActionStyleArr addObject:@(SPAlertActionStyleDefault)];
             }
             config.alertActionStyleArr = alertActionStyleArr;
             //  配置按钮触发方法
             NSMutableArray <NSString *>*alertBtnActionArr = NSMutableArray.array;
             for (int i = 0; i < self.channelMutArr.count; i++) {
                 [alertBtnActionArr addObject:@"makeChannelURL"];
                 // 或者
                 [alertBtnActionArr addObject:@"makeChannelURL"];
             }
             config.alertBtnActionArr = alertBtnActionArr;
             // 配置按钮触发方法的相关形参 【demo见SelectorBlock】
             config.parametersArr;
             
             config.targetVC = self;
             config.funcInWhere = self;
             config.animated = YES;

             [NSObject showSPAlertControllerConfig:config
                                      alertVCBlock:^(SPAlertController *data,
                                                   NSMutableArray <SPAlertAction *>*data2) {
 
                 data.titleColor = AppMainCor_01;
                 data.messageColor = AppMainCor_01;
                 data.titleFont = [UIFont systemFontOfSize:16 weight:UIFontWeightSemibold];
                 data.messageFont = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
                 
                 SPAlertAction *action1 = (SPAlertAction *)data2[0];
                 SPAlertAction *action2 = (SPAlertAction *)data2[1];
                 
                 action1.titleColor = AppMainCor_01;
                 action1.titleFont = [UIFont systemFontOfSize:16 weight:UIFontWeightSemibold];

                 action2.titleColor = AppMainCor_01;
                 action2.titleFont = [UIFont systemFontOfSize:16 weight:UIFontWeightSemibold];
                 
                } completionBlock:nil];
         }];
     }return _channelBtn;
 }
 
 
 */

/**
    富文本的用法
 {
     NSMutableArray *tempDataMutArr = NSMutableArray.array;
     RichLabelDataStringsModel *title_1_Model = RichLabelDataStringsModel.new;
     RichLabelDataStringsModel *title_2_Model = RichLabelDataStringsModel.new;
     RichLabelDataStringsModel *title_3_Model = RichLabelDataStringsModel.new;
     RichLabelDataStringsModel *title_4_Model = RichLabelDataStringsModel.new;
     RichLabelDataStringsModel *title_5_Model = RichLabelDataStringsModel.new;
     {
         title_1_Model.dataString = @"您当前的金币数为";
         
         RichLabelFontModel *richLabelFontModel = RichLabelFontModel.new;
         richLabelFontModel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
         richLabelFontModel.range = NSMakeRange(0, title_1_Model.dataString.length);
         
         RichLabelTextCorModel *richLabelTextCorModel = RichLabelTextCorModel.new;
         richLabelTextCorModel.cor = JobsBlackColor;
         richLabelTextCorModel.range = NSMakeRange(0, title_1_Model.dataString.length);
         
         title_1_Model.richLabelFontModel = richLabelFontModel;
         title_1_Model.richLabelTextCorModel = richLabelTextCorModel;
     }
     
     {
         title_2_Model.dataString = myCoinTipsModel.value.stringValue;
         
         RichLabelFontModel *richLabelFontModel = RichLabelFontModel.new;
         richLabelFontModel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
         richLabelFontModel.range = NSMakeRange(title_1_Model.dataString.length, title_2_Model.dataString.length);
         
         RichLabelTextCorModel *richLabelTextCorModel = RichLabelTextCorModel.new;
         richLabelTextCorModel.cor = RGB_COLOR(255, 163, 163);
         richLabelTextCorModel.range = NSMakeRange(title_1_Model.dataString.length, title_2_Model.dataString.length);
         
         title_2_Model.richLabelFontModel = richLabelFontModel;
         title_2_Model.richLabelTextCorModel = richLabelTextCorModel;
     }
     
     {
         title_3_Model.dataString = @"个，可兑换的余额为";

         RichLabelFontModel *richLabelFontModel = RichLabelFontModel.new;
         richLabelFontModel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
         richLabelFontModel.range = NSMakeRange(title_1_Model.dataString.length + title_2_Model.dataString.length, title_3_Model.dataString.length);

         RichLabelTextCorModel *richLabelTextCorModel = RichLabelTextCorModel.new;
         richLabelTextCorModel.cor = JobsBlackColor;
         richLabelTextCorModel.range = NSMakeRange(title_1_Model.dataString.length + title_2_Model.dataString.length, title_3_Model.dataString.length);

         title_3_Model.richLabelFontModel = richLabelFontModel;
         title_3_Model.richLabelTextCorModel = richLabelTextCorModel;
     }
     
     {
         title_4_Model.dataString = myCoinTipsModel.key;

         RichLabelFontModel *richLabelFontModel = RichLabelFontModel.new;
         richLabelFontModel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
         richLabelFontModel.range = NSMakeRange(title_1_Model.dataString.length + title_2_Model.dataString.length + title_3_Model.dataString.length, title_4_Model.dataString.length);

         RichLabelTextCorModel *richLabelTextCorModel = RichLabelTextCorModel.new;
         richLabelTextCorModel.cor = RGB_COLOR(255, 163, 163);
         richLabelTextCorModel.range = NSMakeRange(title_1_Model.dataString.length + title_2_Model.dataString.length + title_3_Model.dataString.length, title_4_Model.dataString.length);

         title_4_Model.richLabelFontModel = richLabelFontModel;
         title_4_Model.richLabelTextCorModel = richLabelTextCorModel;
     }
     
     {
         title_5_Model.dataString = @"元，确认兑换吗？";

         RichLabelFontModel *richLabelFontModel = RichLabelFontModel.new;
         richLabelFontModel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
         richLabelFontModel.range = NSMakeRange(title_1_Model.dataString.length + title_2_Model.dataString.length + title_3_Model.dataString.length + title_4_Model.dataString.length, title_5_Model.dataString.length);

         RichLabelTextCorModel *richLabelTextCorModel = RichLabelTextCorModel.new;
         richLabelTextCorModel.cor = JobsBlackColor;
         richLabelTextCorModel.range = NSMakeRange(title_1_Model.dataString.length + title_2_Model.dataString.length + title_3_Model.dataString.length + title_4_Model.dataString.length, title_5_Model.dataString.length);

         title_5_Model.richLabelFontModel = richLabelFontModel;
         title_5_Model.richLabelTextCorModel = richLabelTextCorModel;
     }
     
     [tempDataMutArr addObject:title_1_Model];
     [tempDataMutArr addObject:title_2_Model];
     [tempDataMutArr addObject:title_3_Model];
     [tempDataMutArr addObject:title_4_Model];
     [tempDataMutArr addObject:title_5_Model];
     
     SPAlertControllerConfig *config = SPAlertControllerConfig.new;
     config.SPAlertControllerInitType = NSObject_SPAlertControllerInitType_2;
     config.title = @"兑换余额";
     config.preferredStyle = SPAlertControllerStyleAlert;
     config.animationType = SPAlertAnimationTypeDefault;
     config.alertActionTitleArr = @[@"取消",@"确定"];
     config.alertActionStyleArr = @[@(SPAlertActionStyleDestructive),@(SPAlertActionStyleDefault)];
     config.alertBtnActionArr = @[@"".tr,@"networking_chargeGoldPOST"];// 金币换余额
     config.targetVC = [NSObject getCurrentViewController];
     config.funcInWhere = self;
     config.animated = YES;
     
     [NSObject showSPAlertControllerConfig:config
                              alertVCBlock:^(SPAlertController *data,
                                             NSMutableArray <SPAlertAction *>*data2) {
         
         data.attributedMessage = self.richTextWithDataConfigMutArr(tempDataMutArr);
         
         for (SPAlertAction *alertAction in data2) {
             alertAction.titleColor = RGB_SAMECOLOR(75);
             alertAction.titleFont = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
         }
         
     } completionBlock:nil];
 }
 
 */

/**
  自定义View，用属性进行承接，消失的时候调取：
 [self.alertController dismissViewControllerAnimated:YES completion:nil];
 ❤️特别注意：自定义View设置size的width值无效，解决方案：如下
 data.minDistanceToEdges = JobsWidth(30);// 距离屏幕边缘的最小间距
 
 SPAlertControllerConfig *config = SPAlertControllerConfig.new;
 config.SPAlertControllerInitType = NSObject_SPAlertControllerInitType_3;
 config.customAlertView = self.updateView;
 config.preferredStyle = SPAlertControllerStyleAlert;
 config.animationType = SPAlertAnimationTypeDefault;
 config.targetVC = self;
 config.funcInWhere = self;
 config.animated = YES;
 
 self.alertController = [NSObject showSPAlertControllerConfig:config
                                                 alertVCBlock:^(SPAlertController *data,
                                                              NSMutableArray <SPAlertAction *>*data2) {
     data.needDialogBlur = NO;
     data.tapBackgroundViewDismiss = NO;// 是否单击背景退出对话框,默认为YES
 }completionBlock:nil];
 
 */
