//
//  JobsToggleNavViewProtocol.h
//  FM
//
//  Created by User on 7/22/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol JobsToggleNavViewProtocol <NSObject>
@optional
/// 标签按钮文字颜色_未选中时
@property(nonatomic,strong)UIColor *tagTextColor_normal;
/// 标签按钮文字颜色_选中时
@property(nonatomic,strong)UIColor *tagTextColor_selected;
/// 标签按钮文字颜色_未选中时
@property(nonatomic,assign)CGFloat tagTextFont_normal;
/// 标签按钮文字颜色_选中时
@property(nonatomic,assign)CGFloat tagTextFont_selected;
/// 滑块颜色
@property(nonatomic,strong)UIColor *sliderColor;
/// 滑块宽度
@property(nonatomic,assign)CGFloat sliderW;
/// 滑块高度
@property(nonatomic,assign)CGFloat sliderH;
/// 当前选择的标签按钮 index
@property(nonatomic,assign,readonly)NSUInteger current_index;
/// 标签按钮数据源
@property(nonatomic,strong,null_resettable)UIButtonModel *buttonModel;

@end

NS_ASSUME_NONNULL_END

#pragma mark —— @synthesize UITextModelProtocol
/// 和 UIViewModel 重复定义的部分
#ifndef JobsToggleNavViewProtocolSynthesize
#define JobsToggleNavViewProtocolSynthesize \
@synthesize tagTextColor_normal = _tagTextColor_normal;\
@synthesize tagTextColor_selected = _tagTextColor_selected;\
@synthesize tagTextFont_normal = _tagTextFont_normal;\
@synthesize tagTextFont_selected = _tagTextFont_selected;\
@synthesize sliderColor = _sliderColor;\
@synthesize sliderW = _sliderW;\
@synthesize sliderH = _sliderH;\
@synthesize current_index = _current_index;\
@synthesize buttonModel = _buttonMode;\

#endif

#pragma mark —— @dynamic UITextModelProtocol
#ifndef JobsToggleNavViewProtocol_dynamic
#define JobsToggleNavViewProtocol_dynamic \
@dynamic tagTextColor_normal;\
@dynamic tagTextColor_selected;\
@dynamic tagTextFont_normal;\
@dynamic tagTextFont_selected;\
@dynamic sliderColor;\
@dynamic sliderW;\
@dynamic sliderH;\
@dynamic current_index;\
@dynamic buttonModel;\

#endif
