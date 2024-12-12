//
// UIPictureAndBackGroundCorProtocol.h
// JobsOCBaseConfig
//
// Created by Jobs on 2022/1/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UIPictureAndBackGroundCorProtocol <NSObject>
@optional
#pragma mark —— 图片和背景颜色
/// 关于导航栏的
Prop_strong(nullable)UIImage *navBgImage;
Prop_strong(nullable)UIColor *navBgCor;
/// 未选中状态
Prop_strong(nullable)UIImage *image;///【未选中状态】图片
Prop_strong(nullable)UIImage *bgImage;///【未选中状态】背景图片
Prop_copy(nullable)NSString *imageURLString;///【未选中状态】图片URL(字符串形式)
Prop_copy(nullable)NSString *bgImageURLString;///【未选中状态】背景图片URL(字符串形式)
Prop_strong(nullable)UIColor *bgCor;///【未选中状态】背景颜色
Prop_strong(nullable)UIImage *backBtnIMG;///【未选中状态】返回按钮的图标
Prop_strong(nullable)UIBackgroundConfiguration *bgConfig API_AVAILABLE(ios(14.0), tvos(14.0), watchos(7.0));
/// 选中状态
Prop_strong(nullable)UIImage *selectedImage_;///【选中状态】图片
Prop_strong(nullable)UIImage *bgSelectedImage;///【选中状态】背景图片
Prop_copy(nullable)NSString *selectedImageURLString;///【选中状态】图片URL(字符串形式)
Prop_copy(nullable)NSString *bgSelectedImageURLString;///【选中状态】背景图片URL(字符串形式)
Prop_strong(nullable)UIColor *bgSelectedCor;///【选中状态】背景颜色
Prop_strong(nullable)UIImage *backBtnSelectedIMG;///【选中状态】返回按钮的图标
Prop_strong(nullable)UIBackgroundConfiguration *bgSelectedConfig API_AVAILABLE(ios(14.0), tvos(14.0), watchos(7.0));
/// UI 控件
Prop_strong(nullable)UIImageView *bgImageView;

@end

NS_ASSUME_NONNULL_END

#pragma mark —— @synthesize UIPictureAndBackGroundCorProtocol
#ifndef UIPictureAndBackGroundCorProtocol_synthesize
#define UIPictureAndBackGroundCorProtocol_synthesize \
\
@synthesize navBgImage = _navBgImage;\
@synthesize navBgCor = _navBgCor;\
@synthesize image = _image;\
@synthesize bgImage = _bgImage;\
@synthesize imageURLString = _imageURLString;\
@synthesize bgImageURLString = _bgImageURLString;\
@synthesize bgCor = _bgCor;\
@synthesize backBtnIMG = _backBtnIMG;\
@synthesize bgConfig = _bgConfig;\
@synthesize bgImageView = _bgImageView;\
\
@synthesize selectedImage_ = _selectedimage_;\
@synthesize bgSelectedImage = _bgSelectedImage;\
@synthesize selectedImageURLString = _selectedImageURLString;\
@synthesize bgSelectedImageURLString = _bgSelectedImageURLString;\
@synthesize bgSelectedCor = _bgSelectedCor;\
@synthesize backBtnSelectedIMG = _backBtnSelectedIMG;\
@synthesize bgSelectedConfig = _bgSelectedConfig;\

#endif

#pragma mark —— @dynamic UIPictureAndBackGroundCorProtocol
#ifndef UIPictureAndBackGroundCorProtocol_dynamic
#define UIPictureAndBackGroundCorProtocol_dynamic \
\
@dynamic navBgImage;\
@dynamic navBgCor;\
@dynamic image;\
@dynamic bgImage;\
@dynamic imageURLString;\
@dynamic bgImageURLString;\
@dynamic bgCor;\
@dynamic backBtnIMG;\
@dynamic bgConfig;\
@dynamic bgImageView;\
\
@dynamic selectedImage_;\
@dynamic bgSelectedImage;\
@dynamic selectedImageURLString;\
@dynamic bgSelectedImageURLString;\
@dynamic bgSelectedCor;\
@dynamic backBtnSelectedIMG;\
@dynamic bgSelectedConfig;\

#endif /* UIPictureAndBackGroundCorProtocol_dynamic */
