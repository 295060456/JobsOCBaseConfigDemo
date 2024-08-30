//
//  JobsDoorInputViewProtocol.h
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class JobsAppDoorInputViewBaseStyle;

NS_ASSUME_NONNULL_BEGIN

@protocol JobsDoorInputViewProtocol <NSObject>
@optional

-(void)changeTextFieldAnimationColor:(BOOL)toRegisterBtnSelected;
-(__kindof UILabel *_Nullable)textLab;
-(__kindof UIButton *_Nullable)securityModelBtn;
-(__kindof UITextField *_Nullable)textField;
-(NSString *_Nullable)textFieldValue;
-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *_Nullable)appDoorInputViewBaseStyle;

@end

NS_ASSUME_NONNULL_END
