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
 -(UIButton *)btn1{
     if (!_btn1) {
         _btn1 = UIButton.new;
         [_btn1 normalTitle:[@"2388 3788 8907 8890 8888" stringByAppendingString:@"  建设银行"]];
         [_btn1 normalTitleColor:HEXCOLOR(0x524740)];
         [_btn1 normalBackgroundImage:JobsIMG(@"全局输入框背景图")];
         [_btn1 titleFont:[UIFont systemFontOfSize:JobsWidth(14) weight:UIFontWeightRegular]];
         BtnClickEvent(_btn1, {
             NSLog(@"%@",self->dropDownListView);
             x.selected = !x.selected;
             if (x.selected) {
                 self->dropDownListView = [self motivateFromView:x
                                                            data:nil
                                              motivateViewOffset:JobsWidth(5)
                                                     finishBlock:^(UIViewModel *data) {
                     NSLog(@"data = %@",data);
                     [x normalTitle:data.text];
                 }];
             }else{
                 [self->dropDownListView dropDownListViewDisappear];
             }
         });
         [self.view addSubview:_btn1];
         [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
             make.size.mas_equalTo(CGSizeMake(JobsWidth(305), JobsWidth(36)));
             make.top.equalTo(self.titleLab3.mas_bottom).offset(JobsWidth(4));
             make.left.equalTo(self.titleLab1);
         }];
     }return _btn1;
 }
 
 */
