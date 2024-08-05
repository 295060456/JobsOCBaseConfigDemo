//
//  JobsMenuView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/17.
//

#import "BaseView.h"
#import "JobsLinkageMenuView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsMenuView : BaseView
/// Data
@property(nonatomic,strong)NSMutableArray <NSString *>*titleMutArr;
@property(nonatomic,strong)NSMutableArray <__kindof UIView *>*subViewMutArr;
@property(nonatomic,strong)NSMutableArray <UIImage *>*normal_titleBgImageMutArr;
@property(nonatomic,strong)NSMutableArray <UIImage *>*select_titleBgImageMutArr;
@property(nonatomic,strong)NSMutableArray <UIImage *>*normal_titleImageMutArr;

@end

NS_ASSUME_NONNULL_END
