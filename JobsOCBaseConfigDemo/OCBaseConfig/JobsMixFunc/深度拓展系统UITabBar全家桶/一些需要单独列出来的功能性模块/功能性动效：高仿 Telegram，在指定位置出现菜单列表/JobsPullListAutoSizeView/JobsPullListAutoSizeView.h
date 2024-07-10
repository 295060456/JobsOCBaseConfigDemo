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

NS_ASSUME_NONNULL_BEGIN

@interface JobsPullListAutoSizeView : BaseView
<
UITableViewDelegate
,UITableViewDataSource
>

@property(nonatomic,assign)CGFloat listTbVWidth;
@property(nonatomic,assign)CGFloat listTbVCellHeight;
@property(nonatomic,assign)CGFloat listTbVOffset;
@property(nonatomic,strong)UIColor *bgColorListTBV;

+ (instancetype)initWithTargetView:(UIView *__nonnull)targetView
                        dataMutArr:(NSArray <UIViewModel *>*__nonnull)dataMutArr;

@end

NS_ASSUME_NONNULL_END
