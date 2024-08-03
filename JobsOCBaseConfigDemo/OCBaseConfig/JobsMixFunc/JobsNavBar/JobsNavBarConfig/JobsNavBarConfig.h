//
//  JobsNavBarConfig.h
//  FM
//
//  Created by User on 7/24/24.
//

#import <Foundation/Foundation.h>
#import "UIButtonModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsNavBarConfig : NSObject

@property(nonatomic,strong)UIColor *bgCor;
@property(nonatomic,strong)UIImage *bgImage;
#pragma mark —— backBtn 的配置
@property(nonatomic,strong,null_resettable)UIButtonModel *backBtnModel;
#pragma mark —— 对标题的设置
@property(nonatomic,copy)NSAttributedString *attributedTitle;
@property(nonatomic,copy,null_resettable)NSString *title;
@property(nonatomic,strong,null_resettable)UIFont *font;
@property(nonatomic,strong,null_resettable)UIColor *titleCor;
#pragma mark —— closeBtn 的配置
@property(nonatomic,strong,null_resettable)UIButtonModel *closeBtnModel;

@end

NS_ASSUME_NONNULL_END
