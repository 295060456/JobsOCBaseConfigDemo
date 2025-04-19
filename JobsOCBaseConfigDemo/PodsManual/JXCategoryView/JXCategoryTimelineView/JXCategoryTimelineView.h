//
//  JXCategoryTimelineView.h
//  JXCategoryView
//
//  Created by jiaxin on 2019/7/23.
//  Copyright © 2019 jiaxin. All rights reserved.
//

#import "JXCategoryTitleView.h"
#import "JXCategoryTimelineCell.h"
#import "JXCategoryTimelineCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryTimelineView : JXCategoryTitleView

Prop_strong()NSArray <NSString *> *timeTitles;
Prop_strong()UIColor *timeTitleNormalColor;
Prop_strong()UIColor *timeTitleSelectedColor;
Prop_strong()UIFont *timeTitleFont;
Prop_strong()UIFont *timeTitleSelectedFont;

@end

NS_ASSUME_NONNULL_END
