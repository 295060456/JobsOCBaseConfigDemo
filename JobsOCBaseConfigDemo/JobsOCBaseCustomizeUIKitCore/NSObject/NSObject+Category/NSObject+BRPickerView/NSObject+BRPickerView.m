//
//  UIView+BRPickerView.m
//  UBallLive
//
//  Created by Jobs on 2020/10/12.
//

#import "NSObject+BRPickerView.h"
/// https://github.com/91renb/BRPickerView
@implementation NSObject (BRPickerView)
#pragma mark 一些公有方法
-(BRPickerStyle *)makeCustomStyle{
    return jobsMakeBRPickerStyle(^(__kindof BRPickerStyle * _Nullable pickerStyle) {
        pickerStyle.pickerColor = JobsWhiteColor;
        pickerStyle.pickerTextColor = HEXCOLOR(0x3D4A58);
        pickerStyle.separatorColor = HEXCOLOR(0xEAEBED);
        pickerStyle.cancelBtnTitle = JobsInternationalization(@"取消");
        pickerStyle.doneBtnTitle = JobsInternationalization(@"确定");
    });
}

-(JobsReturnBRAddressPickerViewByPickerStyleBlock _Nonnull)makeAddressPickerView{
    return ^BRAddressPickerView *_Nonnull(BRPickerStyle *_Nullable style){
        return jobsMakeBRAddressPickerView(^(__kindof BRAddressPickerView * _Nullable addressPickerView) {
            /**
             BRAddressPickerModeArea,/// 显示【省市区】（默认）
             BRAddressPickerModeCity,/// 显示【省市】
             BRAddressPickerModeProvince/// 显示【省】
             */
            addressPickerView.pickerMode = BRAddressPickerModeArea;
            addressPickerView.title = JobsInternationalization(@"请选择地区");
        //    addressPickerView.selectValues = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        //        data.add(JobsInternationalization(@"浙江省"));
        //        data.add(JobsInternationalization(@"杭州市"));
        //        data.add(JobsInternationalization(@"西湖区"));
        //    });
            addressPickerView.selectIndexs = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
                data.add(@10);
                data.add(0);
                data.add(@4);
            });
            addressPickerView.isAutoSelect = YES;
            // 设置自定义样式
            addressPickerView.pickerStyle = style;
        });
    };
}

-(JobsReturnBRStringPickerViewByPickerModeBlock _Nonnull)makeStringPickerView{
    return ^BRStringPickerView *_Nonnull(BRStringPickerMode style){
        return BRStringPickerView.initBy(style);
    };
}

-(JobsReturnBRDatePickerViewByPickerStyleBlock _Nonnull)makeDatePickerView{
    @jobs_weakify(self)
    return ^BRDatePickerView *_Nonnull(BRPickerStyle *_Nullable customStyle){
        @jobs_strongify(self )
        if (!customStyle) customStyle = self.makeCustomStyle;
        return jobsMakeBRDatePickerView(^(__kindof BRDatePickerView * _Nullable datePickerView) {
            datePickerView.pickerMode = BRDatePickerModeYMD;
            datePickerView.title = JobsInternationalization(@"选择年月日");
            // datePickerView.selectValue = @"2019-10-30";
            datePickerView.selectDate = [NSDate br_setYear:2019
                                                      month:10
                                                        day:30];
            datePickerView.minDate = [NSDate br_setYear:1949
                                                   month:3
                                                     day:12];
            datePickerView.maxDate = NSDate.date;
            datePickerView.isAutoSelect = YES;
            datePickerView.pickerStyle = customStyle;
        });
    };
}
/// 时间选择器
//-(void)makeDatePickerDoneBlock:(BRDoneClickBlock)clickDoneBlock
//                   resultBlock:(BRDateResultBlock)clickResultBlock{
//    @jobs_weakify(self)
//    self.datePickerView.doneBlock = ^{
//        @jobs_strongify(self)
//        [self.datePickerView removePickerFromView:nil];
//        if (clickDoneBlock) clickDoneBlock();
//    };
//    self.datePickerView.resultBlock = ^(NSDate *selectDate,
//                                        NSString *selectValue) {
//        @jobs_strongify(self)
//        NSLog(@"选择的值：%@", selectValue);
//        if (clickResultBlock) clickResultBlock(selectDate,selectValue);
//    };
//    [self.datePickerView show];
//}
/// 地址选择器
//-(void)makeAddressPickerViewDoneBlock:(BRDoneClickBlock)clickDoneBlock
//                          resultBlock:(BRAddressResultBlock)clickResultBlock{
//    @jobs_weakify(self)
//    self.addressPickerView.doneBlock = ^{
//        @jobs_strongify(self)
//        [self.addressPickerView removePickerFromView:nil];
//        if (clickDoneBlock) clickDoneBlock();
//    };
//
//    self.addressPickerView.resultBlock = ^(BRProvinceModel *province,
//                                           BRCityModel *city,
//                                           BRAreaModel *area) {
//        @jobs_strongify(self)
//        NSLog(@"选择的值：%@", [NSString stringWithFormat:@"%@-%@-%@", province.name, city.name, area.name]);
//        if (clickResultBlock) clickResultBlock(province,city,area);
//    };
////    self.addressPickerView.pickerMode = BRAddressPickerModeProvince;
//    [self.addressPickerView show];
//}
/// 自定义字符串选择器
//-(void)makeStringPickerViewWithModel:(BRStringPickerViewModel *_Nullable)stringPickerViewModel
//                         pickerStyle:(BRPickerStyle *_Nullable)pickerStyle
//                           doneBlock:(BRDoneClickBlock)clickDoneBlock
//                         resultBlock:(jobsByIDBlock)clickResultBlock{
//    if (!stringPickerViewModel) {
//        stringPickerViewModel = BRStringPickerViewModel.new;
//        stringPickerViewModel.pickerMode = BRStringPickerComponentSingle;
//        stringPickerViewModel.title = JobsInternationalization(@"学历");
//        stringPickerViewModel.dataSourceArr = @[JobsInternationalization(@"大专以下"),
//                                                JobsInternationalization(@"大专"),
//                                                JobsInternationalization(@"本科"),
//                                                JobsInternationalization(@"硕士"),
//                                                JobsInternationalization(@"博士"),
//                                                JobsInternationalization(@"博士后")];
//        stringPickerViewModel.selectIndex = 2;
//    }
//
//    self.stringPickerView.pickerMode = stringPickerViewModel.pickerMode;
//    self.stringPickerView.title = stringPickerViewModel.title;
//    self.stringPickerView.dataSourceArr = stringPickerViewModel.dataSourceArr;
//    self.stringPickerView.selectIndex = stringPickerViewModel.selectIndex;
//    self.stringPickerView.pickerStyle = pickerStyle ? : self.customStyle;
//
//    @jobs_weakify(self)
//    self.stringPickerView.doneBlock = ^{
//        @jobs_strongify(self)
//        [self.stringPickerView removePickerFromView:nil];
//        if (clickDoneBlock) clickDoneBlock();
//    };
//    /** 选择结果的回调【单列】 */
//    self.stringPickerView.resultModelBlock = ^(BRResultModel *resultModel) {
////            NSLog(@"选择的值：%@", resultModel.selectValue);
//        @jobs_strongify(self)
//        if (self.objectBlock) self.objectBlock(resultModel);
//    };
//    /** 选择结果的回调【多列】 */
//    self.stringPickerView.resultModelArrayBlock = ^(NSArray<BRResultModel *> * _Nullable resultModelArr) {
//        @jobs_strongify(self)
//        if (self.objectBlock) self.objectBlock(resultModelArr);
//    };
//
//    [self.stringPickerView show];
//}
#pragma mark —— 一些私有方法
-(jobsByBRStringPickerViewModelBlock _Nonnull)changeBy{
    @jobs_weakify(self)
    return ^(__kindof BRStringPickerViewModel *_Nullable model){
        @jobs_strongify(self)
        if (model.dataSourceArr.count > 2) {
            NSMutableArray *temp = model.dataSourceArr.copy;
            [temp removeObjectAtIndex:0];
            self.stringPickerView.dataSourceArr = temp;
            self.stringPickerView.title = model.dataSourceArr[0];
        }
    };
}
#pragma mark —— @property(nonatomic,strong)BRStringPickerView *stringPickerView;/// 自定义字符串选择器
JobsKey(_stringPickerView)
@dynamic stringPickerView;
-(BRStringPickerView *)stringPickerView{
    BRStringPickerView *StringPickerView = Jobs_getAssociatedObject(_stringPickerView);
    if (!StringPickerView) {
        StringPickerView = self.makeStringPickerView(self.brStringPickerMode);
        Jobs_setAssociatedRETAIN_NONATOMIC(_stringPickerView, StringPickerView)
    }return StringPickerView;
}

-(void)setStringPickerView:(BRStringPickerView *)stringPickerView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_stringPickerView, stringPickerView)
}
#pragma mark —— @property(nonatomic,strong)BRDatePickerView *datePickerView;/// 时间选择器
JobsKey(_datePickerView)
@dynamic datePickerView;
-(BRDatePickerView *)datePickerView{
    BRDatePickerView *DatePickerView = Jobs_getAssociatedObject(_datePickerView);
    if (!DatePickerView) {
        DatePickerView = self.makeDatePickerView(self.customStyle);
        Jobs_setAssociatedRETAIN_NONATOMIC(_datePickerView, DatePickerView)
    }return DatePickerView;
}

-(void)setDatePickerView:(BRDatePickerView *)datePickerView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_datePickerView, datePickerView)
}
#pragma mark —— @property(nonatomic,strong)BRAddressPickerView *addressPickerView;/// 地址选择器
JobsKey(_addressPickerView)
@dynamic addressPickerView;
-(BRAddressPickerView *)addressPickerView{
    BRAddressPickerView *AddressPickerView = Jobs_getAssociatedObject(_addressPickerView);
    if (!AddressPickerView) {
        AddressPickerView = self.makeAddressPickerView(self.customStyle);
        Jobs_setAssociatedRETAIN_NONATOMIC(_addressPickerView, AddressPickerView)
    }return AddressPickerView;
}

-(void)setAddressPickerView:(BRAddressPickerView *)addressPickerView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_addressPickerView, addressPickerView)
}
#pragma mark —— @property(nonatomic,strong)BRPickerStyle *customStyle;
JobsKey(_customStyle)
@dynamic customStyle;
-(BRPickerStyle *)customStyle{
    BRPickerStyle *pickerStyle = Jobs_getAssociatedObject(_customStyle);
    if (!pickerStyle) {
        pickerStyle = [UIView makeCustomStyle];
        Jobs_setAssociatedRETAIN_NONATOMIC(_customStyle, pickerStyle)
    }return pickerStyle;
}

-(void)setCustomStyle:(BRPickerStyle *)customStyle{
    Jobs_setAssociatedRETAIN_NONATOMIC(_customStyle, customStyle)
}
#pragma mark —— @property(nonatomic,assign)BRStringPickerMode brStringPickerMode;
JobsKey(_brStringPickerMode)
@dynamic brStringPickerMode;
-(BRStringPickerMode)brStringPickerMode{
    return [Jobs_getAssociatedObject(_brStringPickerMode) integerValue];
}

-(void)setBrStringPickerMode:(BRStringPickerMode)brStringPickerMode{
    Jobs_setAssociatedRETAIN_NONATOMIC(_brStringPickerMode, @(brStringPickerMode))
}
#pragma mark —— @property(nonatomic,strong)NSMutableArray *BRStringPickerViewDataMutArr;
JobsKey(_BRStringPickerViewDataMutArr)
@dynamic BRStringPickerViewDataMutArr;
-(NSMutableArray *)BRStringPickerViewDataMutArr{
    NSMutableArray *brStringPickerViewDataMutArr = Jobs_getAssociatedObject(_BRStringPickerViewDataMutArr);
    if (!brStringPickerViewDataMutArr) {
        brStringPickerViewDataMutArr = NSMutableArray.array;
        Jobs_setAssociatedRETAIN_NONATOMIC(_BRStringPickerViewDataMutArr, brStringPickerViewDataMutArr)
    }return brStringPickerViewDataMutArr;
}

-(void)setBRStringPickerViewDataMutArr:(NSMutableArray *)BRStringPickerViewDataMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_BRStringPickerViewDataMutArr, BRStringPickerViewDataMutArr)
}

@end

@implementation BRStringPickerViewModel

@end
