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
@property(nonatomic,strong)HXPhotoView *postPhotoView;/// 展示选择的图片
@property(nonatomic,strong)HXPhotoManager *photoManager;/// 选取图片的数据管理类
@property(nonatomic,strong)JobsPostDelView *postDelView;/// 长按拖动的删除区域
@property(nonatomic,strong)JobsTextView *textView;
@property(nonatomic,strong)UIButton *releaseBtn;
@property(nonatomic,strong)UIBarButtonItem *releaseBtnItem;
@property(nonatomic,strong)UILabel *tipsLab;
/// Data
@property(nonatomic,strong)NSArray <HXPhotoModel *>*historyPhotoDataArr;/// 与之相对应的是self.photoManager.afterSelectedArray
@property(nonatomic,strong)NSArray <HXPhotoModel *>*photosDataArr;
@property(nonatomic,strong)NSArray <HXPhotoModel *>*videosDataArr;
@property(nonatomic,strong)NSString *inputDataString;
@property(nonatomic,strong)NSString *inputDataHistoryString;
@property(nonatomic,strong)NSString *pictures;
@property(nonatomic,strong)NSString *videos;
@property(nonatomic,strong)NSString *coverVideo;
@property(nonatomic,strong)NSMutableArray <UIImage *>*photosImageMutArr;
@property(nonatomic,strong)NSData *videosData;
@property(nonatomic,strong)NSURL *videosUrl;
@property(nonatomic,assign)BOOL isUpload;
@property(nonatomic,assign)BOOL needDeleteItem;
@property(nonatomic,strong)UITextModel *postTextModel;

@end

@implementation JobsPostVC
UIViewModelProtocol_synthesize
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
    
    {
        self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
        self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
        self.viewModel.textModel.font = UIFontWeightRegularSize(16);
        
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
//        self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
        self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
        self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
    }
    
    {
        JobsPostDelViewHeight =[JobsPostDelView viewSizeWithModel:nil].height;
        self.historyPhotoDataArr = [self.photoManager getLocalModelsInFileWithAddData:YES];
        if (![NSString isNullString:JobsUserModel.sharedManager.postDraftURLStr]) {
            self.inputDataHistoryString = [FileFolderHandleTool filePath:JobsUserModel.sharedManager.postDraftURLStr
                                                                fileType:TXT];
        }
        NSLog(@"%@",self.inputDataHistoryString);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsWhiteColor;
    self.setGKNav(nil);
    self.setGKNavBackBtn(nil);
    self.gk_navigationBar.jobsVisible = YES;
    self.gk_navRightBarButtonItem = self.releaseBtnItem;
    
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
    [self.textView updateWordCount:self.inputDataHistoryString.length];
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
-(void)networking_postuploadVideoPOST{}
/// 帖子图片上传 POST
-(void)networking_postUploadImagePOST{}
/// 发帖 POST
-(void)networking_postAddPostPOST{}
/// 发帖权限检测
-(void)networking_checkHadRoleGET{}

-(void)保留文字{
    if (![NSString isNullString:self.inputDataString]) {
        JobsUserModel.sharedManager.postDraftURLStr = [NSObject saveData:self.inputDataString
                                                   withDocumentsChildDir:JobsInternationalization(@"发帖草稿数据临时文件夹")
                                                            fileFullname:@"发帖草稿数据.txt"
                                                                   error:nil];
    }else{
        [FileFolderHandleTool cleanFilesWithPath:JobsUserModel.sharedManager.postDraftURLStr];
    }
    NSLog(@"%@",JobsUserModel.sharedManager.postDraftURLStr);
    [self.view hx_showLoadingHUDText:nil];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        BOOL success = [self.photoManager saveLocalModelsToFile];//保存图片
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.view hx_handleLoading];
            if (success) {
                [self back:nil];
            }else {
                [self.view hx_showImageHUDText:JobsInternationalization(@"保存失败")];
            }
        });
    });
}

-(void)不保留文字{
    [FileFolderHandleTool cleanFilesWithPath:JobsUserModel.sharedManager.postDraftURLStr];
    [self.photoManager deleteLocalModelsInFile];
    [self back:nil];
}

-(void)saveDoc{
    SPAlertControllerConfig *config = SPAlertControllerConfig.new;
    config.SPAlertControllerInitType = NSObject_SPAlertControllerInitType_2;
    config.title = JobsInternationalization(@"提示");
    config.message = JobsInternationalization(@"是否将当前内容保存为草稿？");
    config.preferredStyle = SPAlertControllerStyleAlert;
    config.animationType = SPAlertAnimationTypeDefault;
    config.alertActionTitleArr = @[JobsInternationalization(@"不保存"),JobsInternationalization(@"保存")];
    config.alertActionStyleArr = @[@(SPAlertActionStyleDestructive),@(SPAlertActionStyleDefault)];
    config.alertBtnActionArr = @[JobsInternationalization(@"不保留文字"),JobsInternationalization(@"保留文字")];
    config.targetVC = self;
    config.funcInWhere = self;
    config.animated = YES;
    
    [NSObject showSPAlertControllerConfig:config
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
        if (![self.photoManager.afterSelectedArray compareEqualArrElement:self.historyPhotoDataArr] ||//!d
            ![NSString isEqualStrA:self.inputDataHistoryString strB:self.inputDataString]) {
            [self saveDoc];
        }else [self back:sender];
    };
}

- (void)back:(id)sender{
    /// 因为manager上个界面也持有了，并不会释放。所以手动清空一下已选的数据
    [self.photoManager clearSelectedList];
    switch (self.pushOrPresent) {
        case ComingStyle_PRESENT:{
            [self dismissViewControllerAnimated:YES completion:nil];
        }break;
        case ComingStyle_PUSH:{
            self.navigationController ? [self.navigationController popViewControllerAnimated:YES] : [self dismissViewControllerAnimated:YES completion:nil];
        }break;
            
        default:
            break;
    }
}

-(void)releaseBtnState:(NSArray *)photoDataArr
       inputDataString:(NSString *)inputDataString{
    self.releaseBtn.enabled = photoDataArr.count || inputDataString.length;
    self.releaseBtn.normalBackgroundImage(self.releaseBtn.enabled ? JobsIMG(@"发布") : JobsIMG(@"未发布"));
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
            self.photosImageMutArr = [NSMutableArray arrayWithArray:imageArray];
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
    // 删除的时候需要将草稿删除
    if (self.photoManager.localModels) {
        NSMutableArray *localModels = self.photoManager.localModels.mutableCopy;
        if ([self.photoManager.localModels containsObject:model]) {
            [localModels removeObject:model];
        }
        self.photoManager.localModels = localModels.copy;
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
    self.postDelView.jobsRichElementsInViewWithModel(@(point.y >= self.postDelView.hx_y));
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
        self.postDelView.jobsRichElementsInViewWithModel(@(NO));
    }];
}
#pragma mark —— lazyLoad
-(UIButton *)releaseBtn{
    if (!_releaseBtn) {
        _releaseBtn = UIButton.new;
        _releaseBtn.enabled = NO;
        _releaseBtn.normalBackgroundImage(JobsIMG(@"未发布"));
        _releaseBtn.normalTitle(JobsInternationalization(@"发布"));
        _releaseBtn.normalTitleColor(JobsWhiteColor);
        _releaseBtn.titleFont(UIFontWeightRegularSize(12.5));
        _releaseBtn.width = JobsWidth(38);
        _releaseBtn.height = JobsWidth(23);
        @jobs_weakify(self)
        [_releaseBtn jobsBtnClickEventBlock:^id(id data) {
            @jobs_strongify(self)
            [self.view endEditing:YES];
            [self networking_checkHadRoleGET];
            return nil;
        }];
        [self.view addSubview:_releaseBtn];
        _releaseBtn.cornerCutToCircleWithCornerRadius(_releaseBtn.height / 2);
    }return _releaseBtn;
}

-(UIBarButtonItem *)releaseBtnItem{
    if (!_releaseBtnItem) {
        _releaseBtnItem = [UIBarButtonItem.alloc initWithCustomView:self.releaseBtn];
    }return _releaseBtnItem;
}

-(JobsTextView *)textView{
    if (!_textView) {
        _textView = JobsTextView.new;
        _textView.backgroundColor = JobsWhiteColor;
        [self.view addSubview:_textView];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(10));
            make.left.equalTo(self.view).offset(JobsWidth(0));
            make.right.equalTo(self.view).offset(JobsWidth(-0));
            make.height.mas_equalTo(JobsWidth(101));
        }];
        _textView.jobsRichElementsInViewWithModel(self.textModel);
        @jobs_weakify(self)
        [_textView actionObjectBlock:^(id data) {
            @jobs_strongify(self)
            NSString *x = (NSString *)data;
            self.inputDataString = x;
            [self releaseBtnState:self.photoManager.afterSelectedArray
                  inputDataString:self.inputDataString];
        }];
    }return _textView;
}

-(HXPhotoView *)postPhotoView{
    if (!_postPhotoView) {
        _postPhotoView = [HXPhotoView photoManager:self.photoManager];
        _postPhotoView.spacing = 20.f;
        _postPhotoView.delegate = self;
        _postPhotoView.deleteCellShowAlert = NO;
        _postPhotoView.outerCamera = YES;
        _postPhotoView.previewShowDeleteButton = YES;
        [self.view addSubview:_postPhotoView];
        [_postPhotoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(JobsWidth(10));
            make.top.equalTo(self.tipsLab.mas_bottom).offset(JobsWidth(20));
            make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH() - JobsWidth(10) * 2, JobsWidth(600)));
        }];
    }return _postPhotoView;
}

-(HXPhotoManager *)photoManager {
    if (!_photoManager) {
        _photoManager = [HXPhotoManager.alloc initWithType:HXPhotoManagerSelectedTypePhotoAndVideo];
        _photoManager.configuration.localFileName = jobsCurrentAppName();// 设置保存的文件名称
        _photoManager.configuration.type = HXConfigurationTypeWXChat;
        _photoManager.configuration.showOriginalBytes = YES;
        _photoManager.configuration.showOriginalBytesLoading = YES;
        _photoManager.configuration.videoMaximumSelectDuration = -1;
        _photoManager.configuration.limitVideoSize = 100 * 1024 * 1024;
        _photoManager.configuration.selectVideoLimitSize = YES;
        _photoManager.configuration.selectVideoBeyondTheLimitTimeAutoEdit = NO;
        _photoManager.configuration.specialModeNeedHideVideoSelectBtn = NO;
        _photoManager.configuration.videoMaxNum = 1;
        _photoManager.configuration.maxNum = 9;
        _photoManager.configuration.photoMaxNum = 9;
        _photoManager.configuration.selectTogether = NO;
    }return _photoManager;
}

-(JobsPostDelView *)postDelView{
    if (!_postDelView) {
        _postDelView = JobsPostDelView.new;
        [self.view addSubview:_postDelView];
        _postDelView.frame = [JobsPostDelView viewFrameWithModel:nil];
        _postDelView.jobsRichElementsInViewWithModel(nil);
    }return _postDelView;
}

-(UILabel *)tipsLab{
    if (!_tipsLab) {
        _tipsLab = UILabel.new;
        _tipsLab.textColor = RGB_SAMECOLOR(173);
        _tipsLab.font = UIFontWeightBoldSize(12);
        _tipsLab.numberOfLines = 0;
        _tipsLab.text = JobsInternationalization(@"1、内容不允许出现纯数字，英文字母；\n2、图片/视频(图片最多9张/仅上传一段视频，大小不超100M)。");
        [self.view addSubview:_tipsLab];
        [_tipsLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(JobsWidth(14));
            make.top.equalTo(self.textView.mas_bottom).offset(JobsWidth(11));
        }];
        _tipsLab.makeLabelByShowingType(UILabelShowingType_03);
    }return _tipsLab;
}

-(UITextModel *)postTextModel{
    if(!_postTextModel){
        _postTextModel = UITextModel.new;
        _postTextModel.text = self.inputDataHistoryString;
        _postTextModel.textCor = JobsBlackColor;
        _postTextModel.placeholder = JobsInternationalization(@"撩骚内容，写在这里哦~");
        _postTextModel.placeholderColor = RGB_SAMECOLOR(173);
        _postTextModel.font = UIFontWeightRegularSize(14);
        _postTextModel.maxWordCount = 10;
    }return _textModel;
}

-(NSString *)inputDataHistoryString{
    if(!_inputDataHistoryString){
        _inputDataHistoryString = JobsInternationalization(@"");
    }return _inputDataHistoryString;
}

-(NSMutableArray<UIImage *> *)photosImageMutArr{
    if (!_photosImageMutArr) {
        _photosImageMutArr = NSMutableArray.array;
    }return _photosImageMutArr;
}

@end
