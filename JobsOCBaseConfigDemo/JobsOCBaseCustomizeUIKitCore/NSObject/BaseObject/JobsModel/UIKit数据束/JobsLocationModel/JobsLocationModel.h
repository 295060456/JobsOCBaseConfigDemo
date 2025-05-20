//
//  JobsLocationModel.h
//  FM
//
//  Created by User on 9/30/24.
//

#import <Foundation/Foundation.h>
#import "UILocationProtocol.h"
#import "BaseViewProtocol.h"
#import "UIMarkProtocol.h"
#import "BaseLayerProtocol.h"
#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsLocationModel : BaseModel
<
UILocationProtocol
,BaseViewProtocol
,UIMarkProtocol
,BaseLayerProtocol
>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsLocationModel *_Nonnull jobsMakeLocationModel(jobsByLocationModelBlock _Nonnull block){
    JobsLocationModel *data = JobsLocationModel.alloc.init;
    if (block) block(data);
    return data;
}
#pragma mark —— NSIndexPath
NS_INLINE NSIndexPath *_Nonnull jobsMakeIndexPathByLocationModelBlock(jobsByLocationModelBlock _Nonnull block){
    JobsLocationModel *data = JobsLocationModel.alloc.init;
    if (block) block(data);
    return [NSIndexPath indexPathForRow:data.row inSection:data.section];
}

NS_INLINE NSIndexPath *_Nonnull jobsMakeIndexPathZero(void){
    return [NSIndexPath indexPathForRow:0 inSection:0];
}
#pragma mark —— UIEdgeInsets
NS_INLINE UIEdgeInsets jobsMakeEdgeInsetsByLocationModelBlock(jobsByLocationModelBlock _Nonnull block){
    JobsLocationModel *data = JobsLocationModel.alloc.init;
    if (block) block(data);
    return UIEdgeInsetsMake(data.jobsTop,
                            data.jobsLeft,
                            data.jobsBottom,
                            data.jobsRight);
}
/// 构建一个四边距离相等的 UIEdgeInsets
NS_INLINE UIEdgeInsets jobsMakeSameEdgeInset(CGFloat insets){
    return jobsMakeEdgeInsetsByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
        data.jobsTop = insets;
        data.jobsLeft = insets;
        data.jobsBottom = insets;
        data.jobsRight = insets;
    });
}
#pragma mark —— NSDirectionalEdgeInsets
NS_INLINE NSDirectionalEdgeInsets jobsMakeDirectionalEdgeInsetsByLocationModelBlock(jobsByLocationModelBlock _Nonnull block){
    JobsLocationModel *data = JobsLocationModel.alloc.init;
    if (block) block(data);
    return NSDirectionalEdgeInsetsMake(data.jobsTop,
                                       data.jobsLeft,
                                       data.jobsBottom,
                                       data.jobsRight);
}
/// 构建一个内边距相等的 NSDirectionalEdgeInsets
NS_INLINE NSDirectionalEdgeInsets jobsSameDirectionalEdgeInsets(CGFloat x){
    return jobsMakeDirectionalEdgeInsetsByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
        data.jobsTop = x;
        data.jobsLeft = x;
        data.jobsBottom = x;
        data.jobsRight = x;
    });
}
#pragma mark —— CGRect
NS_INLINE CGRect jobsMakeCGRectByLocationModelBlock(jobsByLocationModelBlock _Nonnull block){
    JobsLocationModel *data = JobsLocationModel.alloc.init;
    if (block) block(data);
    return CGRectMake(data.jobsX,
                      data.jobsY,
                      data.jobsWidth,
                      data.jobsHeight);
}

NS_INLINE CGRect jobsMakeFrameByLocationModelBlock(jobsByLocationModelBlock _Nonnull block){
    return jobsMakeCGRectByLocationModelBlock(block);
}
#pragma mark —— CGPoint
NS_INLINE CGPoint jobsMakeCGPointByLocationModelBlock(jobsByLocationModelBlock _Nonnull block){
    JobsLocationModel *data = JobsLocationModel.alloc.init;
    if (block) block(data);
    return CGPointMake(data.jobsX, data.jobsY);
}
#pragma mark —— CGSize
NS_INLINE CGSize jobsMakeCGSizeByLocationModelBlock(jobsByLocationModelBlock _Nonnull block){
    JobsLocationModel *data = JobsLocationModel.alloc.init;
    if (block) block(data);
    return CGSizeMake(data.jobsWidth, data.jobsHeight);
}
#pragma mark —— NSRange
NS_INLINE NSRange jobsMakeRangeByLocationModelBlock(jobsByLocationModelBlock _Nonnull block){
    JobsLocationModel *data = JobsLocationModel.alloc.init;
    if (block) block(data);
    return NSMakeRange(data.location, data.length);
}
