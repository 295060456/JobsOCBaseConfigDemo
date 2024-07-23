//
//  JobsBaseTableViewCell.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2021/1/20.
//  Copyright © 2021 MonkeyKingVideo. All rights reserved.
//

#import "JobsBaseTableViewCell.h"

#define UITableViewCellTitleWidth JobsMainScreen_WIDTH() * 2 / 3
#define UITableViewCellSubTitleWidth JobsMainScreen_WIDTH() / 3

@interface JobsBaseTableViewCell ()
/// Data
@property(nonatomic,assign)BOOL isSetTBVCellOffset;

@end

@implementation JobsBaseTableViewCell
#pragma mark —— @synthesize UITableViewCellProtocol
UITableViewCellProtocol_synthesize
#pragma mark —— UITableViewCellProtocol
/// 4种UITableViewCell系统样式类型
/// UITableViewCellStyleDefault ：左边有一个显示图片的imageView和一个标题textLabel。
+(instancetype)cellStyleDefaultWithTableView:(UITableView *)tableView{
    JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)[tableView tableViewCellClass:JobsBaseTableViewCell.class];
    if (!cell) {
        cell = [self initTableViewCell:self
                             withStyle:UITableViewCellStyleDefault];
        [self settingForTableViewCell:cell];
    }return cell;
}
/// UITableViewCellStyleValue1 ：左边显示图片的imageView和一个主标题textLabel，右边一个副标题detailTextLabel。
+(instancetype)cellStyleValue1WithTableView:(UITableView *)tableView{
    JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)[tableView tableViewCellClass:JobsBaseTableViewCell.class];
    if (!cell) {
        cell = [self initTableViewCell:self
                             withStyle:UITableViewCellStyleValue1];
        [self settingForTableViewCell:cell];
    }return cell;
}
/// UITableViewCellStyleValue2 ：左边一个主标题textLabel字体偏小，右边一个副标题detailTextLabel。
+(instancetype)cellStyleValue2WithTableView:(UITableView *)tableView{
    JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)[tableView tableViewCellClass:JobsBaseTableViewCell.class];
    if (!cell) {
        cell = [self initTableViewCell:self
                             withStyle:UITableViewCellStyleValue2];
        [self settingForTableViewCell:cell];
    }return cell;
}
/// UITableViewCellStyleSubtitle ：左边还是一个显示图片的imageView，不同的是上边有一个主标题textLabel和一个副标题detailTextLabel。主标题字体大且加黑，副标题字体小在主标题下边。
+(instancetype)cellStyleSubtitleWithTableView:(UITableView *)tableView{
    JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)[tableView tableViewCellClass:JobsBaseTableViewCell.class];
    if (!cell) {
        cell = [self initTableViewCell:self
                             withStyle:UITableViewCellStyleSubtitle];
        [self settingForTableViewCell:cell];
    }return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
//        [self richElementsInCellWithModel:nil];
        self.selectionStyle = UITableViewCellSelectionStyleNone;// 取消点击效果 【不能在cellStyleValue1WithTableView里面写】
        /// 适配iOS 13夜间模式/深色外观(Dark Mode)
        self.backgroundColor = JobsWhiteColor;
        self.detailTextLabel.textColor = JobsBrownColor;
        self.textLabel.textColor = JobsBlackColor;
    }return self;
}
/// UITableViewCell 的横向和纵向的缩进
/// 在具体的子类，去覆盖-(void)setFrame:(CGRect)frame方法
/// - Parameters:
///   - frame: 最原始的Cell的Frame
///   - offsetX: X轴的偏移量
///   - offsetY: Y轴的偏移量
-(void)jobsResetTableViewCellFrame:(CGRect)frame
                       cellOffsetX:(CGFloat)offsetX
                       cellOffsetY:(CGFloat)offsetY{
    /**
     参见：关于UITableViewCell和UICollectionViewCell圆切角+Cell的偏移量
     ❤️如果单独的对每一个row对应的UITableViewCell的边距有缩进则使用下列方法❤️
     如果这个TableViewCell是JobsBaseTableViewCell则不需要复写-(void)setFrame:(CGRect)frame；否则是需要：
     
     UILocationProtocol_UIViewModelSynthesize
     直接影响:
     cell.offsetXForEach = JobsWidth(8);
     cell.offsetYForEach = JobsWidth(6);
     
     // 在具体的子类去实现,分类调用异常
     #pragma mark —— 复写父类方法
     -(void)setFrame:(CGRect)frame{
     NSLog(@"self.offsetXForEach = %f",self.offsetXForEach);
     NSLog(@"self.offsetYForEach = %f",self.offsetYForEach);
     frame.origin.x += self.offsetXForEach;
     frame.origin.y += self.offsetYForEach;
     frame.size.height -= self.offsetYForEach * 2;
     frame.size.width -= self.offsetXForEach * 2;
     [super setFrame:frame];
     }
     
     ❤️ 如果对每一section的cell进行缩进，则在外层协议：❤️
     - (void)tableView:(UITableView *)tableView
     willDisplayCell:(UITableViewCell *)cell
     forRowAtIndexPath:(NSIndexPath *)indexPath{
     
     [UITableViewCell tableView:tableView
     makeSectionFirstAndLastCell:cell
     atIndexPath:indexPath
     cellBgCor:JobsWhiteColor
     bottomLineCor:JobsWhiteColor
     cellOutLineCor:HEXCOLOR(0xEEE2C8)
     roundCorner:JobsWidth(8)
     borderWidth:JobsWidth(1)
     dx:JobsWidth(0)
     dy:0];
     }
     */
    if(!self.isSetTBVCellOffset){
        frame.origin.x += offsetX;
        frame.origin.y += offsetY;
        frame.size.height -= offsetY * 2;
        frame.size.width -= offsetX * 2;
        self.isSetTBVCellOffset = !self.isSetTBVCellOffset;
    }
    [super setFrame:frame];
}
// 在具体的子类，去覆盖-(void)setFrame:(CGRect)frame方法
//-(void)setFrame:(CGRect)frame{
//    [self jobsResetTableViewCellFrame:frame
//                          cellOffsetX:self.offsetXForEach
//                          cellOffsetY:self.offsetYForEach];
//}
#pragma mark —— 一些私有方法
/// 值打印
-(void)printValue{
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
}
/// 修改 UITableViewCell 中默认子控件的frame 【方法一】
-(void)modifySysChildViewFrame1{
    {///【组 1】 UITableViewCell单独自定义设置系统自带控件的Frame 【形成Frame后直接return，避免被其他中间过程修改】❤️与组2、3属性互斥❤️
        if (!jobsZeroRectValue(self.textLabelFrame)) {
            self.textLabel.frame = self.textLabelFrame;
        }
        
        if (!jobsZeroRectValue(self.detailTextLabelFrame)) {
            self.detailTextLabel.frame = self.detailTextLabelFrame;
        }

        if (!jobsZeroRectValue(self.imageViewFrame)) {
            self.imageView.frame = self.imageViewFrame;
        }
        
        if (!jobsZeroRectValue(self.textLabelFrame) ||
            !jobsZeroRectValue(self.detailTextLabelFrame) ||
            !jobsZeroRectValue(self.imageViewFrame)) return;
    }
    
    {///【组 2】UITableViewCell单独自定义设置系统自带控件的Size【形成Frame后直接return，避免被其他中间过程修改】❤️与组1、3属性互斥❤️
        if (!jobsZeroSizeValue(self.textLabelSize)) {
            CGRect textLabelFrame = self.textLabel.frame;
            textLabelFrame.size = self.textLabelSize;
            textLabelFrame.origin.x += self.textLabelFrameOffsetX;
            textLabelFrame.origin.y += self.textLabelFrameOffsetY;
            self.textLabel.frame = textLabelFrame;
        }
        
        if (!jobsZeroSizeValue(self.detailTextLabelSize)) {
            CGRect detailTextLabelFrame = self.detailTextLabel.frame;
            detailTextLabelFrame.size = self.detailTextLabelSize;
            detailTextLabelFrame.origin.x += self.detailTextLabelOffsetX;
            detailTextLabelFrame.origin.y += self.detailTextLabelOffsetY;
            self.detailTextLabel.frame = detailTextLabelFrame;
        }
        
        if (!jobsZeroSizeValue(self.imageViewSize)) {
            CGRect imageViewFrame = self.imageView.frame;
            imageViewFrame.size = self.imageViewSize;
            imageViewFrame.origin.x += self.imageViewFrameOffsetX;
            imageViewFrame.origin.y += self.imageViewFrameOffsetY;
            self.imageView.frame = imageViewFrame;
        }
        
        if (!jobsZeroSizeValue(self.textLabelSize) ||
            !jobsZeroSizeValue(self.detailTextLabelSize) ||
            !jobsZeroSizeValue(self.imageViewSize)) return;
    }
    
    {///【组 3】UITableViewCell单独自定义设置系统自带控件的宽高【形成Frame后直接return，避免被其他中间过程修改】❤️与组1、2属性互斥❤️
        if (self.textLabelWidth) {
            CGRect textLabelFrame = self.textLabel.frame;
            textLabelFrame.size.width = self.textLabelWidth;
            textLabelFrame.origin.x += self.textLabelFrameOffsetX;
            textLabelFrame.origin.y += self.textLabelFrameOffsetY;
            self.textLabel.frame = textLabelFrame;
        }
        
        if (self.textLabelHeight) {
            CGRect textLabelFrame = self.textLabel.frame;
            textLabelFrame.size.height = self.textLabelHeight;
            textLabelFrame.origin.x += self.textLabelFrameOffsetX;
            textLabelFrame.origin.y += self.textLabelFrameOffsetY;
            self.detailTextLabel.frame = textLabelFrame;
        }
        
        if (self.detailTextLabelWidth) {
            CGRect detailTextLabelFrame = self.detailTextLabel.frame;
            detailTextLabelFrame.size.width = self.detailTextLabelWidth;
            detailTextLabelFrame.origin.x += self.detailTextLabelOffsetX;
            detailTextLabelFrame.origin.y += self.detailTextLabelOffsetY;
            self.detailTextLabel.frame = detailTextLabelFrame;
        }
        
        if (self.detailTextLabelHeight) {
            CGRect detailTextLabelFrame = self.detailTextLabel.frame;
            detailTextLabelFrame.size.height = self.detailTextLabelHeight;
            detailTextLabelFrame.origin.x += self.detailTextLabelOffsetX;
            detailTextLabelFrame.origin.y += self.detailTextLabelOffsetY;
            self.detailTextLabel.frame = detailTextLabelFrame;
        }
        
        if (self.imageViewWidth) {
            CGRect imageViewFrame = self.imageView.frame;
            imageViewFrame.size.width = self.imageViewWidth;
            imageViewFrame.origin.x += self.imageViewFrameOffsetX;
            imageViewFrame.origin.y += self.imageViewFrameOffsetY;
            self.imageView.frame = imageViewFrame;
        }
        
        if (self.imageViewHeight) {
            CGRect imageViewFrame = self.imageView.frame;
            imageViewFrame.size.height = self.imageViewHeight;
            imageViewFrame.origin.x += self.imageViewFrameOffsetX;
            imageViewFrame.origin.y += self.imageViewFrameOffsetY;
            self.imageView.frame = imageViewFrame;
        }
        
        if (self.textLabelWidth ||
            self.textLabelHeight ||
            self.detailTextLabelWidth ||
            self.detailTextLabelHeight ||
            self.imageViewWidth ||
            self.imageViewHeight)  return;
    }
    
    {/// 【组 4】UITableViewCell单独自定义设置系统自带控件的偏移量
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.offsetXForEach = self.textLabelFrameOffsetX;
            viewModel.offsetYForEach = self.textLabelFrameOffsetY;
            viewModel.offsetWidth = self.textLabelFrameOffsetWidth;
            viewModel.offsetHeight = self.textLabelFrameOffsetHeight;
            
            [self.textLabel offsetForView:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.offsetXForEach = self.detailTextLabelOffsetX;
            viewModel.offsetYForEach = self.detailTextLabelOffsetY;
            viewModel.offsetWidth = self.detailTextLabelOffsetWidth;
            viewModel.offsetHeight = self.detailTextLabelOffsetHeight;
            
            [self.detailTextLabel offsetForView:viewModel];
        }
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.offsetXForEach = self.imageViewFrameOffsetX;
            viewModel.offsetYForEach = self.imageViewFrameOffsetY;
            viewModel.offsetWidth = self.imageViewFrameOffsetWidth;
            viewModel.offsetHeight = self.imageViewFrameOffsetHeight;
            
            [self.imageView offsetForView:viewModel];
        }
    }
}
/// 修改 UITableViewCell 中默认子控件的frame 【方法二】
-(void)modifySysChildViewFrame2{
    self.textLabelFrameOffsetX = JobsWidth(0);// 等价于用这个 self.textLabel.resetByOffsetOriginX(JobsWidth(0));
    self.textLabelFrameOffsetY = JobsWidth(0);// 等价于用这个 self.textLabel.resetByOffsetOriginY(JobsWidth(0));
    self.textLabelFrameOffsetWidth = JobsWidth(0);// 等价于用这个 self.textLabel.resetByOffsetWidth(JobsWidth(0));
    self.textLabelFrameOffsetHeight = JobsWidth(0);// 等价于用这个 self.textLabel.resetByOffsetHeight(JobsWidth(0));
    
    self.detailTextLabelOffsetX = JobsWidth(0);// 等价于用这个 self.detailTextLabel.resetByOffsetOriginX(JobsWidth(0));
    self.detailTextLabelOffsetY = JobsWidth(0);// 等价于用这个 self.detailTextLabel.resetByOffsetOriginY(JobsWidth(0));
    self.detailTextLabelOffsetWidth = JobsWidth(0);// 等价于用这个 self.detailTextLabel.resetByOffsetWidth(JobsWidth(0));
    self.detailTextLabelOffsetHeight = JobsWidth(0);// 等价于用这个 self.detailTextLabel.resetByOffsetHeight(JobsWidth(0));
    
    self.imageViewFrameOffsetX = JobsWidth(0);// 等价于用这个 self.imageView.resetByOffsetOriginX(JobsWidth(0));
    self.imageViewFrameOffsetY = JobsWidth(0);// 等价于用这个 self.imageView.resetByOffsetOriginY(JobsWidth(0));
    self.imageViewFrameOffsetWidth = JobsWidth(0);// 等价于用这个 self.imageView.resetByOffsetWidth(JobsWidth(0));
    self.imageViewFrameOffsetHeight = JobsWidth(0);// 等价于用这个 self.imageView.resetByOffsetHeight(JobsWidth(0));
}
#pragma mark —— 子类重写父类方法
- (void)setSelected:(BOOL)selected
           animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
/// CXB 所言 全局只有在cellForRowAtIndexPath里面才能设置真正的selected值。而didSelectRowAtIndexPath不行
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    NSLog(@"%d",self.selected);
}
//@synthesize selected = _selected;
//-(void)setSelected:(BOOL)selected{
//    selected = _selected;
//}

-(void)setEditing:(BOOL)editing
         animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self printValue];
    /// 取内部类UITableViewCellEditControl,对编辑状态的Cell的点击按钮进行替换成自定义的
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
    [self modifySysChildViewFrame1];
    // 或者
    [self modifySysChildViewFrame2];
}
/**
 1、-(void)setFrame:(CGRect)frame 此方法仅限于具体的 UITableViewCell子类使用
 2、如果在 JobsBaseTableViewCell 实现此方法，那么一单相关子类集成 JobsBaseTableViewCell 则会对-(void)setFrame:(CGRect)frame进行反复调用，因为[super setFrame:frame];
 3、禁止分类去调用，否则引起异常
 */
-(void)setFrame:(CGRect)frame{
    if (self.class == JobsBaseTableViewCell.class) {
        NSLog(@"self.offsetXForEach = %f",self.offsetXForEach);
        NSLog(@"self.offsetYForEach = %f",self.offsetYForEach);
        frame.origin.x += self.offsetXForEach;
        frame.origin.y += self.offsetYForEach;
        frame.size.height -= self.offsetYForEach * 2;
        frame.size.width -= self.offsetXForEach * 2;
    }
    [super setFrame:frame];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)heightForFooterInSection:(id _Nullable)model{
    return JobsWidth(10);
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)heightForHeaderInSection:(id _Nullable)model{
    return JobsWidth(10);
}
/// 获取绑定的数据源
-(UIViewModel *)getViewModel{
    return _viewModel;
}
#pragma mark —— BaseCellProtocol
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    if (model) {
        self.viewModel = model;
        /**
         - NSString -
         -(NSString *)omitByReplaceStr:(NSString *_Nullable)replaceStr
                       replaceStrLenth:(NSInteger)replaceStrLenth
                         lineBreakMode:(NSLineBreakMode)lineBreakMode
                                 limit:(NSInteger)limit;
         */
        if (model.textModel.attributedText) {
            self.textLabel.attributedText = model.textModel.attributedText;
        }else{
            self.textLabel.text = [NSString stringWithFormat:@"%@",model.textModel.text];
            self.textLabel.textColor = self.viewModel.textModel.textCor;
            self.textLabel.font = self.viewModel.textModel.font;
        }
        
        if (model.subTextModel.attributedText) {
            self.detailTextLabel.attributedText = model.subTextModel.attributedText;
        }else{
            self.detailTextLabel.text = [NSString stringWithFormat:@"%@",model.subTextModel.text];
            self.detailTextLabel.textColor = self.viewModel.subTextModel.textCor;
            self.detailTextLabel.font = self.viewModel.subTextModel.font;
            self.detailTextLabel.width = UITableViewCellSubTitleWidth;
            self.detailTextLabel.makeLabelByShowingType(UILabelShowingType_05);
        }
        self.textLabel.numberOfLines = 0;
        self.detailTextLabel.numberOfLines = 0;
        self.imageView.image = self.viewModel.image;
    }
}

+(CGFloat)cellHeightWithModel:(UIViewModel *_Nullable)model{
    if(model){
        UIViewModel *vm = UIViewModel.new;
        NSString *title = JobsInternationalization(@"");
        NSString *subtitle = JobsInternationalization(@"");
        if(model.textModel.attributedText.string.length){
            title = model.textModel.attributedText.string;
            vm.textModel.font = model.textModel.attributedText.attributedStringFont ? : UIFontWeightRegularSize(14);
            vm.textModel.textLineSpacing = model.textModel.attributedText.attributedStringParagraphStyle.lineSpacing;
        }else{
            title = model.textModel.text;
            vm.textModel.font = model.textModel.font ? : UIFontWeightRegularSize(14);
            vm.textModel.textLineSpacing = model.textModel.textLineSpacing;
        }
        
        if(model.subTextModel.attributedText.string.length){
            subtitle = model.subTextModel.attributedText.string;
            vm.textModel.font = model.subTextModel.attributedText.attributedStringFont ? : UIFontWeightRegularSize(14);
            vm.textModel.textLineSpacing = model.subTextModel.attributedText.attributedStringParagraphStyle.lineSpacing;
        }else{
            subtitle = model.subTextModel.text;
            vm.textModel.font = model.subTextModel.font ? : UIFontWeightRegularSize(14);
            vm.textModel.textLineSpacing = model.subTextModel.textLineSpacing;
        }
        /// 主标题和副标题进行比较，以最长文本为标准执行
        vm.textModel.text = title.length >= subtitle.length ? title : subtitle;
        vm.jobsWidth = UITableViewCellTitleWidth;
        
        return [vm.textModel.text jobsTextHeightWithFont:vm.textModel.font
                                              lineHeight:vm.textModel.textLineSpacing
                                            controlWidth:vm.jobsWidth].jobsHeight;
    }return JobsWidth(50);/// 没有数据源传入的时候的缺省值
}
#pragma mark —— @synthesize UIViewModelProtocol
UIViewModelProtocol_synthesize
-(void)setIndexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
}

-(NSIndexPath *)indexPath{
    return _indexPath;
}

@end
