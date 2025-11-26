//
//  FMMaintenanceView.m
//  FMNormal
//
//  Created by Jobs on 2025/5/19.
//

#import "FMMaintenanceView.h"

@interface FMMaintenanceView ()
/// UI
Prop_strong()UILabel *timeLab;

@end

@implementation FMMaintenanceView
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.byBgCor(JobsWhiteColor);
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.byBgCor(JobsWhiteColor);
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.imageView.alpha = 1;
        self.label.alpha = 1;
        self.subLabel.alpha = 1;
        self.timeLab.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(281), JobsWidth(391));
    };
}
#pragma mark —— lazyLoad
@synthesize imageView = _imageView;
-(__kindof UIImageView *)imageView{
    if(!_imageView){
        _imageView = self.addSubview(jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView.image = @"维护（小狮子）".img;
        })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
            make.top.equalTo(self).offset(JobsWidth(5));
            make.left.equalTo(self).offset(JobsWidth(41.44));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(187), JobsWidth(174)));
        }).on();
    }return _imageView;
}
@synthesize label = _label;
-(__kindof UILabel *)label{
    if(!_label){
        @jobs_weakify(self)
        _label = self.addSubview(jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"UNDER MAINTENANCE".tr)
                .byTextCor(@"#8A93A1".cor)
                .byFont(pingFangHKSemibold(JobsWidth(20)));
        })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
            @jobs_strongify(self)
            make.top.equalTo(self.imageView.mas_bottom).offset(JobsWidth(0));
            make.left.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(270), JobsWidth(28)));
        }).on();
    }return _label;
}
@synthesize subLabel = _subLabel;
-(__kindof UILabel *)subLabel{
    if(!_subLabel){
        @jobs_weakify(self)
        _subLabel = self.addSubview(jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"Dear Valued Customers:".tr
                         .add(JobsNewline)
                         .add(@"We are currently performing maintenance on our services. We apologize for any inconvenience this may cause and appreciate your understanding.".tr))
                .byTextCor(@"#8A93A1".cor)
                .byFont(pingFangHKSemibold(JobsWidth(11)));
        })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
            @jobs_strongify(self)
            make.top.equalTo(self.label.mas_bottom).offset(JobsWidth(5));
            make.left.equalTo(self);
            make.width.mas_equalTo(JobsWidth(270));
        }).on();
        _subLabel.makeLabelByShowingType(UILabelShowingType_05);
    }return _subLabel;
}

-(UILabel *)timeLab{
    if(!_timeLab){
        @jobs_weakify(self)
        _timeLab = self.addSubview(jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"Maintenance Time:".tr
                         .add(JobsNewline)
                         .add(self.currentTimeStringByStyle1)
                         .add(JobsSpace)
                         .add(@"TO".tr)
                         .add(JobsSpace)
                         .add(self.currentTimeStringByStyle1))
                .byTextCor(@"#8A93A1".cor)
                .byFont(pingFangHKSemibold(JobsWidth(11)));
        })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
            @jobs_strongify(self)
            make.top.equalTo(self.subLabel.mas_bottom).offset(JobsWidth(5));
            make.left.equalTo(self);
            make.width.mas_equalTo(JobsWidth(270));
        }).on();
        _timeLab.makeLabelByShowingType(UILabelShowingType_05);
    }return _timeLab;
}

@end
