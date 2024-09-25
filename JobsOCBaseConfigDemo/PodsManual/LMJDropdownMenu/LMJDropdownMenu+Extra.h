//
//  LMJDropdownMenu+Extra.h
//  Casino
//
//  Created by Jobs on 2022/1/11.
//

#if __has_include(<LMJDropdownMenu/LMJDropdownMenu.h>)
#import <LMJDropdownMenu/LMJDropdownMenu.h>
#else
#import "LMJDropdownMenu.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface LMJDropdownMenu (Extra)

-(__kindof UIButton *)great;
-(void)greatAtEmpty;

@end

NS_ASSUME_NONNULL_END
