//
//  JobsMenuView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/17.
//

#import "BaseView.h"
#import "JobsLinkageMenuView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsMenuView : BaseView
/// Data
@property(nonatomic,strong)NSMutableArray <NSString *>*titleMutArr;
@property(nonatomic,strong)NSMutableArray <__kindof UIView *>*subViewMutArr;
@property(nonatomic,strong)NSMutableArray <UIImage *>*normal_titleBgImageMutArr;
@property(nonatomic,strong)NSMutableArray <UIImage *>*select_titleBgImageMutArr;
@property(nonatomic,strong)NSMutableArray <UIImage *>*normal_titleImageMutArr;
@property(nonatomic,strong)NSMutableArray <NSNumber *>*imagePaddings;

@property(nonatomic,strong)JobsLinkageMenuViewConfig *linkageMenuViewConfig;

@end

NS_ASSUME_NONNULL_END
/**
 @property(nonatomic,strong)JobsLinkageMenuView *menuView;
 
 -(JobsLinkageMenuView *)menuView{
     if(!_menuView){
         _menuView = [JobsLinkageMenuView.alloc initWithFrame:self.bounds
                                                    btnConfig:self.buttonModel];
         @jobs_weakify(self)
         [_menuView actionObjectBlock:^(id  _Nullable x) {
             @jobs_strongify(self)
             if (self.objectBlock) self.objectBlock(x);
         }];
         [self addSubview:_menuView];
     }return _menuView;
 }

 -(UIButtonModel *)buttonModel{
     if(!_buttonModel){
         @jobs_weakify(self)
         _buttonModel = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
             @jobs_strongify(self)
             data.normal_titles = self.titleMutArr;
             data.titleCor = JobsClearColor;
             data.selected_titleCor = JobsClearColor;
             data.normal_backgroundImages = self.normal_titleBgImageMutArr;
             data.selected_backgroundImages = self.select_titleBgImageMutArr;// TODO
             data.data = self.subViewMutArr;
         });
     }return _buttonModel;
 }

 -(NSMutableArray<NSString *> *)titleMutArr{
     if(!_titleMutArr){
         _titleMutArr = NSMutableArray.array;
         _titleMutArr.add(JobsInternationalization(@"TOP GAMES").add(@"       "));
         _titleMutArr.add(JobsInternationalization(@"SLOT GAMES").add(@"      "));
         _titleMutArr.add(JobsInternationalization(@"LIVE CASINO".add(@"       ")));
         _titleMutArr.add(JobsInternationalization(@"TABLE GAMES").add(@"     "));
         _titleMutArr.add(JobsInternationalization(@"SPORTS").add(@"                   "));
         _titleMutArr.add(JobsInternationalization(@"FISHING").add(@"                  "));
     }return _titleMutArr;
 }

 -(NSMutableArray<__kindof UIView *> *)subViewMutArr{
     if(!_subViewMutArr){
         _subViewMutArr = NSMutableArray.array;
         _subViewMutArr.add(self.topGamesView);
         _subViewMutArr.add(self.slotGamesView);
         _subViewMutArr.add(self.liveCasinoView);
         _subViewMutArr.add(self.tableGamesView);
         _subViewMutArr.add(self.sportsView);
         _subViewMutArr.add(self.fishingView);
     }return _subViewMutArr;
 }

 -(NSMutableArray<UIImage *> *)normal_titleBgImageMutArr{
     if(!_normal_titleBgImageMutArr){
         _normal_titleBgImageMutArr = NSMutableArray.array;
         _normal_titleBgImageMutArr.add(JobsIMG(@"Top_Games_menu_未点击"));
         _normal_titleBgImageMutArr.add(JobsIMG(@"Slot_Games_menu_未点击"));
         _normal_titleBgImageMutArr.add(JobsIMG(@"Live_Casino_menu_未点击"));
         _normal_titleBgImageMutArr.add(JobsIMG(@"Table_Games_menu_未点击"));
         _normal_titleBgImageMutArr.add(JobsIMG(@"Sport_Menu_未点击"));
         _normal_titleBgImageMutArr.add(JobsIMG(@"Fishing_menu_未点击"));
     }return _normal_titleBgImageMutArr;
 }

 -(NSMutableArray<UIImage *> *)select_titleBgImageMutArr{
     if(!_select_titleBgImageMutArr){
         _select_titleBgImageMutArr = NSMutableArray.array;
         _select_titleBgImageMutArr.add(JobsIMG(@"Top_Games_menu_已点击"));
         _select_titleBgImageMutArr.add(JobsIMG(@"Slot_Games_menu_已点击"));
         _select_titleBgImageMutArr.add(JobsIMG(@"Live_Casino_menu_已点击"));
         _select_titleBgImageMutArr.add(JobsIMG(@"Table_Games_menu_已点击"));
         _select_titleBgImageMutArr.add(JobsIMG(@"Sport_Menu_已点击"));
         _select_titleBgImageMutArr.add(JobsIMG(@"Fishing_menu_已点击"));
     }return _select_titleBgImageMutArr;
 }

 -(FMHomeTopGamesView *)topGamesView{
     if(!_topGamesView){
         _topGamesView = FMHomeTopGamesView.new;
         _topGamesView.frame = self.bounds;
         _topGamesView.jobsRichElementsInViewWithModel(nil);
     }return _topGamesView;
 }

 -(FMHomeSlotGamesView *)slotGamesView{
     if(!_slotGamesView){
         _slotGamesView = FMHomeSlotGamesView.new;
         _slotGamesView.frame = self.bounds;
         _slotGamesView.jobsRichElementsInViewWithModel(nil);
     }return _slotGamesView;
 }

 -(FMHomeLiveCasinoView *)liveCasinoView{
     if(!_liveCasinoView){
         _liveCasinoView = FMHomeLiveCasinoView.new;
         _liveCasinoView.frame = self.bounds;
         _liveCasinoView.jobsRichElementsInViewWithModel(nil);
     }return _liveCasinoView;
 }

 -(FMHomeTableGamesView *)tableGamesView{
     if(!_tableGamesView){
         _tableGamesView = FMHomeTableGamesView.new;
         _tableGamesView.frame = self.bounds;
         _tableGamesView.jobsRichElementsInViewWithModel(nil);
     }return _tableGamesView;
 }

 -(FMHomeSportsView *)sportsView{
     if(!_sportsView){
         _sportsView = FMHomeSportsView.new;
         _sportsView.frame = self.bounds;
         _sportsView.jobsRichElementsInViewWithModel(nil);
     }return _sportsView;
 }

 -(FMHomeFishingView *)fishingView{
     if(!_fishingView){
         _fishingView = FMHomeFishingView.new;
         _fishingView.frame = self.bounds;
         _fishingView.jobsRichElementsInViewWithModel(nil);
     }return _fishingView;
 }
 
 */
