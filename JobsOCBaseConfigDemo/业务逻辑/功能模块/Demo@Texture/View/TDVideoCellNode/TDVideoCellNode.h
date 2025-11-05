//
//  TDVideoCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import <AsyncDisplayKit/ASDisplayNode+Subclasses.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Video Cell (ASVideoNode)
@interface TDVideoCellNode : ASCellNode
@property (nonatomic, strong) ASVideoNode *video;
@property (nonatomic, strong) ASTextNode  *title;
- (instancetype)initWithURL:(NSURL *)url title:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
