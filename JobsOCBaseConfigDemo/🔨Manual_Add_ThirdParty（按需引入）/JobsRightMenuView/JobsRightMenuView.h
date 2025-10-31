//
//  FMHomeRightMenuView.h
//  FM_Normal
//
//  Created by Admin on 10/4/2025.
//

#import "BaseImageView.h"
#import "JobsBlock.h"

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
         _rightMenuView = self.view.addSubview(JobsRightMenuView
                                               .BySize(JobsRightMenuView.viewSizeByModel(nil))
                                               .JobsRichViewByModel2(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                                                   viewModel.data = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIButton *>* _Nullable arr) {
                                                       arr.add(BaseButton.jobsInit()
                                                               .imageURL(@"".jobsUrl)
                                                               .placeholderImage(@"首页右侧悬浮菜单人工客服".img)
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
 //                                                          toast(@"人工客服");
                                                           self.唤起人工客服();
 //                                                          if (self.objBlock) self.objBlock(x);
                                                       }).onLongPressGestureBy(^(id data){
                                                           JobsLog(@"");
                                                       }).normalLoad())
                                                      .add(BaseButton.jobsInit()
                                                           .imageURL(@"".jobsUrl)
                                                           .placeholderImage(@"首页右侧悬浮菜单Telegram".img)
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
                                                          toast(@"Telegram");
                                                          self.jobsOpenURL(@"https://t.me/bsports_ph");
 //                                                         if (self.objBlock) self.objBlock(x);
                                                      }).onLongPressGestureBy(^(id data){
                                                          JobsLog(@"");
                                                      }).normalLoad())
                                                      .add(BaseButton.jobsInit()
                                                           .imageURL(@"".jobsUrl)
                                                           .placeholderImage(@"首页右侧悬浮菜单FaceBook".img)
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
                                                          toast(@"FaceBook");
                                                          self.jobsOpenURL(@"https://www.facebook.com/profile.php?id=61569306594235");
                                                          if (self.objBlock) self.objBlock(x);
                                                      }).onLongPressGestureBy(^(id data){
                                                          JobsLog(@"");
                                                      }).normalLoad());
                                                   });
                                               }))
                                               .JobsBlock1(^(UIButton *x) {
                                                   [UIView animateWithDuration:1
                                                                    animations:^{
                                                       @jobs_strongify(self)
                                                       self->_rightMenuView.resetOriginXByOffset(x.selected ? JobsWidth(-30) :JobsWidth(30));
                                                   }];
                                               }));
         _rightMenuView.resetOriginX(JobsMainScreen_WIDTH() - JobsWidth(20));
         _rightMenuView.resetOriginY(JobsStatusBarHeight() + JobsWidth(54 + 163 + 100));
     }return _rightMenuView;
 }
 
 */
