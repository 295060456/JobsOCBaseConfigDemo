//
//  UIViewController+GifImageView.m
//  UBallLive
//
//  Created by Jobs on 2020/10/12.
//

#import "UIViewController+GifImageView.h"

@implementation UIViewController (GifImageView)
#pragma mark —— @property(nonatomic,strong)UIImageView *gifImageView;
JobsKey(_gifImageView)
@dynamic gifImageView;
-(UIImageView *)gifImageView{
    UIImageView *GifImageView = Jobs_getAssociatedObject(_gifImageView);
    if (!GifImageView) {
        @jobs_weakify(self)
        GifImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.image = self.image;
            [self.view addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.view);
            }];Jobs_setAssociatedRETAIN_NONATOMIC(_gifImageView, GifImageView)
        });
    }return GifImageView;
}

-(void)setGifImageView:(UIImageView *)gifImageView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_gifImageView, gifImageView)
}

#pragma mark —— @property(nonatomic,strong)NSString *path;
JobsKey(_path)
@dynamic path;
-(NSString *)path{
    NSString *Path = Jobs_getAssociatedObject(_path);
    if (isValue(Path)) {
        Path = @"GIF大图.gif".pathForResourceWithFullName;
        Jobs_setAssociatedRETAIN_NONATOMIC(_path, Path)
    }return Path;
}

-(void)setPath:(NSString *)path{
    Jobs_setAssociatedRETAIN_NONATOMIC(_path, path)
}
#pragma mark —— @property(nonatomic,strong)NSData *data;
JobsKey(_data)
@dynamic data;
-(NSData *)data{
    NSData *Data = Jobs_getAssociatedObject(_data);
    if (!Data) {
        Data = [NSData dataWithContentsOfFile:self.path];
        Jobs_setAssociatedRETAIN_NONATOMIC(_data, Data);
    }return Data;
}

-(void)setData:(NSData *)data{
    Jobs_setAssociatedRETAIN_NONATOMIC(_data, data);
}
#pragma mark —— @property(nonatomic,strong)UIImage *image;
JobsKey(_image)
@dynamic image;
-(UIImage *)image{
    UIImage *img = Jobs_getAssociatedObject(_image);
    if (!img) {
        img = [UIImage sd_imageWithGIFData:self.data];
        Jobs_setAssociatedRETAIN_NONATOMIC(_image, img)
    }return img;
}

-(void)setImage:(UIImage *)image{
    Jobs_setAssociatedRETAIN_NONATOMIC(_image, image)
}

@end
