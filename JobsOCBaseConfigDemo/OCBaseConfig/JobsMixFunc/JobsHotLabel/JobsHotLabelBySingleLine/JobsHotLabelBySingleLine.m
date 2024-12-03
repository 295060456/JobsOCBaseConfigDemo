//
//  HotLabel.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/4.
//

#import "JobsHotLabelBySingleLine.h"

@interface JobsHotLabelBySingleLine (){
    CGSize btnSize;
    CGFloat width;
}
/// UI
@property(nonatomic,strong)UIStackView *stackView;/// 放在滚动视图上，可以滚动的UIStackView
@property(nonatomic,strong)NSMutableArray <UIButton *>*btnMutArr;
/// Data
@property(nonatomic,strong)NSArray <UIViewModel *>*viewModelDataArr;// 数据源
@property(nonatomic,strong)NSMutableArray <NSNumber *>*btnHeightMutArr;

@end

@implementation JobsHotLabelBySingleLine

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = HEXCOLOR(0xFFFFFF);
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = HEXCOLOR(0xFFFFFF);
    }return self;
}
/// 必须有frame的前提下才会进行绘制
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(NSObject *_Nullable data){
        return CGSizeMake(JobsWidth(46 * 3 + 59 * 2), data.lineNumBy(3) * JobsWidth(46 + 7));
    };
}
/// 进数据
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(NSMutableArray <UIViewModel *>*_Nullable model) {
        @jobs_strongify(self)
        if (model.count) {
            self.viewModelDataArr = model;
            self.createHotLabelByArr(self.viewModelDataArr);
        }
    };
}
#pragma mark —— 一些私有方法
/// 参考 Demo：https://github.com/PhonixYing/HorizontalScrollStackView
-(jobsByArrWithViewModelBlock _Nonnull)createHotLabelByArr{
    @jobs_weakify(self)
    return ^(__kindof NSArray <UIViewModel *>*_Nullable dataArr){
        @jobs_strongify(self)
        if (dataArr.count) {
//            self.dynamicCalculationWithDataArr(dataArr);
            for (UIViewModel *vm in dataArr) {
                self.viewModel = vm;
                // 其实item是button,因为button有相对于Label更为丰富的表现形式
                UIButton *btn = self.configBtnBy(vm);
                btn.sizer = self->btnSize;
                self.btnMutArr.add(btn);
                self.stackView.add(btn);
            }[self useHighestValue];/// 取最大的高度值使用
        }
    };
}
/// 内部依据数据源动态的计算一些局部变量的值
-(jobsByArrWithViewModelBlock _Nonnull)dynamicCalculationWithDataArr{
    @jobs_weakify(self)
    return ^(__kindof NSArray <UIViewModel *>*_Nullable dataArr){
        @jobs_strongify(self)
        for (UIViewModel *vm in dataArr) {
            CGSize BtnSize = [UILabel sizeWithText:vm.textModel.text
                                              font:vm.textModel.font
                                           maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
            if (CGSizeEqualToSize(vm.jobsSize, CGSizeZero)) {
                self->btnSize = BtnSize;
            }else{
                /// 两项比较取最大值。防止多语言化的时候，外文显示过长的问题
                self->btnSize = CGSizeMake(MAX(BtnSize.width, vm.jobsSize.width),
                                           MAX(BtnSize.height, vm.jobsSize.height));
            }self->width += self->btnSize.width;
        };
    };
}
/**
 配置按钮
 如果在外层进行自定义化调用，那么他的调用时机要早于:
 <BaseViewProtocol>
 -(jobsByIDBlock _Nonnull)jobsRichViewByModel{
     @jobs_weakify(self)
     return ^(NSMutableArray <UIViewModel *>*_Nullable model) {
         @jobs_strongify(self)
     };
 }
 */
-(JobsReturnButtonByViewModelBlock _Nonnull)configBtnBy{
    return ^__kindof UIButton *_Nullable(UIViewModel *_Nullable vm){
        UIButton *btn = UIButton.new;
        btn.selected = self.viewModel.jobsSelected;
        btn.requestParams = vm.requestParams;
        /// TODO
        btn.jobsResetBtnTitle(vm.textModel.text);
        btn.jobsResetBtnTitleFont(vm.textModel.font);
        btn.jobsResetBtnTitleCor(vm.textModel.textCor);
        @jobs_weakify(self)
        [btn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            [self changeButtonState];
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
        [btn actionObjectBlock:^(id data) {
            @jobs_strongify(self)
            self.btnHeightMutArr.add(data);
        }];
        btn.sizer = CGSizeMake((JobsMainScreen_WIDTH() - JobsWidth(15 * 5)) / 4, JobsWidth(30));
        btn.makeBtnTitleByShowingType(self.labelShowingType);
        return btn;
    };
}
/// 取最大的高度值使用
-(void)useHighestValue{
    for (UIButton *btn in self.btnMutArr) {
        /// 取最高的值
        NSNumber *highestNum = @(self.elementDefaultSize.height);
        for (NSNumber *num in self.btnHeightMutArr) {
            highestNum = @(MAX(highestNum.floatValue, num.floatValue));
        }
        
        [btn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(self.elementDefaultSize.width, highestNum.floatValue));
        }];
    }
}

-(void)changeButtonState{
    for (UIButton *btn in self.btnMutArr) {
        btn.selected = NO;
    }
}
#pragma mark —— lazyLoad
/**
 
 typedef NS_ENUM(NSInteger, UIStackViewDistribution) {
     UIStackViewDistributionFill = 0,//充满，当只有一个控件时可以使用
     UIStackViewDistributionFillEqually,//平分充满，每个控件占据相同尺寸排列充满❤️
     UIStackViewDistributionFillProportionally,//会优先按照约束的尺寸进行排列，如果没有充满，会拉伸最后一个排列的控件充满
     UIStackViewDistributionEqualSpacing,//等间距排列
     UIStackViewDistributionEqualCentering,//中心距离相等
 } NS_ENUM_AVAILABLE_IOS(9_0);
 
 typedef NS_ENUM(NSInteger, UIStackViewAlignment) {
    UIStackViewAlignmentFill,//子视图填充StackView
    UIStackViewAlignmentLeading,//子视图左对齐（axis为垂直方向而言）
    UIStackViewAlignmentTop = UIStackViewAlignmentLeading,//子视图顶部对齐（axis为水平方向而言）
    UIStackViewAlignmentFirstBaseline, // 按照第一个子视图的文字的第一行对齐，同时保证高度最大的子视图底部对齐（只在axis为水平方向有效）
    UIStackViewAlignmentCenter,//子视图居中对齐
    UIStackViewAlignmentTrailing,//子视图右对齐(axis为垂直方向而言）
    UIStackViewAlignmentBottom = UIStackViewAlignmentTrailing,//子视图底部对齐（axis为水平方向而言）
    UIStackViewAlignmentLastBaseline, // 按照最后一个子视图的文字的最后一行对齐，同时保证高度最大的子视图顶部对齐（只在axis为水平方向有效）
 } NS_ENUM_AVAILABLE_IOS(9_0);
 
 */
-(UIStackView *)stackView{
    if (!_stackView) {
        @jobs_weakify(self)
        _stackView = jobsMakeStackView(^(__kindof UIStackView * _Nullable stackView) {
            @jobs_strongify(self)
            stackView.axis = UILayoutConstraintAxisHorizontal;
            stackView.distribution = UIStackViewDistributionEqualSpacing;
            stackView.alignment = UIStackViewAlignmentCenter;
            self.scrollView.addSubview(stackView);
            // 注意这里设置的约束，最后一个宽度的约束很关键
            [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(self);
                make.centerY.equalTo(self.scrollView);
                
                if (self.scrollView.contentSize.width > self.scrollView.width) {
                    make.left.equalTo(self.scrollView);/// 必须铆定 self.scrollView
                    make.width.mas_equalTo(self->width);
                }else{
                    CGFloat offset = (self.scrollView.width - self.viewModelDataArr.count * self->btnSize.width) / self.viewModelDataArr.count;
                    if (self.viewModelDataArr.count > 1) {
                        make.width.mas_equalTo(self.scrollView.width - offset / 2);
                    }else make.width.mas_equalTo(self->btnSize.width);
                    make.centerX.equalTo(self.scrollView);
                }
            }];
        });
    }return _stackView;
}
/// BaseViewProtocol
@synthesize scrollView = _scrollView;
/// 可以横向滚动的滚动视图（所有控件加在这上面）
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        @jobs_weakify(self)
        _scrollView = self.addSubview(jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            @jobs_strongify(self)
            scrollView.delegate = self;
            scrollView.frame = self.bounds;
    //        scrollView.backgroundColor = JobsWhiteColor;
            scrollView.contentSize = CGSizeMake(self->width, self->btnSize.height);
            scrollView.showsVerticalScrollIndicator = NO;
            scrollView.showsHorizontalScrollIndicator = NO;
        }));
    }return _scrollView;
}

-(NSMutableArray<UIButton *> *)btnMutArr{
    if (!_btnMutArr) {
        _btnMutArr = NSMutableArray.array;
    }return _btnMutArr;
}

-(NSMutableArray<NSNumber *> *)btnHeightMutArr{
    if (!_btnHeightMutArr) {
        _btnHeightMutArr = NSMutableArray.array;
    }return _btnHeightMutArr;
}

@end
