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
        self.button.enabled = YES;
        self.descNode.enabled = YES;
    }return self;
}

- (void)onTap {
    BOOL on = [self.button.backgroundColor isEqual:UIColor.systemBlueColor];
    self.button.backgroundColor = on ? UIColor.systemGreenColor : UIColor.systemBlueColor;
    [self setNeedsLayout];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    @jobs_weakify(self)
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(12, 16, 12, 16) child:jobsMakeVerticalStackLayoutSpec(^(ASStackLayoutSpec * _Nullable v) {
        @jobs_strongify(self)
        v.spacing = 10;
        v.alignItems = ASStackLayoutAlignItemsStart;
        v.children = @[self.button, self.descNode];
    })];
}
#pragma mark —— lazyLoad
-(ASButtonNode *)button{
    if(!_button){
        _button = jobsMakeButtonNode(^(ASButtonNode * _Nullable node) {
            [node setTitle:@"Tap to Toggle" withFont:[UIFont boldSystemFontOfSize:15] withColor:JobsWhiteColor forState:UIControlStateNormal];
            [node setImage:@"bolt.fill".sys_img forState:UIControlStateNormal];
            node.contentEdgeInsets = UIEdgeInsetsMake(10, 14, 10, 14);
            node.backgroundColor = UIColor.systemBlueColor;
            node.cornerRadius = 8;
            node.hitTestSlop = UIEdgeInsetsMake(-10, -10, -10, -10);
            [node addTarget:self action:@selector(onTap) forControlEvents:ASControlNodeEventTouchUpInside];
        });
    }return _button;
}

-(ASTextNode *)descNode{
    if(!_descNode){
        _descNode = jobsMakeTextNode(^(ASTextNode * _Nullable node) {
            node.attributedText = [[NSAttributedString alloc] initWithString:@"ASButtonNode 支持高性能点击态、图片&标题、对齐和触控扩展区域。"
                                                                       attributes:@{
                NSFontAttributeName: [UIFont systemFontOfSize:13],
                NSForegroundColorAttributeName: UIColor.secondaryLabelColor
            }];
        });
    }return _descNode;
}

@end
