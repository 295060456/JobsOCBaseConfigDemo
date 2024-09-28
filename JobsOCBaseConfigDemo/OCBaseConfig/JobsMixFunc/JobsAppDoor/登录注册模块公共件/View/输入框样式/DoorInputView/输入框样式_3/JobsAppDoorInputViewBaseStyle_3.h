//
//  JobsAppDoorInputViewBaseStyle_3.h
//  My_BaseProj
//
//  Created by Jobs on 2020/12/4.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "BaseViewProtocol.h"
#import "JobsDoorInputViewProtocol.h"
#import "JobsAppDoorInputViewBaseStyleModel.h"
#import "JobsAppDoorInputViewBaseStyle.h"
#import "JobsMagicTextField.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorInputViewBaseStyle_3 : JobsAppDoorInputViewBaseStyle
/**
 
 * 其实并不建议用init方法,而是期望带参数初始化，比如对应BaseViewProtocol里面的 - (instancetype)initWithSize:(CGSize)thisViewSize
 * 因为本类在大多数情况下是依附于一个父视图执行的，这样可以有效的避免过程值对环境的影响
 * 因为父视图在没有进行展开的时候，子视图是不展开的。那么存在生命周期的过程，会影响布局结果
    
 * 如果以后需要强行禁用init或者new，那么:
 - (instancetype)init NS_UNAVAILABLE;
 - (instancetype)new NS_UNAVAILABLE;
 
 */
@end

NS_ASSUME_NONNULL_END
/**
 
 -(JobsAppDoorInputViewBaseStyle_3 *)用户名输入框{
     if (!_用户名输入框) {
         _用户名输入框 = JobsAppDoorInputViewBaseStyle_3.new;
         @jobs_weakify(self)
         [_用户名输入框 actionObjectBlock:^(JobsAppDoorInputViewTFModel *data) {
             @jobs_strongify(self)
 //            if ([data isKindOfClass:JobsAppDoorInputViewTFModel.class]) {
 //                JobsAppDoorInputViewTFModel *model = (JobsAppDoorInputViewTFModel *)data;
 //                self.confirmWithdrawPassword = model.resString;
 //            }
         }];
         
         [self.view addSubview:_用户名输入框];
         [_用户名输入框 mas_makeConstraints:^(MASConstraintMaker *make) {
             make.centerX.equalTo(self.view);
             make.size.mas_equalTo(inputSize());
             make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(85));
         }];
         
         _用户名输入框.layer.cornerRadius = inputSize().height / 2;
         [_用户名输入框 layerBorderCor:HEXCOLOR(0xEEE2C8) andBorderWidth:1.f];
         _用户名输入框.jobsRichViewByModel(配置用户名输入框);
     }return _用户名输入框;
 }

 -(JobsAppDoorInputViewBaseStyleModel *)配置用户名输入框{
     if (!_配置用户名输入框) {
         _配置用户名输入框 = JobsAppDoorInputViewBaseStyleModel.new;
         _配置用户名输入框.leftViewIMG = JobsIMG(@"用户名");
         _配置用户名输入框.placeHolderStr = JobsInternationalization(@"请输入您的用户名");
         _配置用户名输入框.placeholderFont = [UIFont systemFontOfSize:JobsWidth(16) weight:UIFontWeightRegular];
         _配置用户名输入框.placeholderColor = HEXCOLOR(0xC4C4C4);
         _配置用户名输入框.placeHolderOffset = JobsWidth(35);
         _配置用户名输入框.leftViewOffsetX = JobsWidth(10);
         _配置用户名输入框.isShowDelBtn = YES;
         _配置用户名输入框.isShowSecurityBtn = NO;
         _配置用户名输入框.returnKeyType = UIReturnKeyDone;
         _配置用户名输入框.keyboardAppearance = UIKeyboardAppearanceAlert;
         _配置用户名输入框.leftViewMode = UITextFieldViewModeAlways;
         _配置用户名输入框.moveDistance = JobsWidth(40);
         _配置用户名输入框.titleStrCor = _配置用户名输入框.placeholderColor = HEXCOLOR(0x524740);
         _配置用户名输入框.background = JobsIMG(@"设置弹出框输入框背景图");
         _配置用户名输入框.animationColor = HEXCOLOR(0xF2CC78);
     }return _配置用户名输入框;
 }
 
 */
