//
//  CFGradientLabel.h
//  My_BaseProj
//
//  Created by Jobs on 2020/7/8.
//  Copyright © 2020 Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CFGradientLabel : UILabel

@property(nonatomic,strong)NSArray *colors;

@end

NS_ASSUME_NONNULL_END

/*使用示例

CFGradientLabel *lable = CFGradientLabel.new;
lable.colors = @[(id)HEXCOLOR(0xF78361).CGColor,(id)HEXCOLOR(0xF54B64).CGColor];

*/
