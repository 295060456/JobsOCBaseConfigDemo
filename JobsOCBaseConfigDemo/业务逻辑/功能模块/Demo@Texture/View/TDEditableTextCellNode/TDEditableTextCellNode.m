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

-(instancetype)init {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.editable.scrollEnabled = YES;
        self.hint.placeholderEnabled = YES;
    }return self;
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    @jobs_weakify(self)
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(12, 16, 12, 16) child:jobsMakeVerticalStackLayoutSpec(^(ASStackLayoutSpec * _Nullable v) {
        @jobs_strongify(self)
        v.spacing = 8;
        v.children = @[self.editable, self.hint];
    })];
}
#pragma mark —— lazyLoad
-(ASEditableTextNode *)editable{
    if(!_editable){
        @jobs_weakify(self)
        _editable = jobsMakeEditableTextNode(^(ASEditableTextNode * _Nullable node) {
            @jobs_strongify(self)
            node.attributedText = [NSAttributedString.alloc initWithString:@"可编辑内容……"
                                                                attributes:@{
                NSFontAttributeName: [UIFont systemFontOfSize:15],
                NSForegroundColorAttributeName: UIColor.labelColor
            }];
            node.typingAttributes = @{ NSForegroundColorAttributeName: UIColor.labelColor,
                                       NSFontAttributeName: [UIFont systemFontOfSize:15] };
            node.style.preferredSize = CGSizeMake(0, 80);
            node.borderWidth = 1;
            node.borderColor = UIColor.separatorColor.CGColor;
            node.textContainerInset = UIEdgeInsetsMake(8, 8, 8, 8);
            node.delegate = self;
        });
    }return _editable;
}

-(ASTextNode *)hint{
    if(!_hint){
        _hint = jobsMakeTextNode(^(ASTextNode * _Nullable node) {
            node.attributedText = [NSAttributedString.alloc initWithString:@"ASEditableTextNode：异步文本编辑，避免主线程卡顿。"
                                                                attributes:@{
                NSFontAttributeName: [UIFont systemFontOfSize:12],
                NSForegroundColorAttributeName: UIColor.secondaryLabelColor
            }];
        });
    }return _hint;
}

@end
