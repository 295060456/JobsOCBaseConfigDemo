//
//  JobsCommentTitleHeaderView.m
//  JobsComment
//
//  Created by Jobs on 2020/11/17.
//

#import "JobsCommentTitleHeaderView.h"

@interface JobsCommentTitleHeaderView ()
/// UI
Prop_strong()UILabel *titleLab;
Prop_strong()UIButton *cancelBtn;

@end

@implementation JobsCommentTitleHeaderView

-(instancetype)init{
    if (self = [super init]) {

    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        super.jobsRichViewByModel(model);
        self.backgroundColor = JobsWhiteColor;
        self.titleLab.alpha = 1;
        self.cancelBtn.alpha = 1;
    };
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.text = @"评论".tr;
            label.textColor = @"#999999".cor;
            label.font = UIFontWeightRegularSize(18);
            label.labelAutoWidthByFont();
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(self);
            }];
        });
    }return _titleLab;
}

-(UIButton *)cancelBtn{
    if(!_cancelBtn){
        @jobs_weakify(self)
        _cancelBtn = BaseButton
            .initByBackgroundImage(@"删除".img)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
        }).onLongPressGestureBy(^(id data){
            JobsLog(@"");
        });;
        [self addSubview:_cancelBtn];
        [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
    }return _cancelBtn;
}

@end
