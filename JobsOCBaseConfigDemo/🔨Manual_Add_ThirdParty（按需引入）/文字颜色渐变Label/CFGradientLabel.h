//
//  CFGradientLabel.h
//  My_BaseProj
//
//  Created by Jobs on 2020/7/8.
//  Copyright © 2020 Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface CFGradientLabel : UILabel

@property(nonatomic,copy)NSArray *colors;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof CFGradientLabel *_Nonnull jobsMakeCFGradientLabel(jobsByCFGradientLabelBlock _Nonnull block){
    CFGradientLabel *data = CFGradientLabel.alloc.init;
    if (block) block(data);
    return data;
}

/*
 * 使用示例

 jobsMakeCFGradientLabel(^(__kindof CFGradientLabel * _Nullable label) {
     label.colors = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
         arr.add((id)HEXCOLOR(0xF78361).CGColor)
             .add((id)HEXCOLOR(0xF54B64).CGColor);
     });
 });

*/
