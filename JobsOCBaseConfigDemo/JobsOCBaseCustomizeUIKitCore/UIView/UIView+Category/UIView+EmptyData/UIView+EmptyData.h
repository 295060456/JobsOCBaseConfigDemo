//
//  UIView+EmptyData.h
//  DouDong-II
//
//  Created by Jobs on 2020/12/17.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "MacroDef_Cor.h"
#import "JobsString.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIView (EmptyData)

@property(nonatomic,strong)UILabel *tipsLab;
@property(nonatomic,copy)NSString *tipsTitle;

-(jobsByVoidBlock _Nonnull)cleanSubview;
-(jobsByClassBlock _Nonnull)cleanSubviewBy;
-(void)ifEmptyData;

@end

NS_ASSUME_NONNULL_END
