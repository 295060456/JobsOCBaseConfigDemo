//
//  JobsLaunchConfig.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/20.
//

#import "JobsLaunchConfig.h"

@implementation JobsLaunchConfig

#pragma mark —— 关于跳过按钮的配置
UIViewModelProtocol_synthesize

#pragma mark —— 单例化和销毁
+(void)destroyAppDoorSingleton{
    static_launchConfigOnceToken = 0;
    static_launchConfig = nil;
}

-(void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    [NSNotificationCenter.defaultCenter removeObserver:self];
}
static JobsLaunchConfig *static_launchConfig = nil;
static dispatch_once_t static_launchConfigOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_launchConfigOnceToken, ^{
        static_launchConfig = JobsLaunchConfig.new;
    });return static_launchConfig;
}

-(instancetype)init{
    if (self = [super init]) {
        
    }return self;
}
#pragma mark —— 默认值
/// 关于跳过按钮的
-(UIImage *)image{
    if (!_image) {
        _image = JobsIMG(@"空白图");
    }return _image;
}

-(UIImage *)bgImage{
    if (!_bgImage) {
        _bgImage = [UIImage imageWithColor:self.bgCor];
    }return _bgImage;
}

-(UIImage *)bgSelectedImage{
    if (!_bgSelectedImage) {
        _bgSelectedImage = [UIImage imageWithColor:self.bgCor];
    }return _bgSelectedImage;
}

-(UIColor *)bgCor{
    if (!_bgCor) {
        _bgCor = UIColor.clearColor;
    }return _bgCor;
}

-(NSString *)imageURLString{
    if (!_imageURLString) {
        _imageURLString = @"";
    }return _imageURLString;
}

-(NSString *)bgImageURLString{
    if (!_bgImageURLString) {
        _bgImageURLString = @"";
    }return _bgImageURLString;
}

-(NSString *)text{
    if (!_text) {
        _text = Internationalization(@"跳过");
    }return _text;
}

-(UIColor *)textCor{
    if (!_textCor) {
        _textCor = UIColor.whiteColor;
    }return _textCor;
}

-(UIFont *)font{
    if (!_font) {
        _font = [UIFont systemFontOfSize:JobsWidth(14) weight:UIFontWeightRegular];
    }return _font;
}

-(NSTextAlignment)textAlignment{
    if (!_textAlignment) {
        _textAlignment = NSTextAlignmentCenter;
    }return _textAlignment;
}

-(UIColor *)layerBorderCor{
    if (!_layerBorderColour) {
        _layerBorderColour = UIColor.whiteColor;
    }return _layerBorderColour;
}

-(CGFloat)layerBorderWidth{
    if (!_layerBorderWidth) {
        _layerBorderWidth = 0.1f;
    }return _layerBorderWidth;
}

-(UILabelShowingType)labelShowingType{
    if (!_labelShowingType) {
        _labelShowingType = UILabelShowingType_03;
    }return _labelShowingType;
}

@end
