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
-(UILabel *_Nullable)getTextLab;
-(UIButton *_Nullable)getSecurityModeBtn;
-(UITextField *_Nullable)getTextField;
-(NSString *_Nullable)getTextFieldValue;
-(UIViewModel *_Nullable)getViewModel;
-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *_Nullable)getAppDoorInputViewBaseStyle;

@end

NS_ASSUME_NONNULL_END
