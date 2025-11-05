//
//  TDButtonCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import "TDButtonCellNode.h"

@interface TDButtonCellNode ()

@end

@implementation TDButtonCellNode
- (instancetype)init {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;

        _button = [[ASButtonNode alloc] init];
        [_button setTitle:@"Tap to Toggle" withFont:[UIFont boldSystemFontOfSize:15] withColor:UIColor.whiteColor forState:UIControlStateNormal];
        [_button setImage:[UIImage systemImageNamed:@"bolt.fill"] forState:UIControlStateNormal];
        _button.contentEdgeInsets = UIEdgeInsetsMake(10, 14, 10, 14);
        _button.backgroundColor = UIColor.systemBlueColor;
        _button.cornerRadius = 8;
        __weak typeof(self) weakSelf = self;
        _button.hitTestSlop = UIEdgeInsetsMake(-10, -10, -10, -10);
        [_button addTarget:self action:@selector(onTap) forControlEvents:ASControlNodeEventTouchUpInside];

        _descNode = [[ASTextNode alloc] init];
        _descNode.attributedText = [[NSAttributedString alloc] initWithString:@"ASButtonNode 支持高性能点击态、图片&标题、对齐和触控扩展区域。"
                                                                   attributes:@{
            NSFontAttributeName: [UIFont systemFontOfSize:13],
            NSForegroundColorAttributeName: UIColor.secondaryLabelColor
        }];
    }return self;
}

- (void)onTap {
    BOOL on = [self.button.backgroundColor isEqual:UIColor.systemBlueColor];
    self.button.backgroundColor = on ? UIColor.systemGreenColor : UIColor.systemBlueColor;
    [self setNeedsLayout];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASStackLayoutSpec *v = [ASStackLayoutSpec verticalStackLayoutSpec];
    v.spacing = 10;
    v.alignItems = ASStackLayoutAlignItemsStart;
    v.children = @[_button, _descNode];
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(12, 16, 12, 16) child:v];
}

@end
