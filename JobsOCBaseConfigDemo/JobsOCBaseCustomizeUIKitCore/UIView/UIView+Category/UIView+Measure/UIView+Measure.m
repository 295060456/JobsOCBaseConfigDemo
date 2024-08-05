//
//  UIView+Measure.m
//  My_BaseProj
//
//  Created by Jobs on 2020/9/1.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "UIView+Measure.h"
/* ❤️【优先级】 @implementation UIView (Measure) > Masonry,因为Masonry刷新后才有frame ❤️*/
@implementation UIView (Measure)
#pragma mark —— UIView
-(JobsReturnCGRectByCGFloatBlock _Nullable)resetOriginX{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x = data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatAndUIViewBlock _Nullable)resetRightX{
    @jobs_weakify(self)
    return ^(CGFloat data,UIView *superView) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x = superView.width - data - self.width;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatBlock _Nullable)resetOriginY{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.y = data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatAndUIViewBlock _Nullable)resetBottomY{
    @jobs_weakify(self)
    return ^(CGFloat data,UIView *superView) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x = superView.height - data - self.height;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatBlock _Nullable)resetWidth{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.width = data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatBlock _Nullable)resetHeight{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.height = data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGPointBlock _Nullable)resetOrigin{
    @jobs_weakify(self)
    return ^(CGPoint data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x = data.x;
        frame.origin.y = data.y;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGSizeBlock _Nullable)resetSize{
    @jobs_weakify(self)
    return ^(CGSize data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size = data;
        self.frame = frame;
        return self.frame;
    };
}
/// 依据偏移量重设Frame
-(JobsReturnCGRectByCGFloatBlock _Nullable)resetByOffsetOriginX{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x += data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatBlock _Nullable)resetByOffsetOriginY{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.y += data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatBlock _Nullable)resetCenterX{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGPoint center = self.center;
        center.x = data;
        self.center = center;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatBlock _Nullable)resetCenterY{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGPoint center = self.center;
        center.y = data;
        self.center = center;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatBlock _Nullable)resetByOffsetWidth{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.width += data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatBlock _Nullable)resetByOffsetHeight{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.height += data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGPointBlock _Nullable)resetByOffsetOrigin{
    @jobs_weakify(self)
    return ^(CGPoint data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x += data.x;
        frame.origin.y += data.y;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGSizeBlock _Nullable)resetByOffsetSize{
    @jobs_weakify(self)
    return ^(CGSize data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.width += data.width;
        frame.size.height += data.height;
        self.frame = frame;
        return self.frame;
    };
}
/// 设置水平方向对齐
-(jobsByViewBlock)centerxEqualToView{
    @jobs_weakify(self);
    return ^(UIView *view){
        @jobs_strongify(self);
        //如果是子父关系
        if ([self.superview isKindOfClass:view.class]) {
            self.center = CGPointMake(view.center.x - view.x, self.center.y);
        }else{
            self.center = CGPointMake(view.center.x, self.center.y);
        }
    };
}
/// 设置垂平方向对齐
-(jobsByViewBlock)centeryEqualToView{
    @jobs_weakify(self);
    return ^(UIView *view){
        @jobs_strongify(self);
        //如果是子父关系
         if ([self.superview isKindOfClass:view.class]) {
             self.center = CGPointMake(self.center.x, view.center.y - view.y);
         }else{
             self.center = CGPointMake(self.center.x, view.center.y);
         }
    };
}
/// 设置中心方向对齐
-(jobsByViewBlock)centerEqualToView{
    @jobs_weakify(self);
    return ^(UIView *view){
        @jobs_strongify(self);
        //如果是子父关系
        if ([self.superview isKindOfClass:view.class]) {
            self.center = CGPointMake(view.center.x - view.x , view.center.y - view.y);
        }else{
            self.center = view.center;
        }
    };
}
/// 设置左对齐
-(jobsByViewBlock)leftEqualToView{
    @jobs_weakify(self);
    return ^(UIView *view){
        @jobs_strongify(self);
        //如果是子父关系
        if ([self.superview isKindOfClass:view.class]) {
            self.center = CGPointMake(view.center.x - view.x,self.center.y);
            self.x =  self.centerX - view.width/2;
        }else{
            self.x = view.x;
        }
    };
}
/// 设置右对齐
-(jobsByViewBlock)rightEqualToView{
    @jobs_weakify(self);
    return ^(UIView *view){
        @jobs_strongify(self);
        //如果是子父关系
        if ([self.superview isKindOfClass:view.class]) {
            self.center = CGPointMake(view.center.x - view.x,self.center.y);
            self.right =  self.centerX + view.width/2;
        }else{
            self.right = view.right;
        }
    };
}
/// 设置顶部对齐
-(jobsByViewBlock)topEqualToView{
    @jobs_weakify(self);
    return ^(UIView *view){
        @jobs_strongify(self);
        //如果是子父关系
        if ([self.superview isKindOfClass:view.class]) {
            self.center = CGPointMake(self.center.x,view.center.y - view.y);
            self.y =  self.centerY - view.height/2;
        }else{
            self.y = view.y;
        }
    };
}
/// 设置底部对齐
-(jobsByViewBlock)bottomEqualToView{
    @jobs_weakify(self);
    return ^(UIView *view){
        @jobs_strongify(self);
        //如果是子父关系
        if ([self.superview isKindOfClass:view.class]) {
            self.center = CGPointMake(self.center.x,view.center.y - view.y);
            self.height = self.centerY + view.height/2;
        }else{
            self.height = view.height;
        }
    };
}
#pragma mark —— UIScrollView.contentSize
-(jobsBySizeBlock _Nullable)resetContentSize{
    @jobs_weakify(self)
    return ^(CGSize data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentSize = data;
        }
    };
}

-(jobsByCGFloatBlock _Nullable)resetContentSizeWidth{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentSize = CGSizeMake(data,scrollView.contentSize.height);
        }
    };
}

-(jobsByCGFloatBlock _Nullable)resetContentSizeHeight{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentSize = CGSizeMake(scrollView.contentSize.width,data);
        }
    };
}

-(jobsByCGFloatBlock _Nullable)resetContentSizeOffsetWidth{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentSize = CGSizeMake(scrollView.contentSize.width + data,
                                                scrollView.contentSize.height);
        }
    };
}

-(jobsByCGFloatBlock _Nullable)resetContentSizeOffsetHeight{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentSize = CGSizeMake(scrollView.contentSize.width,
                                                scrollView.contentSize.height + data);
        }
    };
}
#pragma mark —— UIScrollView.contentOffset
-(jobsByPointBlock _Nullable)resetContentOffset{
    @jobs_weakify(self)
    return ^(CGPoint data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentOffset = data;
        }
    };
}

-(jobsByCGFloatBlock _Nullable)resetContentOffsetX{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentOffset = CGPointMake(data, scrollView.contentOffset.y);
        }
    };
}

-(jobsByCGFloatBlock _Nullable)resetContentOffsetY{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, data);
        }
    };
}

-(jobsByCGFloatBlock _Nullable)resetContentOffsetX_offset{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x + data,
                                                scrollView.contentOffset.y);
        }
    };
}

-(jobsByCGFloatBlock _Nullable)resetContentOffsetY_offset{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x,
                                                scrollView.contentOffset.y + data);
        }
    };
}
#pragma mark —— UIScrollView.contentInset
-(jobsByEdgeInsetBlock _Nullable)resetContentInset{
    @jobs_weakify(self)
    return ^(UIEdgeInsets data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentInset = data;
        }
    };
}

-(jobsByCGFloatBlock _Nullable)resetContentInsetTop{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentInset = UIEdgeInsetsMake(data,
                                                       scrollView.contentInset.left,
                                                       scrollView.contentInset.bottom,
                                                       scrollView.contentInset.right);
        }
    };
}

-(jobsByCGFloatBlock _Nullable)resetContentInsetLeft{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentInset = UIEdgeInsetsMake(scrollView.contentInset.top,
                                                       data,
                                                       scrollView.contentInset.bottom,
                                                       scrollView.contentInset.right);
        }
    };
}

-(jobsByCGFloatBlock _Nullable)resetContentInsetBottom{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentInset = UIEdgeInsetsMake(scrollView.contentInset.top,
                                                       scrollView.contentInset.left,
                                                       data,
                                                       scrollView.contentInset.right);
        }
    };
}

-(jobsByCGFloatBlock _Nullable)resetContentInsetRight{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentInset = UIEdgeInsetsMake(scrollView.contentInset.top,
                                                       scrollView.contentInset.left,
                                                       scrollView.contentInset.bottom,
                                                       data);
        }
    };
}

-(jobsByCGFloatBlock _Nullable)resetContentInsetOffsetTop{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentInset = UIEdgeInsetsMake(scrollView.contentInset.top + data,
                                                       scrollView.contentInset.left,
                                                       scrollView.contentInset.bottom,
                                                       scrollView.contentInset.right);
        }
    };
}

-(jobsByCGFloatBlock _Nullable)resetContentInsetOffsetLeft{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentInset = UIEdgeInsetsMake(scrollView.contentInset.top,
                                                       scrollView.contentInset.left + data,
                                                       scrollView.contentInset.bottom,
                                                       scrollView.contentInset.right);
        }
    };
}

-(jobsByCGFloatBlock _Nullable)resetContentInsetOffsetBottom{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentInset = UIEdgeInsetsMake(scrollView.contentInset.top,
                                                       scrollView.contentInset.left,
                                                       scrollView.contentInset.bottom + data,
                                                       scrollView.contentInset.right);
        }
    };
}

-(jobsByCGFloatBlock _Nullable)resetContentInsetOffsetRight{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentInset = UIEdgeInsetsMake(scrollView.contentInset.top,
                                                       scrollView.contentInset.left,
                                                       scrollView.contentInset.bottom,
                                                       scrollView.contentInset.right + data);
        }
    };
}
/// 依据偏移量重塑Frame
-(void)offsetForView:(UIViewModel *)viewModel{
    CGRect viewFrame = self.frame;
    viewFrame.origin.x += viewModel.offsetXForEach;
    viewFrame.origin.y += viewModel.offsetYForEach;
    viewFrame.size.width += viewModel.offsetWidth;
    viewFrame.size.height += viewModel.offsetHeight;
    self.frame = viewFrame;
}

- (CGFloat)maxX {
    return self.x + self.width;
}

- (CGFloat)maxY {
    return self.y + self.height;
}

- (void)setMaxXByShift:(CGFloat)maxX {
    self.x = maxX - self.width;
}

- (void)setMaxYByShift:(CGFloat)maxY {
    self.y = maxY - self.height;
}

- (void)setMaxXByStretch:(CGFloat)maxX {
    self.width = maxX - self.x;
}

- (void)setMaxYByStretch:(CGFloat)maxY {
    self.height = maxY - self.y;
}

- (CGPoint)boundCenter {
    return CGPointMake(self.bounds.size.width / 2,
                       self.bounds.size.height / 2);
}
/// 简捷获得控件坐标
#pragma mark —— @property(nonatomic,assign)CGFloat x
JobsKey(_x)
@dynamic x;
-(CGFloat)x{
    if (Jobs_getAssociatedObject(_x)) {
        return [Jobs_getAssociatedObject(_x) floatValue];
    }else{
        CGFloat X = self.frame.origin.x;
        Jobs_setAssociatedRETAIN_NONATOMIC(_x, @(X))
        return X;
    }
}

-(void)setX:(CGFloat)x{
    self.frame = self.resetOriginX(x);
    Jobs_setAssociatedRETAIN_NONATOMIC(_x, @(x))
}
#pragma mark —— @property(nonatomic,assign)CGFloat y
JobsKey(_y)
@dynamic y;
-(CGFloat)y{
    if (Jobs_getAssociatedObject(_y)) {
        return [Jobs_getAssociatedObject(_y) floatValue];
    }else{
        CGFloat Y = self.frame.origin.y;
        Jobs_setAssociatedRETAIN_NONATOMIC(_y, @(Y))
        return Y;
    }
}

-(void)setY:(CGFloat)y{
    self.frame = self.resetOriginY(y);
    Jobs_setAssociatedRETAIN_NONATOMIC(_y, @(y))
}
#pragma mark —— @property(nonatomic,assign)CGFloat width
JobsKey(_width)
@dynamic width;
-(CGFloat)width{
    if (Jobs_getAssociatedObject(_width)) {
        return [Jobs_getAssociatedObject(_width) floatValue];
    }else{
        CGFloat Width = self.frame.size.width;
        Jobs_setAssociatedRETAIN_NONATOMIC(_width, @(Width))
        return Width;
    }
}

-(void)setWidth:(CGFloat)width{
    self.frame = self.resetWidth(width);
    Jobs_setAssociatedRETAIN_NONATOMIC(_width, @(width))
}
#pragma mark —— @property(nonatomic,assign)CGFloat height
JobsKey(_height)
@dynamic height;
-(CGFloat)height{
    if (Jobs_getAssociatedObject(_height)) {
        return [Jobs_getAssociatedObject(_height) floatValue];
    }else{
        CGFloat Height = self.frame.size.height;
        Jobs_setAssociatedRETAIN_NONATOMIC(_height, @(Height))
        return Height;
    }
}

-(void)setHeight:(CGFloat)height{
    self.frame = self.resetHeight(height);
    Jobs_setAssociatedRETAIN_NONATOMIC(_height, @(height))
}
#pragma mark —— @property(nonatomic,assign)CGFloat centerX
JobsKey(_centerX)
@dynamic centerX;
-(CGFloat)centerX{
    if (Jobs_getAssociatedObject(_centerX)) {
        return [Jobs_getAssociatedObject(_centerX) floatValue];
    }else{
        CGFloat CenterX = self.center.x;
        Jobs_setAssociatedRETAIN_NONATOMIC(_centerX, @(CenterX))
        return CenterX;
    }
}

-(void)setCenterX:(CGFloat)centerX{
    self.frame = self.resetCenterX(centerX);
    Jobs_setAssociatedRETAIN_NONATOMIC(_centerX, @(centerX))
}
#pragma mark —— @property(nonatomic,assign)CGFloat centerY
JobsKey(_centerY)
@dynamic centerY;
-(CGFloat)centerY{
    if (Jobs_getAssociatedObject(_centerY)) {
        return [Jobs_getAssociatedObject(_centerY) floatValue];
    }else{
        CGFloat CenterY = self.center.y;
        Jobs_setAssociatedRETAIN_NONATOMIC(_centerY, @(CenterY))
        return CenterY;
    }
}

-(void)setCenterY:(CGFloat)centerY{
    self.frame = self.resetCenterY(centerY);
    Jobs_setAssociatedRETAIN_NONATOMIC(_centerY, @(centerY))
}
#pragma mark —— @property(nonatomic,assign)CGFloat left
JobsKey(_left)
@dynamic left;
-(CGFloat)left{
    if (Jobs_getAssociatedObject(_left)) {
        return [Jobs_getAssociatedObject(_left) floatValue];
    }else{
        CGFloat Left = self.frame.origin.x;
        Jobs_setAssociatedRETAIN_NONATOMIC(_left, @(Left))
        return Left;
    }
}

-(void)setLeft:(CGFloat)left{
    self.frame = self.resetOriginX(left);
    Jobs_setAssociatedRETAIN_NONATOMIC(_left, @(left))
}
#pragma mark —— @property(nonatomic,assign)CGFloat right
JobsKey(_right)
@dynamic right;
-(CGFloat)right{
    if (Jobs_getAssociatedObject(_right)) {
        return [Jobs_getAssociatedObject(_right) floatValue];
    }else{
        CGFloat Right = self.frame.origin.x + self.frame.size.width;
        Jobs_setAssociatedRETAIN_NONATOMIC(_right, @(Right))
        return Right;
    }
}

-(void)setRight:(CGFloat)right{
    self.frame = self.resetOriginX(right - self.width);
    Jobs_setAssociatedRETAIN_NONATOMIC(_right, @(right))
}
#pragma mark —— @property(nonatomic,assign)CGFloat top
JobsKey(_top)
@dynamic top;
-(CGFloat)top{
    if (Jobs_getAssociatedObject(_top)) {
        return [Jobs_getAssociatedObject(_top) floatValue];
    }else{
        CGFloat Top = CGRectGetMinY(self.frame);
        [self setTop:Top];
        Jobs_setAssociatedRETAIN_NONATOMIC(_top, @(Top))
        return Top;
    }
}

-(void)setTop:(CGFloat)top{
    self.frame = self.resetOriginY(top);
    Jobs_setAssociatedRETAIN_NONATOMIC(_top, @(top))
}
#pragma mark —— @property(nonatomic,assign)CGFloat bottom
JobsKey(_bottom)
@dynamic bottom;
-(CGFloat)bottom{
    if (Jobs_getAssociatedObject(_bottom)) {
        return [Jobs_getAssociatedObject(_bottom) floatValue];
    }else{
        CGFloat Bottom = self.frame.origin.y + self.frame.size.height;
        Jobs_setAssociatedRETAIN_NONATOMIC(_bottom, @(Bottom))
        return Bottom;
    }
}

-(void)setBottom:(CGFloat)bottom{
    self.frame = self.resetOriginY(bottom - self.height);
    Jobs_setAssociatedRETAIN_NONATOMIC(_bottom, @(bottom))
}
#pragma mark —— @property(nonatomic,assign)CGSize size
JobsKey(_size)
@dynamic size;
-(CGSize)size{
    if (Jobs_getAssociatedObject(_size)) {
        return [Jobs_getAssociatedObject(_size) CGSizeValue];
    }else{
        CGSize Size = self.frame.size;
        Jobs_setAssociatedRETAIN_NONATOMIC(_size, @(Size))
        return Size;
    }
}

-(void)setSize:(CGSize)size{
    self.frame = self.resetSize(size);
    Jobs_setAssociatedRETAIN_NONATOMIC(_size, @(size))
}
#pragma mark —— @property(nonatomic,assign)CGPoint origin
JobsKey(_origin)
@dynamic origin;
-(CGPoint)origin{
    if (Jobs_getAssociatedObject(_origin)) {
        return [Jobs_getAssociatedObject(_origin) CGPointValue];
    }else{
        CGPoint Point = self.frame.origin;
        Jobs_setAssociatedRETAIN_NONATOMIC(_origin, [NSValue valueWithCGPoint:Point])
        return Point;
    }
}

-(void)setOrigin:(CGPoint)origin{
    self.frame = self.resetOrigin(origin);
    Jobs_setAssociatedRETAIN_NONATOMIC(_origin, [NSValue valueWithCGPoint:origin])
}

@end
