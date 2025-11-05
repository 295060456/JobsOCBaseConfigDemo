//
//  TDTextCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

NS_ASSUME_NONNULL_BEGIN
#pragma mark —— Text Cell (ASTextNode)
@interface TDTextCellNode : ASCellNode

@property (nonatomic, strong) ASTextNode *title;
@property (nonatomic, strong) ASTextNode *subtitle;

- (instancetype)initWithTitle:(NSString *)t subtitle:(NSString *)s ;

@end

NS_ASSUME_NONNULL_END
