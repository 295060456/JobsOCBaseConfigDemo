//
//  TDButtonCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "DefineProperty.h"
#import "ASButtonNode+DSL.h"

NS_ASSUME_NONNULL_BEGIN
/// Button Cell (ASButtonNode)
@interface TDButtonCellNode : ASCellNode

Prop_strong()ASButtonNode *button;
Prop_strong()ASTextNode *descNode;

@end

NS_ASSUME_NONNULL_END
