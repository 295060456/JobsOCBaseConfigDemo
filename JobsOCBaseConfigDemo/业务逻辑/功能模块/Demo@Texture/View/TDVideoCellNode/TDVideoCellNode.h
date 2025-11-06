//
//  TDVideoCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import <AsyncDisplayKit/ASDisplayNode+Subclasses.h>
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN
/// Video Cell (ASVideoNode)
@interface TDVideoCellNode : ASCellNode

Prop_strong() ASVideoNode *video;
Prop_strong() ASTextNode  *title;

-(instancetype)initWithURL:(NSURL *)url title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
