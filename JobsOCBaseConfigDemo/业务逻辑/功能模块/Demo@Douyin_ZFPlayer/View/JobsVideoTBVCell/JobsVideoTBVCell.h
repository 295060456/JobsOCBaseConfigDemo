//
//  ZFDouYinCell.h
//  DouYin
//
//  Created by Jobs on 2020/9/28.
//

#import <UIKit/UIKit.h>
#import "BaseCellProtocol.h"
#import "UIMarkProtocol.h"
#import "UIViewModelOthersProtocol.h"
#import "DefineProperty.h"
#import "JobsRightBtnsView.h"
#import "VideoModel.h"

NS_ASSUME_NONNULL_BEGIN
@class JobsVideoTBVCell;
typedef JobsVideoTBVCell *_Nonnull(^JobsReturnVideoTBVCellByDelegateBlock)(id<UIViewModelOthersProtocol> delegate);

@interface JobsVideoTBVCell : UITableViewCell
<
BaseCellProtocol,
UIMarkProtocol
>

Prop_weak()id<UIViewModelOthersProtocol> delegate;
-(JobsReturnVideoTBVCellByDelegateBlock _Nonnull)byDelegate;

@end

NS_ASSUME_NONNULL_END
