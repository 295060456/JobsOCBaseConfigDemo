//
//  JobsExcelTopHeadView.h
//  JobsExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"
#import "NSValue+Extra.h"

#import "JobsTopViewItem.h"
#import "JobsExcelConfigureViewModel.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

@interface JobsExcelTopHeadView : UIView
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
BaseViewProtocol
>

@property(nonatomic,strong,readonly)JobsExcelConfigureViewModel *_Nonnull excelConfigureData;

@end

NS_INLINE __kindof JobsExcelTopHeadView *_Nonnull jobsMakeExcelTopHeadView(jobsByExcelTopHeadViewBlock _Nonnull block){
    JobsExcelTopHeadView *data = JobsExcelTopHeadView.alloc.init;
    if (block) block(data);
    return data;
}
