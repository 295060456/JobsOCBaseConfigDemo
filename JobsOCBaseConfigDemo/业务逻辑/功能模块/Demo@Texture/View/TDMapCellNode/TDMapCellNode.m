//
//  TDMapCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import "TDMapCellNode.h"

#pragma mark - Map Cell (ASMapNode) [Optional]

#if HAS_MAPKIT
@interface TDMapCellNode ()

@end

@implementation TDMapCellNode
- (instancetype)init {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        _mapNode = [[ASMapNode alloc] init];
        _mapNode.style.preferredSize = CGSizeMake(0, 180);
        _mapNode.cornerRadius = 12;
        _mapNode.clipsToBounds = YES;
        // 示例：设置一个区域
        MKCoordinateRegion region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(35.0, 103.0),
                                                           MKCoordinateSpanMake(20, 20));
        _mapNode.region = region;
        _mapNode.liveMap = YES;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 16, 8, 16) child:_mapNode];
}

@end
#endif
