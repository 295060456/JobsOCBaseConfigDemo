//
//  TDImageCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

NS_ASSUME_NONNULL_BEGIN
#pragma mark - Local Image Cell (ASImageNode) + Corner/Background/Overlay
@interface TDImageCellNode : ASCellNode

@property (nonatomic, strong) ASImageNode *image;
@property (nonatomic, strong) ASTextNode *badge;

- (instancetype)initWithImage:(UIImage *)img title:(NSString *)title ;

@end

NS_ASSUME_NONNULL_END
