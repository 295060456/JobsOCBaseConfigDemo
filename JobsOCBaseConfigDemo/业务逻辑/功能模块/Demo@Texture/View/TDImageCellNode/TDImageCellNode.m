//
//  TDImageCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import "TDImageCellNode.h"

@implementation TDImageCellNode
- (instancetype)initWithImage:(UIImage *)img title:(NSString *)title {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.backgroundColor = UIColor.systemBackgroundColor;

        _image = [[ASImageNode alloc] init];
        _image.image = img;
        _image.contentMode = UIViewContentModeScaleAspectFill;
        _image.clipsToBounds = YES;
        _image.cornerRadius = 12.0;
        _image.placeholderColor = UIColor.secondarySystemFillColor;

        _badge = [[ASTextNode alloc] init];
        _badge.attributedText = [[NSAttributedString alloc] initWithString:title
                                                                attributes:@{
            NSFontAttributeName: [UIFont boldSystemFontOfSize:12],
            NSForegroundColorAttributeName: UIColor.whiteColor
        }];
        _badge.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
        _badge.textContainerInset = UIEdgeInsetsMake(4, 8, 4, 8);
        _badge.cornerRadius = 10;
        _badge.clipsToBounds = YES;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    // Ratio 16:9 裁切
    ASRatioLayoutSpec *ratio = [ASRatioLayoutSpec ratioLayoutSpecWithRatio:(9.0/16.0) child:_image];

    // overlay 右下角角标
    ASInsetLayoutSpec *badgeInset =
        [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(INFINITY, INFINITY, 8, 8)
                                               child:_badge];
    ASOverlayLayoutSpec *overlay = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:ratio overlay:badgeInset];

    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 16, 8, 16) child:overlay];
}
@end
