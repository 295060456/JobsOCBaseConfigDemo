//
//  BaseCellProtocol.h
//  DouDong-II
//
//  Created by Jobs on 2021/3/22.
//

#import <Foundation/Foundation.h>
#import "BaseViewProtocol.h"
#import "UIViewModelProtocol.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BaseCellProtocol
<
BaseViewProtocol
,UIViewModelProtocol
>
@optional
#pragma mark —— 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel;
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel2;
#pragma mark —— 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel;
-(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel;
#pragma mark —— 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)cellSizeByModel;
-(JobsReturnCGSizeByIDBlock _Nonnull)cellSizeByModel;
#pragma mark —— 设置Cell的背景图片
-(jobsByImageBlock _Nonnull)setCellBgImage;

@end

NS_ASSUME_NONNULL_END
