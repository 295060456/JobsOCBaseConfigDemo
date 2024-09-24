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
     _btn = BaseButton
         .initByStyle1(JobsInternationalization(@"点击按钮弹出下拉列表"),UIFontWeightRegularSize(12),JobsWhiteColor)
         .bgColor(JobsWhiteColor)
         .cornerRadiusValue(JobsWidth(8))
         .onClick(^(UIButton *x){
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
             }
         }).onLongPressGesture(^(id data){
             NSLog(@"按钮的长按事件触发");
         });
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
