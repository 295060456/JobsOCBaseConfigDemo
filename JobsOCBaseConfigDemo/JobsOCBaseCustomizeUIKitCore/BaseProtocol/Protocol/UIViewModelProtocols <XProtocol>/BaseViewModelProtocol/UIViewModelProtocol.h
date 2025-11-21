//
//  UIViewModelProtocol.h
//  Casino
//
//  Created by Jobs on 2022/1/12.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "DefineProperty.h"
#import "XProtocol.h"
#import "MacroDef_App.h"
#import "MacroDef_Cor.h"
#import "MacroDef_Size.h"
#import "MacroDef_Func.h"
#import "UIImage+Extras.h"

NS_ASSUME_NONNULL_BEGIN
/// 全局的共用的属性。所有属性的大集合
@protocol UIViewModelProtocol<XProtocol>
//<
//NSObject,
//BaseLayerProtocol, /// <NSObject>：BaseLayerProtocol_synthesize、BaseLayerProtocol_dynamic
//UILocationProtocol, /// <NSObject>：UILocationProtocol_synthesize、UILocationProtocol_dynamic
//UIMarkProtocol, /// <NSObject>：UIMarkProtocol_synthesize、UIMarkProtocol_dynamic
//UIPictureAndBackGroundCorProtocol, /// <NSObject>： UIPictureAndBackGroundCorProtocol_synthesize、UIPictureAndBackGroundCorProtocol_dynamic
//UITextModelProtocol, /// <NSObject>：UITextModelProtocol_synthesize、UITextModelProtocol_dynamic
//UIViewModelOthersProtocol, /// <NSObject>：UIViewModelOthersProtocol_synthesize、UIViewModelOthersProtocol_dynamic
////BaseButtonProtocol, /// <NSObject>：
////UITextFieldProtocol, /// <NSObject>：
//RACProtocol /// <NSObject>：
//>
@optional
#pragma mark —— 文字配置
Prop_copy(nullable)JobsRetIDByIDBlock jobsBlock;
Prop_strong(nullable)NSMutableArray <JobsRetIDByIDBlock>*jobsBlockMutArr;
#pragma mark —— 图片配置
/// 普通图
Prop_copy(nullable)NSString *normalImageURLString;
Prop_strong(nullable)NSURL *normalImageURL;
/// 背景图
Prop_copy(nullable)NSString *normalBgImageURLString;
Prop_strong(nullable)NSURL *normalBgImageURL;
/// 标题用图片替代文字显示
Prop_strong()UIImage *titleImage;
#pragma mark —— UI约束
Prop_copy(nullable)jobsByMASConstraintMakerBlock masonryBlock; /// Masonry
Prop_assign()CGRect imageViewFrame;

@end

NS_ASSUME_NONNULL_END
/// 自带的属性
#ifndef UIViewModelProtocol_synthesize_part1
#define UIViewModelProtocol_synthesize_part1 \
\
@synthesize jobsBlock = _jobsBlock; \
@synthesize jobsBlockMutArr = _jobsBlockMutArr; \
@synthesize normalImageURLString = _normalImageURLString; \
@synthesize normalImageURL = _normalImageURL; \
@synthesize normalBgImageURLString = _normalBgImageURLString; \
@synthesize normalBgImageURL = _normalBgImageURL; \
@synthesize titleImage = _titleImage; \
@synthesize masonryBlock = _masonryBlock; \
@synthesize imageViewFrame = _imageViewFrame; \

#endif /* UIViewModelProtocol_synthesize_part1 */
/// 继承的属性（避免冲突）
#ifndef UIViewModelProtocol_synthesize_part2
#define UIViewModelProtocol_synthesize_part2 \
\
UIViewModelOthersProtocol_synthesize \
UIPictureAndBackGroundCorProtocol_synthesize \
UILocationProtocol_synthesize \
UIMarkProtocol_synthesize_part1 \
UITextModelProtocol_synthesize_part3 \
BaseLayerProtocol_synthesize_part2 \
UITextFieldProtocol_synthesize_part2 \

#endif /* UIViewModelProtocol_synthesize_part2 */

#ifndef UIViewModelProtocol_synthesize_part3
#define UIViewModelProtocol_synthesize_part3 \
\
@synthesize layerBorderCor = _layerBorderCor;\

#endif /* UIViewModelProtocol_synthesize_part3 */

#ifndef UIViewModelProtocol_synthesize
#define UIViewModelProtocol_synthesize \
\
BaseProtocol_synthesize \
RACProtocol_synthesize \
UIViewModelProtocol_synthesize_part1 \
UIViewModelProtocol_synthesize_part2 \

#endif /* UIViewModelProtocol_synthesize */

#ifndef UIViewModelProtocol_dynamic_part1
#define UIViewModelProtocol_dynamic_part1 \
\
@dynamic jobsBlock;\
@dynamic jobsBlockMutArr;\
@dynamic normalImageURLString;\
@dynamic normalImageURL;\
@dynamic normalBgImageURLString;\
@dynamic normalBgImageURL;\
@dynamic titleImage;\
@dynamic masonryBlock;\
@dynamic imageViewFrame;\

#endif /* UIViewModelProtocol_dynamic_part1 */
