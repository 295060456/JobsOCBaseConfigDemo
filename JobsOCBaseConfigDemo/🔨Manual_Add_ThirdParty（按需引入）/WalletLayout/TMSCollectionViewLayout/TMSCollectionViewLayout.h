//
//  TMSCollectionViewLayout.h
//  TestTTT
//
//  Created by TmmmS on 2019/8/8.
//  Copyright © 2019 TMS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "DefineProperty.h"
#import "DefineConstString.h" /// 常量字符串的定义
#import "TMSCollectionViewLayoutDelegate.h"
#import "NSString+ID.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMSCollectionViewLayout : UICollectionViewLayout

Prop_weak()id<TMSCollectionViewLayoutDelegate> layout_delegate;
/// 左右边距
Prop_assign()CGFloat padding;
/// 点击item
-(void)didClickWithIndexPath:(NSIndexPath *)clickIndexPath isExpand:(BOOL)isExpand;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof TMSCollectionViewLayout *_Nonnull jobsMakeTMSCollectionViewLayout(jobsByTMSCollectionViewLayoutBlock _Nonnull block){
    TMSCollectionViewLayout *data = TMSCollectionViewLayout.alloc.init;
    if (block) block(data);
    return data;
}
