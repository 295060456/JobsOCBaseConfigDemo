//
//  JobsBlockDef.h
//  FMNormal
//
//  Created by Jobs on 2025/5/6.
//

#ifndef JobsBlockDef_h
#define JobsBlockDef_h
/// 主动调用宏，传入2个参数
#ifndef Jobs_2_Arguments
#define Jobs_2_Arguments \
    id _Nullable data, \
    id _Nullable data2
#endif /* Jobs_2_Arguments */
/// 主动调用宏，传入3个参数
#ifndef Jobs_3_Arguments
#define Jobs_3_Arguments \
    id _Nullable data, \
    id _Nullable data2, \
    id _Nullable data3
#endif /* Jobs_3_Arguments */
/// 主动调用宏，传入4个参数
#ifndef Jobs_4_Arguments
#define Jobs_4_Arguments \
    id _Nullable data, \
    id _Nullable data2, \
    id _Nullable data3, \
    id _Nullable data4
#endif /* Jobs_4_Arguments */
/// 主动调用宏，传入5个参数
#ifndef Jobs_5_Arguments
#define Jobs_5_Arguments \
    id _Nullable data, \
    id _Nullable data2, \
    id _Nullable data3, \
    id _Nullable data4, \
    id _Nullable data5
#endif /* Jobs_5_Arguments */
/// 主动调用宏，传入6个参数
#ifndef Jobs_6_Arguments
#define Jobs_6_Arguments \
    id _Nullable data, \
    id _Nullable data2, \
    id _Nullable data3, \
    id _Nullable data4, \
    id _Nullable data5, \
    id _Nullable data6
#endif /* Jobs_6_Arguments */
/// 主动调用宏，传入7个参数
#ifndef Jobs_7_Arguments
#define Jobs_7_Arguments \
    id _Nullable data, \
    id _Nullable data2, \
    id _Nullable data3, \
    id _Nullable data4, \
    id _Nullable data5, \
    id _Nullable data6, \
    id _Nullable data7
#endif /* Jobs_7_Arguments */
/// 主动调用宏，传入8个参数
#ifndef Jobs_8_Arguments
#define Jobs_8_Arguments \
    id _Nullable data, \
    id _Nullable data2, \
    id _Nullable data3, \
    id _Nullable data4, \
    id _Nullable data5, \
    id _Nullable data6, \
    id _Nullable data7, \
    id _Nullable data8
#endif /* Jobs_8_Arguments */
/// 主动调用宏，传入9个参数
#ifndef Jobs_9_Arguments
#define Jobs_9_Arguments \
    id _Nullable data, \
    id _Nullable data2, \
    id _Nullable data3, \
    id _Nullable data4, \
    id _Nullable data5, \
    id _Nullable data6, \
    id _Nullable data7, \
    id _Nullable data8, \
    id _Nullable data9
#endif /* Jobs_9_Arguments */
/// 主动调用宏，传入10个参数
#ifndef Jobs_10_Arguments
#define Jobs_10_Arguments \
    id _Nullable data, \
    id _Nullable data2, \
    id _Nullable data3, \
    id _Nullable data4, \
    id _Nullable data5, \
    id _Nullable data6, \
    id _Nullable data7, \
    id _Nullable data8, \
    id _Nullable data9, \
    id _Nullable data10
#endif /* Jobs_10_Arguments */
/// 主文字内容、字体大小
#ifndef Jobs_Title_Font_Arguments
#define Jobs_Title_Font_Arguments \
    NSString *_Nonnull title, \
    UIFont *_Nullable font
#endif /* Jobs_Title_Font_Arguments */
/// 主文字内容、字体大小、主文字颜色
#ifndef Jobs_Title_Font_TitleCor_Arguments
#define Jobs_Title_Font_TitleCor_Arguments \
    NSString *_Nonnull title, \
    UIFont *_Nullable font, \
    UIColor *_Nullable titleCor
#endif /* Jobs_Title_Font_TitleCor_Arguments */
/// 主文字内容、字体大小、主文字颜色、按钮图片、图片和文字的位置关系、x
#ifndef Jobs_Title_Font_TitleCor_Image_imagePlacement_X_Arguments
#define Jobs_Title_Font_TitleCor_Image_imagePlacement_X_Arguments \
    NSString *_Nonnull title, \
    UIFont *_Nullable font, \
    UIColor *_Nullable titleCor, \
    UIImage *_Nonnull image, \
    NSDirectionalRectEdge imagePlacement, \
    CGFloat x
#endif /* Jobs_Title_Font_TitleCor_Image_imagePlacement_X_Arguments */
/// 主文字内容、字体大小、主文字颜色、按钮图片、图文距离
#ifndef Jobs_Title_Font_TitleCor_Image_X_Arguments
#define Jobs_Title_Font_TitleCor_Image_X_Arguments \
    NSString *_Nonnull title, \
    UIFont *_Nullable font, \
    UIColor *_Nullable titleCor, \
    UIImage *_Nonnull image, \
    CGFloat x
#endif /* Jobs_Title_Font_TitleCor_Image_X_Arguments */
/// 主文字内容、字体大小、主文字颜色、按钮图片
#ifndef Jobs_Title_Font_TitleCor_Image_Arguments
#define Jobs_Title_Font_TitleCor_Image_Arguments \
    NSString *_Nonnull title, \
    UIFont *_Nullable font, \
    UIColor *_Nullable titleCor, \
    UIImage *_Nonnull image
#endif /* Jobs_Title_Font_TitleCor_Image_Arguments */
/// 主文字内容、字体大小、主文字颜色、按钮图片、按钮背景图片、图片和文字的位置关系
#ifndef Jobs_Title_Font_TitleCor_Image_BackgroundImage_ImagePlacement_Arguments
#define Jobs_Title_Font_TitleCor_Image_BackgroundImage_ImagePlacement_Arguments \
    NSString *_Nonnull title, \
    UIFont *_Nullable font, \
    UIColor *_Nullable titleCor, \
    UIImage *_Nonnull image, \
    UIImage *_Nonnull backgroundImage, \
    NSDirectionalRectEdge imagePlacement
#endif /* Jobs_Title_Font_TitleCor_Image_BackgroundImage_ImagePlacement_Arguments */
/// 主文字内容、字体大小、主文字颜色、按钮图片、图文相对位置、图文距离
#ifndef Jobs_Title_Font_TitleCor_Image_DirectionalRectEdge_X_Arguments
#define Jobs_Title_Font_TitleCor_Image_DirectionalRectEdge_X_Arguments \
    NSString *_Nonnull title, \
    UIFont *_Nullable font, \
    UIColor *_Nullable titleCor, \
    UIImage *_Nonnull image, \
    NSDirectionalRectEdge directionalRectEdge, \
    CGFloat x
#endif /* Jobs_Title_Font_TitleCor_Image_DirectionalRectEdge_X_Arguments */

#ifndef Jobs_WKNavigationDelegate_Arguments
#define Jobs_WKNavigationDelegate_Arguments \
    WKNavigationActionPolicy policy, \
    WKWebpagePreferences *_Nullable preferences
#endif /* Jobs_WKNavigationDelegate_Arguments */

#ifndef Jobs_NavBarConfig_Title_Action_Arguments
#define Jobs_NavBarConfig_Title_Action_Arguments \
    NSString *_Nullable string, \
    JobsReturnIDByIDBlock _Nullable backActionBlock
#endif /* Jobs_NavBarConfig_Title_Action_Arguments */

#ifndef Jobs_NavBarConfig_BackBtnModel_CloseBtnModel_Arguments
#define Jobs_NavBarConfig_BackBtnModel_CloseBtnModel_Arguments \
    UIButtonModel *_Nullable backBtnModel, \
    UIButtonModel *_Nullable closeBtnModel
#endif /* Jobs_NavBarConfig_BackBtnModel_CloseBtnModel_Arguments */

#ifndef Jobs_ViewArrayRowsColumnsBlock_Arguments
#define Jobs_ViewArrayRowsColumnsBlock_Arguments \
    __kindof NSArray <__kindof UIView *>*_Nullable arr, \
    NSInteger rows, \
    NSInteger columns
#endif /* Jobs_ViewArrayRowsColumnsBlock_Arguments */

#ifndef Jobs_KeyValueBlock_Arguments
#define Jobs_KeyValueBlock_Arguments \
    id <NSCopying>_Nonnull key, \
    id _Nonnull value
#endif /* Jobs_KeyValueBlock_Arguments */

#ifndef Jobs_Key_ValueBlock_Arguments
#define Jobs_Key_ValueBlock_Arguments \
    NSString *_Nonnull key, \
    id _Nullable value
#endif /* Jobs_Key_ValueBlock_Arguments */

#ifndef Jobs_JSCompletionHandlerBlock_Arguments
#define Jobs_JSCompletionHandlerBlock_Arguments \
    id _Nullable result, \
    NSError *_Nullable error
#endif /* Jobs_JSCompletionHandlerBlock_Arguments */

#endif /* JobsBlockDef_h */
