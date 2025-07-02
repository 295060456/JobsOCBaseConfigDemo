//
//  JobsMenuView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/17.
//

#import "JobsBlock.h"
#import "BaseView.h"
#import "JobsLinkageMenuView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsMenuView : BaseView
/// Data
Prop_strong()NSMutableArray <NSString *>*titleMutArr;
Prop_strong()NSMutableArray <__kindof UIView *>*subViewMutArr;
Prop_strong()NSMutableArray <UIImage *>*normal_titleBgImageMutArr;
Prop_strong()NSMutableArray <UIImage *>*select_titleBgImageMutArr;
Prop_strong()NSMutableArray <UIImage *>*normal_titleImageMutArr;
Prop_strong()NSMutableArray <NSNumber *>*imagePaddings;

Prop_strong()JobsLinkageMenuViewConfig *linkageMenuViewConfig;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UILabel *_Nonnull jobsMakeMenuView(jobsByMenuViewBlock _Nonnull block){
    JobsMenuView *data = JobsMenuView.alloc.init;
    if (block) block(data);
    return data;
}

/**
 Prop_strong()JobsLinkageMenuView *menuView;
 
 -(JobsMenuView *)menuView{
     if(!_menuView){
         @jobs_weakify(self)
         _menuView = JobsMenuView.ByFrame(self.bounds)
         .JobsRichViewByModel2(nil)
         .JobsBlock1(^(id _Nullable data) {
             @jobs_strongify(self)
             if (self.objBlock) self.objBlock(data);
         });
     }return _menuView;
 }

 -(UIButtonModel *)buttonModel{
     if(!_buttonModel){
         @jobs_weakify(self)
         _buttonModel = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
             @jobs_strongify(self)
             data.normal_titles = self.titleMutArr;
             data.titleCor = JobsClearColor;
             data.selectedTitleCor = JobsClearColor;
             data.normal_backgroundImages = self.normal_titleBgImageMutArr;
             data.selected_backgroundImages = self.select_titleBgImageMutArr;// TODO
             data.data = self.subViewMutArr;
         });
     }return _buttonModel;
 }

 -(NSMutableArray<NSString *> *)titleMutArr{
     if(!_titleMutArr){
         _titleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>* _Nullable arr) {
             arr.add(JobsInternationalization(@"TOP GAMES").add(@"       "))
             .add(JobsInternationalization(@"SLOT GAMES").add(@"      "))
             .add(JobsInternationalization(@"LIVE CASINO".add(@"       ")))
             .add(JobsInternationalization(@"TABLE GAMES").add(@"     "))
             .add(JobsInternationalization(@"SPORTS").add(@"                   "))
             .add(JobsInternationalization(@"FISHING").add(@"                  "));
         });
     }return _titleMutArr;
 }

 -(NSMutableArray<__kindof UIView *> *)subViewMutArr{
     if(!_subViewMutArr){
         @jobs_weakify(self)
         _subViewMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
             @jobs_strongify(self)
             arr.add(FMHomeTopGamesView
                     .ByFrame(self.bounds)
                     .JobsRichViewByModel2(nil)
                     .JobsBlock1(^(id  _Nullable data) {
                         
                     }))
             .add(FMHomeSlotGamesView
                  .ByFrame(self.bounds)
                  .JobsRichViewByModel2(nil)
                  .JobsBlock1(^(id  _Nullable data) {
                      
                  }))
             .add(FMHomeLiveCasinoView
                  .ByFrame(self.bounds)
                  .JobsRichViewByModel2(nil)
                  .JobsBlock1(^(id  _Nullable data) {
                      
                  }))
             .add(FMHomeTableGamesView
                  .ByFrame(self.bounds)
                  .JobsRichViewByModel2(nil)
                  .JobsBlock1(^(id  _Nullable data) {
                      
                  }))
             .add(FMHomeSportsView
                  .ByFrame(self.bounds)
                  .JobsRichViewByModel2(nil)
                  .JobsBlock1(^(id  _Nullable data) {
                      
                  }))
             .add(FMHomeFishingView
                  .ByFrame(self.bounds)
                  .JobsRichViewByModel2(nil)
                  .JobsBlock1(^(id  _Nullable data) {
                      
                  }));
         });
     }return _subViewMutArr;
 }

 -(NSMutableArray<UIImage *> *)normal_titleBgImageMutArr{
     if(!_normal_titleBgImageMutArr){
         _normal_titleBgImageMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
             arr.add(JobsIMG(@"Top_Games_menu_未点击"))
             .add(JobsIMG(@"Slot_Games_menu_未点击"))
             .add(JobsIMG(@"Live_Casino_menu_未点击"))
             .add(JobsIMG(@"Table_Games_menu_未点击"))
             .add(JobsIMG(@"Sport_Menu_未点击"))
             .add(JobsIMG(@"Fishing_menu_未点击"));
         });
     }return _normal_titleBgImageMutArr;
 }

 -(NSMutableArray<UIImage *> *)select_titleBgImageMutArr{
     if(!_select_titleBgImageMutArr){
         _select_titleBgImageMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
             arr.add(JobsIMG(@"Top_Games_menu_已点击"))
             .add(JobsIMG(@"Slot_Games_menu_已点击"))
             .add(JobsIMG(@"Live_Casino_menu_已点击"))
             .add(JobsIMG(@"Table_Games_menu_已点击"))
             .add(JobsIMG(@"Sport_Menu_已点击"))
             .add(JobsIMG(@"Fishing_menu_已点击"));
         });
     }return _select_titleBgImageMutArr;
 }
 
 */
