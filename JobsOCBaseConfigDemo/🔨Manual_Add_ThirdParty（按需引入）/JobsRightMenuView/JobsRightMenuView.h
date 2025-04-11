//
//  FMHomeRightMenuView.h
//  FM_Normal
//
//  Created by Admin on 10/4/2025.
//

#import "BaseImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsRightMenuView : BaseImageView

-(jobsByBtnBlock _Nonnull)resetUI;

@end

NS_ASSUME_NONNULL_END

/**
 #import "JobsRightMenuView.h" /// 首页右侧菜单
 Prop_strong()JobsRightMenuView *rightMenuView; /// 首页右侧菜单
 self.rightMenuView.alpha = 1;
 
 -(JobsRightMenuView *)rightMenuView{
     if(!_rightMenuView){
         @jobs_weakify(self)
         _rightMenuView = JobsRightMenuView
             .BySize(FMHomeRightMenuView.viewSizeByModel(nil))
             .JobsRichViewByModel2(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                 viewModel.data = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
                     arr.add(BaseButton.jobsInit()
                             .imageURL(@"".jobsUrl)
                             .placeholderImage(JobsIMG(@"首页右侧悬浮菜单人工客服"))
                             .options(SDWebImageRefreshCached)/// 强制刷新缓存
                             .completed(^(UIImage * _Nullable image,
                                          NSError * _Nullable error,
                                          SDImageCacheType cacheType,
                                          NSURL * _Nullable imageURL) {
                                 if (error) {
                                     JobsLog(@"图片加载失败: %@-%@", error,imageURL);
                                 } else {
                                     JobsLog(@"图片加载成功");
                                 }
                             }).onClickBy(^(UIButton *x){
                                 @jobs_strongify(self)
                                 self->_rightMenuView.resetUI(x);
                                 x.selected = !x.selected;
 //                                if (self.objBlock) self.objBlock(x);
                             }).onLongPressGestureBy(^(id data){
                             JobsLog(@"");
                         }).normalLoad());
                     arr.add(BaseButton.jobsInit()
                             .imageURL(@"".jobsUrl)
                             .placeholderImage(JobsIMG(@"首页右侧悬浮菜单Telegram"))
                             .options(SDWebImageRefreshCached)/// 强制刷新缓存
                             .completed(^(UIImage * _Nullable image,
                                          NSError * _Nullable error,
                                          SDImageCacheType cacheType,
                                          NSURL * _Nullable imageURL) {
                                 if (error) {
                                     JobsLog(@"图片加载失败: %@-%@", error,imageURL);
                                 } else {
                                     JobsLog(@"图片加载成功");
                                 }
                             }).onClickBy(^(UIButton *x){
                                 @jobs_strongify(self)
                                 self->_rightMenuView.resetUI(x);
                                 x.selected = !x.selected;
 //                                if (self.objBlock) self.objBlock(x);
                             }).onLongPressGestureBy(^(id data){
                             JobsLog(@"");
                         }).normalLoad());
                     arr.add(BaseButton.jobsInit()
                             .imageURL(@"".jobsUrl)
                             .placeholderImage(JobsIMG(@"首页右侧悬浮菜单FaceBook"))
                             .options(SDWebImageRefreshCached)/// 强制刷新缓存
                             .completed(^(UIImage * _Nullable image,
                                          NSError * _Nullable error,
                                          SDImageCacheType cacheType,
                                          NSURL * _Nullable imageURL) {
                                 if (error) {
                                     JobsLog(@"图片加载失败: %@-%@", error,imageURL);
                                 } else {
                                     JobsLog(@"图片加载成功");
                                 }
                             }).onClickBy(^(UIButton *x){
                                 @jobs_strongify(self)
                                 self->_rightMenuView.resetUI(x);
                                 x.selected = !x.selected;
 //                                if (self.objBlock) self.objBlock(x);
                             }).onLongPressGestureBy(^(id data){
                             JobsLog(@"");
                         }).normalLoad());
                 });
             }))
             .JobsBlock1(^(UIButton *x) {
                 [UIView animateWithDuration:1
                                  animations:^{
                     @jobs_strongify(self)
                     self->_rightMenuView.resetOriginXByOffset(x.selected ? JobsWidth(-50) :JobsWidth(50));
                 }];
             });
         self.view.addSubview(_rightMenuView);
         _rightMenuView.resetOriginX(JobsMainScreen_WIDTH() - JobsWidth(20));
         _rightMenuView.resetOriginY(JobsStatusBarHeight() + JobsWidth(54 + 163 + 100));
     }return _rightMenuView;
 }
 
 */
