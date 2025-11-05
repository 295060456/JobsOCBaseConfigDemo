//
//  TDTextCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

NS_ASSUME_NONNULL_BEGIN
/// Text Cell (ASTextNode)
@interface TDTextCellNode : ASCellNode

Prop_strong() ASTextNode *title;
Prop_strong() ASTextNode *subtitle;

-(instancetype)initWithTitle:(NSString *)t subtitle:(NSString *)s ;

@end

NS_ASSUME_NONNULL_END
