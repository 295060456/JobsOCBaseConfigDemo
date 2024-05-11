//
//  UIPictureAndBackGroundCorProtocol.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UIPictureAndBackGroundCorProtocol <NSObject>
@optional
#pragma mark —— 图片和背景颜色
/// 未选中状态
@property(nonatomic,strong,nullable)UIImage __block *image;///【未选中状态】图片
@property(nonatomic,strong,nullable)UIImage __block *bgImage;///【未选中状态】背景图片
@property(nonatomic,strong,nullable)NSString __block *imageURLString;///【未选中状态】图片URL(字符串形式)
@property(nonatomic,strong,nullable)NSString __block *bgImageURLString;///【未选中状态】背景图片URL(字符串形式)
@property(nonatomic,strong,nullable)UIColor __block *bgCor;///【未选中状态】背景颜色
@property(nonatomic,strong,nullable)UIImage __block *backBtnIMG;///【未选中状态】返回按钮的图标
@property(nonatomic,strong,nullable)UIBackgroundConfiguration *bgConfig API_AVAILABLE(ios(14.0), tvos(14.0), watchos(7.0));
/// 选中状态
@property(nonatomic,strong,nullable)UIImage __block *selectedImage;///【选中状态】图片
@property(nonatomic,strong,nullable)UIImage __block *bgSelectedImage;///【选中状态】背景图片
@property(nonatomic,strong,nullable)NSString __block *selectedImageURLString;///【选中状态】图片URL(字符串形式)
@property(nonatomic,strong,nullable)NSString __block *bgSelectedImageURLString;///【选中状态】背景图片URL(字符串形式)
@property(nonatomic,strong,nullable)UIColor __block *bgSelectedCor;///【选中状态】背景颜色
@property(nonatomic,strong,nullable)UIImage __block *backBtnSelectedIMG;///【选中状态】返回按钮的图标
@property(nonatomic,strong,nullable)UIBackgroundConfiguration *bgSelectedConfig API_AVAILABLE(ios(14.0), tvos(14.0), watchos(7.0));
/// UI 控件
@property(nonatomic,strong,nullable)UIImageView __block *bgImageView;

@end

NS_ASSUME_NONNULL_END

#pragma mark —— @synthesize UIPictureAndBackGroundCorProtocol
#ifndef UIPictureAndBackGroundCorProtocol_synthesize
#define UIPictureAndBackGroundCorProtocol_synthesize \
\
@synthesize image = _image;\
@synthesize bgImage = _bgImage;\
@synthesize imageURLString = _imageURLString;\
@synthesize bgImageURLString = _bgImageURLString;\
@synthesize bgCor = _bgCor;\
@synthesize backBtnIMG = _backBtnIMG;\
@synthesize bgImageView = _bgImageView;\
\
@synthesize selectedImage = _selectedimage;\
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
@dynamic image;\
@dynamic bgImage;\
@dynamic imageURLString;\
@dynamic bgImageURLString;\
@dynamic bgCor;\
@dynamic backBtnIMG;\
@dynamic bgImageView;\
\
@dynamic selectedImage;\
@dynamic bgSelectedImage;\
@dynamic selectedImageURLString;\
@dynamic bgSelectedImageURLString;\
@dynamic bgSelectedCor;\
@dynamic backBtnSelectedIMG;\
@dynamic bgSelectedConfig;\

#endif


