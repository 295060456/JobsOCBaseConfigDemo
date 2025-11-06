//
//  TDHorizontalItemNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "DefineProperty.h"
#import "MacroDef_Cor.h"

NS_ASSUME_NONNULL_BEGIN
/// Horizontal Carousel (ASCollectionNode In Cell)
@interface TDHorizontalItemNode : ASCellNode

Prop_strong()ASDisplayNode *colorNode;
Prop_strong()ASTextNode *text;

-(instancetype)initWithIndex:(NSInteger)idx;

@end

NS_ASSUME_NONNULL_END
