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
//        [self richElementsInViewWithModel:nil];
    }return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    @jobs_weakify(self)
    if (self.objectBlock) self.objectBlock(weak_self);
}
/// 由具体的子类进行覆写
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    self.bgImageView.jobsVisible = model.bgImage;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
/// UICollectionViewDelegateFlowLayout
+(CGSize)collectionReusableViewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(nil), JobsWidth(50));
}
#pragma mark —— lazyLoad
-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = UIImageView.new;
        [self addSubview:_bgImageView];
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    _bgImageView.image = self.viewModel.bgImage;
    return _bgImageView;
}

@end
