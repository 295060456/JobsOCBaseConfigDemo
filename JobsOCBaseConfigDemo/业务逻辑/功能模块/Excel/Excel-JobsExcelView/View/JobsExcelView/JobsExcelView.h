//
//  JobsExcelView.h
//  JobsExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import <UIKit/UIKit.h>

#import "JobsExcelLeftListView.h"
#import "JobsExcelTopHeadView.h"
#import "JobsExcelContentView.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#import "JobsExcelConfigureViewModel.h"

@interface JobsExcelView : UIView

@end

NS_INLINE __kindof JobsExcelView *_Nonnull jobsMakeExcelView(jobsByExcelViewBlock _Nonnull block){
    JobsExcelView *data = JobsExcelView.alloc.init;
    if (block) block(data);
    return data;
}
