//
//  PicToStrStoreSubVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/24.
//

#import "PicToStrStoreSubVC.h"

@interface PicToStrStoreSubVC (){
    UIImage *_picBefore;
    UIImage *_picAfter;
    NSString *_resultStr;/// 最原始的图片编码字符串
    NSString *_showStr;/// 对外显示的字符串
}
/// UI
@property(nonatomic,strong)BaseButton *btn_1;
@property(nonatomic,strong)BaseButton *btn_2;
@property(nonatomic,strong)NSMutableArray <NSString *>*richTextMutArr;
@property(nonatomic,strong)NSMutableArray <JobsRichTextConfig *>*richTextConfigMutArr;
@property(nonatomic,strong)UITextView *textView;
/// Data
@property(nonatomic,strong)NSMutableArray <UIImage *>*photosImageMutArr;

@end

@implementation PicToStrStoreSubVC

- (void)dealloc{
    JobsRemoveNotification(self);;
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
    
    _picBefore = nil;
    _picAfter = nil;
    _resultStr = JobsInternationalization(@"");
    _showStr = JobsInternationalization(@"");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsWhiteColor;
    self.setGKNav(nil);
    self.setGKNavBackBtn(nil);
    self.gk_navigationBar.jobsVisible = YES;
//    [self.bgImageView removeFromSuperview];
    
    self.btn_1.alpha = 1;
    self.btn_2.alpha = 1;
    self.textView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.updateStatusBarCor(JobsOrangeColor);/// 在具体子类实现，不要写在父类。父类只做提示
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    self.restoreStatusBarCor(nil);
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
/*
 UIImagePNGRepresentation：
 这个方法将UIImage对象转换为PNG格式的NSData对象。
 PNG格式是一种无损压缩格式，因此生成的图像数据保留了原始图像的质量，但文件大小可能会比JPEG格式大。
 PNG格式通常用于需要保留图像透明度、精确颜色和细节的情况，如图标、线条图和图形设计等。
 
 UIImageJPEGRepresentation：
 这个方法将UIImage对象转换为JPEG格式的NSData对象。
 JPEG格式是一种有损压缩格式，通过牺牲一些图像细节来实现更小的文件大小。
 JPEG格式通常用于照片和图像，因为它可以提供较小的文件大小，而且人眼对于JPEG压缩引起的细节损失不太敏感。
 **/

/*
 在Objective-C中，NSMutableString是可变的字符串类型，而NSString是不可变的字符串类型。
 NSMutableString的copy方法会返回一个不可变的字符串副本，而NSString的copy方法会返回其本身，因为NSString本身就是不可变的。

 在返回字符串时，如果直接返回可变字符串hexString，那么在调用方修改了这个可变字符串，可能会影响到内部的数据。这种行为不太符合设计的期望，因为方法返回的字符串应该是不可变的，以防止意外的修改。
 因此，使用[hexString copy]可以确保返回的是一个不可变的字符串副本，保护了原始数据的安全性，而且调用方可以安心地使用返回的字符串而不必担心意外修改原始数据。

 总之，为了保证代码的健壮性和安全性，将可变对象转换为不可变对象并返回其副本是一种良好的编程实践。
 **/
#pragma mark —— 一些私有方法
/// 输出文字修饰为可对外显示。但是对外还是输出入参字符串
-(NSString *)dataForTextView:(NSString *)string{
    if(string){
#warning 不可能全部显示完全这个字符串，太长了。渲染到UI会撑爆内存，最终致程序崩溃
        _showStr = [string substringToIndex:1000];
        _showStr = [NSString stringWithFormat:@"目标图片对应的字符串编码为（只列举一部分）前面几位都是一样的：%@", _showStr];
        _showStr = [_showStr stringByAppendingString:@"...后面还有很多，就不一一列举了（渲染UI会撑爆内存，最终导致程序崩溃）"];
        self.textView.text = _showStr;
    }else self.jobsToastMsg(JobsInternationalization(@"暂无编码数据！！！"));
    return string;
}
/// 输出图片到Btn_1
-(void)dataForBtn1ImageView:(UIImage *)image{
    if(image){
        _picBefore = image;
        self.btn_1.jobsResetBtnImage(_picBefore);
    }else self.jobsToastMsg(JobsInternationalization(@"字符串解码转换失败"));
}
/// 输出图片到Btn_2
-(UIImage *)dataForBtn2ImageView:(UIImage *)image{
    if(image){
        _picAfter = image;
        self.btn_2.jobsResetBtnImage(image);
    }else self.jobsToastMsg(JobsInternationalization(@"字符串解码转换失败"));
    return _picAfter;
}
#pragma mark —— 图片（图片数据Data）=编码=> 字符串(加盐)
-(NSString *)strForPic:(UIImage *)pic{
    switch ([self.viewModel.requestParams intValue]) {
        case PicToStrStyle_Hexadecimal:{
            _resultStr = [self dataForTextView:self.encodePicStr(pic.hexStr)];
        }break;
        case PicToStrStyle_Base16:{
            _resultStr = [self dataForTextView:self.encodePicStr(pic.base16Str)];
        }break;
        case PicToStrStyle_Base32:{
            _resultStr = [self dataForTextView:self.encodePicStr(pic.base32Str)];
        }break;
        case PicToStrStyle_Base64:{
            _resultStr = [self dataForTextView:self.encodePicStr(pic.base64Str)];
        }break;
        case PicToStrStyle_Base85:{
            _resultStr = [self dataForTextView:self.encodePicStr(pic.base85Str)];
        }break;
        case PicToStrStyle_MIME:{
            _resultStr = [self dataForTextView:self.encodePicStr(pic.MIMEStr)];
        }break;
        default:
            break;
    }return _resultStr;
}
#pragma mark —— 字符串（加盐）=解码=> 图片
-(UIImage *)picForStr:(NSString *)str{
    _picAfter = nil;
    if(!str.isNotBlank) return nil;

    switch ([self.viewModel.requestParams intValue]) {
        case PicToStrStyle_Hexadecimal:{
            return [self dataForBtn2ImageView:self.decodePicStr(str).imageByHexString];
        }break;
        case PicToStrStyle_Base16:{
            return [self dataForBtn2ImageView:self.decodePicStr(str).imageByBase16String];
        }break;
        case PicToStrStyle_Base32:{
            return [self dataForBtn2ImageView:self.decodePicStr(str).imageByBase32String];
        }break;
        case PicToStrStyle_Base64:{
            return [self dataForBtn2ImageView:self.decodePicStr(str).imageByBase64String];
        }break;
        case PicToStrStyle_Base85:{
            return [self dataForBtn2ImageView:self.decodePicStr(str).imageByBase85String];
        }break;
        case PicToStrStyle_MIME:{
            return [self dataForBtn2ImageView:self.decodePicStr(str).imageByMIMEString];
        }break;
        default:
            break;
    }return _picAfter;
}
#pragma mark —— lazyLoad
-(BaseButton *)btn_1{
    if(!_btn_1){
        @jobs_weakify(self)
        _btn_1 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                   background:nil
                                   buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                textAlignment:NSTextAlignmentCenter
                                             subTextAlignment:NSTextAlignmentCenter
                                                  normalImage:_picBefore ? : JobsBuddleIMG(@"bundle",@"Others",nil,@"绿色加号")
                                               highlightImage:nil
                                              attributedTitle:nil
                                      selectedAttributedTitle:nil
                                           attributedSubtitle:nil
                                                        title:JobsInternationalization(@"点击按钮")
                                                     subTitle:JobsInternationalization(@"选取相册图片")
                                                    titleFont:UIFontWeightBoldSize(25)
                                                 subTitleFont:UIFontWeightBoldSize(18)
                                                     titleCor:JobsCor(@"#333333")
                                                  subTitleCor:nil
                                           titleLineBreakMode:NSLineBreakByWordWrapping
                                        subtitleLineBreakMode:NSLineBreakByWordWrapping
                                          baseBackgroundColor:JobsLightGrayColor
                                              backgroundImage:nil
                                                 imagePadding:JobsWidth(10)
                                                 titlePadding:JobsWidth(10)
                                               imagePlacement:NSDirectionalRectEdgeNone
                                   contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                     contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                contentInsets:jobsSameDirectionalEdgeInsets(0)
                                            cornerRadiusValue:JobsWidth(8)
                                              roundingCorners:UIRectCornerAllCorners
                                         roundingCornersRadii:CGSizeZero
                                               layerBorderCor:nil
                                                  borderWidth:JobsWidth(.5f)
                                                primaryAction:nil
                                   longPressGestureEventBlock:nil
                                              clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            /// 调取系统相册
            @jobs_weakify(self)
            [self hx_invokeSysPhotoAlbumSuccessBlock:^(HXPhotoPickerModel *data) {
                self.photoManager = data.photoManager;
                [data.photoList hx_requestImageWithOriginal:NO
                                                 completion:^(NSArray<UIImage *> * _Nullable imageArray,
                                                              NSArray<HXPhotoModel *> * _Nullable errorArray) {
                    @jobs_strongify(self)
                    self.photosImageMutArr = [NSMutableArray arrayWithArray:imageArray];
                    UIImage *image = (UIImage *)self.photosImageMutArr.lastObject;
                    self->_picBefore = image;
                    self.btn_1.jobsResetBtnImage(image);/// 永远值显示最后选择的图
                    [self strForPic:self->_picBefore];
                }];
            } failBlock:^(HXPhotoPickerModel *data) {
//                @jobs_strongify(self)
            }];return nil;
        }];
        [self.view addSubview:_btn_1];
        [_btn_1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(10));
            make.left.equalTo(self.view).offset(JobsWidth(10));
            make.right.equalTo(self.view).offset(JobsWidth(-10));
            make.height.mas_equalTo(@200);
        }];
        _btn_1.makeBtnTitleByShowingType(UILabelShowingType_03);
    }return _btn_1;
}

-(BaseButton *)btn_2{
    if(!_btn_2){
        @jobs_weakify(self)
        _btn_2 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                   background:nil
                                   buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                textAlignment:NSTextAlignmentCenter
                                             subTextAlignment:NSTextAlignmentCenter
                                                  normalImage:nil
                                               highlightImage:nil
                                              attributedTitle:nil
                                      selectedAttributedTitle:nil
                                           attributedSubtitle:nil
                                                        title:JobsInternationalization(@"点击按钮")
                                                     subTitle:JobsInternationalization(@"编码转译成图片")
                                                    titleFont:UIFontWeightBoldSize(25)
                                                 subTitleFont:UIFontWeightBoldSize(18)
                                                     titleCor:JobsCor(@"#333333")
                                                  subTitleCor:nil
                                           titleLineBreakMode:NSLineBreakByWordWrapping
                                        subtitleLineBreakMode:NSLineBreakByWordWrapping
                                          baseBackgroundColor:JobsLightGrayColor
                                              backgroundImage:nil
                                                 imagePadding:JobsWidth(10)
                                                 titlePadding:JobsWidth(10)
                                               imagePlacement:NSDirectionalRectEdgeNone
                                   contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                     contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                contentInsets:jobsSameDirectionalEdgeInsets(0)
                                            cornerRadiusValue:JobsWidth(8)
                                              roundingCorners:UIRectCornerAllCorners
                                         roundingCornersRadii:CGSizeZero
                                               layerBorderCor:nil
                                                  borderWidth:JobsWidth(.5f)
                                                primaryAction:nil
                                   longPressGestureEventBlock:nil
                                              clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            if([self->_resultStr isNotBlank]){
                /// 存在于内存里面的编码，转变成图像对外进行输出
                [self picForStr:self->_resultStr];
            }else self.jobsToastMsg(JobsInternationalization(@"请先编码图片"));
            return nil;
        }];
        [self.view addSubview:_btn_2];
        [_btn_2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.btn_1.mas_bottom).offset(JobsWidth(10));
            make.left.equalTo(self.view).offset(JobsWidth(10));
            make.right.equalTo(self.view).offset(JobsWidth(-10));
            make.height.mas_equalTo(@200);
        }];
        _btn_2.makeBtnTitleByShowingType(UILabelShowingType_03);
    }return _btn_2;
}

-(UITextView *)textView{
    if (!_textView) {
        _textView = UITextView.new;
        _textView.backgroundColor = JobsLightTextColor;
        _textView.text = JobsInternationalization(@"暂无编码数据！！！");
        _textView.textColor = HEXCOLOR(0xB0B0B0);
        _textView.font = UIFontSystemFontOfSize(14);
        [self.view addSubview:_textView];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(JobsWidth(10));
            make.right.equalTo(self.view).offset(JobsWidth(-10));
            make.top.equalTo(self.btn_2.mas_bottom).offset(JobsWidth(10));
            make.bottom.equalTo(self.view).offset(JobsWidth(-20));
        }];
        [_textView layerBorderCor:JobsLightGrayColor andBorderWidth:.5f];
    }return _textView;
}

@end
