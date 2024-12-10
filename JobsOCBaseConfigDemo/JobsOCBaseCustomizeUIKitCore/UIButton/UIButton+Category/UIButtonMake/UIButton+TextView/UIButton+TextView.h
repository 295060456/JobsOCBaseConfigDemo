//
//  UIButton+TextView.h
//  FM
//
//  Created by Admin on 10/12/2024.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "DefineConstString.h"
#import "NSObject+Extras.h"
#import "JobsKeyValueModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (TextView)

@property(nonatomic,strong)UITextView *titleTextView;
@property(nonatomic,strong)UITextView *subtitleTextView;

@end

NS_ASSUME_NONNULL_END
