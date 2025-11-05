//
//  TDDrawCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "TDDrawingNode.h"

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Custom Drawing Node (Async displayWithParameters:)
@interface TDDrawCellNode : ASCellNode
@property (nonatomic, strong) TDDrawingNode *canvas;
@end

NS_ASSUME_NONNULL_END
