//
//  TDDrawCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "TDDrawingNode.h"
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN
/// Custom Drawing Node (Async displayWithParameters:)
@interface TDDrawCellNode : ASCellNode

Prop_strong()TDDrawingNode *canvas;

@end

NS_ASSUME_NONNULL_END
