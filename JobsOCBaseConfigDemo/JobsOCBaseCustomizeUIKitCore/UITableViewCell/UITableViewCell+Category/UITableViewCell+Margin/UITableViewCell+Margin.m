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
//    NSLog(@"self.offsetXForEach = %f",self.offsetXForEach);
//    NSLog(@"self.offsetYForEach = %f",self.offsetYForEach);
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
-(jobsByVoidBlock _Nonnull)modifySysChildViewFrame1{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
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
-(NSIndexPath *)indexPath{
    return Jobs_getAssociatedObject(_indexPath);
}

-(void)setIndexPath:(NSIndexPath *)indexPath{
    Jobs_setAssociatedRETAIN_NONATOMIC(_indexPath, indexPath)
}
#pragma mark —— <UIMarkProtocol> @property(nonatomic,assign)NSInteger index;
JobsKey(_index)
-(NSInteger)index{
    return [Jobs_getAssociatedObject(_index) integerValue];
}

-(void)setIndex:(NSInteger)index{
    Jobs_setAssociatedRETAIN_NONATOMIC(_index, @(index))
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGRect textLabelFrame;
JobsKey(_textLabelFrame)
-(CGRect)textLabelFrame{
    return [Jobs_getAssociatedObject(_textLabelFrame) CGRectValue];
}

-(void)setTextLabelFrame:(CGRect)textLabelFrame{
    Jobs_setAssociatedRETAIN_NONATOMIC(_textLabelFrame, NSValue.byRect(textLabelFrame))
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGRect detailTextLabelFrame;
JobsKey(_detailTextLabelFrame)
-(CGRect)detailTextLabelFrame{
    return [Jobs_getAssociatedObject(_detailTextLabelFrame) CGRectValue];
}

-(void)setDetailTextLabelFrame:(CGRect)detailTextLabelFrame{
    Jobs_setAssociatedRETAIN_NONATOMIC(_detailTextLabelFrame, NSValue.byRect(detailTextLabelFrame))
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGRect imageViewFrame;
JobsKey(_imageViewFrame)
-(CGRect)imageViewFrame{
    return [Jobs_getAssociatedObject(_imageViewFrame) CGRectValue];
}

-(void)setImageViewFrame:(CGRect)imageViewFrame{
    Jobs_setAssociatedRETAIN_NONATOMIC(_imageViewFrame, NSValue.byRect(imageViewFrame))
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGRect textLabelSize;
JobsKey(_textLabelSize)
-(CGSize)textLabelSize{
    return [Jobs_getAssociatedObject(_imageViewFrame) CGSizeValue];
}

-(void)setTextLabelSize:(CGSize)textLabelSize{
    Jobs_setAssociatedRETAIN_NONATOMIC(_textLabelSize, NSValue.bySize(textLabelSize))
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGSize detailTextLabelSize;
JobsKey(_detailTextLabelSize)
-(CGSize)detailTextLabelSize{
    return [Jobs_getAssociatedObject(_detailTextLabelSize) CGSizeValue];
}

-(void)setDetailTextLabelSize:(CGSize)detailTextLabelSize{
    Jobs_setAssociatedRETAIN_NONATOMIC(_detailTextLabelSize, NSValue.bySize(detailTextLabelSize));
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGSize imageViewSize;
JobsKey(_imageViewSize)
-(CGSize)imageViewSize{
    return [Jobs_getAssociatedObject(_imageViewSize) CGSizeValue];
}

-(void)setImageViewSize:(CGSize)imageViewSize{
    Jobs_setAssociatedRETAIN_NONATOMIC(_imageViewSize, NSValue.bySize(imageViewSize));
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat textLabelWidth;
JobsKey(_textLabelWidth)
-(CGFloat)textLabelWidth{
    return [Jobs_getAssociatedObject(_textLabelWidth) byFloat];
}

-(void)setTextLabelWidthe:(CGFloat)textLabelWidth{
    Jobs_setAssociatedRETAIN_NONATOMIC(_textLabelWidth, NSNumber.initByShort(textLabelWidth));
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat textLabelHeight;
JobsKey(_textLabelHeight)
-(CGFloat)textLabelHeight{
    return [Jobs_getAssociatedObject(_textLabelHeight) byFloat];
}

-(void)setTextLabelHeight:(CGFloat)textLabelHeight{
    Jobs_setAssociatedRETAIN_NONATOMIC(_textLabelHeight, NSNumber.initByCGFloat(textLabelHeight));
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat detailTextLabelWidth;
JobsKey(_detailTextLabelWidth)
-(CGFloat)detailTextLabelWidth{
    return [Jobs_getAssociatedObject(_detailTextLabelWidth) byFloat];
}

-(void)setDetailTextLabelWidth:(CGFloat)detailTextLabelWidth{
    Jobs_setAssociatedRETAIN_NONATOMIC(_detailTextLabelWidth, NSNumber.initByCGFloat(detailTextLabelWidth));
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat detailTextLabelHeight;
JobsKey(_detailTextLabelHeight)
-(CGFloat)detailTextLabelHeight{
    return [Jobs_getAssociatedObject(_detailTextLabelHeight) byFloat];
}

-(void)setDetailTextLabelHeight:(CGFloat)detailTextLabelHeight{
    Jobs_setAssociatedRETAIN_NONATOMIC(_detailTextLabelHeight, NSNumber.initByCGFloat(detailTextLabelHeight));
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat imageViewWidth;
JobsKey(_imageViewWidth)
-(CGFloat)imageViewWidth{
    return [Jobs_getAssociatedObject(_imageViewWidth) byFloat];
}

-(void)setImageViewWidth:(CGFloat)imageViewWidth{
    Jobs_setAssociatedRETAIN_NONATOMIC(_imageViewWidth, NSNumber.initByCGFloat(imageViewWidth));
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat imageViewHeight;
JobsKey(_imageViewHeight)
-(CGFloat)imageViewHeight{
    return [Jobs_getAssociatedObject(_imageViewHeight) byFloat];
}

-(void)setImageViewHeight:(CGFloat)imageViewHeight{
    Jobs_setAssociatedRETAIN_NONATOMIC(_imageViewHeight, NSNumber.initByCGFloat(imageViewHeight));
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat textLabelFrameOffsetX;
JobsKey(_textLabelFrameOffsetX)
-(CGFloat)textLabelFrameOffsetX{
    return [Jobs_getAssociatedObject(_textLabelFrameOffsetX) byFloat];
}

-(void)setTextLabelFrameOffsetX:(CGFloat)textLabelFrameOffsetX{
    Jobs_setAssociatedRETAIN_NONATOMIC(_textLabelFrameOffsetX, NSNumber.initByCGFloat(textLabelFrameOffsetX));
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat textLabelFrameOffsetY;
JobsKey(_textLabelFrameOffsetY)
-(CGFloat)textLabelFrameOffsetY{
    return [Jobs_getAssociatedObject(_textLabelFrameOffsetY) byFloat];
}

-(void)setTextLabelFrameOffsetY:(CGFloat)textLabelFrameOffsetY{
    Jobs_setAssociatedRETAIN_NONATOMIC(_textLabelFrameOffsetY, NSNumber.initByCGFloat(textLabelFrameOffsetY));
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat textLabelFrameOffsetWidth;
JobsKey(_textLabelFrameOffsetWidth)
-(CGFloat)textLabelFrameOffsetWidth{
    return [Jobs_getAssociatedObject(_textLabelFrameOffsetWidth) byFloat];
}

-(void)setTextLabelFrameOffsetWidth:(CGFloat)textLabelFrameOffsetWidth{
    Jobs_setAssociatedRETAIN_NONATOMIC(_textLabelFrameOffsetWidth, NSNumber.initByCGFloat(textLabelFrameOffsetWidth));
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat textLabelFrameOffsetHeight;
JobsKey(_textLabelFrameOffsetHeight)
-(CGFloat)textLabelFrameOffsetHeight{
    return [Jobs_getAssociatedObject(_textLabelFrameOffsetHeight) byFloat];
}

-(void)setTextLabelFrameOffsetHeight:(CGFloat)textLabelFrameOffsetHeight{
    Jobs_setAssociatedRETAIN_NONATOMIC(_textLabelFrameOffsetHeight, NSNumber.initByCGFloat(textLabelFrameOffsetHeight));
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat detailTextLabelOffsetX;
JobsKey(_detailTextLabelOffsetX)
-(CGFloat)detailTextLabelOffsetX{
    return [Jobs_getAssociatedObject(_detailTextLabelOffsetX) byFloat];
}

-(void)setDetailTextLabelOffsetX:(CGFloat)detailTextLabelOffsetX{
    Jobs_setAssociatedRETAIN_NONATOMIC(_detailTextLabelOffsetX, NSNumber.initByCGFloat(detailTextLabelOffsetX));
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat detailTextLabelOffsetY;
JobsKey(_detailTextLabelOffsetY)
-(CGFloat)detailTextLabelOffsetY{
    return [Jobs_getAssociatedObject(_detailTextLabelOffsetY) byFloat];
}

-(void)setDetailTextLabelOffsetY:(CGFloat)detailTextLabelOffsetY{
    Jobs_setAssociatedRETAIN_NONATOMIC(_detailTextLabelOffsetY, NSNumber.initByCGFloat(detailTextLabelOffsetY));
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat detailTextLabelOffsetWidth;
JobsKey(_detailTextLabelOffsetWidth)
-(CGFloat)detailTextLabelOffsetWidth{
    return [Jobs_getAssociatedObject(_detailTextLabelOffsetWidth) byFloat];
}

-(void)setDetailTextLabelOffsetWidth:(CGFloat)detailTextLabelOffsetWidth{
    Jobs_setAssociatedRETAIN_NONATOMIC(_detailTextLabelOffsetWidth, NSNumber.initByCGFloat(detailTextLabelOffsetWidth));
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat detailTextLabelOffsetHeight;
JobsKey(_detailTextLabelOffsetHeight)
-(CGFloat)detailTextLabelOffsetHeight{
    return [Jobs_getAssociatedObject(_detailTextLabelOffsetHeight) byFloat];
}

-(void)setDetailTextLabelOffsetHeight:(CGFloat)detailTextLabelOffsetHeight{
    Jobs_setAssociatedRETAIN_NONATOMIC(_detailTextLabelOffsetHeight, NSNumber.initByCGFloat(detailTextLabelOffsetHeight));
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat imageViewFrameOffsetX;
JobsKey(_imageViewFrameOffsetX)
-(CGFloat)imageViewFrameOffsetX{
    return [Jobs_getAssociatedObject(_imageViewFrameOffsetX) byFloat];
}

-(void)setImageViewFrameOffsetX:(CGFloat)imageViewFrameOffsetX{
    Jobs_setAssociatedRETAIN_NONATOMIC(_imageViewFrameOffsetX, NSNumber.initByCGFloat(imageViewFrameOffsetX));
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat imageViewFrameOffsetY;
JobsKey(_imageViewFrameOffsetY)
-(CGFloat)imageViewFrameOffsetY{
    return [Jobs_getAssociatedObject(_imageViewFrameOffsetY) byFloat];
}

-(void)setImageViewFrameOffsetY:(CGFloat)imageViewFrameOffsetY{
    Jobs_setAssociatedRETAIN_NONATOMIC(_imageViewFrameOffsetY, NSNumber.initByCGFloat(imageViewFrameOffsetY));
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat imageViewFrameOffsetWidth;
JobsKey(_imageViewFrameOffsetWidth)
-(CGFloat)imageViewFrameOffsetWidth{
    return [Jobs_getAssociatedObject(_imageViewFrameOffsetWidth) byFloat];
}

-(void)setImageViewFrameOffsetWidth:(CGFloat)imageViewFrameOffsetWidth{
    Jobs_setAssociatedRETAIN_NONATOMIC(_imageViewFrameOffsetWidth, NSNumber.initByCGFloat(imageViewFrameOffsetWidth));
}
#pragma mark —— <UITableViewCellProtocol> @property(nonatomic, assign)CGFloat imageViewFrameOffsetHeight;
JobsKey(_imageViewFrameOffsetHeight)
-(CGFloat)imageViewFrameOffsetHeight{
    return [Jobs_getAssociatedObject(_imageViewFrameOffsetHeight) byFloat];
}

-(void)setImageViewFrameOffsetHeight:(CGFloat)imageViewFrameOffsetHeight{
    Jobs_setAssociatedRETAIN_NONATOMIC(_imageViewFrameOffsetHeight, NSNumber.initByCGFloat(imageViewFrameOffsetHeight));
}

@end
