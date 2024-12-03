//
//  HotLabel.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/4.
//

#import <UIKit/UIKit.h>
#import "UIViewModelProtocol.h"
#import "BaseView.h"
#import "UIViewModel.h"
#import "CasinoCustomerContactModel.h"
#import "UILabel+Extra.h"

NS_ASSUME_NONNULL_BEGIN
/**
    1、单排显示固定样式UI（UIButton 方便图文展示）：
        1.1、如果不满一行居中显示；
        1.2、如果超过一行滑动显示；
    2、如果要显示多排固定样式UI，请移步用CollectionView实现
 */
@interface JobsHotLabelBySingleLine : BaseView

@property(nonatomic,assign)CGSize elementDefaultSize;/// 内置元素Size的预设值

@end

NS_ASSUME_NONNULL_END

/**
 uses
 
 // Data
 @property(nonatomic,strong)JobsHotLabelBySingleLine *hl;
 @property(nonatomic,strong)NSMutableArray <UIViewModel *>*hotLabelDataMutArr;
 
 -(JobsHotLabelBySingleLine *)hl{
     if (!_hl) {
         _hl = JobsHotLabelBySingleLine.new;
         _hl.backgroundColor = JobsClearColor;
         _hl.labelShowingType = UILabelShowingType_05;
         _hl.hotLabelDefaultHeight = JobsWidth(30);
         @jobs_weakify(self)
         [_hl actionObjectBlock:^(UIButton *btn) {
             @jobs_strongify(self)
             if ([btn.titleForNormalState isEqualToString:JobsInternationalization(@"Top-up check in progress")]) {
                 self.chargeOrderType = ChargeOrderType_processing;
             }else if ([btn.titleForNormalState isEqualToString:JobsInternationalization(@"Top-up success")]){
                 self.chargeOrderType = ChargeOrderType_success;
             }else if ([btn.titleForNormalState isEqualToString:JobsInternationalization(@"Top-up cancel")]){
                 self.chargeOrderType = ChargeOrderType_cancel;
             }else if ([btn.titleForNormalState isEqualToString:JobsInternationalization(@"All")]){
                 self.chargeOrderType = ChargeOrderType_all;//ChargeOrderType_all;
             }else{}
             
             [self chargeOrderChargeOrderList];/// 用户充值列表
         }];
         [self.view addSubview:_hl];
         [_hl mas_makeConstraints:^(MASConstraintMaker *make) {
             make.centerX.equalTo(self.view);
             make.width.mas_equalTo(JobsMainScreen_WIDTH());
             make.top.equalTo(self.dropdownMenu.mas_bottom).offset(JobsWidth(5));
             switch (self.currentLanguageType) {
                 case HTTPRequestHeaderLanguageEn:{
                     make.height.mas_equalTo(JobsWidth(60));
                 }break;
                 case HTTPRequestHeaderLanguageCN:{
                     make.height.mas_equalTo(JobsWidth(30));
                 }break;
                     
                 default:
                     break;
             }
             
         }];
         [self.view layoutIfNeeded];
          _hl.jobsRichViewByModel(self.hotLabelDataMutArr);
     }return _hl;
 }

 -(NSMutableArray<UIViewModel *> *)hotLabelDataMutArr{
     if (!_hotLabelDataMutArr) {
         _hotLabelDataMutArr = NSMutableArray.array;
         
         {
             UIViewModel *vm = UIViewModel.new;
             vm.bgImage = JobsIMG(@"service_skype");
             vm.text = JobsInternationalization(@"");
             vm.size = CGSizeMake(JobsWidth(46), JobsWidth(46));
             vm.offsetXForEach = JobsWidth(46);
             vm.offsetYForEach = JobsWidth(46);
             [_hotLabelDataMutArr addObject:vm];
         }
         
         {
             UIViewModel *vm = UIViewModel.new;
             vm.bgImage = JobsIMG(@"service_qq");
             vm.text = JobsInternationalization(@"");
             vm.size = CGSizeMake(JobsWidth(46), JobsWidth(46));
             vm.offsetXForEach = JobsWidth(46);
             vm.offsetYForEach = JobsWidth(46);
             [_hotLabelDataMutArr addObject:vm];
         }
         
         {
             UIViewModel *vm = UIViewModel.new;
             vm.bgImage = JobsIMG(@"service_telegram");
             vm.text = JobsInternationalization(@"");
             vm.size = CGSizeMake(JobsWidth(46), JobsWidth(46));
             vm.offsetXForEach = JobsWidth(46);
             vm.offsetYForEach = JobsWidth(46);
             [_hotLabelDataMutArr addObject:vm];
         }
         
         {
             UIViewModel *vm = UIViewModel.new;
             vm.bgImage = JobsIMG(@"service_wechat");
             vm.text = JobsInternationalization(@"");
             vm.size = CGSizeMake(JobsWidth(46), JobsWidth(46));
             vm.offsetXForEach = JobsWidth(46);
             vm.offsetYForEach = JobsWidth(46);
             [_hotLabelDataMutArr addObject:vm];
         }
         
         {
             UIViewModel *vm = UIViewModel.new;
             vm.bgImage = JobsIMG(@"login_skype");
             vm.text = JobsInternationalization(@"");
             vm.size = CGSizeMake(JobsWidth(46), JobsWidth(46));
             vm.offsetXForEach = JobsWidth(46);
             vm.offsetYForEach = JobsWidth(46);
             [_hotLabelDataMutArr addObject:vm];
         }
         
         {
             UIViewModel *vm = UIViewModel.new;
             vm.bgImage = JobsIMG(@"service_meiqia");
             vm.text = JobsInternationalization(@"");
             vm.size = CGSizeMake(JobsWidth(46), JobsWidth(46));
             vm.offsetXForEach = JobsWidth(46);
             vm.offsetYForEach = JobsWidth(46);
             [_hotLabelDataMutArr addObject:vm];
         }
         
     }return _hotLabelDataMutArr;
 }
 
 
 */
