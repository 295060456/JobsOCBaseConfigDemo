//
//  TDTextCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import "TDTextCellNode.h"

@interface TDTextCellNode ()

@end

@implementation TDTextCellNode

- (instancetype)initWithTitle:(NSString *)t subtitle:(NSString *)s {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.backgroundColor = UIColor.systemBackgroundColor;
        self.neverShowPlaceholders = NO; // 展示占位渲染
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        self.title = jobsMakeTextNode(^(ASTextNode * _Nullable node) {
            node.truncationMode = NSLineBreakByTruncatingTail;
            node.maximumNumberOfLines = 2;
            node.attributedText = [NSAttributedString.alloc initWithString:t
                                                                attributes:@{
                NSFontAttributeName: [UIFont boldSystemFontOfSize:16],
                NSForegroundColorAttributeName: UIColor.labelColor
            }];
        });

        self.subtitle = jobsMakeTextNode(^(ASTextNode * _Nullable node) {
            node.maximumNumberOfLines = 3;
            node.attributedText = [[NSAttributedString alloc] initWithString:s
                                                                       attributes:@{
                NSFontAttributeName: [UIFont systemFontOfSize:13],
                NSForegroundColorAttributeName: UIColor.secondaryLabelColor
            }];
        });
    }return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASStackLayoutSpec *v = [ASStackLayoutSpec verticalStackLayoutSpec];
    v.spacing = 6;
    v.children = @[_title, _subtitle];
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(12, 16, 12, 16) child:v];
}

@end
