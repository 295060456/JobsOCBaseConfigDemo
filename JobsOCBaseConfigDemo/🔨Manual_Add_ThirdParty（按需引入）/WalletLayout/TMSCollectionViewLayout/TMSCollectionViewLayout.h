//
//  TMSCollectionViewLayout.h
//  TestTTT
//
//  Created by TmmmS on 2019/8/8.
//  Copyright © 2019 TMS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefineConstString.h" /// 常量字符串的定义
#import "TMSCollectionViewLayoutDelegate.h"
#import "NSString+ID.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMSCollectionViewLayout : UICollectionViewLayout

@property(nonatomic,weak)id<TMSCollectionViewLayoutDelegate> layout_delegate;
/// 左右边距
@property(nonatomic,assign)CGFloat padding;
/// 点击item
-(void)didClickWithIndexPath:(NSIndexPath *)clickIndexPath isExpand:(BOOL)isExpand;

@end

NS_ASSUME_NONNULL_END

