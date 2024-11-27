//
//  CollectionReusableView.m
//  UBallLive
//
//  Created by Jobs on 2020/10/12.
//

#import "BaseCollectionReusableView.h"

@interface BaseCollectionReusableView ()
/// UI
@property(nonatomic,strong)UIImageView *bgImageView;

@end

@implementation BaseCollectionReusableView
@synthesize viewModel = _viewModel;
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.jobsRichViewByModel(nil);
    }return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    @jobs_weakify(self)
    if (self.objectBlock) self.objectBlock(weak_self);
}
/// 由具体的子类进行覆写
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        self.bgImageView.jobsVisible = model.bgImage;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
/// UICollectionViewDelegateFlowLayout
+(JobsReturnCGSizeByIDBlock _Nonnull)collectionReusableViewSizeByModel{
    return ^(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(50));
    };
}
#pragma mark —— lazyLoad
-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        @jobs_weakify(self)
        _bgImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            self.addSubview(imageView);
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
        });
    }_bgImageView.image = self.viewModel.bgImage;
    return _bgImageView;
}

@end
