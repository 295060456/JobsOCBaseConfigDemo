//
//  UIView+BRPickerView.h
//  UBallLive
//
//  Created by Jobs on 2020/10/12.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsBlock.h"
#import "MacroDef_Cor.h"
#import "MacroDef_Strong@Weak.h"

#if __has_include(<BRPickerView/BRPickerView.h>)
#import <BRPickerView/BRPickerView.h>
#else
#import "BRPickerView.h"
#endif

#import "BRStringPickerView.h"
#import "BRAddressPickerView.h"

@class BRStringPickerViewModel;

NS_ASSUME_NONNULL_BEGIN
/// https://github.com/91renb/BRPickerView
@interface NSObject (BRPickerView)
#pragma mark —— BaseVC+BRStringPickerView
/// UI
@property(nonatomic,strong)BRStringPickerView *stringPickerView;/// 自定义字符串选择器
@property(nonatomic,strong)BRDatePickerView *datePickerView;/// 时间选择器
@property(nonatomic,strong)BRAddressPickerView *addressPickerView;/// 地址选择器
/// Data
@property(nonatomic,assign)BRStringPickerMode brStringPickerMode;
@property(nonatomic,strong)NSMutableArray *BRStringPickerViewDataMutArr;
@property(nonatomic,strong)BRPickerStyle *customStyle;
/// 时间选择器
//-(void)makeDatePickerDoneBlock:(BRDoneClickBlock)clickDoneBlock
//                   resultBlock:(BRDateResultBlock)clickResultBlock;
///// 地址选择器
//-(void)makeAddressPickerViewDoneBlock:(BRDoneClickBlock)clickDoneBlock
//                          resultBlock:(BRAddressResultBlock)clickResultBlock;
/// 自定义字符串选择器
//-(void)makeStringPickerViewWithModel:(BRStringPickerViewModel *_Nullable)stringPickerViewModel
//                         pickerStyle:(BRPickerStyle *_Nullable)pickerStyle
//                           doneBlock:(BRDoneClickBlock)clickDoneBlock
//                         resultBlock:(jobsByIDBlock)clickResultBlock;
/// 以应对一个视图上面多个 BRStringPickerView的情况
/// 关键代码：[self.pickerView1 addPickerToView:承接的视图1];只能一对一承接
-(BRPickerStyle *)makeCustomStyle;
-(JobsReturnBRAddressPickerViewByPickerStyleBlock _Nonnull)makeAddressPickerView;
-(JobsReturnBRStringPickerViewByPickerModeBlock _Nonnull)makeStringPickerView;
-(JobsReturnBRDatePickerViewByPickerStyleBlock _Nonnull)makeDatePickerView;

@end

@interface BRStringPickerViewModel : NSObject
/// 来自 BRStringPickerView
/** 字符串选择器显示类型 */
@property(nonatomic,assign)BRStringPickerMode pickerMode;
/**
 *  1.设置数据源
 *    单列：@[@"男", @"女", @"其他"]，或直接传一维模型数组(NSArray <BRResultModel *>*)
 *    多列：@[@[@"语文", @"数学", @"英语"], @[@"优秀", @"良好"]]，或直接传多维模型数组
 *    联动：直接传一维模型数组(NSArray <BRResultModel *>*)，要注意数据源联动格式，可参考Demo
 */
@property(nonatomic,copy,nullable)NSArray *dataSourceArr;
/**
 *  2.设置数据源
 *    直接传plist文件名：NSString类型（如：@"test.plist"），要带后缀名
 *    场景：可以将数据源数据（数组类型）放到plist文件中，直接传plist文件名更加简单
 */
@property(nullable,nonatomic,copy)NSString *plistName;
/**
 *  设置默认选中的位置【单列】
 *  推荐使用 selectIndex，更加严谨，可以避免使用 selectValue 时，有名称相同的情况
 */
@property(nonatomic,assign)NSInteger selectIndex;
@property(nonatomic,copy,nullable)NSString *selectValue;
/**
 *  设置默认选中的位置【多列】
 *  推荐使用 selectIndexs，更加严谨，可以避免使用 selectValues 时，有名称相同的情况
 */
@property(nullable,nonatomic,copy)NSArray <NSNumber *> *selectIndexs;
@property(nullable,nonatomic,copy)NSArray <NSString *> *selectValues;
/**
 *  最大层级数(列数) for `BRStringPickerComponentLinkage`, ignored otherwise.
 *  使用场景：默认可选，当数据源中有 key 等于 parentKey 情况时，必须要设置
 */
@property(nonatomic,assign)NSInteger numberOfComponents;

/// 来自 BRBaseView
/** 选择器标题 */
@property (nullable, nonatomic, copy) NSString *title;
/** 是否自动选择，即滚动选择器后就执行结果回调，默认为 NO */
@property (nonatomic, assign) BOOL isAutoSelect;
/** 自定义UI样式（不传或为nil时，是默认样式） */
@property (nullable, nonatomic, strong) BRPickerStyle *pickerStyle;
/** accessory view for above picker view. default is nil */
@property (nullable, nonatomic, strong) UIView *pickerHeaderView;
/** accessory view below picker view. default is nil */
@property (nullable, nonatomic, strong) UIView *pickerFooterView;
/** 弹框视图(使用场景：可以在 alertView 上添加选择器的自定义背景视图) */
@property (nullable, nonatomic, strong) UIView *alertView;
/** 组件的父视图：可以传 自己获取的 keyWindow，或页面的 view */
@property (nullable, nonatomic, strong) UIView *keyView;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof BRDatePickerView *_Nonnull jobsMakeBRDatePickerView(jobsByBRDatePickerViewBlock _Nonnull block){
    BRDatePickerView *data = BRDatePickerView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof BRAddressPickerView *_Nonnull jobsMakeBRAddressPickerView(jobsByBRAddressPickerViewBlock _Nonnull block){
    BRAddressPickerView *data = BRAddressPickerView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof BRPickerStyle *_Nonnull jobsMakeBRPickerStyle(jobsByBRPickerStyleBlock _Nonnull block){
    BRPickerStyle *data = BRPickerStyle.alloc.init;
    if (block) block(data);
    return data;
}



/**
 * 常规用法
 * 构建日期选择器
     [self makeDatePickerDoneBlock:^{

     } resultBlock:^(NSDate * _Nullable selectDate,
                      NSString * _Nullable selectValue) {

     }];
 * 构建地址选择器
     [self makeAddressPickerViewDoneBlock:^{

     } resultBlock:^(BRProvinceModel * _Nullable province,
                     BRCityModel * _Nullable city,
                     BRAreaModel * _Nullable area) {

     }];
 * 构建自定义字符串选择器
     [self.view makeStringPickerViewWithModel:nil
                                  pickerStyle:nil
                                    doneBlock:^{
         
     } resultBlock:^(id data) {
         
     }];
 
 */

/**
 * 如果一个视图上需要展现多个BRPickerView，关键代码：【BRBaseView】 -addPickerToView
 *
 * @property(nonatomic,strong)BaseView *containFromView;/// fromDatePickerView的承接视图
 * @property(nonatomic,strong)BaseView *containToView;/// toDatePickerView的承接视图
 * @property(nonatomic,strong)BRDatePickerView *fromDatePickerView;
 * @property(nonatomic,strong)BRDatePickerView *toDatePickerView;
 *
    -(BaseView *)containFromView{
     if (!_containFromView) {
         _containFromView = BaseView.new;
         _containFromView.backgroundColor = JobsRandomColor;
         _containFromView.frame = CGRectMake(JobsWidth(100),
                                             JobsWidth(44),
                                             JobsWidth(263),
                                             JobsWidth(196 / 2));
    //        _containView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
         [self addSubview:_containFromView];
     }return _containFromView;
    }

    -(BaseView *)containToView{
     if (!_containToView) {
         _containToView = BaseView.new;
         _containToView.backgroundColor = JobsRandomColor;
         _containToView.frame = CGRectMake(JobsWidth(100),
                                           JobsWidth(44 + 196 / 2),
                                           JobsWidth(263),
                                           JobsWidth(196 / 2));
    //        _containView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
         [self addSubview:_containToView];
     }return _containToView;
    }

    -(BRDatePickerView *)fromDatePickerView{
     if (!_fromDatePickerView) {
         _fromDatePickerView = self.makeDatePickerView(nil);
     }return _fromDatePickerView;
    }

    -(BRDatePickerView *)toDatePickerView{
     if (!_toDatePickerView) {
         _toDatePickerView = self.makeDatePickerView(nil);
     }return _toDatePickerView;
    }
 * 启动
    [self.fromDatePickerView addPickerToView:self.containFromView];
    [self.toDatePickerView addPickerToView:self.containToView];
 
 */
