//
//  FMGameCVCell.m
//  FM_Normal
//
//  Created by Jobs on 2025/4/19.
//

#import "FMGameCVCell.h"

@interface FMGameCVCell ()

Prop_strong()GoodsClassModel *goodsClsModel;
Prop_assign(class)SourceType sourceType;

@end

@implementation FMGameCVCell

-(void)layoutSubviews{
    [super layoutSubviews];
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    return self.viewModel;
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    FMGameCVCell *cell = JobsRegisterDequeueCollectionViewCell(FMGameCVCell);
    cell.contentView.layerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable model) {
        model.masksToBounds = YES;
        model.layerCor = RGBA_COLOR(255, 225, 144, 1);
        model.jobsWidth = JobsWidth(1);
        model.cornerRadiusValue = JobsWidth(8);
    }));
    cell.layerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable model) {
        model.masksToBounds = YES;
        model.layerCor = RGBA_COLOR(255, 225, 144, 1);
        model.jobsWidth = JobsWidth(1);
        model.cornerRadiusValue = JobsWidth(15);
    }));
    cell.indexPath = indexPath;
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(id _Nullable model) {
        @jobs_strongify(self)
        if([model isKindOfClass:UIViewModel.class]){
            self.viewModel = model;
            self.button.jobsResetBtnImage(self.viewModel.image);
            self.button.jobsResetBtnTitle(self.viewModel.text);
            self.imageView.image = self.viewModel.bgImage;
            self.imageView
                    .imageURL(self.viewModel.imageUrl)
                    .placeholderImage(self.viewModel.bgImage)
                    .options(self.makeSDWebImageOptions)
                    .completed(^(UIImage * _Nullable image,
                                 NSError * _Nullable error,
                                 SDImageCacheType cacheType,
                                 NSURL * _Nullable imageURL) {
                        if (error) {
                            JobsLog(@"aa图片加载失败: %@-%@", error,imageURL);
                        } else {
                            JobsLog(@"图片加载成功");
                        }
                    }).load();
        }
        
        if([model isKindOfClass:GoodsClassModel.class]){
            self.goodsClsModel = model;
            self.button.jobsResetBtnImage(self.goodsClsModel.image);
            self.button.jobsResetBtnTitle(self.goodsClsModel.text);
            self.imageView
                    .imageURL(self.goodsClsModel.imageUrl)
                    .placeholderImage(self.goodsClsModel.bgImage)
                    .options(self.makeSDWebImageOptions)
                    .completed(^(UIImage * _Nullable image,
                                 NSError * _Nullable error,
                                 SDImageCacheType cacheType,
                                 NSURL * _Nullable imageURL) {
                        if (error) {
                            JobsLog(@"aa图片加载失败: %@-%@", error,imageURL);
                        } else {
                            JobsLog(@"图片加载成功");
                        }
                    }).load();
        } return self;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)cellSizeByModel{
    @jobs_weakify(self)
    return ^CGSize(NSNumber *_Nullable data){
        @jobs_strongify(self)
        FMGameCVCell.sourceType = data.integerValue;
        switch (self.sourceType) {
            case SourceType_Home:/// 来自首页
                return CGSizeMake(JobsWidth(88), JobsWidth(123));
                break;
            case SourceType_Favorite:/// 来自收藏
                return CGSizeMake(JobsWidth(108), JobsWidth(142));
                break;
            default:
                return CGSizeZero;
                break;
        }
    };
}
@dynamic sourceType;
static SourceType _sourceType;
+(SourceType)sourceType{
    return _sourceType;
}

+(void)setSourceType:(SourceType)type {
    _sourceType = type;
}
#pragma mark —— lazyLoad
@synthesize imageView = _imageView;
-(__kindof UIImageView *)imageView{
    if(!_imageView){
        @jobs_weakify(self)
        _imageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            [self.contentView.addSubview(imageView) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.equalTo(self.contentView);
                switch (FMGameCVCell.sourceType) {
                    case SourceType_Home:/// 来自首页
                        make.height.mas_equalTo(JobsWidth(88));
                        break;
                    case SourceType_Favorite:/// 来自收藏
                        make.height.mas_equalTo(JobsWidth(108));
                        break;
                    default:
                        make.height.mas_equalTo(JobsWidth(0));
                        break;
                }
            }];
        });
    }return _imageView;
}
@synthesize button = _button;
-(__kindof UIButton *)button{
    if(!_button){
        _button = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(1)
//            .jobsResetBtnImage(self.viewModel.image)
            .jobsResetBtnBgCor(JobsCor(@"#FF0000"))
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(bayonRegular(JobsWidth(12)))
//            .jobsResetBtnTitle(self.viewModel.text)
            .onClickBy(^(UIButton *x){
                JobsLog(@"");
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        [self.contentView.addSubview(_button) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(33));
            make.bottom.left.right.equalTo(self.contentView);
        }];
    }return _button;
}

@end
