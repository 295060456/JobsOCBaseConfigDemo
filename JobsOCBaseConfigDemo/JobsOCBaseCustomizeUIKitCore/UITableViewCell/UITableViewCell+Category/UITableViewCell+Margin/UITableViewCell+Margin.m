//
//  UITableViewCell+Margin.m
//  JobsIM
//
//  Created by Jobs on 2020/11/13.
//

#import "UITableViewCell+Margin.h"

@implementation UITableViewCell (Margin)

@dynamic offsetXForEach;
@dynamic offsetYForEach;
// 在具体的子类去实现,分类调用异常
//-(void)setFrame:(CGRect)frame{
//    NSLog(@"self.offsetXForEach = %f",self.offsetXForEach);
//    NSLog(@"self.offsetYForEach = %f",self.offsetYForEach);
//    frame.origin.x += self.offsetXForEach;
//    frame.origin.y += self.offsetYForEach;
//    frame.size.height -= self.offsetYForEach * 2;
//    frame.size.width -= self.offsetXForEach * 2;
//    [super setFrame:frame];
//}
/// 值打印
-(jobsByVoidBlock)printValue{
    return ^(){
        NSLog(@"self.textLabelFrame = %@",NSStringFromCGRect(self.textLabelFrame));
        NSLog(@"self.detailTextLabelFrame = %@",NSStringFromCGRect(self.detailTextLabelFrame));
        NSLog(@"self.imageViewFrame = %@",NSStringFromCGRect(self.imageViewFrame));
        
        NSLog(@"self.textLabelSize = %@",NSStringFromCGSize(self.textLabelSize));
        NSLog(@"self.detailTextLabelSize = %@",NSStringFromCGSize(self.detailTextLabelSize));
        NSLog(@"self.imageViewSize = %@",NSStringFromCGSize(self.imageViewSize));
        
        NSLog(@"self.textLabelWidth = %f",self.textLabelWidth);
        NSLog(@"self.textLabelHeight = %f",self.textLabelHeight);
        NSLog(@"self.detailTextLabelWidth = %f",self.detailTextLabelWidth);
        NSLog(@"elf.detailTextLabelHeight = %f",self.detailTextLabelHeight);
        NSLog(@"self.imageViewWidth = %f",self.imageViewWidth);
        NSLog(@"self.imageViewHeight = %f",self.imageViewHeight);
        
        NSLog(@"self.textLabelFrameOffsetX = %f",self.textLabelFrameOffsetX);
        NSLog(@"self.textLabelFrameOffsetY = %f",self.textLabelFrameOffsetY);
        NSLog(@"self.textLabelFrameOffsetWidth = %f",self.textLabelFrameOffsetWidth);
        NSLog(@"self.textLabelFrameOffsetHeight = %f",self.textLabelFrameOffsetHeight);
        
        NSLog(@"self.detailTextLabelOffsetX = %f",self.detailTextLabelOffsetX);
        NSLog(@"self.detailTextLabelOffsetY = %f",self.detailTextLabelOffsetY);
        NSLog(@"self.detailTextLabelOffsetWidth = %f",self.detailTextLabelOffsetWidth);
        NSLog(@"self.detailTextLabelOffsetHeight = %f",self.detailTextLabelOffsetHeight);
        
        NSLog(@"self.imageViewFrameOffsetX = %f",self.imageViewFrameOffsetX);
        NSLog(@"self.imageViewFrameOffsetY = %f",self.imageViewFrameOffsetY);
        NSLog(@"self.imageViewFrameOffsetWidth = %f",self.imageViewFrameOffsetWidth);
        NSLog(@"self.imageViewFrameOffsetHeight = %f",self.imageViewFrameOffsetHeight);
    };
}
/// 修改 UITableViewCell 中默认子控件的frame 【方法一】
-(jobsByVoidBlock)modifySysChildViewFrame1{
    return ^(){
        self.contentView.frame = self.bounds;
        
        {///【组 1】 UITableViewCell单独自定义设置系统自带控件的Frame 【形成Frame后直接return，避免被其他中间过程修改】❤️与组2、3属性互斥❤️
            if (!jobsZeroRectValue(self.textLabelFrame)) {
                self.textLabel.frame = self.textLabelFrame;
            }
            
            if (!jobsZeroRectValue(self.detailTextLabelFrame) && self.detailTextLabel) {
                self.detailTextLabel.frame = self.detailTextLabelFrame;
            }

            if (!jobsZeroRectValue(self.imageViewFrame)) {
                self.imageView.frame = self.imageViewFrame;
            }
        }
        
        {///【组 2】UITableViewCell单独自定义设置系统自带控件的Size【形成Frame后直接return，避免被其他中间过程修改】❤️与组1、3属性互斥❤️
            {
                if (!jobsZeroSizeValue(self.textLabelSize)) {
                    self.textLabel.resetSize(self.textLabelSize);
                }
                if(self.textLabelFrameOffsetX){
                    self.textLabel.resetOriginXByOffset(self.textLabelFrameOffsetX);
                }
                if(self.textLabelFrameOffsetY){
                    self.textLabel.resetOriginYByOffset(self.textLabelFrameOffsetY);
                }
            }
            
            {
                if (!jobsZeroSizeValue(self.detailTextLabelSize) && self.detailTextLabel) {
                    self.detailTextLabel.resetSize(self.detailTextLabelSize);
                }
                if(self.detailTextLabelOffsetX && self.detailTextLabel){
                    self.detailTextLabel.resetOriginXByOffset(self.detailTextLabelOffsetX);
                }
                if(self.detailTextLabelOffsetY && self.detailTextLabel){
                    self.detailTextLabel.resetOriginYByOffset(self.detailTextLabelOffsetY);
                }
            }

            {
                if (!jobsZeroSizeValue(self.imageViewSize)) {
                    self.imageView.resetSize(self.imageViewSize);
                }
                if(self.imageViewFrameOffsetX){
                    self.imageView.resetOriginXByOffset(self.imageViewFrameOffsetX);
                }
                if(self.imageViewFrameOffsetY){
                    self.imageView.resetOriginYByOffset(self.imageViewFrameOffsetY);
                }
            }
        }
        
        {///【组 3】UITableViewCell单独自定义设置系统自带控件的宽高【形成Frame后直接return，避免被其他中间过程修改】❤️与组1、2属性互斥❤️
           
            {
                if (self.textLabelWidth) {
                    self.textLabel.resetWidth(self.textLabelWidth);
                }
                if (self.textLabelHeight && self.detailTextLabel) {
                    self.detailTextLabel.resetHeight(self.textLabelHeight);
                }
                if(self.textLabelFrameOffsetX){
                    self.textLabel.resetOriginXByOffset(self.textLabelFrameOffsetX);
                }
                if(self.textLabelFrameOffsetY){
                    self.textLabel.resetOriginYByOffset(self.textLabelFrameOffsetY);
                }
            }
            
            {
                if (self.detailTextLabelWidth && self.detailTextLabel) {
                    self.detailTextLabel.resetWidth(self.detailTextLabelWidth);
                }
                if (self.detailTextLabelHeight && self.detailTextLabel) {
                    self.detailTextLabel.resetHeight(self.detailTextLabelHeight);
                }
                if(self.detailTextLabelOffsetX && self.detailTextLabel){
                    self.detailTextLabel.resetOriginXByOffset(self.detailTextLabelOffsetX);
                }
                if(self.detailTextLabelOffsetY && self.detailTextLabel){
                    self.detailTextLabel.resetOriginYByOffset(self.detailTextLabelOffsetY);
                }
            }
            
            {
                if (self.imageViewWidth) {
                    self.imageView.resetWidth(self.imageViewWidth);
                }
                if (self.imageViewHeight) {
                    self.imageView.resetHeight(self.imageViewHeight);
                }
                if(self.imageViewFrameOffsetX){
                    self.imageView.resetOriginXByOffset(self.imageViewFrameOffsetX);
                }
                if(self.imageViewFrameOffsetY){
                    self.imageView.resetOriginYByOffset(self.imageViewFrameOffsetY);
                }
            }
        }
        
        {/// 【组 4】UITableViewCell单独自定义设置系统自带控件的偏移量
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.offsetXForEach = self.textLabelFrameOffsetX;
                viewModel.offsetYForEach = self.textLabelFrameOffsetY;
                viewModel.offsetWidth = self.textLabelFrameOffsetWidth;
                viewModel.offsetHeight = self.textLabelFrameOffsetHeight;
                self.textLabel.offsetForView(viewModel);
            }
            
            if (self.detailTextLabel) {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.offsetXForEach = self.detailTextLabelOffsetX;
                viewModel.offsetYForEach = self.detailTextLabelOffsetY;
                viewModel.offsetWidth = self.detailTextLabelOffsetWidth;
                viewModel.offsetHeight = self.detailTextLabelOffsetHeight;
                self.detailTextLabel.offsetForView(viewModel);
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.offsetXForEach = self.imageViewFrameOffsetX;
                viewModel.offsetYForEach = self.imageViewFrameOffsetY;
                viewModel.offsetWidth = self.imageViewFrameOffsetWidth;
                viewModel.offsetHeight = self.imageViewFrameOffsetHeight;
                self.imageView.offsetForView(viewModel);
            }
        }
    };
}
/// 修改 UITableViewCell 中默认子控件的frame 【方法二】
-(jobsByVoidBlock)modifySysChildViewFrame2{
    return ^(){
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
-(jobsByVoidBlock)customCellEditStateImage{
    return ^(){
        for (UIControl *control in self.subviews){
            if ([control isMemberOfClass:NSClassFromString(@"UITableViewCellEditControl")]){
                for (UIView *view in control.subviews){
                    if ([view isKindOfClass:UIImageView.class]) {
                        UIImageView *img = (UIImageView *)view;
                        if (JobsIMG(@"按钮已选中") && JobsIMG(@"按钮未选中")) {
                            img.image = self.selected ? JobsIMG(@"按钮已选中") : JobsIMG(@"按钮未选中");
                        }
                    }
                }
            }
        }
    };
}
#pragma mark —— <UIViewModelProtocol> @property(nonatomic,strong)NSIndexPath *indexPath;
JobsKey(_indexPath)
@dynamic indexPath;
-(NSIndexPath *)indexPath{
    return Jobs_getAssociatedObject(_indexPath);
}

-(void)setIndexPath:(NSIndexPath *)indexPath{
    Jobs_setAssociatedRETAIN_NONATOMIC(_indexPath, indexPath)
}
#pragma mark —— <UIViewModelProtocol> @property(nonatomic,assign)NSInteger index;
JobsKey(_index)
@dynamic index;
-(NSInteger)index{
    return [Jobs_getAssociatedObject(_index) integerValue];
}

-(void)setIndex:(NSInteger)index{
    Jobs_setAssociatedRETAIN_NONATOMIC(_index, @(index))
}

@end

