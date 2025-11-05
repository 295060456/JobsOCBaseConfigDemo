//
//  TDHorizontalItemNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import "TDHorizontalItemNode.h"

@interface TDHorizontalItemNode ()

@end

@implementation TDHorizontalItemNode

-(instancetype)initWithIndex:(NSInteger)idx{
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.colorNode.shouldAnimateSizeChanges = YES;
        self.text = jobsMakeTextNode(^(ASTextNode * _Nullable node) {
            node.attributedText = [NSAttributedString.alloc initWithString:[NSString stringWithFormat:@"#%ld", (long)idx]
                                                                attributes:@{
               NSFontAttributeName: [UIFont boldSystemFontOfSize:13],
               NSForegroundColorAttributeName: UIColor.whiteColor
            }];
        });
    }return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASCenterLayoutSpec *centerText =
    [ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:ASCenterLayoutSpecCenteringXY
                                               sizingOptions:ASCenterLayoutSpecSizingOptionMinimumXY
                                                       child:self.text];
    ASOverlayLayoutSpec *overlay = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:_colorNode overlay:centerText];
    return overlay;
}
#pragma mark —— lazyLoad
-(ASDisplayNode *)colorNode{
    if(!_colorNode){
        _colorNode = jobsMakeDisplayNode(^(ASDisplayNode * _Nullable node) {
            node.backgroundColor = TD_RandColor();
            node.cornerRadius = 8.0;
            node.style.preferredSize = CGSizeMake(120, 70);
        });
    }return _colorNode;
}

@end
