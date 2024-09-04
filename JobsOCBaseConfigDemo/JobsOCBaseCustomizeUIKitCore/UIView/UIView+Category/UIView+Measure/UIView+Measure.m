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
#pragma mark —— 刷新UI
-(jobsByVoidBlock _Nonnull)jobsRefreshUI{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self setNeedsLayout];
        [self layoutIfNeeded];
    };
}
#pragma mark —— 交换宽高
-(JobsReturnCGRectByVoidBlock _Nonnull)exchangeWidthAndHeight{
    return ^CGRect(){
        return CGRectMake(self.x,
                          self.y,
                          self.height,
                          self.width);
    };
}
#pragma mark —— 交换 X 和 Y
-(JobsReturnCGRectByVoidBlock _Nonnull)exchangeXAndY{
    return ^CGRect(){
        return CGRectMake(self.y,
                          self.x,
                          self.width,
                          self.height);
    };
}
#pragma mark —— UIView
-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetOriginX{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x = data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatAndUIViewBlock _Nonnull)resetRightX{
    @jobs_weakify(self)
    return ^(CGFloat data,UIView *superView) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x = superView.width - data - self.width;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetOriginY{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.y = data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatAndUIViewBlock _Nonnull)resetBottomY{
    @jobs_weakify(self)
    return ^(CGFloat data,UIView *superView) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x = superView.height - data - self.height;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetWidth{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.width = data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetHeight{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.height = data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGPointBlock _Nonnull)resetOrigin{
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

-(JobsReturnCGRectByCGSizeBlock _Nonnull)resetSize{
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
-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetByOffsetOriginX{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x += data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetByOffsetOriginY{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.y += data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetCenterX{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGPoint center = self.center;
        center.x = data;
        self.center = center;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetCenterY{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGPoint center = self.center;
        center.y = data;
        self.center = center;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetByOffsetWidth{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.width += data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetByOffsetHeight{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.height += data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsReturnCGRectByCGPointBlock _Nonnull)resetByOffsetOrigin{
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

-(JobsReturnCGRectByCGSizeBlock _Nonnull)resetByOffsetSize{
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
-(jobsByViewBlock _Nonnull)centerxEqualToView{
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
-(jobsByViewBlock _Nonnull)centeryEqualToView{
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
-(jobsByViewBlock _Nonnull)centerEqualToView{
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
-(jobsByViewBlock _Nonnull)leftEqualToView{
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
-(jobsByViewBlock _Nonnull)rightEqualToView{
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
-(jobsByViewBlock _Nonnull)topEqualToView{
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
-(jobsByViewBlock _Nonnull)bottomEqualToView{
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
-(jobsBySizeBlock _Nonnull)resetContentSize{
    @jobs_weakify(self)
    return ^(CGSize data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentSize = data;
        }
    };
}

-(jobsByCGFloatBlock _Nonnull)resetContentSizeWidth{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentSize = CGSizeMake(data,scrollView.contentSize.height);
        }
    };
}

-(jobsByCGFloatBlock _Nonnull)resetContentSizeHeight{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentSize = CGSizeMake(scrollView.contentSize.width,data);
        }
    };
}

-(jobsByCGFloatBlock _Nonnull)resetContentSizeOffsetWidth{
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

-(jobsByCGFloatBlock _Nonnull)resetContentSizeOffsetHeight{
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
-(jobsByPointBlock _Nonnull)resetContentOffset{
    @jobs_weakify(self)
    return ^(CGPoint data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentOffset = data;
        }
    };
}

-(jobsByCGFloatBlock _Nonnull)resetContentOffsetX{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentOffset = CGPointMake(data, scrollView.contentOffset.y);
        }
    };
}

-(jobsByCGFloatBlock _Nonnull)resetContentOffsetY{
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, data);
        }
    };
}

-(jobsByCGFloatBlock _Nonnull)resetContentOffsetX_offset{
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

-(jobsByCGFloatBlock _Nonnull)resetContentOffsetY_offset{
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
-(jobsByEdgeInsetBlock _Nonnull)resetContentInset{
    @jobs_weakify(self)
    return ^(UIEdgeInsets data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentInset = data;
        }
    };
}

-(jobsByCGFloatBlock _Nonnull)resetContentInsetTop{
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

-(jobsByCGFloatBlock _Nonnull)resetContentInsetLeft{
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

-(jobsByCGFloatBlock _Nonnull)resetContentInsetBottom{
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

-(jobsByCGFloatBlock _Nonnull)resetContentInsetRight{
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

-(jobsByCGFloatBlock _Nonnull)resetContentInsetOffsetTop{
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

-(jobsByCGFloatBlock _Nonnull)resetContentInsetOffsetLeft{
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

-(jobsByCGFloatBlock _Nonnull)resetContentInsetOffsetBottom{
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

-(jobsByCGFloatBlock _Nonnull)resetContentInsetOffsetRight{
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
-(jobsByViewModelBlock)offsetForView{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nonnull viewModel) {
        @jobs_strongify(self)
        if(viewModel.offsetXForEach){
            self.resetByOffsetOriginX(viewModel.offsetXForEach);
        }
        if(viewModel.offsetYForEach){
            self.resetByOffsetOriginY(viewModel.offsetYForEach);
        }
        if(viewModel.offsetWidth){
            self.resetByOffsetWidth(viewModel.offsetWidth);
        }
        if(viewModel.offsetHeight){
            self.resetByOffsetHeight(viewModel.offsetHeight);
        }
    };
}

-(CGFloat)maxX{
    return self.x + self.width;
}

-(CGFloat)maxY{
    return self.y + self.height;
}

-(void)setMaxXByShift:(CGFloat)maxX{
    self.x = maxX - self.width;
}

-(void)setMaxYByShift:(CGFloat)maxY{
    self.y = maxY - self.height;
}

-(void)setMaxXByStretch:(CGFloat)maxX{
    self.width = maxX - self.x;
}

-(void)setMaxYByStretch:(CGFloat)maxY{
    self.height = maxY - self.y;
}

-(CGPoint)boundCenter{
    return CGPointMake(self.bounds.size.width / 2,
                       self.bounds.size.height / 2);
}
/// 简捷获得控件坐标
#pragma mark —— @property(nonatomic,assign)CGFloat x
-(CGFloat)x{
    return self.frame.origin.x;
}

-(void)setX:(CGFloat)x{
    self.frame = self.resetOriginX(x);
}
#pragma mark —— @property(nonatomic,assign)CGFloat y
-(CGFloat)y{
    return self.frame.origin.y;
}

-(void)setY:(CGFloat)y{
    self.frame = self.resetOriginY(y);
}
#pragma mark —— @property(nonatomic,assign)CGFloat width
-(CGFloat)width{
    return self.frame.size.width;
}

-(void)setWidth:(CGFloat)width{
    self.frame = self.resetWidth(width);
}
#pragma mark —— @property(nonatomic,assign)CGFloat height
-(CGFloat)height{
    return self.frame.size.height;
}

-(void)setHeight:(CGFloat)height{
    self.frame = self.resetHeight(height);
}
#pragma mark —— @property(nonatomic,assign)CGFloat centerX
-(CGFloat)centerX{
    return self.center.x;
}

-(void)setCenterX:(CGFloat)centerX{
    self.frame = self.resetCenterX(centerX);
}
#pragma mark —— @property(nonatomic,assign)CGFloat centerY
-(CGFloat)centerY{
    return self.center.y;
}

-(void)setCenterY:(CGFloat)centerY{
    self.frame = self.resetCenterY(centerY);
}
#pragma mark —— @property(nonatomic,assign)CGFloat left
-(CGFloat)left{
    return self.frame.origin.x;
}

-(void)setLeft:(CGFloat)left{
    self.frame = self.resetOriginX(left);
}
#pragma mark —— @property(nonatomic,assign)CGFloat right
-(CGFloat)right{
    return self.frame.origin.x + self.frame.size.width;
}

-(void)setRight:(CGFloat)right{
    self.frame = self.resetOriginX(right - self.width);
}
#pragma mark —— @property(nonatomic,assign)CGFloat top
-(CGFloat)top{
    return CGRectGetMinY(self.frame);
}

-(void)setTop:(CGFloat)top{
    self.frame = self.resetOriginY(top);
}
#pragma mark —— @property(nonatomic,assign)CGFloat bottom
-(CGFloat)bottom{
    return self.frame.origin.y + self.frame.size.height;
}

-(void)setBottom:(CGFloat)bottom{
    self.frame = self.resetOriginY(bottom - self.height);
}
#pragma mark —— @property(nonatomic,assign)CGSize size
-(CGSize)size{
    return self.frame.size;
}

-(void)setSize:(CGSize)size{
    self.frame = self.resetSize(size);
}
#pragma mark —— @property(nonatomic,assign)CGPoint origin
-(CGPoint)origin{
    return self.frame.origin;
}

-(void)setOrigin:(CGPoint)origin{
    self.frame = self.resetOrigin(origin);
}

@end
