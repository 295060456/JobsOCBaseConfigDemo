//
//  TextureDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import <AsyncDisplayKit/ASDisplayNode+Subclasses.h>
#import <AVFoundation/AVFoundation.h>

#import "TDTextCellNode.h"
#import "TDImageCellNode.h"
#import "TDNetImageCellNode.h"
#import "TDButtonCellNode.h"
#import "TDEditableTextCellNode.h"
#import "TDHorizontalItemNode.h"
#import "TDHorizontalCarouselCellNode.h"
#import "TDVideoCellNode.h"
#import "TDMapCellNode.h"
#import "TDDrawCellNode.h"

#pragma mark - Table Section Model
typedef NS_ENUM(NSInteger, TDDemoRowType) {
    TDDemoRowType_Text = 0,
    TDDemoRowType_LocalImage,
    TDDemoRowType_NetImage,
    TDDemoRowType_Button,
    TDDemoRowType_EditableText,
    TDDemoRowType_HCarousel,
    TDDemoRowType_Video,
#if HAS_MAPKIT
    TDDemoRowType_Map,
#endif
    TDDemoRowType_Draw
};

NS_ASSUME_NONNULL_BEGIN

@interface TextureDemoVC : ASDKViewController<ASTableNode *> <ASTableDataSource, ASTableDelegate>
@property (nonatomic, strong) ASTableNode *tableNode;
@property (nonatomic, strong) NSMutableArray<NSNumber *> *rows;
@property (nonatomic, assign) BOOL hasMore;
@end

NS_ASSUME_NONNULL_END
