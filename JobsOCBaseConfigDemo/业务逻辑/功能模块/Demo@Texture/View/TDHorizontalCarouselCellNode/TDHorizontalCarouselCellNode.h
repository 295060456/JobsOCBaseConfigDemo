//
//  TDHorizontalCarouselCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "TDHorizontalItemNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface TDHorizontalCarouselCellNode : ASCellNode <ASCollectionDataSource, ASCollectionDelegate>

Prop_strong()ASCollectionNode *collection;
Prop_strong()NSArray<NSNumber *> *items;

-(instancetype)initWithCount:(NSInteger)count;

@end

NS_ASSUME_NONNULL_END
