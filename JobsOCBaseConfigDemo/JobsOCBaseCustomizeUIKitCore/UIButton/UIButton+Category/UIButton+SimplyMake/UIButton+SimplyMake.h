//
//  UIButton+SimplyMake.h
//  FM
//
//  Created by User on 9/9/24.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "UIButton+UI.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (SimplyMake)

@property(nonatomic,copy,class)jobsByBtnBlock clickBlock;

+(JobsReturnButtonByTitleBlock)initByTitle;
+(JobsReturnButtonByTitleAndFontBlock)initByTitleAndFont;
+(JobsReturnButtonByTitleAndFontAndTitleCorBlock)initByTitleAndFontAndTitleCor;
+(JobsReturnButtonByNormalImageBlock)initByNormalImage;
+(JobsReturnButtonByBackgroundImageBlock)initByBackgroundImage;

-(JobsReturnButtonByClickBlock)onClick;

@end

NS_ASSUME_NONNULL_END
