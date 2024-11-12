//
//  LeftListView.h
//  JobsExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"
#import "NSValue+Extra.h"

#import "JobsExcelConfigureViewModel.h"
#import "TableViewOneCell.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

@class UIButtonModel;

@interface JobsExcelLeftListView : UIView
<
UITableViewDelegate
,UITableViewDataSource
,BaseViewProtocol
>

@property(nonatomic,strong,readonly)JobsExcelConfigureViewModel *_Nonnull excelConfigureData;

@end

NS_INLINE __kindof JobsExcelLeftListView *_Nonnull jobsMakeExcelLeftListView(jobsByExcelLeftListViewBlock _Nonnull block){
    JobsExcelLeftListView *data = JobsExcelLeftListView.alloc.init;
    if (block) block(data);
    return data;
}
