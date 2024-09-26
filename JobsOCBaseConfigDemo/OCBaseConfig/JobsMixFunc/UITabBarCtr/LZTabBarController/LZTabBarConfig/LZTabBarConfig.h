//
//  LZTabBarConfig.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/14.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface LZTabBarConfig : NSObject
/// 控制器数组, 必须设置
@property (nonatomic,strong)NSArray *viewControllers;
/// item标题数组, 选择设置
@property (nonatomic,strong)NSArray *titles;
/// 是否是导航, 默认 YES
@property (nonatomic,assign)BOOL isNavigation;
/// 选中状态下的图片数组
@property (nonatomic,strong)NSArray *selectedImages;
/// 正常状态下的图片数组
@property (nonatomic,strong)NSArray *normalImages;
/// 选中状态下的标题颜色 默认: red
@property (nonatomic,strong)UIColor *selectedColor;
/// 正常状态下的标题颜色 默认: gray
@property (nonatomic,strong)UIColor *normalColor;

@end

NS_ASSUME_NONNULL_END

static inline __kindof LZTabBarConfig *_Nonnull jobsMakeLZTabBarConfig(jobsByLZTabBarConfigBlock _Nonnull block){
    LZTabBarConfig *data = LZTabBarConfig.alloc.init;
    if (block) block(data);
    return data;
}
