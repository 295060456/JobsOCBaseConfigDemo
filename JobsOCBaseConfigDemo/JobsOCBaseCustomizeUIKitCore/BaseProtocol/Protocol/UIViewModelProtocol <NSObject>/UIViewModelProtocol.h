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
#import "UIPictureAndBackGroundCorProtocol.h"
#import "UILocationProtocol.h"
#import "UIMarkProtocol.h"
#import "UIViewModelOthersProtocol.h"
#import "BaseButtonProtocol.h"
#import "UITextModelProtocol.h"
#import "UITextFieldProtocol.h"
#import "BaseLayerProtocol.h"

#import "MacroDef_App.h"
#import "MacroDef_Cor.h"
#import "MacroDef_Size.h"
#import "MacroDef_Func.h"
#import "UIImage+Extras.h"

@class UIViewModel;
@class UITextModel;
@class UIButtonModel;

NS_ASSUME_NONNULL_BEGIN
/// 全局的共用的属性。所有属性的大集合
@protocol UIViewModelProtocol
<
UIViewModelOthersProtocol /// UIViewModelOthersProtocol_synthesize、UIViewModelOthersProtocol_dynamic
,UIPictureAndBackGroundCorProtocol /// UIPictureAndBackGroundCorProtocol_synthesize、UIPictureAndBackGroundCorProtocol_dynamic
,UILocationProtocol /// UILocationProtocol_synthesize、UILocationProtocol_dynamic
,UIMarkProtocol /// UIMarkProtocol_synthesize、UIMarkProtocol_dynamic
,BaseButtonProtocol /// BaseButtonProtocol_synthesize、BaseButtonProtocol_dynamic
,UITextModelProtocol /// UITextModelProtocol_synthesize、UITextModelProtocol_dynamic
,BaseLayerProtocol /// BaseLayerProtocol_synthesize、BaseLayerProtocol_dynamic
,UITextFieldProtocol /// UITextFieldProtocol_synthesize、UITextFieldProtocol_dynamic
>
@optional
#pragma mark —— 文字配置
Prop_strong(nullable)UITextModel *textModel;
Prop_strong(nullable)UITextModel *subTextModel;
Prop_strong(nullable)UITextModel *backBtnTitleModel;/// 在具体的子类去实现，以覆盖父类的方法实现
Prop_strong(nullable)UIButtonModel *buttonModel;
Prop_strong(nullable)UIButtonModel *subButtonModel;
Prop_copy(nullable)JobsReturnIDByIDBlock jobsBlock;
Prop_strong(nullable)NSMutableArray <JobsReturnIDByIDBlock>*jobsBlockMutArr;
#pragma mark —— 图片配置
/// 普通图
Prop_copy(nullable)NSString *normalImageURLString;
Prop_strong(nullable)NSURL *normalImageURL;
/// 背景图
Prop_copy(nullable)NSString *normalBgImageURLString;
Prop_strong(nullable)NSURL *normalBgImageURL;
#pragma mark —— UI约束（Masonry）
Prop_copy(nullable)jobsByMASConstraintMakerBlock masonryBlock;

@end

NS_ASSUME_NONNULL_END
/// 自带的属性
#ifndef UIViewModelProtocol_synthesize_part1
#define UIViewModelProtocol_synthesize_part1 \
\
@synthesize textModel = _textModel; \
@synthesize subTextModel = _subTextModel; \
@synthesize backBtnTitleModel = _backBtnTitleModel; \
@synthesize buttonModel = _buttonModel; \
@synthesize subButtonModel = _subButtonModel; \
@synthesize jobsBlock = _jobsBlock; \
@synthesize jobsBlockMutArr = _jobsBlockMutArr; \
@synthesize normalImageURLString = _normalImageURLString; \
@synthesize normalImageURL = _normalImageURL; \
@synthesize normalBgImageURLString = _normalBgImageURLString; \
@synthesize normalBgImageURL = _normalBgImageURL; \
@synthesize masonryBlock = _masonryBlock; \

#endif /* UIViewModelProtocol_synthesize_part1 */
/// 继承的属性（避免冲突）
#ifndef UIViewModelProtocol_synthesize_part2
#define UIViewModelProtocol_synthesize_part2 \
\
UIViewModelOthersProtocol_synthesize \
UIPictureAndBackGroundCorProtocol_synthesize \
UILocationProtocol_synthesize \
UIMarkProtocol_synthesize_part1 \
BaseButtonProtocol_synthesize_part2 \
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
UIViewModelProtocol_synthesize_part1 \
UIViewModelProtocol_synthesize_part2 \

#endif /* UIViewModelProtocol_synthesize */

#ifndef UIViewModelProtocol_dynamic_part1
#define UIViewModelProtocol_dynamic_part1 \
\
@dynamic textModel;\
@dynamic subTextModel;\
@dynamic backBtnTitleModel;\
@dynamic buttonModel;\
@dynamic subButtonModel;\
@dynamic jobsBlock;\
@dynamic jobsBlockMutArr;\
@dynamic normalImageURLString;\
@dynamic normalImageURL;\
@dynamic normalBgImageURLString;\
@dynamic normalBgImageURL;\
@dynamic masonryBlock;\

#endif /* UIViewModelProtocol_dynamic_part1 */
