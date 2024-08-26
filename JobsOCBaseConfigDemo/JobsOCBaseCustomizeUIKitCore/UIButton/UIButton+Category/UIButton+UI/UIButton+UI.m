//
//  UIButton+UI.m
//  Casino
//
//  Created by Jobs on 2021/11/29.
//

#import "UIButton+UI.h"
/**
 NSLineBreakByWordWrapping：这是默认的换行模式，会在单词边界换行。适用于希望保留单词完整性的场合。例如，如果单词太长而无法放入当前行，那么该单词将移动到下一行。
 NSLineBreakByCharWrapping：在字符边界处换行，而不是单词边界。适用于需要最大限度地利用行宽的场合，即使这意味着单词会被拆分。
 */
@implementation UIButton (UI)
#pragma mark —— 一些功能性
/// 为了兼容新的Api，批量设定UIButton
/// 新Api较老的Api，增加了subTitle
/// 资料来源：https://www.jianshu.com/p/12426709420e
/// - Parameters:
///   - btnConfiguration: 来自新Api的配置文件。UIButtonConfiguration.filledButtonConfiguration;
///   - background: 自定义按钮背景的配置
///   - buttonConfigTitleAlignment: 针对文本的对齐方式 UIButtonConfiguration.titleAlignment 【新Api】
///   - textAlignment: 针对文本的对齐方式 UIButton.titleLabel.titleAlignment【老Api】。也对应新Api里面的title的对齐方式
///   - subTextAlignment:也对应新Api里面的subTitle的对齐方式
///   - normalImage: 正常情况下的image
///   - highlightImage: 高亮情况下的image
///   - attributedTitle: 主标题的富文本（优先级高于普通文本）。设置富文本，请关注：#import "NSObject+RichText.h"
///   - selectedAttributedTitle:（只限于老Api，新Api里面没有）UIControlStateSelected状态下的标题富文本。设置富文本，请关注：#import "NSObject+RichText.h"
///   - attributedSubtitle:（新Api才有的）副标题的富文本（优先级高于普通文本）。设置富文本，请关注：#import "NSObject+RichText.h"
///   - title: 主标题
///   - subTitle:（新Api才有的）副标题
///   - titleFont: 主标题字体
///   - subTitleFont:（新Api才有的）副标题字体
///   - titleCor: 主标题文字颜色
///   - subTitleCor: 副标题文字颜色
///   - titleLineBreakMode: 主标题换行模式
///   - subtitleLineBreakMode:（新Api才有的）副标题换行模式
///   - baseBackgroundColor: 背景颜色
///   - backgroundImage:背景图片
///   - imagePadding: ❤️图像与标题之间的间距❤️
///   - titlePadding: 标题和副标题标签之间的距离
///   - imagePlacement: ❤️图片和文字的位置关系❤️
///   - contentHorizontalAlignment: 针对内容的横向对齐方式
///   - contentVerticalAlignment: 针对内容的竖向对齐方式
///   - contentInsets: 定位内边距的方向
///   - cornerRadiusValue: 圆切角—作用于所有的角
///   - roundingCorners: 圆切角—作用于指定的方位   ❤️这个属性如果不是UIRectCornerAllCorners，在某些情况下，按钮会不可见
///   - roundingCornersRadii: 圆切角—指定方位的Size大小
///   - layerBorderCor: 描边的颜色
///   - borderWidth: 描边线的宽度
///   - primaryAction: 新Api的点击事件
///   - longPressGestureEventBlock: 按钮的长按事件
///   - clickEventBlock: 老Api的点击事件，利用RAC实现
///   如果同时设置 clickEventBlock 和 primaryAction，会优先响应新的Api，再响应老的Api
-(instancetype)jobsInitBtnByConfiguration:(UIButtonConfiguration *_Nullable)btnConfiguration
                               background:(UIBackgroundConfiguration *_Nullable)background
               buttonConfigTitleAlignment:(UIButtonConfigurationTitleAlignment)buttonConfigTitleAlignment/// 针对文本的对齐方式 UIButtonConfiguration.titleAlignment 【新Api】
                            textAlignment:(NSTextAlignment)textAlignment/// 针对文本的对齐方式 UIButton.titleLabel.titleAlignment【老Api】
                         subTextAlignment:(NSTextAlignment)subTextAlignment
                              normalImage:(UIImage *_Nullable)normalImage
                           highlightImage:(UIImage *_Nullable)highlightImage
                          attributedTitle:(NSAttributedString *_Nullable)attributedTitle
                  selectedAttributedTitle:(NSAttributedString *_Nullable)selectedAttributedTitle
                       attributedSubtitle:(NSAttributedString *_Nullable)attributedSubtitle
                                    title:(NSString *_Nullable)title
                                 subTitle:(NSString *_Nullable)subTitle
                                titleFont:(UIFont *_Nullable)titleFont
                             subTitleFont:(UIFont *_Nullable)subTitleFont
                                 titleCor:(UIColor *_Nullable)titleCor
                              subTitleCor:(UIColor *_Nullable)subTitleCor
                       titleLineBreakMode:(NSLineBreakMode)titleLineBreakMode/// 对应老Api中的：UIButton.lineBreakMode
                    subtitleLineBreakMode:(NSLineBreakMode)subtitleLineBreakMode
                      baseBackgroundColor:(UIColor *_Nullable)baseBackgroundColor
                          backgroundImage:(UIImage *_Nullable)backgroundImage
                             imagePadding:(CGFloat)imagePadding
                             titlePadding:(CGFloat)titlePadding
                           imagePlacement:(NSDirectionalRectEdge)imagePlacement/// 定义图文关系
               contentHorizontalAlignment:(UIControlContentHorizontalAlignment)contentHorizontalAlignment /// 针对内容
                 contentVerticalAlignment:(UIControlContentVerticalAlignment)contentVerticalAlignment /// 针对内容
                            contentInsets:(NSDirectionalEdgeInsets)contentInsets/// 对应老Api中的：UIButton.contentEdgeInsets
                        cornerRadiusValue:(CGFloat)cornerRadiusValue
                          roundingCorners:(UIRectCorner)roundingCorners
                     roundingCornersRadii:(CGSize)roundingCornersRadii
                           layerBorderCor:(UIColor *_Nullable)layerBorderCor
                              borderWidth:(CGFloat)borderWidth
                            primaryAction:(UIAction *_Nullable)primaryAction
               longPressGestureEventBlock:(JobsReturnIDBySelectorBlock _Nullable)longPressGestureEventBlock
                          clickEventBlock:(JobsReturnIDByIDBlock _Nullable)clickEventBlock{
    if(!btnConfiguration) btnConfiguration = UIButtonConfiguration.filledButtonConfiguration;
    if(!background) background = UIBackgroundConfiguration.clearConfiguration;
    {/// 一般的文字
        btnConfiguration.title = title;
        btnConfiguration.subtitle = subTitle;
        btnConfiguration.titlePadding = titlePadding;
        btnConfiguration.baseForegroundColor = titleCor;/// 文本颜色
        btnConfiguration.titleAlignment = buttonConfigTitleAlignment;/// 文本的对齐方式
        btnConfiguration.titleLineBreakMode = titleLineBreakMode;/// 主标题的提行方式
        btnConfiguration.subtitleLineBreakMode = subtitleLineBreakMode;/// 副标题的提行方式
        if(titleFont && titleCor){
            btnConfiguration.titleTextAttributesTransformer = [self jobsSetConfigTextAttributesTransformerByTitleFont:titleFont
                                                                                                          btnTitleCor:titleCor];
        }
        if(subTitleFont && subTitleCor){
            btnConfiguration.subtitleTextAttributesTransformer = [self jobsSetConfigTextAttributesTransformerByTitleFont:subTitleFont
                                                                                                             btnTitleCor:subTitleCor];
        }
    }
    {/// 图片
        btnConfiguration.imagePadding = imagePadding;/// 设置图像与标题之间的间距
        btnConfiguration.image = normalImage;
        btnConfiguration.imagePlacement = imagePlacement;
        background.edgesAddingLayoutMarginsToBackgroundInsets = imagePlacement;
        background.image = backgroundImage;
        /// ❤️要设置UIButton.imageView的宽\高\尺寸\坐标，请参阅 BaseButtonProtocol❤️
    }
#warning 这个方法，同时设置了普通文本和富文本，其实是走富文本的创建路线。富文本4要素：文字信息、文字颜色、段落、字体
    {/// 富文本 优先级高于普通文本
        /// 设置按钮标题的文本属性
        if (attributedTitle) {
            btnConfiguration.attributedTitle = attributedTitle;
        }else{
            if(titleFont && titleCor && title){
                btnConfiguration.attributedTitle = [NSAttributedString.alloc initWithString:title
                                                                                 attributes:@{NSForegroundColorAttributeName:titleCor,
                                                                                              NSFontAttributeName:titleFont,
                                                                                              NSParagraphStyleAttributeName:self.jobsparagraphStyleByTextAlignment(textAlignment)}];
            }
        }
        /// 设置按钮副标题的文本属性
        if(attributedSubtitle){
            btnConfiguration.attributedSubtitle = attributedSubtitle;
        }else{
            if(subTitleFont && subTitleCor && subTitle){
                btnConfiguration.attributedSubtitle = [NSAttributedString.alloc initWithString:subTitle
                                                                                 attributes:@{NSForegroundColorAttributeName:subTitleCor,
                                                                                              NSFontAttributeName:subTitleFont,
                                                                                              NSParagraphStyleAttributeName:self.jobsparagraphStyleByTextAlignment(subTextAlignment)}];
            }
        }
    }
    {/// 其他
        /// 内边距
        btnConfiguration.contentInsets = contentInsets;
        background.backgroundInsets = contentInsets;
        /// 背景颜色
        background.backgroundColor = baseBackgroundColor;
        btnConfiguration.baseBackgroundColor = baseBackgroundColor;
        /// 圆切角
        background.cornerRadius = cornerRadiusValue;
        /// 描边的颜色和线宽
        background.strokeColor = layerBorderCor;
        background.strokeWidth = borderWidth;
    }
    
    btnConfiguration.background = background;
    UIButton *btn = nil;
    
    if(self.deviceSystemVersion.floatValue >= 15.0){
        btn = [self.class buttonWithConfiguration:btnConfiguration
                                    primaryAction:primaryAction];
        
        NSLog(@"%@",btnConfiguration);
        NSLog(@"%@",btn.configuration);
        NSLog(@"");
    /**
     UIAction *action = [UIAction actionWithTitle:@"按钮点击操作"
                                            image:nil
                                       identifier:nil
                                          handler:^(__kindof UIAction * _Nonnull action) {
         NSLog(@"按钮被点击了！");
         // 在这里执行按钮点击时的操作
     }];
     */
    }else{
        if(self == [UIButton buttonWithType:UIButtonTypeSystem]){
            btn = self;
            /// 公共设置
            self.normalImage(normalImage);
            self.titleFont(titleFont);
            
            if(attributedTitle){
                self.normalAttributedTitle(attributedTitle);
            }else{
                self.normalTitle(title);
                self.normalTitleColor(titleCor);
            }
            SuppressWdeprecatedDeclarationsWarning(btn.contentEdgeInsets = UIEdgeInsetsMake(contentInsets.top,
                                                                                            contentInsets.leading,
                                                                                            contentInsets.bottom,
                                                                                            contentInsets.trailing););
            if(selectedAttributedTitle) self.selectedAttributedTitle(selectedAttributedTitle);
            /// 在按钮高亮状态变化时，使用 configurationUpdateHandler 来自定义图像样式
            self.configurationUpdateHandler = ^(UIButton * _Nonnull updatedButton) {
                updatedButton.configuration.image = updatedButton.isHighlighted ? highlightImage : normalImage;
            };
            self.titleLabel.textAlignment = textAlignment;
            [self layoutButtonWithEdgeInsetsStyle:imagePlacement
                                     imagePadding:imagePadding];
        }else{
            NSLog(@"初始化UIButton失败");
            NSAssert(0, @"初始化失败");
        }
    }
    {/// 公共设置
        if(self.deviceSystemVersion.floatValue < 15.0){
            [btn layerBorderCor:layerBorderCor andBorderWidth:borderWidth];/// 描边
        }
        
        if(roundingCorners == UIRectCornerAllCorners && jobsZeroSizeValue(roundingCornersRadii)){
            btn.cornerCutToCircleWithCornerRadius(cornerRadiusValue);/// 圆切角（四个角全部按照统一的标准切）
        }else{
            [btn appointCornerCutToCircleByRoundingCorners:roundingCorners
                                               cornerRadii:roundingCornersRadii];/// 圆切角（指定某个角按照统一的标准Size切）
        }
        /// 内容的对齐方式
        btn.contentVerticalAlignment = contentVerticalAlignment;
        btn.contentHorizontalAlignment = contentHorizontalAlignment;
        /// 按钮的点击事件
        [btn jobsBtnClickEventBlock:clickEventBlock];
        /// 按钮的长按事件
        [btn jobsBtnLongPressGestureEventBlock:longPressGestureEventBlock];
    }return btn;
}
/// UIButtonConfiguration 创建的UIbutton修改字体以及颜色的方法
/// 注意⚠️因为UIConfigurationTextAttributesTransformer是没有办法直接获取到里面的字体的，只能从外面生成以后直接赋值，也就是每次修改需要给一个完整的UIConfigurationTextAttributesTransformer对象进UIButtonConfiguration
-(void)jobsSetBtnTitleFont:(UIFont *_Nullable)titleFont
               btnTitleCor:(UIColor *_Nullable)titleCor{
    self.jobsResetTitleTextAttributesTransformer([self jobsSetConfigTextAttributesTransformerByTitleFont:titleFont
                                                                                             btnTitleCor:titleCor]);
}

-(void)jobsSetBtnSubTitleFont:(UIFont *_Nullable)subTitleFont
               btnSubTitleCor:(UIColor *_Nullable)subTitleCor{
    self.jobsResetSubtitleTextAttributesTransformer([self jobsSetConfigTextAttributesTransformerByTitleFont:subTitleFont
                                                                                                btnTitleCor:subTitleCor]);
}
/// @property (nonatomic, readwrite, assign) UIButtonConfigurationSize buttonSize; 这个属性，不是我们想要的UIFont。设置UIFont必须在富文本里面进行设置
-(UIConfigurationTextAttributesTransformer)jobsSetConfigTextAttributesTransformerByTitleFont:(UIFont *_Nullable)titleFont
                                                                                 btnTitleCor:(UIColor *_Nullable)titleCor{
    return ^NSDictionary<NSAttributedStringKey, id> *(NSDictionary<NSAttributedStringKey, id> *textAttributes) {
        NSMutableDictionary<NSAttributedStringKey, id> *newTextAttributes = textAttributes.mutableCopy;
        if(titleFont){
            [newTextAttributes addEntriesFromDictionary:@{
                NSFontAttributeName:titleFont /// 替换为你想要的字体和大小
            }];
        }
        
        if(titleCor){
            [newTextAttributes addEntriesFromDictionary:@{
                NSForegroundColorAttributeName:titleCor /// 替换为你想要的文本颜色
            }];
        }return newTextAttributes;
    };
}
/// 通过 Transformer 得到 字体
-(JobsReturnFontByConfigurationTextAttributesTransformerBlock)getTitleFontFromTransformer{
    return ^(UIConfigurationTextAttributesTransformer transformer) {
        if(!transformer) return (UIFont *)nil;
        // 创建一个示例的 textAttributes 字典
        NSDictionary<NSAttributedStringKey, id> *exampleAttributes = @{};
        // 获取 transformer 转换后的属性字典
        NSDictionary<NSAttributedStringKey, id> *newTextAttributes = transformer(exampleAttributes);
        // 从新的字典中提取 titleFont
        UIFont *titleFont = newTextAttributes[NSFontAttributeName];
        return titleFont;
    };
}
/// 通过 Transformer 得到 文字颜色
-(JobsReturnColorByConfigurationTextAttributesTransformerBlock)getTitleColorFromTransformer{
    return ^(UIConfigurationTextAttributesTransformer transformer) {
        if(!transformer) return (UIColor *)nil;
        // 创建一个示例的 textAttributes 字典
        NSDictionary<NSAttributedStringKey, id> *exampleAttributes = @{};
        // 获取 transformer 转换后的属性字典
        NSDictionary<NSAttributedStringKey, id> *newTextAttributes = transformer(exampleAttributes);
        // 从新的字典中提取 titleCor
        UIColor *titleCor = newTextAttributes[NSForegroundColorAttributeName];
        return titleCor;
    };
}
/// RAC 点击事件2次封装
-(RACDisposable *)jobsBtnClickEventBlock:(JobsReturnIDByIDBlock)subscribeNextBlock{
    return [[self rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIButton * _Nullable x) {
        if(subscribeNextBlock) subscribeNextBlock(x);
    }];
}
/// 设置按钮的长按手势
-(void)jobsBtnLongPressGestureEventBlock:(JobsReturnIDBySelectorBlock)longPressGestureEventBlock{
    @jobs_weakify(self)
    if(longPressGestureEventBlock){
        self.userInteractionEnabled = YES;
        self.numberOfTouchesRequired = 1;
        self.numberOfTapsRequired = 0;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
        self.minimumPressDuration = 0.1;
        self.numberOfTouchesRequired = 1;
        self.allowableMovement = 1;
        self.target = weak_self;/// ⚠️注意：任何手势这一句都要写
        NSLog(@"%@",NSStringFromSelector(self.longPressGR_SelImp.selector));
        if (!NSStringFromSelector(self.longPressGR_SelImp.selector)) {
            SEL d = [self selectorBlocks:longPressGestureEventBlock
                            selectorName:nil
                                  target:self];// selector_2147483647_146_
            self.longPressGR_SelImp.selector = [self selectorBlocks:longPressGestureEventBlock
                                                       selectorName:nil
                                                             target:self];
            [self jobsSelectorBlock:longPressGestureEventBlock];
        }
        NSLog(@"%@",NSStringFromSelector(self.longPressGR_SelImp.selector));//
        self.longPressGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
    }
}
/// 方法名字符串（带参数、参数之间用"："隔开）、作用对象、参数
-(JobsReturnIDByThreeIDBlock)btnClickActionWithParamarrays{
    // SEL method = @selector(func);//定义一个类方法的指针，selector查找是当前类（包含子类）的方法
    // SEL 用 assign修饰
    @jobs_weakify(self)
    return ^(NSString * _Nonnull methodName,
             id _Nonnull targetObj,
             NSArray * _Nullable paramarrays){
        @jobs_strongify(self)
        return [[self rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIButton * _Nullable x) {
            [NSObject methodName:methodName
                       targetObj:targetObj
                     paramarrays:paramarrays];
        }];
    };
}
/// 方法名字符串（不带参数）、作用对象
-(JobsReturnIDByTwoIDBlock)btnClickActionWithMethodName{
    return ^(NSString * _Nonnull methodName,
             id _Nonnull targetObj){
        SuppressWarcPerformSelectorLeaksWarning(return [self jobsBtnClickEventBlock:^(id data) {
            return [targetObj performSelector:NSSelectorFromString(methodName) withObject:nil];
         }];);
    };
}
/// 代码触发点击调用
-(jobsByVoidBlock _Nonnull)actionByCode{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        [self sendActionsForControlEvents:UIControlEventTouchUpInside];
    };
}
/// UIButton 上的 image 旋转一定的角度angle
-(void)changeAction:(CGFloat)angle{
    @jobs_weakify(self)
    [UIView animateWithDuration:.3f
                     animations:^{
        @jobs_strongify(self)
        self.imageView.transform = CGAffineTransformMakeRotation(M_PI * angle);/// 最后实际改变位置
    }];
}
/// 当Button不可用的时候，需要做些什么
-(jobsByBOOLBlock _Nonnull)enabledBlock{
    @jobs_weakify(self)
    return ^(BOOL enabled) {
        @jobs_strongify(self)
        self.enabled = enabled;
        self.normalTitleColor(self.enabled ? self.titleColorForNormalState : HEXCOLOR(0xB0B0B0));
    };
}
/// 重设UIButtonConfiguration并使之生效  JobsReturnButtonConfigurationByButtonConfigurationBlock
-(void)jobsUpdateButtonConfiguration:(jobsByButtonConfigurationBlock)configurationBlock {
    if (@available(iOS 16.0, *)) {
        UIButtonConfiguration *config = self.configuration.copy;
        if (configurationBlock) configurationBlock(config);
        self.configuration = config;
        [self updateConfiguration];
    }
}

-(UIButtonConfiguration *)JobsUpdateButtonConfiguration:(jobsByButtonConfigurationBlock)configurationBlock{
    [self jobsUpdateButtonConfiguration:configurationBlock];
    return self.configuration;
}
#pragma mark —— 一些通用修改（已做Api向下兼容）
/// 重设Btn的描边：线宽和线段的颜色
-(jobsByColor_FloatBlock)jobsResetBtnlayerBorderCorAndWidth{
    @jobs_weakify(self)
    return ^(UIColor *_Nullable layerBorderCor,float borderWidth) {
        @jobs_strongify(self)
        self.jobsResetBtnlayerBorderCor(layerBorderCor);
        self.jobsResetBtnlayerBorderWidth(borderWidth);
    };
}
/// 重设Btn的描边线段的颜色
-(jobsByCorBlock)jobsResetBtnlayerBorderCor{
    return ^(UIColor *_Nullable layerBorderCor) {
        @jobs_weakify(self)
        if(self.deviceSystemVersion.floatValue < 15.0){
            self.layer.borderColor = layerBorderCor.CGColor;
        }else{
            [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
                @jobs_strongify(self)
                config.background.strokeColor = layerBorderCor;
            }];
        }
    };
}
/// 重设Btn的描边线段的宽度
-(jobsByFloatBlock)jobsResetBtnlayerBorderWidth{
    @jobs_weakify(self)
    return ^(float borderWidth) {
        @jobs_strongify(self)
        if(self.deviceSystemVersion.floatValue < 15.0){
            self.layer.borderWidth = borderWidth;
        }else{
            [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
                config.background.strokeWidth = borderWidth;
            }];
        }
    };
}
/// 重设Btn的圆切角
-(jobsByCGFloatBlock)jobsResetBtnCornerRadiusValue{
    @jobs_weakify(self)
    return ^(CGFloat cornerRadiusValue) {
        @jobs_strongify(self)
        if(self.deviceSystemVersion.floatValue < 15.0){
            self.cornerCutToCircleWithCornerRadius(cornerRadiusValue);
        }else{
            [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
                config.background.cornerRadius = cornerRadiusValue;
            }];
        }
    };
}
/// 重设Btn主标题的文字内容
-(jobsByStringBlock)jobsResetBtnTitle{
    @jobs_weakify(self)
    return ^(NSString *_Nullable data) {
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            self.jobsResetTitle(data ? : JobsInternationalization(@"暂无数据"));
        } else self.normalTitle(data);
    };
}
/// 重设Btn副标题的文字内容
-(jobsByStringBlock)jobsResetBtnSubTitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(NSString *_Nullable data) {
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            self.jobsResetSubTitle(data ? : JobsInternationalization(@"暂无数据"));
        }
    };
}
/// 修改主标题的对齐方式
-(jobsByTextAlignmentBlock _Nonnull)jobsResetTitleTextAlignment API_AVAILABLE(ios(16.0)){
    return ^(NSTextAlignment data) {
        @jobs_weakify(self)
        [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            @jobs_strongify(self)
            if(config.subtitle){
                NSMutableDictionary <NSAttributedStringKey, id>*mutDic = NSMutableDictionary.dictionary;
                mutDic.add(NSForegroundColorAttributeName,self.getTitleColorFromTransformer(config.titleTextAttributesTransformer));
                mutDic.add(NSFontAttributeName,self.getTitleFontFromTransformer(config.titleTextAttributesTransformer));
                mutDic.add(NSParagraphStyleAttributeName,self.jobsparagraphStyleByTextAlignment(data));
                config.attributedSubtitle = [NSAttributedString.alloc initWithString:config.subtitle
                                                                          attributes:mutDic];
            }
        }];
    };
}
/// 修改副标题的对齐方式
-(jobsByTextAlignmentBlock _Nonnull)jobsResetSubTitleTextAlignment API_AVAILABLE(ios(16.0)){
    return ^(NSTextAlignment data) {
        @jobs_weakify(self)
        [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            @jobs_strongify(self)
            if(config.subtitle){
                NSMutableDictionary <NSAttributedStringKey, id>*mutDic = NSMutableDictionary.dictionary;
                mutDic.add(NSForegroundColorAttributeName,self.getTitleColorFromTransformer(config.subtitleTextAttributesTransformer));
                mutDic.add(NSFontAttributeName,self.getTitleFontFromTransformer(config.subtitleTextAttributesTransformer));
                mutDic.add(NSParagraphStyleAttributeName,self.jobsparagraphStyleByTextAlignment(data));
                config.attributedSubtitle = [NSAttributedString.alloc initWithString:config.subtitle
                                                                          attributes:mutDic];
            }
        }];
    };
}
/// 重设Btn.Image
-(jobsByImageBlock)jobsResetBtnImage{
    @jobs_weakify(self)
    return ^(UIImage *_Nullable data) {
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            self.jobsResetImage(data);
        } else self.normalImage(data);
    };
}
/// 重设Btn主标题的文字颜色
-(jobsByCorBlock)jobsResetBtnTitleCor{
    @jobs_weakify(self)
    return ^(UIColor *_Nullable data) {
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            self.jobsResetTitleBaseForegroundColor(data ? : JobsBlueColor);
        } else self.normalTitleColor(data);
    };
}
/// 重设Btn副标题的文字颜色
-(jobsByCorBlock)jobsResetBtnSubTitleCor API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIColor *_Nullable data) {
        @jobs_strongify(self)
        self.jobsResetSubTitleBaseForegroundColor(data);
    };
}
/// 重设Btn主标题的背景颜色
-(jobsByCorBlock)jobsResetBtnBgCor{
    @jobs_weakify(self)
    return ^(UIColor *_Nullable data) {
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            self.jobsResetBaseBackgroundColor(data ? : JobsCyanColor);
        } else self.backgroundColor = data;
    };
}
/// 重设Btn的背景图片
-(jobsByImageBlock)jobsResetBtnBgImage{
    @jobs_weakify(self)
    return ^(UIImage *_Nullable data) {
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            self.jobsResetBackgroundImage(data);
        } else self.normalBackgroundImage(data);
    };
}

-(jobsByBOOLBlock _Nonnull)makeNewLineShows{
    @jobs_weakify(self)
    return ^(BOOL breakLine) {
        @jobs_strongify(self)
        self.titleLabel.numberOfLines = !breakLine;
    };
}

-(jobsByNSIntegerBlock _Nonnull)titleAlignment{
    return ^(NSTextAlignment textAlignment) {
        if (@available(iOS 16.0, *)) {
            @jobs_weakify(self)
            [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
                @jobs_strongify(self)
                NSMutableDictionary <NSAttributedStringKey, id>*mutDic = NSMutableDictionary.dictionary;
                mutDic.add(NSForegroundColorAttributeName,self.normalTitleColor);
                mutDic.add(NSFontAttributeName,self.titleFont);
                mutDic.add(NSParagraphStyleAttributeName,self.jobsparagraphStyleByTextAlignment (textAlignment));
                config.attributedTitle = [NSAttributedString.alloc initWithString:self.titleForNormalState
                                                                       attributes:mutDic];
            }];
        } else self.titleLabel.textAlignment = textAlignment;
    };
}

-(jobsByFontBlock _Nonnull)titleFont{
    return ^(UIFont *_Nonnull font) {
        if (@available(iOS 16.0, *)) {
            @jobs_weakify(self)
            [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
                @jobs_strongify(self)
                config.titleTextAttributesTransformer = [self jobsSetConfigTextAttributesTransformerByTitleFont:font btnTitleCor:self.titleColorForNormalState];
            }];
        } else self.titleLabel.font = font;
    };
}

-(jobsByFontBlock _Nonnull)subTitleFont{
    return ^(UIFont *_Nonnull font) {
        @jobs_weakify(self)
        if (@available(iOS 16.0, *)) {
            [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
                @jobs_strongify(self)
                config.subtitleTextAttributesTransformer =
                [self jobsSetConfigTextAttributesTransformerByTitleFont:font
                                                            btnTitleCor:self.getTitleColorFromTransformer(config.subtitleTextAttributesTransformer)];
            }];
        } else self.titleLabel.font = font;
    };
}

-(jobsByImageBlock _Nonnull)normalImage{
    @jobs_weakify(self)
    return ^(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
                config.image = image;
            }];
        } else [self setImage:image forState:UIControlStateNormal];
    };
}

-(jobsByImageBlock _Nonnull)normalBackgroundImage{
    @jobs_weakify(self)
    return ^(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
                config.background.image = backgroundImage;
            }];
        } else [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    };
}

-(jobsByStringBlock _Nonnull)normalTitle{
    @jobs_weakify(self)
    return ^(NSString *_Nonnull title) {
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
                config.title = title;
            }];
        } else [self setTitle:title forState:UIControlStateNormal];
    };
}

-(jobsByCorBlock _Nonnull)normalTitleColor{
    @jobs_weakify(self)
    return ^(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
                config.baseForegroundColor = titleColor;/// 文本颜色
            }];
        } else [self setTitleColor:titleColor forState:UIControlStateNormal];
    };
}

-(jobsByCorBlock _Nonnull)subTitleColor{
    @jobs_weakify(self)
    return ^(UIColor *_Nonnull color) {
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
                config.subtitleTextAttributesTransformer = [self jobsSetConfigTextAttributesTransformerByTitleFont:self.getTitleFontFromTransformer(config.subtitleTextAttributesTransformer) btnTitleCor:color];
            }];
        } else self.titleLabel.textColor = color;
    };
}
/// 富文本
-(jobsByAttributedStringBlock _Nonnull)normalAttributedTitle{
    @jobs_weakify(self)
    return ^(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
                config.attributedTitle = title;
            }];
        } else [self setAttributedTitle:title forState:UIControlStateNormal];
    };
}

-(jobsByCGFloatBlock _Nonnull)resetCornerRadius{
    @jobs_weakify(self)
    return ^(CGFloat cornerRadiusValue) {
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
                config.background.cornerRadius = cornerRadiusValue;
            }];
        } else self.cornerCutToCircleWithCornerRadius(cornerRadiusValue);
    };
}

-(jobsByCorBlock _Nonnull)resetLayerBorderCor{
    @jobs_weakify(self)
    return ^(UIColor *_Nullable layerBorderCor) {
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
                config.background.strokeColor = layerBorderCor;
            }];
        } else self.layer.borderColor = layerBorderCor.CGColor;
    };
}

-(jobsByCGFloatBlock _Nonnull)resetBorderWidth{
    @jobs_weakify(self)
    return ^(CGFloat borderWidth) {
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
                config.background.strokeWidth = borderWidth;
            }];
        } else self.layer.borderWidth = borderWidth;
    };
}
#pragma mark —— UIButton.带状态 set
/// 设置 UIButton 已选择状态下的 按钮图片
-(jobsByImageBlock _Nonnull)selectedImage{
    @jobs_weakify(self)
    return ^(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateSelected];
    };
}
/// 设置 UIButton 已选择状态下的 按钮背景图片
-(jobsByImageBlock _Nonnull)selectedBackgroundImage{
    @jobs_weakify(self)
    return ^(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateSelected];
    };
}
/// 设置 UIButton 已选择状态下的 按钮主标题
-(jobsByStringBlock _Nonnull)selectedTitle{
    @jobs_weakify(self)
    return ^(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateSelected];
    };
}
/// 设置 UIButton 已选择状态下的 按钮主标题的颜色
-(jobsByCorBlock _Nonnull)selectedTitleColor{
    @jobs_weakify(self)
    return ^(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateSelected];
    };
}
/// 设置 UIButton 已选择状态下的 按钮主标题的富文本内容
-(jobsByAttributedStringBlock _Nonnull)selectedAttributedTitle{
    @jobs_weakify(self)
    return ^(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        [self setAttributedTitle:title forState:UIControlStateSelected];
    };
}
/**
 1、一一对应UIButtonConfiguration.h文件里面的属性
 2、只有通过UIButtonConfiguration创建的UIButton，这个UIbutton的configuration属性才不为空
 3、要修改通过UIButtonConfiguration创建的UIButton的各属性值，只有通过下列方式方可以
 */
#pragma mark —— UIButton.configuration的各项属性值的修改
-(JobsReturnButtonConfigurationByBackgroundBlock _Nonnull)jobsResetBackground API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIBackgroundConfiguration *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.background = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByImageBlock _Nonnull)jobsResetBackgroundImage API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIImage *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.background.image = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByCornerStyleBlock _Nonnull)jobsResetCornerStyle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIButtonConfigurationCornerStyle data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.cornerStyle = data;
        }];
    };
}

-(JobsReturnButtonConfigurationBySizeBlock _Nonnull)jobsResetButtonSize API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIButtonConfigurationSize data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.buttonSize = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByMacIdiomStyleBlock _Nonnull)jobsResetMacIdiomStyle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIButtonConfigurationMacIdiomStyle data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.macIdiomStyle = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByBaseBackgroundColorBlock _Nonnull)jobsResetBaseBackgroundColor API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIColor *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            UIBackgroundConfiguration *bgConfig = config.background.copy;
            config.baseBackgroundColor = data;
            bgConfig.backgroundColor = data;
            config.background = bgConfig;
        }];
    };
}

-(JobsReturnButtonConfigurationByImageBlock _Nonnull)jobsResetImage API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIImage *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.image = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByImageColorTransformerBlock _Nonnull)jobsResetImageColorTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIConfigurationColorTransformer data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.imageColorTransformer = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByPreferredSymbolConfigurationForImageBlock _Nonnull)jobsResetPreferredSymbolConfigurationForImage API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIImageSymbolConfiguration *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.preferredSymbolConfigurationForImage = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByShowsActivityIndicatorBlock _Nonnull)jobsResetShowsActivityIndicator API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(BOOL data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.showsActivityIndicator = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByActivityIndicatorColorTransformerBlock _Nonnull)jobsResetActivityIndicatorColorTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIConfigurationColorTransformer data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.activityIndicatorColorTransformer = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByTitleBlock _Nonnull)jobsResetTitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(NSString *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.title = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByTitleBlock _Nonnull)jobsResetSubTitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(NSString *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.subtitle = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByAttributedTitleBlock _Nonnull)jobsResetAttributedTitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(NSAttributedString *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.attributedTitle = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByTitleTextAttributesTransformerBlock _Nonnull)jobsResetTitleTextAttributesTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIConfigurationTextAttributesTransformer data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.titleTextAttributesTransformer = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByTitleLineBreakModeBlock _Nonnull)jobsResetTitleLineBreakMode API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(NSLineBreakMode data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.titleLineBreakMode = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByTitleLineBreakModeBlock _Nonnull)jobsResetSubTitleLineBreakMode API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(NSLineBreakMode data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.subtitleLineBreakMode = data;
        }];
    };
}

-(JobsReturnButtonConfigurationBySubtitleBlock _Nonnull)jobsResetSubtitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(NSString *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.subtitle = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByAttributedSubtitleBlock _Nonnull)jobsResetAttributedSubtitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(NSAttributedString *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.attributedSubtitle = data;
        }];
    };
}

-(JobsReturnButtonConfigurationBySubtitleTextAttributesTransformerBlock _Nonnull)jobsResetSubtitleTextAttributesTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIConfigurationTextAttributesTransformer data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.subtitleTextAttributesTransformer = data;
        }];
    };
}

-(JobsReturnButtonConfigurationBySubtitleLineBreakModeBlock _Nonnull)jobsResetSubtitleLineBreakMode API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(NSLineBreakMode data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.subtitleLineBreakMode = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByIndicatorBlock _Nonnull)jobsResetIndicator API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIButtonConfigurationIndicator data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.indicator = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByIndicatorColorTransformerBlock _Nonnull)jobsResetIndicatorColorTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIConfigurationColorTransformer data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.indicatorColorTransformer = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByContentInsetsBlock _Nonnull)jobsResetContentInsets API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(NSDirectionalEdgeInsets data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.contentInsets = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByImagePlacementBlock _Nonnull)jobsResetImagePlacement API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(NSDirectionalRectEdge data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.imagePlacement = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByImagePaddingBlock _Nonnull)jobsResetImagePadding API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.imagePadding = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByTitlePaddingBlock _Nonnull)jobsResetTitlePadding API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(CGFloat data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.titlePadding = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByTitleAlignmentBlock _Nonnull)jobsResetTitleAlignment API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIButtonConfigurationTitleAlignment data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.titleAlignment = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByAutomaticallyUpdateForSelectionBlock _Nonnull)jobsResetAutomaticallyUpdateForSelection API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(BOOL data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.automaticallyUpdateForSelection = data;
        }];
    };
}

-(JobsReturnButtonConfigurationByBaseForegroundColorBlock _Nonnull)jobsResetTitleBaseForegroundColor API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIColor *data) {
        @jobs_strongify(self)
        [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.baseForegroundColor = data;
            self.configuration = config;
        }];
        self.jobsResetTitleTextAttributesTransformer([self jobsSetConfigTextAttributesTransformerByTitleFont:nil btnTitleCor:data]);
        [self updateConfiguration];
        return self.configuration;
    };
}

-(JobsReturnButtonConfigurationByBaseForegroundColorBlock _Nonnull)jobsResetSubTitleBaseForegroundColor API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIColor *data) {
        @jobs_strongify(self)
        [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
#warning UIButtonConfiguration 没有对subTitle字体颜色的描述
            config.baseForegroundColor = data;
            self.configuration = config;
        }];
        self.jobsResetSubtitleTextAttributesTransformer([self jobsSetConfigTextAttributesTransformerByTitleFont:nil btnTitleCor:data]);
        [self updateConfiguration];
        return self.configuration;
    };
}

-(jobsByFontBlock _Nonnull)jobsResetTitleFont API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIFont *data) {
        @jobs_strongify(self)
        self.jobsResetTitleTextAttributesTransformer([self jobsSetConfigTextAttributesTransformerByTitleFont:data btnTitleCor:nil]);
    };
}

-(jobsByFontBlock _Nonnull)jobsResetSubTitleFont API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^(UIFont *data) {
        @jobs_strongify(self)
        self.jobsResetSubtitleTextAttributesTransformer([self jobsSetConfigTextAttributesTransformerByTitleFont:data btnTitleCor:nil]);
    };
}
#pragma mark —— UIButton.带状态的 get
/// 获取 UIButton 已选择状态下的按钮图片
-(nullable UIImage *)imageForSelectedState{
    return [self imageForState:UIControlStateSelected];
}
/// 获取 UIButton 已选择状态下的背景图片
-(nullable UIImage *)backgroundImageForSelectedState{
    return [self backgroundImageForState:UIControlStateSelected];
}
/// 获取 UIButton 已选择状态下的 主标题的文本内容
-(nullable NSString *)titleForSelectedState{
    return [self titleForState:UIControlStateSelected];
}
/// 获取 UIButton 已选择状态下的 主标题的文本颜色
-(nullable UIColor *)titleColorForSelectedState{
    return [self titleColorForState:UIControlStateSelected];
}
/// 获取 UIButton 已选择状态下的 主标题的富文本内容
-(nullable NSAttributedString *)attributedTitleForSelectedState{
    return [self attributedTitleForState:UIControlStateSelected];
}
#pragma mark —— UIButton.UIControlStateNormal.get
-(nullable UIImage *)imageForNormalState{
    if (@available(iOS 16.0, *)) {
        return self.configuration.image ? : [self imageForState:UIControlStateNormal];
    } else return [self imageForState:UIControlStateNormal];
}

-(nullable UIImage *)backgroundImageForNormalState{
    if (@available(iOS 16.0, *)) {
        return self.configuration.background.image ? : [self backgroundImageForState:UIControlStateNormal];
    } else return [self backgroundImageForState:UIControlStateNormal];
}

-(nullable NSString *)titleForConfigurationAttributed{
    if (@available(iOS 16.0, *)) {
        return self.configuration.attributedTitle.string ? : self.titleLabel.attributedText.string;
    } else return self.titleLabel.attributedText.string;
}

-(nullable NSString *)titleForNormalState{
    if (@available(iOS 16.0, *)) {
        return self.configuration.title ? : [self titleForState:UIControlStateNormal];
    } else return [self titleForState:UIControlStateNormal];
}

-(nullable UIColor *)titleColorForNormalState{
    if (@available(iOS 16.0, *)) {
        return self.configuration.baseForegroundColor ? : [self titleColorForState:UIControlStateNormal];
    } else return [self titleColorForState:UIControlStateNormal];
}

-(nullable NSAttributedString *)attributedTitleForNormalState{
    if (@available(iOS 16.0, *)) {
        return self.configuration.attributedTitle ? : [self attributedTitleForState:UIControlStateNormal];
    } else return [self attributedTitleForState:UIControlStateNormal];
}
#pragma mark —— <BaseProtocol> @property(nonatomic,strong)RACDisposable *racDisposable;
JobsKey(_racDisposable)
@dynamic racDisposable;
-(RACDisposable *)racDisposable{
    return Jobs_getAssociatedObject(_racDisposable);
}

-(void)setRacDisposable:(RACDisposable *)racDisposable{
    Jobs_setAssociatedRETAIN_NONATOMIC(_racDisposable, racDisposable)
}

@end
