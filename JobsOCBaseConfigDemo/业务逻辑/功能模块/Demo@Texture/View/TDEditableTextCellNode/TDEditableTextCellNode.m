//
//  TDEditableTextCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import "TDEditableTextCellNode.h"

@interface TDEditableTextCellNode ()

@end

@implementation TDEditableTextCellNode
- (instancetype)init {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;

        _editable = [[ASEditableTextNode alloc] init];
        _editable.attributedText = [[NSAttributedString alloc] initWithString:@"可编辑内容……"
                                                                   attributes:@{
            NSFontAttributeName: [UIFont systemFontOfSize:15],
            NSForegroundColorAttributeName: UIColor.labelColor
        }];
        _editable.typingAttributes = @{ NSForegroundColorAttributeName: UIColor.labelColor,
                                        NSFontAttributeName: [UIFont systemFontOfSize:15] };
        _editable.style.preferredSize = CGSizeMake(0, 80);
        _editable.borderWidth = 1;
        _editable.borderColor = UIColor.separatorColor.CGColor;
        _editable.textContainerInset = UIEdgeInsetsMake(8, 8, 8, 8);
        _editable.delegate = self;

        _hint = [[ASTextNode alloc] init];
        _hint.attributedText = [[NSAttributedString alloc] initWithString:@"ASEditableTextNode：异步文本编辑，避免主线程卡顿。"
                                                               attributes:@{
            NSFontAttributeName: [UIFont systemFontOfSize:12],
            NSForegroundColorAttributeName: UIColor.secondaryLabelColor
        }];
    }
    return self;
}
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASStackLayoutSpec *v = [ASStackLayoutSpec verticalStackLayoutSpec];
    v.spacing = 8;
    v.children = @[_editable, _hint];
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(12, 16, 12, 16) child:v];
}
@end
