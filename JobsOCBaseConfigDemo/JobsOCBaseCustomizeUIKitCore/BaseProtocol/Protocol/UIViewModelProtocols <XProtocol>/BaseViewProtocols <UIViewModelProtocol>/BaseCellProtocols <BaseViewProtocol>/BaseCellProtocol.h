//
//  BaseCellProtocol.h
//  DouDong-II
//
//  Created by Jobs on 2021/3/22.
//

#import <Foundation/Foundation.h>
#import "BaseViewProtocol.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BaseCellProtocol <BaseViewProtocol>
@optional
#pragma mark —— 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy;
-(JobsRetCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy;
#pragma mark —— 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel;
-(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel;
#pragma mark —— 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)cellSizeByModel;
-(JobsRetCGSizeByIDBlock _Nonnull)cellSizeByModel;
#pragma mark —— 设置Cell的背景图片
-(jobsByImageBlock _Nonnull)setCellBgImage;

@end

NS_ASSUME_NONNULL_END
