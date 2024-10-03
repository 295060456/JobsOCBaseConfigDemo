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
/// 滑块之间的距离
@property(nonatomic,assign)CGFloat btn_each_offset;
/// 滑块颜色
@property(nonatomic,strong)UIColor *sliderColor;
/// 滑块宽度
@property(nonatomic,assign)CGFloat sliderW;
/// 滑块高度
@property(nonatomic,assign)CGFloat sliderH;
/// 当前选择的标签按钮 index
@property(nonatomic,assign,readonly)NSUInteger current_index;

@end

NS_ASSUME_NONNULL_END

#pragma mark —— @synthesize UITextModelProtocol
/// 和 UIViewModel 重复定义的部分
#ifndef JobsToggleNavViewProtocolSynthesize
#define JobsToggleNavViewProtocolSynthesize \
@synthesize btn_each_offset = _btn_each_offset;\
@synthesize sliderColor = _sliderColor;\
@synthesize sliderW = _sliderW;\
@synthesize sliderH = _sliderH;\
@synthesize current_index = _current_index;\
@synthesize buttonModel = _buttonModel;\

#endif

#pragma mark —— @dynamic UITextModelProtocol
#ifndef JobsToggleNavViewProtocol_dynamic
#define JobsToggleNavViewProtocol_dynamic \
@dynamic btn_each_offset;\
@dynamic sliderColor;\
@dynamic sliderW;\
@dynamic sliderH;\
@dynamic current_index;\
@dynamic buttonModel;\

#endif
