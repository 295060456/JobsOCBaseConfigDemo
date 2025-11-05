//
//  TDHorizontalItemNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

static inline UIColor * _Nullable TD_RandColor(void) {
    return [UIColor colorWithHue:arc4random_uniform(1000)/1000.0
                      saturation:0.5 + arc4random_uniform(500)/1000.0
                      brightness:0.8
                           alpha:1];
}

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Horizontal Carousel (ASCollectionNode In Cell)
@interface TDHorizontalItemNode : ASCellNode

@property (nonatomic, strong) ASDisplayNode *colorNode;
@property (nonatomic, strong) ASTextNode *text;

- (instancetype)initWithIndex:(NSInteger)idx;

@end

NS_ASSUME_NONNULL_END
