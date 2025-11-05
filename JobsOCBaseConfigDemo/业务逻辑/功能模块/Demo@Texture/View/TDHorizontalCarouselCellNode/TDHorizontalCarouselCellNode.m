//
//  TDHorizontalCarouselCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import "TDHorizontalCarouselCellNode.h"

@interface TDHorizontalCarouselCellNode ()

@end

@implementation TDHorizontalCarouselCellNode
- (instancetype)initWithCount:(NSInteger)count {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumInteritemSpacing = 10;
        layout.minimumLineSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);

        _collection = [[ASCollectionNode alloc] initWithCollectionViewLayout:layout];
        _collection.dataSource = self;
        _collection.delegate = self;
        _collection.backgroundColor = UIColor.clearColor;
        _collection.style.preferredSize = CGSizeMake(0, 90);

        NSMutableArray *arr = [NSMutableArray array];
        for (NSInteger i = 0; i < count; i++) { [arr addObject:@(i)]; }
        _items = arr;

        // 预取/范围调优（水平场景）
        _collection.leadingScreensForBatching = 1.5;
        _collection.inverted = NO;
    }
    return self;
}
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 0, 8, 0) child:_collection];
}
#pragma mark - ASCollection
- (NSInteger)collectionNode:(ASCollectionNode *)collectionNode numberOfItemsInSection:(NSInteger)section { return _items.count; }
- (ASCellNodeBlock)collectionNode:(ASCollectionNode *)collectionNode nodeBlockForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger idx = indexPath.item;
    return ^ASCellNode * _Nonnull{
        return [[TDHorizontalItemNode alloc] initWithIndex:idx];
    };
}
@end
