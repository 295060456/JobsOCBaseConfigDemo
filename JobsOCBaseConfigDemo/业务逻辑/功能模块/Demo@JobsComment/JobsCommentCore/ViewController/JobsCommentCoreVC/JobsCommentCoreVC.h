//
//  JobsCommentCoreVC.h
//  JobsComment
//
//  Created by Jobs on 2020/11/15.
//

#import <UIKit/UIKit.h>

#pragma mark —— View
#import "JobsCommentPopUpView_viewForHeaderInSection.h"
#import "JobsCommentTitleHeaderView.h"
#import "JobsInfoTBVCell.h"//显示具体的有用讯息
#import "JobsLoadMoreTBVCell.h"//加载更多
#import "LOTAnimationMJRefreshHeader.h"
#pragma mark —— ViewController
#import "JobsPopUpVC.h"
#pragma mark —— Model
#import "BaseModel.h"
#import "JobsCommentModel.h"
#import "JobsCommentConfig.h"
#pragma mark —— 3rd
#import "NSString+Conversion.h"
#import "NSObject+DefConfig.h"
#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

//#if __has_include(<YYModel/YYModel.h>)
//#import <YYModel/YYModel.h>
//#else
//#import "YYModel.h"
//#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsCommentCoreVC : JobsPopUpVC
<
UITableViewDelegate
,UITableViewDataSource
>

-(void)setMJModel:(JobsCommentModel *)mjModel;
-(void)setYYModel:(JobsCommentModel *)yyModel;
-(JobsCommentTitleHeaderView *)getJobsCommentTitleHeaderView;
-(UITableView *)getTableView;

@end

NS_ASSUME_NONNULL_END
