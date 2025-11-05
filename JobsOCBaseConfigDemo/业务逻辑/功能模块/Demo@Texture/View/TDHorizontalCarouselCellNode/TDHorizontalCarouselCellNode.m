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
        self.collection.inverted = NO;
        _items = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
            for (NSInteger i = 0; i < count; i++) {
                arr.add(@(i));
            }
        });
    }return self;
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 0, 8, 0) child:self.collection];
}
#pragma mark —— ASCollection
-(NSInteger)collectionNode:(ASCollectionNode *)collectionNode
    numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

-(ASCellNodeBlock)collectionNode:(ASCollectionNode *)collectionNode
     nodeBlockForItemAtIndexPath:(NSIndexPath *)indexPath {
    return ^ASCellNode * _Nonnull{
        return [TDHorizontalItemNode.alloc initWithIndex:indexPath.item];
    };
}
#pragma mark —— lazyLoad
-(ASCollectionNode *)collection{
    if(!_collection){
        @jobs_weakify(self)
        _collection = jobsMakeCollectionNode(^(ASCollectionNode * _Nullable node) {
            @jobs_strongify(self)
            node = [ASCollectionNode.alloc initWithCollectionViewLayout:jobsMakeCollectionViewFlowLayout(^(__kindof UICollectionViewFlowLayout * _Nullable layout) {
                layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
                layout.minimumInteritemSpacing = 10;
                layout.minimumLineSpacing = 10;
                layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
            })];
            node.dataSource = self;
            node.delegate = self;
            node.backgroundColor = UIColor.clearColor;
            node.style.preferredSize = CGSizeMake(0, 90);
            /// 预取/范围调优（水平场景）
            node.leadingScreensForBatching = 1.5;
            node.inverted = NO;
        });
    }return _collection;
}


@end
