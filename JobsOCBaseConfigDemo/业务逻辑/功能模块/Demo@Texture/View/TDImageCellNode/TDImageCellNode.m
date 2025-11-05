//
//  TDImageCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import "TDImageCellNode.h"

@implementation TDImageCellNode

-(instancetype)initWithImage:(UIImage *)img title:(NSString *)title {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.backgroundColor = UIColor.systemBackgroundColor;
        self.image = jobsMakeImageNode(^(ASImageNode * _Nullable node) {
            node.image = img;
            node.contentMode = UIViewContentModeScaleAspectFill;
            node.clipsToBounds = YES;
            node.cornerRadius = 12.0;
            node.placeholderColor = UIColor.secondarySystemFillColor;
        });

        self.badge = jobsMakeTextNode(^(ASTextNode * _Nullable node) {
            node.attributedText = [[NSAttributedString alloc] initWithString:title
                                                                    attributes:@{
                NSFontAttributeName: [UIFont boldSystemFontOfSize:12],
                NSForegroundColorAttributeName: UIColor.whiteColor
            }];
            node.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
            node.textContainerInset = UIEdgeInsetsMake(4, 8, 4, 8);
            node.cornerRadius = 10;
            node.clipsToBounds = YES;
        });
    }return self;
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    // Ratio 16:9 裁切
    ASRatioLayoutSpec *ratio = [ASRatioLayoutSpec ratioLayoutSpecWithRatio:(9.0/16.0) child:_image];
    // overlay 右下角角标
    ASInsetLayoutSpec *badgeInset = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(INFINITY, INFINITY, 8, 8) child:_badge];
    ASOverlayLayoutSpec *overlay = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:ratio overlay:badgeInset];
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 16, 8, 16) child:overlay];
}

@end
