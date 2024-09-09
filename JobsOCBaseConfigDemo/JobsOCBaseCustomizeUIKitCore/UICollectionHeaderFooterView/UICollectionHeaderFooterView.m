//
//  UICollectionHeaderFooterView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/10.
//

#import "UICollectionHeaderFooterView.h"

@interface UICollectionHeaderFooterView ()
/// UI
@property(nonatomic,strong)UIImageView *imageView;
/// Data

@end

@implementation UICollectionHeaderFooterView
@synthesize imageViewFrame = _imageViewFrame;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_collectionHeaderFooterViewOnceToken = 0;
    static_collectionHeaderFooterView = nil;
}

static UICollectionHeaderFooterView *static_collectionHeaderFooterView = nil;
static dispatch_once_t static_collectionHeaderFooterViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_collectionHeaderFooterViewOnceToken, ^{
        static_collectionHeaderFooterView = UICollectionHeaderFooterView.new;
    });return static_collectionHeaderFooterView;
}
#pragma mark —— SysMethod
- (instancetype)init{
    if (self = [super init]) {
        
    }return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— UIScrollViewDelegate
-(void)scrollViewDidScrollWithContentOffsetY:(CGFloat)contentOffsetY {
    if (self.isZoom) {
        CGRect frame = self.imageViewFrame;
        frame.size.height -= contentOffsetY;
        frame.origin.y = contentOffsetY;
        
        self.imageView.frame = frame;
    }
}
#pragma mark —— lazyLoad
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = UIImageView.new;
        _imageView.image = JobsBuddleIMG(@"bundle",
                                      @"Others",
                                      nil,
                                      @"个人中心背景图");
        _imageView.clipsToBounds = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_imageView];
        if (self.isZoom) {
            _imageView.frame = CGRectMake(0,
                                          0,
                                          self.width,
                                          self.height);
            self.imageViewFrame = _imageView.frame;
        }else{
            [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
        }
    }return _imageView;
}

@end
