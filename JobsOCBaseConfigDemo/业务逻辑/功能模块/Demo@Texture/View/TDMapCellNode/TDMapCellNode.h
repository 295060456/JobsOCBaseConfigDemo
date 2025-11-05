//
//  TDMapCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

#if __has_include(<MapKit/MapKit.h>)
#import <MapKit/MapKit.h>
#define HAS_MAPKIT 1
#else
#define HAS_MAPKIT 0
#endif

NS_ASSUME_NONNULL_BEGIN

@interface TDMapCellNode : ASCellNode

@property (nonatomic, strong) ASMapNode *mapNode;

@end


NS_ASSUME_NONNULL_END
