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

        _title = [[ASTextNode alloc] init];
        _title.attributedText = [[NSAttributedString alloc] initWithString:t
                                                                attributes:@{
            NSFontAttributeName: [UIFont boldSystemFontOfSize:16],
            NSForegroundColorAttributeName: UIColor.labelColor
        }];
        _title.truncationMode = NSLineBreakByTruncatingTail;
        _title.maximumNumberOfLines = 2;

        _subtitle = [[ASTextNode alloc] init];
        _subtitle.attributedText = [[NSAttributedString alloc] initWithString:s
                                                                   attributes:@{
            NSFontAttributeName: [UIFont systemFontOfSize:13],
            NSForegroundColorAttributeName: UIColor.secondaryLabelColor
        }];
        _subtitle.maximumNumberOfLines = 3;

        self.backgroundColor = UIColor.systemBackgroundColor;
        self.neverShowPlaceholders = NO; // 展示占位渲染
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASStackLayoutSpec *v = [ASStackLayoutSpec verticalStackLayoutSpec];
    v.spacing = 6;
    v.children = @[_title, _subtitle];
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(12, 16, 12, 16) child:v];
}

@end
