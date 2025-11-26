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
#pragma mark —— 初始化方法封装
+(JobsRetViewByClassBlock _Nonnull)build{
    return ^__kindof UIView *_Nullable(Class _Nonnull cls){
        UIView <BaseViewProtocol>*instance = cls.new;
        return instance;
    };
}
#pragma mark —— 控件居中的时候，相对于全屏的X和Y值
/// 当控件相对于view居中的时候，控件的X值
-(JobsRetCGFloatByViewBlock _Nonnull)xWhenViewInViewCenter{
    @jobs_weakify(self)
    return ^CGFloat(UIView *_Nullable view){
        @jobs_strongify(self)
        return (view.width - self.width) / 2;
    };
}
/// 当控件相对于view居中的时候，控件的Y值
-(JobsRetCGFloatByViewBlock _Nonnull)yWhenViewInViewCenter{
    @jobs_weakify(self)
    return ^CGFloat(UIView *_Nullable view){
        @jobs_strongify(self)
        return (view.height - self.height) / 2;
    };
}
/// 当控件相对于一个特定的值居中的时候，控件的X值
-(JobsRetCGFloatByCGFloatBlock _Nonnull)xWhenViewInViewCenterBy{
    @jobs_weakify(self)
    return ^CGFloat(CGFloat data){
        @jobs_strongify(self)
        return (data - self.width) / 2;
    };
}
/// 当控件相对于一个特定的值居中的时候，控件的Y值
-(JobsRetCGFloatByCGFloatBlock _Nonnull)yWhenViewInViewCenterBy{
    @jobs_weakify(self)
    return ^CGFloat(CGFloat data){
        @jobs_strongify(self)
        return (data - self.height) / 2;
    };
}
/// 当控件相对于整个设备屏幕居中的时候，控件的X值
-(JobsRetCGFloatByVoidBlock _Nonnull)xWhenViewInScreenCenter{
    @jobs_weakify(self)
    return ^CGFloat(){
        @jobs_strongify(self)
        return self.xWhenViewInViewCenterBy(JobsMainScreen_WIDTH());
    };
}
/// 当控件相对于整个设备屏幕居中的时候，控件的Y值
-(JobsRetCGFloatByVoidBlock _Nonnull)yWhenViewInScreenCenter{
    @jobs_weakify(self)
    return ^CGFloat(){
        @jobs_strongify(self)
        return self.yWhenViewInViewCenterBy(JobsMainScreen_WIDTH());
    };
}
#pragma mark —— 刷新UI
-(JobsRetViewByVoidBlock _Nonnull)jobsRefreshUI{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self setNeedsLayout];
        [self layoutIfNeeded];
        return self;
    };
}
#pragma mark —— 交换宽高
/// 仅在横屏情况下交换Size宽高的值
-(JobsRetFrameByVoidBlock _Nonnull)fitSize{
    @jobs_weakify(self)
    return ^CGRect(){
        @jobs_strongify(self)
        if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
            return self.exchangeWidthAndHeight();
        }else return self.frame;
    };
}

-(JobsRetFrameByVoidBlock _Nonnull)exchangeWidthAndHeight{
    @jobs_weakify(self)
    return ^CGRect(){
        @jobs_strongify(self)
        return CGRectMake(self.x,
                          self.y,
                          self.height,
                          self.width);
    };
}
#pragma mark —— 交换 X 和 Y
/// 仅在横屏情况下交换坐标XY的值
-(JobsRetFrameByVoidBlock _Nonnull)fitOrigin{
    @jobs_weakify(self)
    return ^CGRect(){
        @jobs_strongify(self)
        if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
            return self.exchangeXAndY();
        }else return self.frame;
    };
}

-(JobsRetFrameByVoidBlock _Nonnull)exchangeXAndY{
    @jobs_weakify(self)
    return ^CGRect(){
        @jobs_strongify(self)
        return CGRectMake(self.y,
                          self.x,
                          self.width,
                          self.height);
    };
}
#pragma mark ——【类方法】设置控件的约束（返回控件自己本身）
+(JobsRetViewByCGSizeBlock _Nonnull)BySize{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGSize data){
        @jobs_strongify(self)
        UIView <BaseViewProtocol>*instance = UIView.build(self.class);
        if ([instance respondsToSelector:@selector(bySize)]) {
            instance.bySize(data); // 确保视图有 bySize: 方法
        }return instance;
    };
}
/// 设置控件的 Frame
+(JobsRetViewByFrameBlock _Nonnull)ByFrame{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGRect data){
        @jobs_strongify(self)
        UIView <BaseViewProtocol>*instance = UIView.build(self.class);
        if ([instance respondsToSelector:@selector(byFrame)]) {
            instance.byFrame(data); // 确保视图有 bySize: 方法
        }return instance;
    };
}
/// 设置控件的 Origin
+(JobsRetViewByCGPointBlock _Nonnull)ByOrigin{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGPoint data){
        @jobs_strongify(self)
        UIView <BaseViewProtocol>*instance = UIView.build(self.class);
        if ([instance respondsToSelector:@selector(byOrigin)]) {
            instance.byOrigin(data); // 确保视图有 bySize: 方法
        }return instance;
    };
}
/// 设置控件的 Width
+(JobsRetViewByFloatBlock _Nonnull)ByWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float data){
        @jobs_strongify(self)
        UIView <BaseViewProtocol>*instance = UIView.build(self.class);
        if ([instance respondsToSelector:@selector(byWidth)]) {
            instance.byWidth(data); // 确保视图有 bySize: 方法
        }return instance;
    };
}
/// 设置控件的 Height
+(JobsRetViewByFloatBlock _Nonnull)ByHeight{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float data){
        @jobs_strongify(self)
        UIView <BaseViewProtocol>*instance = UIView.build(self.class);
        if ([instance respondsToSelector:@selector(byHeight)]) {
            instance.byHeight(data); // 确保视图有 bySize: 方法
        }return instance;
    };
}
/// 设置控件的 Center
+(JobsRetViewByCenterBlock _Nonnull)ByCenter{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat x,CGFloat y){
        @jobs_strongify(self)
        UIView <BaseViewProtocol>*instance = UIView.build(self.class);
        if ([instance respondsToSelector:@selector(byCenter)]) {
            instance.byCenter(x,y); // 确保视图有 bySize: 方法
        }return instance;
    };
}
#pragma mark ——【实例方法】设置控件的约束（返回控件自己本身）
/// 设置控件的 Size
-(JobsRetViewByCGSizeBlock _Nonnull)bySize{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGSize data){
        @jobs_strongify(self)
        self.sizer = data;
        return self;
    };
}
/// 设置控件的 Frame
-(JobsRetViewByFrameBlock _Nonnull)byFrame{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.frame = data;
        return self;
    };
}
/// 设置控件的 Origin
-(JobsRetViewByCGPointBlock _Nonnull)byOrigin{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGPoint data){
        @jobs_strongify(self)
        self.resetOrigin(data);
        return self;
    };
}
/// 设置控件的 Width
-(JobsRetViewByFloatBlock _Nonnull)byWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float data){
        @jobs_strongify(self)
        self.resetWidth(data);
        return self;
    };
}
/// 设置控件的 Height
-(JobsRetViewByFloatBlock _Nonnull)byHeight{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float data){
        @jobs_strongify(self)
        self.resetHeight(data);
        return self;
    };
}
/// 设置控件的 Center
-(JobsRetViewByCenterBlock _Nonnull)byCenter{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat x,CGFloat y){
        @jobs_strongify(self)
        CGPoint center = self.center;
        center.x = x;
        center.x = y;
        self.center = center;
        return self;
    };
}
#pragma mark —— 重新设置控件的约束（返回控件的Frame）
-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginX{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x = data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatAndUIViewBlock _Nonnull)resetRightX{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data,UIView *superView) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x = superView.width - data - self.width;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginY{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.y = data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatAndUIViewBlock _Nonnull)resetBottomY{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data,UIView *superView) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x = superView.height - data - self.height;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetWidth{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.width = data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetHeight{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.height = data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsRetFrameByCGPointBlock _Nonnull)resetOrigin{
    @jobs_weakify(self)
    return ^CGRect(CGPoint data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x = data.x;
        frame.origin.y = data.y;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsRetFrameByCGSizeBlock _Nonnull)resetSize{
    @jobs_weakify(self)
    return ^CGRect(CGSize data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size = data;
        self.frame = frame;
        return self.frame;
    };
}
/// 依据偏移量重设Frame
-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginXByOffset{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x += data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginYByOffset{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.y += data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetCenterX{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGPoint center = self.center;
        center.x = data;
        self.center = center;
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetCenterY{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGPoint center = self.center;
        center.y = data;
        self.center = center;
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetWidthByOffset{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.width += data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetHeightByOffset{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.height += data;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsRetFrameByCGPointBlock _Nonnull)resetOriginByOffset{
    @jobs_weakify(self)
    return ^CGRect(CGPoint data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x += data.x;
        frame.origin.y += data.y;
        self.frame = frame;
        return self.frame;
    };
}

-(JobsRetFrameByCGSizeBlock _Nonnull)resetSizeByOffset{
    @jobs_weakify(self)
    return ^CGRect(CGSize data) {
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.width += data.width;
        frame.size.height += data.height;
        self.frame = frame;
        return self.frame;
    };
}
/// 设置水平方向对齐
-(JobsRetViewByViewBlock _Nonnull)centerxEqualToView{
    @jobs_weakify(self);
    return ^__kindof UIView *_Nullable(UIView *view){
        @jobs_strongify(self);
        /// 如果是子父关系
        if ([self.superview isKindOfClass:view.class]) {
            self.center = CGPointMake(view.center.x - view.x, self.center.y);
        }else{
            self.center = CGPointMake(view.center.x, self.center.y);
        }return self;
    };
}
/// 设置垂平方向对齐
-(JobsRetViewByViewBlock _Nonnull)centeryEqualToView{
    @jobs_weakify(self);
    return ^__kindof UIView *_Nullable(UIView *view){
        @jobs_strongify(self);
        /// 如果是子父关系
         if ([self.superview isKindOfClass:view.class]) {
             self.center = CGPointMake(self.center.x, view.center.y - view.y);
         }else{
             self.center = CGPointMake(self.center.x, view.center.y);
         }return self;
    };
}
/// 设置中心方向对齐
-(JobsRetViewByViewBlock _Nonnull)centerEqualToView{
    @jobs_weakify(self);
    return ^__kindof UIView *_Nullable(UIView *view){
        @jobs_strongify(self);
        /// 如果是子父关系
        if ([self.superview isKindOfClass:view.class]) {
            self.center = CGPointMake(view.center.x - view.x , view.center.y - view.y);
        }else{
            self.center = view.center;
        }return self;
    };
}
/// 设置左对齐
-(JobsRetViewByViewBlock _Nonnull)leftEqualToView{
    @jobs_weakify(self);
    return ^__kindof UIView *_Nullable(UIView *view){
        @jobs_strongify(self);
        //如果是子父关系
        if ([self.superview isKindOfClass:view.class]) {
            self.center = CGPointMake(view.center.x - view.x,self.center.y);
            self.x =  self.centerX - view.width/2;
        }else{
            self.x = view.x;
        }return self;
    };
}
/// 设置右对齐
-(JobsRetViewByViewBlock _Nonnull)rightEqualToView{
    @jobs_weakify(self);
    return ^__kindof UIView *_Nullable(UIView *view){
        @jobs_strongify(self);
        //如果是子父关系
        if ([self.superview isKindOfClass:view.class]) {
            self.center = CGPointMake(view.center.x - view.x,self.center.y);
            self.right =  self.centerX + view.width/2;
        }else{
            self.right = view.right;
        }return self;
    };
}
/// 设置顶部对齐
-(JobsRetViewByViewBlock _Nonnull)topEqualToView{
    @jobs_weakify(self);
    return ^__kindof UIView *_Nullable(UIView *view){
        @jobs_strongify(self);
        //如果是子父关系
        if ([self.superview isKindOfClass:view.class]) {
            self.center = CGPointMake(self.center.x,view.center.y - view.y);
            self.y =  self.centerY - view.height/2;
        }else{
            self.y = view.y;
        }return self;
    };
}
/// 设置底部对齐
-(JobsRetViewByViewBlock _Nonnull)bottomEqualToView{
    @jobs_weakify(self);
    return ^__kindof UIView *_Nullable(UIView *view){
        @jobs_strongify(self);
        //如果是子父关系
        if ([self.superview isKindOfClass:view.class]) {
            self.center = CGPointMake(self.center.x,view.center.y - view.y);
            self.height = self.centerY + view.height/2;
        }else{
            self.height = view.height;
        }return self;
    };
}
#pragma mark —— UIScrollView.contentSize
-(JobsRetViewByCGSizeBlock _Nonnull)resetContentSize{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGSize data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentSize = data;
        }return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)resetContentSizeWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentSize = CGSizeMake(data,scrollView.contentSize.height);
        }return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)resetContentSizeHeight{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentSize = CGSizeMake(scrollView.contentSize.width,data);
        }return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)resetContentSizeOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentSize = CGSizeMake(scrollView.contentSize.width + data,
                                                scrollView.contentSize.height);
        }return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)resetContentSizeOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentSize = CGSizeMake(scrollView.contentSize.width,
                                                scrollView.contentSize.height + data);
        }return self;
    };
}
#pragma mark —— UIScrollView.contentOffset
-(JobsRetViewByCGPointBlock _Nonnull)resetContentOffset{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGPoint data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentOffset = data;
        }return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)resetContentOffsetX{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentOffset = CGPointMake(data, scrollView.contentOffset.y);
        }return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)resetContentOffsetY{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, data);
        }return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)resetContentOffsetX_offset{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x + data,
                                                scrollView.contentOffset.y);
        }return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)resetContentOffsetY_offset{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x,
                                                scrollView.contentOffset.y + data);
        }return self;
    };
}
#pragma mark —— UIScrollView.contentInset
-(JobsRetViewByUIEdgeInsetBlock _Nonnull)resetContentInset{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIEdgeInsets data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentInset = data;
        }return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)resetContentInsetTop{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentInset = UIEdgeInsetsMake(data,
                                                       scrollView.contentInset.left,
                                                       scrollView.contentInset.bottom,
                                                       scrollView.contentInset.right);
        }return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)resetContentInsetLeft{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentInset = UIEdgeInsetsMake(scrollView.contentInset.top,
                                                       data,
                                                       scrollView.contentInset.bottom,
                                                       scrollView.contentInset.right);
        }return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)resetContentInsetBottom{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentInset = UIEdgeInsetsMake(scrollView.contentInset.top,
                                                       scrollView.contentInset.left,
                                                       data,
                                                       scrollView.contentInset.right);
        }return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)resetContentInsetRight{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentInset = UIEdgeInsetsMake(scrollView.contentInset.top,
                                                       scrollView.contentInset.left,
                                                       scrollView.contentInset.bottom,
                                                       data);
        }return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)resetContentInsetOffsetTop{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentInset = UIEdgeInsetsMake(scrollView.contentInset.top + data,
                                                       scrollView.contentInset.left,
                                                       scrollView.contentInset.bottom,
                                                       scrollView.contentInset.right);
        }return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)resetContentInsetOffsetLeft{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentInset = UIEdgeInsetsMake(scrollView.contentInset.top,
                                                       scrollView.contentInset.left + data,
                                                       scrollView.contentInset.bottom,
                                                       scrollView.contentInset.right);
        }return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)resetContentInsetOffsetBottom{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentInset = UIEdgeInsetsMake(scrollView.contentInset.top,
                                                       scrollView.contentInset.left,
                                                       scrollView.contentInset.bottom + data,
                                                       scrollView.contentInset.right);
        }return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)resetContentInsetOffsetRight{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        if([self isKindOfClass:UIScrollView.class]){
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.contentInset = UIEdgeInsetsMake(scrollView.contentInset.top,
                                                       scrollView.contentInset.left,
                                                       scrollView.contentInset.bottom,
                                                       scrollView.contentInset.right + data);
        }return self;
    };
}
/// 依据偏移量重塑Frame
-(JobsRetViewByViewModelBlock _Nonnull)offsetForView{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIViewModel *_Nonnull viewModel) {
        @jobs_strongify(self)
        if(viewModel.offsetXForEach) self.resetOriginXByOffset(viewModel.offsetXForEach);
        if(viewModel.offsetYForEach) self.resetOriginYByOffset(viewModel.offsetYForEach);
        if(viewModel.offsetWidth) self.resetWidthByOffset(viewModel.offsetWidth);
        if(viewModel.offsetHeight) self.resetHeightByOffset(viewModel.offsetHeight);
        return self;
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
#pragma mark —— Prop_assign()CGFloat x
JobsKey(_x)
@dynamic x;
- (CGFloat)x{
    return [Jobs_getAssociatedObject(_x) floatValue] ? : self.frame.origin.x;
}

- (void)setX:(CGFloat)x{
    CGFloat X = x ? : self.frame.origin.x;
    self.frame = self.resetOriginX(X);
    Jobs_setAssociatedRETAIN_NONATOMIC(_x, @(X));
}
#pragma mark —— Prop_assign()CGFloat y
JobsKey(_y)
@dynamic y;
- (CGFloat)y{
    return [Jobs_getAssociatedObject(_y) floatValue] ? : self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    CGFloat Y = y ? : self.frame.origin.y;
    self.frame = self.resetOriginY(Y);
    Jobs_setAssociatedRETAIN_NONATOMIC(_y, @(Y));
}
#pragma mark —— Prop_assign()CGFloat width
JobsKey(_width)
@dynamic width;
- (CGFloat)width {
    return [Jobs_getAssociatedObject(_width) floatValue] ? : self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGFloat Width = width ? : self.frame.size.width;
    self.frame = self.resetWidth(Width);
    Jobs_setAssociatedRETAIN_NONATOMIC(_width, @(Width));
}
#pragma mark —— Prop_assign()CGFloat height
JobsKey(_height)
@dynamic height;
- (CGFloat)height {
    return [Jobs_getAssociatedObject(_height) floatValue] ? : self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGFloat Height = height ? : self.frame.size.height;
    self.frame = self.resetHeight(Height);
    Jobs_setAssociatedRETAIN_NONATOMIC(_height, @(Height));
}
#pragma mark —— Prop_assign()CGFloat centerX
JobsKey(_centerX)
@dynamic centerX;
- (CGFloat)centerX {
    return [Jobs_getAssociatedObject(_centerX) floatValue] ? : self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    CGFloat CenterX = centerX ? : self.center.x;
    self.frame = self.resetCenterX(CenterX);
    Jobs_setAssociatedRETAIN_NONATOMIC(_centerX, @(CenterX));
}
#pragma mark —— Prop_assign()CGFloat centerY
JobsKey(_centerY)
@dynamic centerY;
- (CGFloat)centerY {
    return [Jobs_getAssociatedObject(_centerY) floatValue] ? : self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    CGFloat CenterY = centerY ? : self.center.y;
    self.frame = self.resetCenterY(centerY);
    Jobs_setAssociatedRETAIN_NONATOMIC(_centerY, @(CenterY));
}
#pragma mark —— Prop_assign()CGFloat left
JobsKey(_left)
@dynamic left;
- (CGFloat)left {
    return [Jobs_getAssociatedObject(_left) floatValue] ? : self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left{
    CGFloat Left = left ? : self.frame.origin.x;
    self.frame = self.resetOriginX(Left);
    Jobs_setAssociatedRETAIN_NONATOMIC(_left, @(Left));
}
#pragma mark —— Prop_assign()CGFloat right
JobsKey(_right)
@dynamic right;
- (CGFloat)right {
    return [Jobs_getAssociatedObject(_right) floatValue] ? : self.frame.origin.x + self.width;
}

- (void)setRight:(CGFloat)right{
    CGFloat Right = right ? : (self.frame.origin.x + self.width);
    self.frame = self.resetOriginX(Right - self.width);
    Jobs_setAssociatedRETAIN_NONATOMIC(_right, @(Right));
}
#pragma mark —— Prop_assign()CGFloat top
JobsKey(_top)
@dynamic top;
-(CGFloat)top{
    return [Jobs_getAssociatedObject(_top) floatValue] ? : CGRectGetMinY(self.frame);
}

-(void)setTop:(CGFloat)top{
    CGFloat Top = top ? : CGRectGetMinY(self.frame);
    self.frame = self.resetOriginY(Top);
    Jobs_setAssociatedRETAIN_NONATOMIC(_top, @(Top))
}
#pragma mark —— Prop_assign()CGFloat bottom
JobsKey(_bottom)
@dynamic bottom;
-(CGFloat)bottom{
    return [Jobs_getAssociatedObject(_bottom) floatValue] ? : (self.frame.origin.y + self.height);
}

-(void)setBottom:(CGFloat)bottom{
    CGFloat Bottom = bottom ? : self.frame.origin.y + self.height;
    self.frame = self.resetOriginY(bottom - self.height);
    Jobs_setAssociatedRETAIN_NONATOMIC(_bottom, @(Bottom))
}
#pragma mark —— Prop_assign()CGSize sizer
JobsKey(_sizer)
@dynamic sizer;
-(CGSize)sizer{
    NSValue *sizeValue = Jobs_getAssociatedObject(_sizer);
    return sizeValue ? sizeValue.CGSizeValue : CGSizeZero;
}

-(void)setSizer:(CGSize)sizer{
    CGSize size = self.isSizeZero(sizer) ? CGSizeMake(self.width, self.height) : sizer;
    NSValue *sizeValue = NSValue.bySize(size);
    self.frame = self.resetSize(size);
    Jobs_setAssociatedRETAIN_NONATOMIC(_sizer, sizeValue);
}
#pragma mark —— Prop_assign()CGPoint Origin
JobsKey(_Origin)
@dynamic Origin;
-(CGPoint)Origin{
    NSValue *pointValue = Jobs_getAssociatedObject(_Origin);
    return pointValue ? pointValue.CGPointValue : CGPointZero;
}

-(void)setOrigin:(CGPoint)Origin{
    CGPoint point = self.isPointZero(Origin) ? self.frame.origin : Origin;
    NSValue *pointValue = NSValue.byPoint(point);
    self.frame = self.resetOrigin(Origin);
    Jobs_setAssociatedRETAIN_NONATOMIC(_Origin, pointValue);
}

@end
