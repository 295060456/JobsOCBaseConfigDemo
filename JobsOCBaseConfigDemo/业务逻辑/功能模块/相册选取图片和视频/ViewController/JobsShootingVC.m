//
//  JobsShootingVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs Hi on 9/26/23.
//

#import "JobsShootingVC.h"

@interface JobsShootingVC ()
/// UI
@property(nonatomic,strong)UIButton *cameraBtn;
@property(nonatomic,strong)UIButton *photoAlbumBtn;
@property(nonatomic,strong)UIImageView *imageView;
/// Data
@property(nonatomic,strong)NSMutableArray <UIImage *>*photosImageMutArr;

@end

@implementation JobsShootingVC

- (void)dealloc{
    JobsRemoveNotification(self);
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(16);
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
//        self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = JobsWhiteColor;
    self.makeNavByAlpha(1);
    
    self.cameraBtn.alpha = 1;
    self.photoAlbumBtn.alpha = 1;
    self.imageView.alpha = 1;
}
#pragma mark —— 一些私有方法
/// 选取最后一张你选的图，作为显示
-(void)getImageFromResource:(NSArray <HXPhotoModel *>*)resource{
//    @jobs_weakify(self)

}
#pragma mark —— lazyLoad
-(UIButton *)cameraBtn{
    if(!_cameraBtn){
        _cameraBtn = UIButton.new;
        _cameraBtn.jobsResetBtnTitle(JobsInternationalization(@"调取系统相机"));
        _cameraBtn.backgroundColor = JobsGreenColor;
        _cameraBtn.jobsResetBtnTitleCor(JobsWhiteColor);
        [self.view addSubview:_cameraBtn];
        [_cameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(50));
            make.left.equalTo(self.view).offset(JobsWidth(20));
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(100));
        }];
        _cameraBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
        @jobs_weakify(self)
        [_cameraBtn jobsBtnClickEventBlock:^id(id data) {
            /// 调取系统相机
            [self hx_invokeSysCameraSuccessBlock:^(HXPhotoPickerModel *data) {
                @jobs_strongify(self)
                self.imageView.image = data.photoModel.previewPhoto;
            } failBlock:^(HXPhotoPickerModel *data) {
                @jobs_strongify(self)
            }];
            return nil;
        }];
    }return _cameraBtn;
}

-(UIButton *)photoAlbumBtn{
    if(!_photoAlbumBtn){
        _photoAlbumBtn = UIButton.new;
        _photoAlbumBtn.backgroundColor = JobsBlueColor;
        _photoAlbumBtn.jobsResetBtnTitleCor(JobsWhiteColor);
        _photoAlbumBtn.jobsResetBtnTitle(JobsInternationalization(@"调取系统相机"));
        [self.view addSubview:_photoAlbumBtn];
        [_photoAlbumBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(50));
            make.right.equalTo(self.view).offset(JobsWidth(-20));
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(100));
        }];
        _photoAlbumBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
        [_photoAlbumBtn jobsBtnClickEventBlock:^id(id data) {
            /// 调取系统相册
            @jobs_weakify(self)
            [self hx_invokeSysPhotoAlbumSuccessBlock:^(HXPhotoPickerModel *data) {
                self.photoManager = data.photoManager;
                [data.photoList hx_requestImageWithOriginal:NO
                                                 completion:^(NSArray<UIImage *> * _Nullable imageArray,
                                                              NSArray<HXPhotoModel *> * _Nullable errorArray) {
                    @jobs_strongify(self)
                    self.photosImageMutArr = [NSMutableArray arrayWithArray:imageArray];
                    self.imageView.image = (UIImage *)self.photosImageMutArr.lastObject;/// 永远值显示最后选择的图
                }];
            } failBlock:^(HXPhotoPickerModel *data) {
//                @jobs_strongify(self)
            }];return nil;
        }];
    }return _photoAlbumBtn;
}

-(UIImageView *)imageView{
    if(!_imageView){
        @jobs_weakify(self)
        _imageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.image = JobsIMG(@"选择资源➕");
            self.view.addSubview(imageView);
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(200), JobsWidth(200)));
                make.centerX.equalTo(self.view);
                make.top.equalTo(self.photoAlbumBtn.mas_bottom).offset(JobsWidth(50));
            }];
        });
    }return _imageView;
}

@end
