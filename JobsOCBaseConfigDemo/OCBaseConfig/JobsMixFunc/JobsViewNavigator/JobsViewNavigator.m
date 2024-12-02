//
//  JobsViewNavigator.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/3/24.
//

#import "JobsViewNavigator.h"

@interface JobsViewNavigator ()

@property(nonatomic,strong)NSMutableArray<__kindof UIView *> *viewStack;

@end

@implementation JobsViewNavigator

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

    }return self;
}

-(jobsByViewAndAnimatedBlock _Nonnull)pushView{
    @jobs_weakify(self)
    return ^(UIView __kindof * _Nullable view,BOOL animated) {
        @jobs_strongify(self)
        if (!view) return;
        UIView *currentTopView = self.viewStack.lastObject;
        self.viewStack.add(view);
        [self addSubview:view];
        
        CGRect offScreenRight = CGRectOffset(self.bounds,
                                             self.bounds.size.width, 0);
        view.frame = offScreenRight;
        
        jobsByVoidBlock transitionBlock = ^{
            @jobs_strongify(self)
            view.frame = self.bounds;
            currentTopView.frame = CGRectOffset(self.bounds,
                                                -self.bounds.size.width, 0);
        };
        
        if (animated) {
            [UIView animateWithDuration:0.3
                             animations:transitionBlock
                             completion:nil];
        } else {
            if(transitionBlock) transitionBlock();
        }
    };
}

-(jobsByBOOLBlock _Nonnull)popViewAnimated{
    @jobs_weakify(self)
    return ^(BOOL animated) {
        @jobs_strongify(self)
        if (self.viewStack.count == 0) return; // Prevent popping when there's no view
        
        UIView *topView = self.viewStack.lastObject;
        [self.viewStack removeLastObject];
        UIView *previousView = self.viewStack.lastObject;

        jobsByVoidBlock transitionBlock = ^{
            @jobs_strongify(self)
            topView.frame = CGRectOffset(self.bounds, self.bounds.size.width, 0);
            previousView.frame = self.bounds;
        };
        
        jobsByBOOLBlock completionBlock = ^(BOOL finished) {
            @jobs_strongify(self)
            [topView removeFromSuperview];
            if (self.viewStack.count == 0) {
                // 移除MyViewNavigator自身
                [self removeFromSuperview];
            }
        };
        
        if (animated) {
            [UIView animateWithDuration:0.3
                             animations:transitionBlock
                             completion:completionBlock];
        } else {
            if(transitionBlock) transitionBlock();
            if(completionBlock) completionBlock(YES);
        }
    };
}
#pragma mark —— lazyLoad
-(NSMutableArray<__kindof UIView *> *)viewStack{
    if(!_viewStack){
        _viewStack = NSMutableArray.array;
    }return _viewStack;
}

@end
