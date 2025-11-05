//
//  TDDrawCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import "TDDrawCellNode.h"

@interface TDDrawCellNode ()

@end

@implementation TDDrawCellNode

- (instancetype)init {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.canvas.placeholderEnabled = YES;
    }return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 16, 8, 16) child:_canvas];
}
#pragma mark —— lazyLoad
-(TDDrawingNode *)canvas{
    if(!_canvas){
        _canvas = jobsMakeDrawingNode(^(TDDrawingNode * _Nullable node) {
            node.style.preferredSize = CGSizeMake(0, 120); // 高度 120，宽度由父布局给
        });
    }return _canvas;
}

@end
