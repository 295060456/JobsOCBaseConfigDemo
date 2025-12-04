//
//  JobsPullListAutoSizeView.h
//  TabbarItemLottie
//
//  Created by Jobs on 2020/10/15.
//

#import <UIKit/UIKit.h>
#import "UIViewModel.h"
#import "BaseView.h"
#import "JobsPullListTBVCell.h"
#import "UIView+Extras.h"
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsPullListAutoSizeView : BaseView
<
UITableViewDelegate
,UITableViewDataSource
>

Prop_assign()CGFloat listTbVWidth;
Prop_assign()CGFloat listTbVCellHeight;
Prop_assign()CGFloat listTbVOffset;
Prop_strong()UIColor *bgColorListTBV;

+(instancetype)initWithTargetView:(UIView *__nonnull)targetView
                       dataMutArr:(NSArray <UIViewModel *>*__nonnull)dataMutArr;

@end

NS_ASSUME_NONNULL_END
