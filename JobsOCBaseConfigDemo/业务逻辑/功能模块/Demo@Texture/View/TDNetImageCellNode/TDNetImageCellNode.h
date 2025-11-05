//
//  TDNetImageCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Network Image Cell (ASNetworkImageNode) + Round
@interface TDNetImageCellNode : ASCellNode

@property (nonatomic, strong) ASNetworkImageNode *netImage;
@property (nonatomic, strong) ASTextNode *title;

- (instancetype)initWithURL:(NSURL *)url text:(NSString *)text ;

@end

NS_ASSUME_NONNULL_END
