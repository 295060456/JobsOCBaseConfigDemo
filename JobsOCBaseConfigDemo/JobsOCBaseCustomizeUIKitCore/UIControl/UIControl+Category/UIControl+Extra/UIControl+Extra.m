//
//  UIControl+Extra.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/26.
//

#import "UIControl+Extra.h"

@implementation UIControl (Extra)

-(void)addTarget:(id _Nullable)target
 touchDownAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventTouchDown];
}

-(void)addTarget:(id _Nullable)target
touchDownRepeatAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventTouchDownRepeat];
}

-(void)addTarget:(id _Nullable)target
touchDragInsideAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventTouchDragInside];
}

-(void)addTarget:(id _Nullable)target
touchDragEnterAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventTouchDragEnter];
}

-(void)addTarget:(id _Nullable)target
touchDragExitAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventTouchDragExit];
}

-(void)addTarget:(id _Nullable)target
touchUpInsideAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventTouchUpInside];
}

-(void)addTarget:(id _Nullable)target
touchUpOutsideAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventTouchUpOutside];
}

-(void)addTarget:(id _Nullable)target
touchCancelAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventTouchCancel];
}

-(void)addTarget:(id _Nullable)target
valueChangedAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventValueChanged];
}

-(void)addTarget:(id _Nullable)target
primaryActionTriggeredAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventPrimaryActionTriggered];
}

-(void)addTarget:(id _Nullable)target
menuActionTriggeredAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventMenuActionTriggered];
}

-(void)addTarget:(id _Nullable)target
editingDidBeginAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventEditingDidBegin];
}

-(void)addTarget:(id _Nullable)target
editingChangedAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventEditingChanged];
}

-(void)addTarget:(id _Nullable)target
editingDidEndAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventEditingDidEnd];
}

-(void)addTarget:(id _Nullable)target
editingDidEndOnExitAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventEditingDidEndOnExit];
}

-(void)addTarget:(id _Nullable)target
allTouchEventsAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventAllTouchEvents];
}

-(void)addTarget:(id _Nullable)target
allEditingEventsAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventAllEditingEvents];
}

-(void)addTarget:(id _Nullable)target
applicationReservedAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventApplicationReserved];
}

-(void)addTarget:(id _Nullable)target
systemReservedAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventSystemReserved];
}

-(void)addTarget:(id _Nullable)target
 allEventsAction:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventAllEvents];
}

@end
