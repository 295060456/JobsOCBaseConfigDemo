//
//  MsgEditBoardView.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/6.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MsgEditBoardView : BaseView

#pragma mark —— 一些公有方法
-(UIButton *)getAllChooseBtn;
-(UIButton *)getMarkToReadBtn;
-(UIButton *)getDeleteBtn;

-(void)appearByView:(UIView * _Nonnull)view;
-(void)disappearByView:(UIView * _Nullable)view;

@end

NS_ASSUME_NONNULL_END
