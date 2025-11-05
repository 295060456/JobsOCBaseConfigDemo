//
//  TDButtonCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

NS_ASSUME_NONNULL_BEGIN
#pragma mark - Button Cell (ASButtonNode)
@interface TDButtonCellNode : ASCellNode

@property (nonatomic, strong) ASButtonNode *button;
@property (nonatomic, strong) ASTextNode *descNode;

@end

NS_ASSUME_NONNULL_END
