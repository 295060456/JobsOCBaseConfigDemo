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

-(instancetype)init {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.button.enabled = YES;
        self.descNode.enabled = YES;
    }return self;
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    @jobs_weakify(self)
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(12, 16, 12, 16) child:jobsMakeVerticalStackLayoutSpec(^(ASStackLayoutSpec * _Nullable v) {
        @jobs_strongify(self)
        v.bySpacing(10).byAlignItems(ASStackLayoutAlignItemsStart).byChildren(@[self.button, self.descNode]);
    })];
}
#pragma mark —— lazyLoad
- (ASButtonNode *)button {
    if (!_button) {
        @jobs_weakify(self)
        _button = jobsMakeButtonNode(^(ASButtonNode *node) {
            node.byTitle(@"Tap to Toggle",[UIFont boldSystemFontOfSize:15],JobsWhiteColor,UIControlStateNormal)
                .byImage(@"bolt.fill".img,UIControlStateNormal)
                .byContentEdgeInsets(UIEdgeInsetsMake(10, 14, 10, 14))
                .byBackgroundColor(UIColor.systemBlueColor)
                .byCornerRadius(8)
                .byHitTestSlop(UIEdgeInsetsMake(-10, -10, -10, -10))
                .onClickBy(^(__kindof ASButtonNode *btn) {
                    @jobs_strongify(self)
                    if (!self) return;
                    BOOL on = [self.button.backgroundColor isEqual:UIColor.systemBlueColor];
                    btn.backgroundColor = on ? UIColor.systemGreenColor : UIColor.systemBlueColor;
                    btn.accessibilityLabel = @"Tap to Toggle";
                    [self setNeedsLayout];
                })
                .onLongPressGestureBy(^(__kindof ASButtonNode *btn, UILongPressGestureRecognizer *gr) {
                    @jobs_strongify(self)
                    if (!self) return;
                    JobsLog(@"长按触发 %@", gr);
                });
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
