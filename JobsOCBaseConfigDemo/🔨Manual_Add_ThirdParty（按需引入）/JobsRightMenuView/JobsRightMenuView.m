//
//  FMHomeRightMenuView.m
//  FM_Normal
//
//  Created by Admin on 10/4/2025.
//

#import "JobsRightMenuView.h"

@interface JobsRightMenuView ()
/// UI
Prop_strong()BaseButton *suspendBtn;
Prop_strong()UIImageView *stackImageView;
/// Data
Prop_copy()NSArray <__kindof UIButton*>*datas;

@end

@implementation JobsRightMenuView
@synthesize isAllowDrag = _isAllowDrag;
-(void)dealloc{
    JobsLog(@"");
}
#pragma mark —— BaseProtocol
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
//        self.backgroundColor = JobsClearColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = JobsClearColor;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.panRcognize.enabled = YES;
    self.isAllowDrag = YES;//悬浮效果必须要的参数
}

-(void)layoutSubviews{
    [super layoutSubviews];
    /// 内部指定圆切角
    [self appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft
                                        cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
//        self.backgroundColor = JobsClearColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        if([model.data isKindOfClass:NSArray.class]){
            self.datas = (NSArray *)model.data;
        }
        self.suspendBtn.alpha = 1;
        self.stackImageView.alpha = 1;
        self.stackView.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(50),JobsWidth(170));
    };
}
#pragma mark —— 一些私有方法
#pragma mark —— 一些公有方法
-(jobsByBtnBlock _Nonnull)resetUI{
    @jobs_weakify(self)
    return ^(__kindof UIButton *_Nullable btn){
        @jobs_strongify(self)
        for (id data in self.datas) {
            if([data isKindOfClass:UIButton.class]){
                UIButton *button = (UIButton *)data;
                if(btn != button) button.selected = NO;
            }
        }
    };
}
#pragma mark —— lazyLoad
-(BaseButton *)suspendBtn{
    if(!_suspendBtn){
        @jobs_weakify(self)
        _suspendBtn = self.addSubview(BaseButton
                                      .initByBackgroundImage(@"首页悬浮按钮（朝左）".img)
                                      .onClickBy(^(UIButton *x){
                                          JobsLog(@"");
                                          @jobs_strongify(self)
                                          x.selected = !x.selected;
                                          x.jobsResetBtnBgImage(x.selected ? @"首页悬浮按钮（朝右）".img : @"首页悬浮按钮（朝左）".img);
                                          if (self.objBlock) self.objBlock(x);
                                      }).onLongPressGestureBy(^(id data){
                                          JobsLog(@"");
                                      }))
            .setMasonryBy(^(MASConstraintMaker *_Nonnull make){
                @jobs_strongify(self)
                make.size.mas_equalTo(CGSizeMake(JobsWidth(20), JobsWidth(50)));
                make.centerY.equalTo(self);
                make.left.equalTo(self);
        }).on();
    }return _suspendBtn;
}

-(UIImageView *)stackImageView{
    if(!_stackImageView){
        @jobs_weakify(self)
        _stackImageView = self.addSubview(jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView.byImage(@"首页右侧悬浮菜单背景图".img);
        })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
            @jobs_strongify(self)
            make.size.mas_equalTo(CGSizeMake(JobsWidth(30), JobsWidth(160)));
            make.centerY.equalTo(self);
            make.left.equalTo(self.suspendBtn.mas_right);
        }).on();
    }return _stackImageView;
}
/// BaseViewProtocol
@synthesize stackView = _stackView;
-(UIStackView *)stackView{
    if(!_stackView){
        @jobs_weakify(self)
        _stackView = self.addSubview(jobsMakeStackView(^(__kindof UIStackView * _Nullable stackView) {
            @jobs_strongify(self)
            stackView.backgroundColor = JobsClearColor;
            stackView.axis = UILayoutConstraintAxisVertical; // 垂直排列
            stackView.spacing = 0; // 每个按钮之间的间距
            stackView.distribution = UIStackViewDistributionFillEqually; // 平均分配高度
            stackView.alignment = UIStackViewAlignmentFill;
            for (id data in self.datas) {
                if([data isKindOfClass:UIView.class]){
                    UIView *view = (UIView *)data;
                    stackView.add(view);
                }
            }
        })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
            @jobs_strongify(self)
            make.edges.equalTo(self.stackImageView);
        }).on();
    }return _stackView;
}

-(NSArray<__kindof UIButton *> *)datas{
    if (!_datas) {
        _datas = NSMutableArray.array;
    }return _datas;
}

@end
