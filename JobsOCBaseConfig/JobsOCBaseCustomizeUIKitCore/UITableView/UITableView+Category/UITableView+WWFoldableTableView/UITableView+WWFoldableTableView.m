//
//  UITableView+WWFoldableTableView.m
//  WWFoldableTableView
//
//  https://github.com/Tidusww/WWFoldableTableView
//  Created by Tidus on 17/1/6.
//  Copyright © 2017年 Tidus. All rights reserved.
//

#import "UITableView+WWFoldableTableView.h"

@implementation UITableView (WWFoldableTableView)
#pragma mark - init
+ (void)load{
    SuppressWundeclaredSelectorWarning(
//                                       [self ww_swizzInstanceMethod:@selector(_numberOfSections)
//                                                         withMethod:@selector(ww__numberOfSections)];
                                       [self ww_swizzInstanceMethod:@selector(_numberOfRowsInSection:)
                                                         withMethod:@selector(ww__numberOfRowsInSection:)];
                                       );
}

- (NSInteger)ww__numberOfRowsInSection:(NSInteger)section{
    if(!self.ww_foldState || !self.ww_foldState){
        return [self ww__numberOfRowsInSection:section];
    }
    /// 根据折叠状态返回行数
    BOOL isFolded = [self ww_isSectionFolded:section];
    return isFolded ? 0 : [self ww__numberOfRowsInSection:section];
}
JobsKey(_ww_foldable)
- (BOOL)ww_foldable{
    return Jobs_getAssociatedObject(_ww_foldable);
}

- (void)setWw_foldable:(BOOL)ww_foldable{
    [self willChangeValueForKey:@"ww_foldable"];
    Jobs_setAssociatedASSIGN(_ww_foldable, @(ww_foldable))
    [self didChangeValueForKey:@"ww_foldable"];
    
    if(ww_foldable && !self.ww_foldState){
        NSMutableSet *foldState = NSMutableSet.set;
        self.ww_foldState = foldState;
    }
    //clean up
    if(!ww_foldable){
        [self setWw_foldState:nil];
    }
}
JobsKey(_ww_foldState)
- (NSMutableSet *)ww_foldState{
    return Jobs_getAssociatedObject(_ww_foldState);
}

- (void)setWw_foldState:(NSMutableSet *)ww_foldState{
    if(self.ww_foldable && ww_foldState != self.ww_foldState){
        [self willChangeValueForKey:@"ww_foldState"];
        Jobs_setAssociatedRETAIN_NONATOMIC(_ww_foldState, ww_foldState)
        [self didChangeValueForKey:@"ww_foldState"];
    }
}
#pragma mark —— methods
- (BOOL)ww_isSectionFolded:(NSInteger)section{
    if(!self.ww_foldable || !self.ww_foldState){
        return NO;
    }return [self.ww_foldState containsObject:@(section)];
}

- (void)ww_foldSection:(NSInteger)section fold:(BOOL)fold{
    if(!self.ww_foldable || !self.ww_foldState){
        return;
    }
    NSMutableSet *state = self.ww_foldState;
    if(fold){
        [state addObject:@(section)];
    }else{
        [state removeObject:@(section)];
    }
    self.ww_foldState = state;
    
    @try {
        //防止crash
        [self reloadSections:[NSIndexSet indexSetWithIndex:section]
            withRowAnimation:UITableViewRowAnimationFade];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception);
        [self reloadData];
    }
}

@end

@implementation NSObject (WWExtension)

+(void)ww_swizzInstanceMethod:(SEL)methodOrig withMethod:(SEL)methodNew{
    Method orig = class_getInstanceMethod(self, methodOrig);
    Method new = class_getInstanceMethod(self, methodNew);
    if(orig && new){
        method_exchangeImplementations(orig, new);
    }else{
        NSLog(@"swizz instance method failed: %s", sel_getName(methodOrig));
    }
}

+(void)ww_swizzClassMethod:(SEL)methodOrig withMethod:(SEL)methodNew{
    Method orig = class_getClassMethod(self, methodOrig);
    Method new = class_getClassMethod(self, methodNew);
    if(orig && new){
        method_exchangeImplementations(orig, new);
    }else{
        NSLog(@"swizz class method failed: %s", sel_getName(methodOrig));
    }
}

@end
