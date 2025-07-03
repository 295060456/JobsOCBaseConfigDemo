//
//  WMZCodeViewDefine.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/7/9.
//

#ifndef WMZCodeViewDefine_h
#define WMZCodeViewDefine_h
/// 间距
#define WMZmargin 10
/// 滑块大小
#define codeSize 50
/// 贝塞尔曲线偏移
#define WMZoffset 9
/// 背景图片宽度
#define WMZimageHeight 200
/// 滑块高度
#define WMZsliderHeight 40
/// 默认需要点击文本的数量
#define codeLabelCount 4
/// 默认还需要添加的点击文本的数量
#define codeAddLabelCount 3
/// 字体
#define WMZfont 24
/// CodeType type
typedef NS_ENUM(NSInteger, CodeType) {
    CodeTypeImage = 0,    // DefaultImage
    CodeTypeLabel,        // Label
    CodeTypeNineLabel,    // NineLabel
    CodeTypeSlider        // Slider
};

#endif /* WMZCodeViewDefine_h */
