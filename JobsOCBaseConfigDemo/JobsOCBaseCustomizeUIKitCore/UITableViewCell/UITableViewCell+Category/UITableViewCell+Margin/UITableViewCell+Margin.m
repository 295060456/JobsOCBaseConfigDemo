//
//  UITableViewCell+Margin.m
//  JobsIM
//
//  Created by Jobs on 2020/11/13.
//

#import "UITableViewCell+Margin.h"

@implementation UITableViewCell (Margin)
UILocationProtocol_dynamic
// 在具体的子类去实现,分类调用异常
//-(void)setFrame:(CGRect)frame{
//    JobsLog(@"self.offsetXForEach = %f",self.offsetXForEach);
//    JobsLog(@"self.offsetYForEach = %f",self.offsetYForEach);
//    frame.origin.x += self.offsetXForEach;
//    frame.origin.y += self.offsetYForEach;
//    frame.size.height -= self.offsetYForEach * 2;
//    frame.size.width -= self.offsetXForEach * 2;
//    [super setFrame:frame];
//}
/// 值打印
-(jobsByVoidBlock _Nonnull)printValue{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        JobsLog(@"self.textLabelFrame = %@",NSStringFromCGRect(self.textLabelFrame));
        JobsLog(@"self.detailTextLabelFrame = %@",NSStringFromCGRect(self.detailTextLabelFrame));
        JobsLog(@"self.imageViewFrame = %@",NSStringFromCGRect(self.imageViewFrame));
        
        JobsLog(@"self.textLabelSize = %@",NSStringFromCGSize(self.textLabelSize));
        JobsLog(@"self.detailTextLabelSize = %@",NSStringFromCGSize(self.detailTextLabelSize));
        JobsLog(@"self.imageViewSize = %@",NSStringFromCGSize(self.imageViewSize));
        
        JobsLog(@"self.textLabelWidth = %f",self.textLabelWidth);
        JobsLog(@"self.textLabelHeight = %f",self.textLabelHeight);
        JobsLog(@"self.detailTextLabelWidth = %f",self.detailTextLabelWidth);
        JobsLog(@"elf.detailTextLabelHeight = %f",self.detailTextLabelHeight);
        JobsLog(@"self.imageViewWidth = %f",self.imageViewWidth);
        JobsLog(@"self.imageViewHeight = %f",self.imageViewHeight);
        
        JobsLog(@"self.textLabelFrameOffsetX = %f",self.textLabelFrameOffsetX);
        JobsLog(@"self.textLabelFrameOffsetY = %f",self.textLabelFrameOffsetY);
        JobsLog(@"self.textLabelFrameOffsetWidth = %f",self.textLabelFrameOffsetWidth);
        JobsLog(@"self.textLabelFrameOffsetHeight = %f",self.textLabelFrameOffsetHeight);
        
        JobsLog(@"self.detailTextLabelOffsetX = %f",self.detailTextLabelOffsetX);
        JobsLog(@"self.detailTextLabelOffsetY = %f",self.detailTextLabelOffsetY);
        JobsLog(@"self.detailTextLabelOffsetWidth = %f",self.detailTextLabelOffsetWidth);
        JobsLog(@"self.detailTextLabelOffsetHeight = %f",self.detailTextLabelOffsetHeight);
        
        JobsLog(@"self.imageViewFrameOffsetX = %f",self.imageViewFrameOffsetX);
        JobsLog(@"self.imageViewFrameOffsetY = %f",self.imageViewFrameOffsetY);
        JobsLog(@"self.imageViewFrameOffsetWidth = %f",self.imageViewFrameOffsetWidth);
        JobsLog(@"self.imageViewFrameOffsetHeight = %f",self.imageViewFrameOffsetHeight);
    };
}
/// 修改 UITableViewCell 中默认子控件的frame 【方法一】
-(jobsByVoidBlock _Nonnull)modifySysChildViewFrame1{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.contentView.frame = self.bounds;
        
        {///【组 1】 UITableViewCell单独自定义设置系统自带控件的Frame 【形成Frame后直接return，避免被其他中间过程修改】❤️与组2、3属性互斥❤️
            if (!jobsZeroRectValue(self.textLabelFrame)) self.textLabel.frame = self.textLabelFrame;
            
            if (!jobsZeroRectValue(self.detailTextLabelFrame) && self.detailTextLabel) {
                self.detailTextLabel.frame = self.detailTextLabelFrame;
            }

            if (!jobsZeroRectValue(self.imageViewFrame)) self.imageView.frame = self.imageViewFrame;
        }
        
        {///【组 2】UITableViewCell单独自定义设置系统自带控件的Size【形成Frame后直接return，避免被其他中间过程修改】❤️与组1、3属性互斥❤️
            {
                if (!jobsZeroSizeValue(self.textLabelSize)) self.textLabel.resetSize(self.textLabelSize);
                if (self.textLabelFrameOffsetX) self.textLabel.resetOriginXByOffset(self.textLabelFrameOffsetX);
                if (self.textLabelFrameOffsetY) self.textLabel.resetOriginYByOffset(self.textLabelFrameOffsetY);
            }
            
            {
                if (!jobsZeroSizeValue(self.detailTextLabelSize) && self.detailTextLabel) {
                    self.detailTextLabel.resetSize(self.detailTextLabelSize);
                }
                if (self.detailTextLabelOffsetX && self.detailTextLabel){
                    self.detailTextLabel.resetOriginXByOffset(self.detailTextLabelOffsetX);
                }
                if (self.detailTextLabelOffsetY && self.detailTextLabel){
                    self.detailTextLabel.resetOriginYByOffset(self.detailTextLabelOffsetY);
                }
            }

            {
                if (!jobsZeroSizeValue(self.imageViewSize)) self.imageView.resetSize(self.imageViewSize);
                if (self.imageViewFrameOffsetX) self.imageView.resetOriginXByOffset(self.imageViewFrameOffsetX);
                if (self.imageViewFrameOffsetY) self.imageView.resetOriginYByOffset(self.imageViewFrameOffsetY);
            }
        }
        
        {///【组 3】UITableViewCell单独自定义设置系统自带控件的宽高【形成Frame后直接return，避免被其他中间过程修改】❤️与组1、2属性互斥❤️
           
            {
                if (self.textLabelWidth) self.textLabel.resetWidth(self.textLabelWidth);
                if (self.textLabelHeight && self.detailTextLabel) {
                    self.detailTextLabel.resetHeight(self.textLabelHeight);
                }
                if(self.textLabelFrameOffsetX) self.textLabel.resetOriginXByOffset(self.textLabelFrameOffsetX);
                if(self.textLabelFrameOffsetY) self.textLabel.resetOriginYByOffset(self.textLabelFrameOffsetY);
            }
            
            {
                if (self.detailTextLabelWidth && self.detailTextLabel) {
                    self.detailTextLabel.resetWidth(self.detailTextLabelWidth);
                }
                if (self.detailTextLabelHeight && self.detailTextLabel) {
                    self.detailTextLabel.resetHeight(self.detailTextLabelHeight);
                }
                if (self.detailTextLabelOffsetX && self.detailTextLabel){
                    self.detailTextLabel.resetOriginXByOffset(self.detailTextLabelOffsetX);
                }
                if (self.detailTextLabelOffsetY && self.detailTextLabel){
                    self.detailTextLabel.resetOriginYByOffset(self.detailTextLabelOffsetY);
                }
            }
            
            {
                if (self.imageViewWidth) self.imageView.resetWidth(self.imageViewWidth);
                if (self.imageViewHeight) self.imageView.resetHeight(self.imageViewHeight);
                if (self.imageViewFrameOffsetX) self.imageView.resetOriginXByOffset(self.imageViewFrameOffsetX);
                if (self.imageViewFrameOffsetY)self.imageView.resetOriginYByOffset(self.imageViewFrameOffsetY);
            }
        }
        
        {/// 【组 4】UITableViewCell单独自定义设置系统自带控件的偏移量
            {
                self.textLabel.offsetForView(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
                    @jobs_strongify(self)
                    data.offsetXForEach = self.textLabelFrameOffsetX;
                    data.offsetYForEach = self.textLabelFrameOffsetY;
                    data.offsetWidth = self.textLabelFrameOffsetWidth;
                    data.offsetHeight = self.textLabelFrameOffsetHeight;
                }));
            }
            
            if (self.detailTextLabel) {
                self.detailTextLabel.offsetForView(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
                    @jobs_strongify(self)
                    data.offsetXForEach = self.detailTextLabelOffsetX;
                    data.offsetYForEach = self.detailTextLabelOffsetY;
                    data.offsetWidth = self.detailTextLabelOffsetWidth;
                    data.offsetHeight = self.detailTextLabelOffsetHeight;
                }));
            }
            
            if(self.imageView){
                self.imageView.offsetForView(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
                    @jobs_strongify(self)
                    data.offsetXForEach = self.imageViewFrameOffsetX;
                    data.offsetYForEach = self.imageViewFrameOffsetY;
                    data.offsetWidth = self.imageViewFrameOffsetWidth;
                    data.offsetHeight = self.imageViewFrameOffsetHeight;
                }));
            }
        }
    };
}
/// 修改 UITableViewCell 中默认子控件的frame 【方法二】
-(jobsByVoidBlock _Nonnull)modifySysChildViewFrame2{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.contentView.frame = self.bounds;
        self.textLabelFrameOffsetX = JobsWidth(0);// 等价于用这个 self.textLabel.resetOriginXByOffset(JobsWidth(0));
        self.textLabelFrameOffsetY = JobsWidth(0);// 等价于用这个 self.textLabel.resetOriginYByOffset(JobsWidth(0));
        self.textLabelFrameOffsetWidth = JobsWidth(0);// 等价于用这个 self.textLabel.resetWidthByOffset(JobsWidth(0));
        self.textLabelFrameOffsetHeight = JobsWidth(0);// 等价于用这个 self.textLabel.resetHeightByOffset(JobsWidth(0));
        
        self.detailTextLabelOffsetX = JobsWidth(0);// 等价于用这个 self.detailTextLabel.resetOriginXByOffset(JobsWidth(0));
        self.detailTextLabelOffsetY = JobsWidth(0);// 等价于用这个 self.detailTextLabel.resetOriginYByOffset(JobsWidth(0));
        self.detailTextLabelOffsetWidth = JobsWidth(0);// 等价于用这个 self.detailTextLabel.resetWidthByOffset(JobsWidth(0));
        self.detailTextLabelOffsetHeight = JobsWidth(0);// 等价于用这个 self.detailTextLabel.resetHeightByOffset(JobsWidth(0));
        
        self.imageViewFrameOffsetX = JobsWidth(0);// 等价于用这个 self.imageView.resetOriginXByOffset(JobsWidth(0));
        self.imageViewFrameOffsetY = JobsWidth(0);// 等价于用这个 self.imageView.resetOriginYByOffset(JobsWidth(0));
        self.imageViewFrameOffsetWidth = JobsWidth(0);// 等价于用这个 self.imageView.resetWidthByOffset(JobsWidth(0));
        self.imageViewFrameOffsetHeight = JobsWidth(0);// 等价于用这个 self.imageView.resetHeightByOffset(JobsWidth(0));
    };
}
/// 取内部类UITableViewCellEditControl,对编辑状态的Cell的点击按钮进行替换成自定义的
-(jobsByVoidBlock _Nonnull)customCellEditStateImage{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        for (UIControl *control in self.subviews){
            if ([control isMemberOfClass:NSClassFromString(UITableViewCellEditControl)]){
                for (UIView *view in control.subviews){
                    if ([view isKindOfClass:UIImageView.class]) {
                        UIImageView *img = (UIImageView *)view;
                        if (@"按钮已选中".img && @"按钮未选中".img) {
                            img.image = self.selected ? @"按钮已选中".img : @"按钮未选中".img;
                        }
                    }
                }
            }
        }
    };
}
/// <UIViewModelProtocol> Prop_strong()NSIndexPath *indexPath;
PROP_STRONG_OBJECT_TYPE(NSIndexPath, indexPath, IndexPath)
/// <UIMarkProtocol> Prop_assign()NSInteger index;
PROP_NSInteger(index, Index)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGRect textLabelFrame;
PROP_CGRECT(textLabelFrame, TextLabelFrame)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGRect detailTextLabelFrame;
PROP_CGRECT(detailTextLabelFrame, DetailTextLabelFrame)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGRect imageViewFrame;
PROP_CGRECT(imageViewFrame, ImageViewFrame)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGSize textLabelSize;
PROP_CGSIZE(textLabelSize, TextLabelSize)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGSize detailTextLabelSize;
PROP_CGSIZE(detailTextLabelSize, DetailTextLabelSize)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGSize imageViewSize;
PROP_CGSIZE(imageViewSize, ImageViewSize)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat textLabelWidth;
PROP_CGFloat(textLabelWidth, TextLabelWidth)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat textLabelHeight;
PROP_CGFloat(textLabelHeight, TextLabelHeight)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat detailTextLabelWidth;
PROP_CGFloat(detailTextLabelWidth, DetailTextLabelWidth)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat detailTextLabelHeight;
PROP_CGFloat(detailTextLabelHeight, DetailTextLabelHeight)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat imageViewWidth;
PROP_CGFloat(imageViewWidth, ImageViewWidth)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat imageViewHeight;
PROP_CGFloat(imageViewHeight, ImageViewHeight)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat textLabelFrameOffsetX;
PROP_CGFloat(textLabelFrameOffsetX, TextLabelFrameOffsetX)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat textLabelFrameOffsetY;
PROP_CGFloat(textLabelFrameOffsetY, TextLabelFrameOffsetY)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat textLabelFrameOffsetWidth;
PROP_CGFloat(textLabelFrameOffsetWidth, TextLabelFrameOffsetWidth)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat textLabelFrameOffsetHeight;
PROP_CGFloat(textLabelFrameOffsetHeight, TextLabelFrameOffsetHeight)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat detailTextLabelOffsetX;
PROP_CGFloat(detailTextLabelOffsetX, DetailTextLabelOffsetX)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat detailTextLabelOffsetY;
PROP_CGFloat(detailTextLabelOffsetY, DetailTextLabelOffsetY)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat detailTextLabelOffsetWidth;
PROP_CGFloat(detailTextLabelOffsetWidth, DetailTextLabelOffsetWidth)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat detailTextLabelOffsetHeight;
PROP_CGFloat(detailTextLabelOffsetHeight, DetailTextLabelOffsetHeight)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat imageViewFrameOffsetX;
PROP_CGFloat(imageViewFrameOffsetX, ImageViewFrameOffsetX)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat imageViewFrameOffsetY;
PROP_CGFloat(imageViewFrameOffsetY, ImageViewFrameOffsetY)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat imageViewFrameOffsetWidth;
PROP_CGFloat(imageViewFrameOffsetWidth, ImageViewFrameOffsetWidth)
/// <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat imageViewFrameOffsetHeight;
PROP_CGFloat(imageViewFrameOffsetHeight, ImageViewFrameOffsetHeight)

@end
