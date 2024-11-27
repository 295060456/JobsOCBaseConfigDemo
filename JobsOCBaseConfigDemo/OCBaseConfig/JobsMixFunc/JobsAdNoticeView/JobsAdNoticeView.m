//
//  JobsAdNoticeView.m
//  JobsIM
//
//  Created by Jobs on 2020/11/15.
//

#import "JobsAdNoticeView.h"

@interface JobsAdNoticeView ()

@property(nonatomic,strong)UILabel *adNoticeLab;

@end

@implementation JobsAdNoticeView

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsCyanColor;

    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        self.adNoticeLab.alpha = 1;
    };
}

+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(), 30);
    };
}
#pragma mark —— lazyLoad
-(UILabel *)adNoticeLab{
    if (!_adNoticeLab) {
        @jobs_weakify(self)
        _adNoticeLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.text = JobsInternationalization(@"Jobs安全聊天，为您的聊天加密护航");
            label.textColor = JobsRedColor;
            label.textAlignment = NSTextAlignmentCenter;
            label.font = UIFontWeightRegularSize(JobsWidth(12));
            label.backgroundColor = JobsClearColor;
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
        });
    }return _adNoticeLab;
}

@end
