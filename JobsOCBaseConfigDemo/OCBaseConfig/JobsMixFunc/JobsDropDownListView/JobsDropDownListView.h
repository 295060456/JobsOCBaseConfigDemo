//
//  JobsDropDownListView.h
//  Casino
//
//  Created by Jobs on 2021/12/21.
//

#import "BaseView.h"
#import "JobsDropDownListTBVCell.h"
#import "UITableViewCellProtocol.h"

typedef enum : NSInteger {
    JobsDropDownListViewDirection_Down = 0,
    JobsDropDownListViewDirection_UP
} JobsDropDownListViewDirection;// JobsDropDownListView的方向

NS_ASSUME_NONNULL_BEGIN

@interface JobsDropDownListView : BaseView
<
UITableViewDelegate
,UITableViewDataSource
>

@property(nonatomic,assign)JobsDropDownListViewDirection direction;

-(void)dropDownListViewDisappear:(UIControl *_Nullable)x;
-(instancetype)initWithTableViewClass:(Class <UITableViewCellProtocol>_Nonnull)tableViewClass;// 要链接自定义的cell用这个初始化方法

@end

NS_ASSUME_NONNULL_END

/**
 【用法与用量】
 -(BaseButton *)btn{
     if(!_btn){
         @jobs_weakify(self)
         _btn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                  background:nil
                                  buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                               textAlignment:NSTextAlignmentCenter
                                            subTextAlignment:NSTextAlignmentCenter
                                                 normalImage:nil
                                              highlightImage:nil
                                             attributedTitle:nil
                                     selectedAttributedTitle:nil
                                          attributedSubtitle:nil
                                                       title:JobsInternationalization(@"点击按钮弹出下拉列表")
                                                    subTitle:nil
                                                   titleFont:UIFontWeightRegularSize(12)
                                                subTitleFont:nil
                                                    titleCor:JobsWhiteColor
                                                 subTitleCor:nil
                                          titleLineBreakMode:NSLineBreakByWordWrapping
                                       subtitleLineBreakMode:NSLineBreakByWordWrapping
                                         baseBackgroundColor:JobsOrangeColor
                                             backgroundImage:nil
                                                imagePadding:JobsWidth(0)
                                                titlePadding:JobsWidth(0)
                                              imagePlacement:NSDirectionalRectEdgeNone
                                  contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                    contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                               contentInsets:jobsSameDirectionalEdgeInsets(0)
                                           cornerRadiusValue:JobsWidth(8)
                                             roundingCorners:UIRectCornerAllCorners
                                        roundingCornersRadii:CGSizeZero
                                              layerBorderCor:nil
                                                 borderWidth:JobsWidth(1)
                                               primaryAction:nil
                                  longPressGestureEventBlock:^(id  _Nullable weakSelf,
                                                               id  _Nullable arg) {
             NSLog(@"按钮的长按事件触发");
      }
                                             clickEventBlock:^id(BaseButton *x){
             @jobs_strongify(self)
             if (self.objectBlock) self.objectBlock(x);
             NSLog(@"AAA = %@",self.dropDownListView);
             x.selected = !x.selected;
             if (x.selected) {
                 /// ❤️只能让它执行一次❤️
                 self.dropDownListView = [self motivateFromView:x
                                  jobsDropDownListViewDirection:self.dropDownListViewDirection
                                                           data:self.listViewData
                                             motivateViewOffset:JobsWidth(5)
                                                    finishBlock:^(UIViewModel *data) {
                     NSLog(@"data = %@",data);
                 }];
             }else{
                 [self endDropDownListView];
             }return nil;
          return nil;
         }];
         [self.view addSubview:_btn];
         [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.center.equalTo(self.view);
 //            make.size.mas_equalTo(CGSizeMake(JobsWidth(120), JobsWidth(25)));
             make.height.mas_equalTo(JobsWidth(30));
         }];
         _btn.makeBtnTitleByShowingType(UILabelShowingType_03);
     }return _btn;
 }
 
 */
