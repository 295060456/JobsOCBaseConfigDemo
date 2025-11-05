//
//  TDEditableTextCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

NS_ASSUME_NONNULL_BEGIN
#pragma mark - Editable Text (ASEditableTextNode)
@interface TDEditableTextCellNode : ASCellNode <ASEditableTextNodeDelegate>

@property (nonatomic, strong) ASEditableTextNode *editable;
@property (nonatomic, strong) ASTextNode *hint;

@end

NS_ASSUME_NONNULL_END
