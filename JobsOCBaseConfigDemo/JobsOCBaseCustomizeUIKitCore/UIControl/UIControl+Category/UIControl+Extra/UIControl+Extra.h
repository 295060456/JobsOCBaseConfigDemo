//
//  UIControl+Extra.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (Extra)

-(void)addTarget:(id _Nullable)target
 touchDownAction:(SEL)action;

-(void)addTarget:(id _Nullable)target
touchDownRepeatAction:(SEL)action;

-(void)addTarget:(id _Nullable)target
touchDragInsideAction:(SEL)action;

-(void)addTarget:(id _Nullable)target
touchDragEnterAction:(SEL)action;

-(void)addTarget:(id _Nullable)target
touchDragExitAction:(SEL)action;

-(void)addTarget:(id _Nullable)target
touchUpInsideAction:(SEL)action;

-(void)addTarget:(id _Nullable)target
touchUpOutsideAction:(SEL)action;

-(void)addTarget:(id _Nullable)target
touchCancelAction:(SEL)action;

-(void)addTarget:(id _Nullable)target
valueChangedAction:(SEL)action;

-(void)addTarget:(id _Nullable)target
primaryActionTriggeredAction:(SEL)action;

-(void)addTarget:(id _Nullable)target
menuActionTriggeredAction:(SEL)action;

-(void)addTarget:(id _Nullable)target
editingDidBeginAction:(SEL)action;

-(void)addTarget:(id _Nullable)target
editingChangedAction:(SEL)action;

-(void)addTarget:(id _Nullable)target
editingDidEndAction:(SEL)action;

-(void)addTarget:(id _Nullable)target
editingDidEndOnExitAction:(SEL)action;

-(void)addTarget:(id _Nullable)target
allTouchEventsAction:(SEL)action;

-(void)addTarget:(id _Nullable)target
allEditingEventsAction:(SEL)action;

-(void)addTarget:(id _Nullable)target
applicationReservedAction:(SEL)action;

-(void)addTarget:(id _Nullable)target
systemReservedAction:(SEL)action;

-(void)addTarget:(id _Nullable)target
 allEventsAction:(SEL)action;

@end

NS_ASSUME_NONNULL_END

/**
 * 调用示例：
    [self addTarget:self touchUpInsideAction:[self jobsSelectorBlock:^id _Nullable(id  _Nullable weakSelf,
                                                             id  _Nullable arg) {
        NSLog(@"Hello Jobs");
        return nil;
    }]];
 */
