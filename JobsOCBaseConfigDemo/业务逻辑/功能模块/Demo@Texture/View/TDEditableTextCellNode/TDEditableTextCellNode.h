//
//  TDEditableTextCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

NS_ASSUME_NONNULL_BEGIN
/// Editable Text (ASEditableTextNode)
@interface TDEditableTextCellNode : ASCellNode <ASEditableTextNodeDelegate>

Prop_strong()ASEditableTextNode *editable;
Prop_strong()ASTextNode *hint;

@end

NS_ASSUME_NONNULL_END
