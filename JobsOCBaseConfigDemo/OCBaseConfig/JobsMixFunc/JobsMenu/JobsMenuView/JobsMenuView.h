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
         _buttonModel = UIButtonModel.new;
         _buttonModel.normal_titles = self.titleMutArr;
         _buttonModel.titleCor = JobsClearColor;
         _buttonModel.selected_titleCor = JobsClearColor;
         _buttonModel.normal_backgroundImages = self.normal_titleBgImageMutArr;
         _buttonModel.selected_backgroundImages = self.select_titleBgImageMutArr;// TODO
         _buttonModel.data = self.subViewMutArr;
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

 -(TopGamesView *)topGamesView{
     if(!_topGamesView){
         _topGamesView = TopGamesView.new;
         _topGamesView.frame = self.bounds;
         _topGamesView.jobsRichElementsInViewWithModel(nil);
     }return _topGamesView;
 }

 -(SlotGamesView *)slotGamesView{
     if(!_slotGamesView){
         _slotGamesView = SlotGamesView.new;
         _slotGamesView.frame = self.bounds;
         _slotGamesView.jobsRichElementsInViewWithModel(nil);
     }return _slotGamesView;
 }

 -(LiveCasinoView *)liveCasinoView{
     if(!_liveCasinoView){
         _liveCasinoView = LiveCasinoView.new;
         _liveCasinoView.frame = self.bounds;
         _liveCasinoView.jobsRichElementsInViewWithModel(nil);
     }return _liveCasinoView;
 }

 -(TableGamesView *)tableGamesView{
     if(!_tableGamesView){
         _tableGamesView = TableGamesView.new;
         _tableGamesView.frame = self.bounds;
         _tableGamesView.jobsRichElementsInViewWithModel(nil);
     }return _tableGamesView;
 }

 -(SportsView *)sportsView{
     if(!_sportsView){
         _sportsView = SportsView.new;
         _sportsView.frame = self.bounds;
         _sportsView.jobsRichElementsInViewWithModel(nil);
     }return _sportsView;
 }

 -(FishingView *)fishingView{
     if(!_fishingView){
         _fishingView = FishingView.new;
         _fishingView.frame = self.bounds;
         _fishingView.jobsRichElementsInViewWithModel(nil);
     }return _fishingView;
 }
 
 */
