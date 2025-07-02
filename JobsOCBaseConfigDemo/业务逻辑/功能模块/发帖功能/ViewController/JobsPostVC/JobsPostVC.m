//
//  JobsShootingVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs Hi on 9/26/23.
//

#import "JobsPostVC.h"

@interface JobsPostVC (){
    CGFloat JobsPostDelViewHeight;
}
/// UI
Prop_strong()HXPhotoView *postPhotoView;/// 展示选择的图片
Prop_strong()HXPhotoManager *photoManager;/// 选取图片的数据管理类
Prop_strong()JobsPostDelView *postDelView;/// 长按拖动的删除区域
Prop_strong()BaseButton *releaseBtn;
Prop_strong()UILabel *tipsLab;
/// Data
Prop_copy()NSArray <HXPhotoModel *>*historyPhotoDataArr;/// 与之相对应的是self.photoManager.afterSelectedArray
Prop_copy()NSArray <HXPhotoModel *>*photosDataArr;
Prop_copy()NSArray <HXPhotoModel *>*videosDataArr;
Prop_copy()NSString *inputDataString;
Prop_copy()NSString *inputDataHistoryString;
Prop_copy()NSString *pictures;
Prop_copy()NSString *videos;
Prop_copy()NSString *coverVideo;
Prop_strong()NSMutableArray <UIImage *>*photosImageMutArr;
Prop_strong()NSData *videosData;
Prop_strong()NSURL *videosUrl;
Prop_assign()BOOL isUpload;
Prop_assign()BOOL needDeleteItem;
Prop_strong()UITextModel *postTextModel;

@end

@implementation JobsPostVC

- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
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
    
    {
        JobsPostDelViewHeight = JobsPostDelView.viewSizeByModel(nil).height;
        self.historyPhotoDataArr = [self.photoManager getLocalModelsInFileWithAddData:YES];
        if (isValue(JobsUserModel.sharedManager.postDraftURLStr)) {
            self.inputDataHistoryString = [FileFolderHandleTool filePath:JobsUserModel.sharedManager.postDraftURLStr
                                                                fileType:FileType_TXT];
        }JobsLog(@"%@",self.inputDataHistoryString);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsWhiteColor;

    @jobs_weakify(self)
    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
//        @jobs_strongify(self)
//        data.add(UIBarButtonItem.initBy(self.aboutBtn));
    });
    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
        @jobs_strongify(self)
        data.add(UIBarButtonItem.initBy(self.releaseBtn));
    });
    self.makeNavByAlpha(1);
    
    self.textView.alpha = 1;
    self.tipsLab.alpha = 1;
    self.postPhotoView.alpha = 1;
    self.postDelView.alpha = 1;
    [self releaseBtnState:self.historyPhotoDataArr
          inputDataString:self.inputDataHistoryString];
    self.fd_interactivePopDisabled = YES;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.jobsTextView.updateWordCount(self.inputDataHistoryString.length);
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
//    if (!self.historyPhotoDataArr.count) {
//        HXPhotoSubViewCell *cell = (HXPhotoSubViewCell *)[self.postPhotoView.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
//        if (cell) {
//            cell.imageView.image = KIMG(@"选择资源➕");
//            [UIView cornerCutToCircleWithView:cell
//                              andCornerRadius:6];
//        }
//    }
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
#pragma mark —— 一些私有方法
/// 帖子视频上传 POST
-(jobsByVoidBlock _Nonnull)networking_postuploadVideoPOST{
    return ^(){
        
    };
}
/// 帖子图片上传 POST
-(jobsByVoidBlock _Nonnull)networking_postUploadImagePOST{
    return ^(){
        
    };
}
/// 发帖 POST
-(jobsByVoidBlock _Nonnull)networking_postAddPostPOST{
    return ^(){
        
    };
}
/// 发帖权限检测
-(jobsByVoidBlock _Nonnull)networking_checkHadRoleGET{
    return ^(){
        
    };
}

-(void)保留文字{
    @jobs_weakify(self)
    if (isValue(self.inputDataString)) {
        NSError *err;
        JobsUserModel.sharedManager.postDraftURLStr = [NSObject saveData:self.inputDataString
                                                    withDocumentsChildDir:JobsInternationalization(@"发帖草稿数据临时文件夹")
                                                             fileFullname:@"发帖草稿数据.txt"
                                                                    error:&err];
        if(err) JobsLog(@"%@",err.description);
    }else FileFolderHandleTool.cleanFilesWithPath(JobsUserModel.sharedManager.postDraftURLStr);
    JobsLog(@"%@",JobsUserModel.sharedManager.postDraftURLStr);
    [self.view hx_showLoadingHUDText:nil];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        BOOL success = [self.photoManager saveLocalModelsToFile];/// 保存图片
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            [self.view hx_handleLoading];
            if (success) {
                self.back(nil);
            }else [self.view hx_showImageHUDText:JobsInternationalization(@"保存失败")];
        });
    });
}

-(void)不保留文字{
    FileFolderHandleTool.cleanFilesWithPath(JobsUserModel.sharedManager.postDraftURLStr);
    [self.photoManager deleteLocalModelsInFile];
    self.back(nil);
}

-(void)saveDoc{
    @jobs_weakify(self)
    [NSObject showSPAlertControllerConfig:jobsMakeSPAlertControllerConfig(^(__kindof SPAlertControllerConfig * _Nullable config) {
        @jobs_strongify(self)
        config.SPAlertControllerInitType = NSObject_SPAlertControllerInitType_2;
        config.title = JobsInternationalization(@"提示");
        config.message = JobsInternationalization(@"是否将当前内容保存为草稿？");
        config.preferredStyle = SPAlertControllerStyleAlert;
        config.animationType = SPAlertAnimationTypeDefault;
        config.alertActionTitleArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>* _Nullable data) {
            data.add(JobsInternationalization(@"不保存"));
            data.add(JobsInternationalization(@"保存"));
        });
        config.alertActionStyleArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>* _Nullable data) {
            data.add(@(SPAlertActionStyleDestructive));
            data.add(@(SPAlertActionStyleDefault));
        });
        config.alertBtnActionArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>* _Nullable data) {
            data.add(JobsInternationalization(@"不保留文字"));
            data.add(JobsInternationalization(@"保留文字"));
        });
        config.targetVC = self;
        config.funcInWhere = self;
        config.animated = YES;
    })
                           alertVCBlock:^(SPAlertController *data,
                                          NSMutableArray <SPAlertAction *>*data2) {
        
        data.titleColor = JobsBlackColor;
        data.messageColor = JobsBlackColor;
        data.titleFont = UIFontWeightSemiboldSize(16);
        data.messageFont = UIFontWeightMediumSize(14);
        
        SPAlertAction *action1 = (SPAlertAction *)data2[0];
        SPAlertAction *action2 = (SPAlertAction *)data2[1];
        
        action1.titleColor = JobsLightGrayColor;
        action1.titleFont = UIFontWeightSemiboldSize(16);

        action2.titleColor = JobsBlackColor;
        action2.titleFont = UIFontWeightSemiboldSize(16);
        
    } completionBlock:nil];
}
/// 返回按钮点击方法 【覆写父类方法】 // 清空草稿   [self.photoManager deleteLocalModelsInFile];
-(jobsByBtnBlock _Nonnull)backBtnClickEvent{
    @jobs_weakify(self)
    return ^(UIButton *_Nullable sender) {
        @jobs_strongify(self)
        if (self.isUpload) return;
        if (!self.photoManager.afterSelectedArray.compareEqualArrElement(self.historyPhotoDataArr) ||//!d
            ![NSString isEqualStrA:self.inputDataHistoryString strB:self.inputDataString]) {
            [self saveDoc];
        }else self.back(sender);
    };
}
/// 因为manager上个界面也持有了，并不会释放。所以手动清空一下已选的数据
-(jobsByIDBlock _Nonnull)back{
    @jobs_weakify(self)
    return ^(id _Nullable sender){
        @jobs_strongify(self)
        [self.photoManager clearSelectedList];
        self.backViewControllerCore(self);
    };
}

-(void)releaseBtnState:(NSArray *)photoDataArr
       inputDataString:(NSString *)inputDataString{
    self.releaseBtn.enabled = photoDataArr.count || inputDataString.length;
    self.releaseBtn.jobsResetBtnBgImage(self.releaseBtn.enabled ? JobsIMG(@"发布") : JobsIMG(@"未发布"));
}
#pragma mark —— HXPhotoViewDelegate
/// 在这里获取到点选的资料
- (void)photoView:(HXPhotoView *)photoView
   changeComplete:(NSArray<HXPhotoModel *> *)allList//self.photoManager.afterSelectedArray
           photos:(NSArray<HXPhotoModel *> *)photos
           videos:(NSArray<HXPhotoModel *> *)videos
         original:(BOOL)isOriginal{
    self.photosDataArr = photos;
    self.videosDataArr = videos;
    @weakify(self)
    if (self.videosDataArr.count) {
        [FileFolderHandleTool getVideoFromPHAsset:self.videosDataArr.lastObject.asset
                                         complete:^(FileFolderHandleModel *data) {
            @strongify(self)
            self.videosData = data.data;
        }];
    }else if(self.photosDataArr.count){
        if (self.photosImageMutArr.count) [self.photosImageMutArr removeAllObjects];
        [self.photosDataArr hx_requestImageWithOriginal:NO
                                             completion:^(NSArray<UIImage *> * _Nullable imageArray,
                                                          NSArray<HXPhotoModel *> * _Nullable errorArray) {
            @strongify(self)
            self.photosImageMutArr = NSMutableArray.initBy(imageArray);
        }];
    }else{}
    [self releaseBtnState:allList
          inputDataString:self.inputDataString];
}

- (void)photoView:(HXPhotoView *)photoView
      updateFrame:(CGRect)frame {
}

- (void)photoView:(HXPhotoView *)photoView
currentDeleteModel:(HXPhotoModel *)model
     currentIndex:(NSInteger)index {
    /// 删除的时候需要将草稿删除
    if (self.photoManager.localModels) {
        NSMutableArray *localModels = self.photoManager.localModels.mutableCopy;
        if ([self.photoManager.localModels containsObject:model]) {
            [localModels removeObject:model];
        }self.photoManager.localModels = localModels.copy;
    }
}

- (BOOL)photoViewShouldDeleteCurrentMoveItem:(HXPhotoView *)photoView
                           gestureRecognizer:(UILongPressGestureRecognizer *)longPgr
                                   indexPath:(NSIndexPath *)indexPath {
    return self.needDeleteItem;
}

- (void)photoView:(HXPhotoView *)photoView
gestureRecognizerBegan:(UILongPressGestureRecognizer *)longPgr
        indexPath:(NSIndexPath *)indexPath{
    @weakify(self)
    [UIView animateWithDuration:0.25f
                     animations:^{
        @strongify(self)
        self.postDelView.y = JobsMainScreen_HEIGHT() - self->JobsPostDelViewHeight;
    }];
}

- (void)photoView:(HXPhotoView *)photoView
gestureRecognizerChange:(UILongPressGestureRecognizer *)longPgr
        indexPath:(NSIndexPath *)indexPath {
    CGPoint point = [longPgr locationInView:self.view];
    self.postDelView.jobsRichViewByModel(@(point.y >= self.postDelView.hx_y));
}

- (void)photoView:(HXPhotoView *)photoView
gestureRecognizerEnded:(UILongPressGestureRecognizer *)longPgr
        indexPath:(NSIndexPath *)indexPath {
    CGPoint point = [longPgr locationInView:self.view];
    self.needDeleteItem = point.y >= self.postDelView.y;
    if (point.y >= self.postDelView.y) {
        [self.postPhotoView deleteModelWithIndex:indexPath.item];
    }
    @jobs_weakify(self)
    [UIView animateWithDuration:0.25f
                     animations:^{
        @jobs_strongify(self)
        self.postDelView.y = JobsMainScreen_HEIGHT();
    } completion:^(BOOL finished) {
        @jobs_strongify(self)
        self.postDelView.jobsRichViewByModel(@(NO));
    }];
}
#pragma mark —— lazyLoad
-(BaseButton *)releaseBtn{
    if (!_releaseBtn) {
        @jobs_weakify(self)
        _releaseBtn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetBtnBgImage(JobsIMG(@"未发布"))
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(JobsInternationalization(@"发布"))
            .jobsResetBtnCornerRadiusValue(JobsWidth(23 / 2))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                [self.view endEditing:YES];
                [self networking_checkHadRoleGET];
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        _releaseBtn.enabled = NO;
        _releaseBtn.width = JobsWidth(38);
        _releaseBtn.height = JobsWidth(23);
        self.view.addSubview(_releaseBtn);
    }return _releaseBtn;
}
@synthesize jobsTextView = _jobsTextView;
-(JobsTextView *)jobsTextView{
    if (!_jobsTextView) {
        @jobs_weakify(self)
        _jobsTextView = makeJobsTextView(^(__kindof JobsTextView * _Nullable textView) {
            @jobs_strongify(self)
            textView.backgroundColor = JobsWhiteColor;
            textView.JobsRichViewByModel2(self.textModel)
                .JobsBlock1(^(id  _Nullable data) {
                    @jobs_strongify(self)
                    NSString *x = (NSString *)data;
                    self.inputDataString = x;
                    [self releaseBtnState:self.photoManager.afterSelectedArray
                          inputDataString:self.inputDataString];
            });
            [self.view.addSubview(textView) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(10));
                make.left.equalTo(self.view).offset(JobsWidth(0));
                make.right.equalTo(self.view).offset(JobsWidth(-0));
                make.height.mas_equalTo(JobsWidth(101));
            }];
        });
    }return _jobsTextView;
}

-(HXPhotoView *)postPhotoView{
    if (!_postPhotoView) {
        _postPhotoView = HXPhotoView.initBy(self.photoManager);
        _postPhotoView.spacing = 20.f;
        _postPhotoView.delegate = self;
        _postPhotoView.deleteCellShowAlert = NO;
        _postPhotoView.outerCamera = YES;
        _postPhotoView.previewShowDeleteButton = YES;
        [self.view.addSubview(_postPhotoView) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(JobsWidth(10));
            make.top.equalTo(self.tipsLab.mas_bottom).offset(JobsWidth(20));
            make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH() - JobsWidth(10) * 2, JobsWidth(600)));
        }];
    }return _postPhotoView;
}

-(HXPhotoManager *)photoManager {
    if (!_photoManager) {
        _photoManager = jobsMakeHXPhotoManagerBySelectedTypePhotoAndVideo(^(__kindof HXPhotoManager * _Nullable manager) {
            manager.configuration.localFileName = jobsCurrentAppName();// 设置保存的文件名称
            manager.configuration.type = HXConfigurationTypeWXChat;
            manager.configuration.showOriginalBytes = YES;
            manager.configuration.showOriginalBytesLoading = YES;
            manager.configuration.videoMaximumSelectDuration = -1;
            manager.configuration.limitVideoSize = 100 * 1024 * 1024;
            manager.configuration.selectVideoLimitSize = YES;
            manager.configuration.selectVideoBeyondTheLimitTimeAutoEdit = NO;
            manager.configuration.specialModeNeedHideVideoSelectBtn = NO;
            manager.configuration.videoMaxNum = 1;
            manager.configuration.maxNum = 9;
            manager.configuration.photoMaxNum = 9;
            manager.configuration.selectTogether = NO;
        });
    }return _photoManager;
}

-(JobsPostDelView *)postDelView{
    if (!_postDelView) {
        _postDelView = JobsPostDelView.new;
        self.view.addSubview(_postDelView);
        _postDelView.frame = JobsPostDelView.viewFrameByModel(nil);
        _postDelView.jobsRichViewByModel(nil);
    }return _postDelView;
}

-(UILabel *)tipsLab{
    if (!_tipsLab) {
        @jobs_weakify(self)
        _tipsLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.textColor = RGB_SAMECOLOR(173);
            label.font = UIFontWeightBoldSize(12);
            label.numberOfLines = 0;
            label.text = JobsInternationalization(@"1、内容不允许出现纯数字，英文字母；")
                .add(JobsNewline)
                .add(JobsInternationalization(@"2、图片/视频(图片最多9张/仅上传一段视频，大小不超100M)。"));
            [self.view.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view).offset(JobsWidth(14));
                make.top.equalTo(self.textView.mas_bottom).offset(JobsWidth(11));
            }];label.makeLabelByShowingType(UILabelShowingType_03);
        });
    }return _tipsLab;
}

-(UITextModel *)postTextModel{
    if(!_postTextModel){
        @jobs_weakify(self)
        _postTextModel = jobsMakeTextModel(^(__kindof UITextModel * _Nullable data) {
            @jobs_strongify(self)
            data.text = self.inputDataHistoryString;
            data.textCor = JobsBlackColor;
            data.placeholder = JobsInternationalization(@"撩骚内容，写在这里哦~");
            data.placeholderColor = RGB_SAMECOLOR(173);
            data.font = UIFontWeightRegularSize(14);
            data.maxWordCount = 10;
        });
    }return _postTextModel;
}

-(NSString *)inputDataHistoryString{
    if(!_inputDataHistoryString){
        _inputDataHistoryString = @"";
    }return _inputDataHistoryString;
}

-(NSMutableArray<UIImage *> *)photosImageMutArr{
    if (!_photosImageMutArr) {
        _photosImageMutArr = jobsMakeMutArr(^(NSMutableArray <UIImage *>* _Nullable data) {
            
        });
    }return _photosImageMutArr;
}

@end
