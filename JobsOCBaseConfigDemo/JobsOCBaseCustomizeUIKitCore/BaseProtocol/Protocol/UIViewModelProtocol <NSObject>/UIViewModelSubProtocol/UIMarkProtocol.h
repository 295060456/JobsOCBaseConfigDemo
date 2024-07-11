//
// UIMarkProtocol.h
// JobsOCBaseConfig
//
// Created by Jobs on 2022/1/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UIMarkProtocol <NSObject>
@optional
#pragma mark —— 标记📌
@property(nonatomic,strong,nullable)NSIndexPath *indexPath;
@property(nonatomic,assign)NSInteger section;
@property(nonatomic,assign)NSInteger row;
@property(nonatomic,assign)NSInteger item;
@property(nonatomic,assign)CGPoint lastPoint;
@property(nonatomic,assign)NSInteger index;
@property(nonatomic,assign)NSInteger currentPage;/// 网路请求分页数据的时候的当前页码
@property(nonatomic,assign)NSInteger pageSize;
@property(nonatomic,assign)BOOL isMark;/// 是否被标记。标记的意思可以是是否维护中等等......
@property(nonatomic,assign)CGFloat presentUpHeight;/// 当一个VC被以present的形式推出的时候，距离手机屏幕下边距的距离

@end

NS_ASSUME_NONNULL_END

#pragma mark —— @synthesize UIMarkProtocol
#ifndef UIMarkProtocol_synthesize
#define UIMarkProtocol_synthesize \
\
@synthesize indexPath = _indexPath;\
@synthesize section = _section;\
@synthesize row = _row;\
@synthesize item = _item;\
@synthesize lastPoint = _lastPoint;\
@synthesize index = _index;\
@synthesize currentPage = _currentPage;\
@synthesize pageSize = _pageSize;\
@synthesize isMark = _isMark;\
@synthesize presentUpHeight = _presentUpHeight;\

#endif

#pragma mark —— @dynamic UIMarkProtocol
#ifndef UIMarkProtocol_dynamic
#define UIMarkProtocol_dynamic \
\
@dynamic indexPath;\
@dynamic section;\
@dynamic rowp;\
@dynamic item;\
@dynamic lastPoint;\
@dynamic index;\
@dynamic currentPage;\
@dynamic pageSize;\
@dynamic isMark;\
@dynamic presentUpHeight;\

#endif

