//
//  JobsHeaderFooterView.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/25.
//

#import "BaseCollectionReusableView.h"
#import "BaseButton.h"

NS_ASSUME_NONNULL_BEGIN
/// 最左边一个主标题（UIButton） + 最右边有一个副标题（UIButton）
@interface JobsHeaderFooterView : BaseCollectionReusableView

-(BaseButton *)getTitleBtn;
-(BaseButton *)getSubTitleBtn;

@end

NS_ASSUME_NONNULL_END
