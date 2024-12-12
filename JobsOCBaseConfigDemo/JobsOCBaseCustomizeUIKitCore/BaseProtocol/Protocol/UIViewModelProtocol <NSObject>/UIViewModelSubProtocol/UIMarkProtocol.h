//
// UIMarkProtocol.h
// JobsOCBaseConfig
//
// Created by Jobs on 2022/1/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DefineProperty.h"
#import "BaseLayerProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UIMarkProtocol <NSObject>
@optional
#pragma mark —— 标记📌
Prop_strong(nullable)NSIndexPath *indexPath;
Prop_strong(nullable)NSNumber *currentPage;/// 网路请求分页数据的时候的当前页码
Prop_strong(nullable)NSNumber *pageSize;
Prop_strong(nullable)NSNumber *pageNum;
Prop_assign()NSInteger section;
Prop_assign()NSInteger row;
Prop_assign()NSInteger item;
Prop_assign()CGPoint lastPoint;
Prop_assign()NSInteger index;
Prop_assign()BOOL isMark; /// 是否被标记。标记的意思可以是是否维护中等等......
Prop_assign()CGFloat presentUpHeight; /// 当一个VC被以present的形式推出的时候，距离手机屏幕下边距的距离

@end

NS_ASSUME_NONNULL_END

#ifndef UIMarkProtocol_synthesize_part1
#define UIMarkProtocol_synthesize_part1 \
\
@synthesize indexPath = _indexPath; \
@synthesize lastPoint = _lastPoint; \
@synthesize index = _index; \
@synthesize currentPage = _currentPage; \
@synthesize pageSize = _pageSize; \
@synthesize pageNum = _pageNum; \
@synthesize isMark = _isMark; \
@synthesize presentUpHeight = _presentUpHeight; \

#endif /* UIMarkProtocol_synthesize_part1 */

#ifndef UIMarkProtocol_synthesize_part2
#define UIMarkProtocol_synthesize_part2 \
\
@synthesize section = _section; \
@synthesize row = _row; \
@synthesize item = _item; \

#endif /* UIMarkProtocol_synthesize_part2 */

#ifndef UIMarkProtocol_synthesize
#define UIMarkProtocol_synthesize \
\
UIMarkProtocol_synthesize_part1 \
UIMarkProtocol_synthesize_part2

#endif /* UIMarkProtocol_synthesize */

#ifndef UIMarkProtocol_dynamic_part1
#define UIMarkProtocol_dynamic_part1 \
\
@dynamic section; \
@dynamic item; \
@dynamic row; \

#endif /* UIMarkProtocol_dynamic_part1 */

#ifndef UIMarkProtocol_dynamic_part2
#define UIMarkProtocol_dynamic_part2 \
\
@dynamic indexPath; \
@dynamic lastPoint; \
@dynamic index; \
@dynamic currentPage; \
@dynamic pageSize; \
@dynamic pageNum; \
@dynamic isMark; \
@dynamic presentUpHeight; \

#endif /* UIMarkProtocol_dynamic_part2 */

#ifndef UIMarkProtocol_dynamic
#define UIMarkProtocol_dynamic \
\
UIMarkProtocol_dynamic_part1 \
UIMarkProtocol_dynamic_part2 \

#endif /* UIMarkProtocol_dynamic */


//item
