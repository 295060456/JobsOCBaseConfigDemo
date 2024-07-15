//
//  NotifiViewFactory.h
//  CoreTextLearning
//
//  Created by alan comb on 2021/4/10.
//

#import <Foundation/Foundation.h>
#import "NotifiView.h"

typedef void(^FetchNotifiViewBlock)(NotifiView *_Nullable view);

NS_ASSUME_NONNULL_BEGIN

@interface NotifiViewFactory : NSObject

@property(nonatomic,readonly,strong)NSArray *notifiViews;

+(instancetype)shared;

-(void)setNotifiViews:(NSArray * _Nonnull)notifiViews;
//取得一个目前可用的NotifiView, 如果没有可能为空
-(void)fetchAvailableView:(FetchNotifiViewBlock)block;
//如果key指向的view为空，则返回nil
-(NotifiView*)fetchViewWithKey:(NSString*)key;

@end

NS_ASSUME_NONNULL_END
