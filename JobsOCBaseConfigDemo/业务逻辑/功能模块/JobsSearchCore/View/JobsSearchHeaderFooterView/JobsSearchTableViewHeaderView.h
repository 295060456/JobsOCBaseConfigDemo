//
//  JobsSearchHoveringHeaderView.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "BaseViewProtocol.h"
#import "BaseTableViewHeaderFooterView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchTableViewHeaderView : BaseTableViewHeaderFooterView
<
BaseViewProtocol
>

-(UIButton *)getDelBtn;

@end

NS_ASSUME_NONNULL_END
