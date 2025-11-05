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

- (instancetype)initWithIndex:(NSInteger)idx {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        _colorNode = [[ASDisplayNode alloc] init];
        _colorNode.backgroundColor = TD_RandColor();
        _colorNode.cornerRadius = 8.0;
        _colorNode.style.preferredSize = CGSizeMake(120, 70);

        _text = [[ASTextNode alloc] init];
        _text.attributedText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"#%ld", (long)idx]
                                                               attributes:@{
           NSFontAttributeName: [UIFont boldSystemFontOfSize:13],
           NSForegroundColorAttributeName: UIColor.whiteColor
        }];
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASCenterLayoutSpec *centerText =
    [ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:ASCenterLayoutSpecCenteringXY
                                               sizingOptions:ASCenterLayoutSpecSizingOptionMinimumXY
                                                       child:_text];
    ASOverlayLayoutSpec *overlay = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:_colorNode overlay:centerText];
    return overlay;
}

@end
