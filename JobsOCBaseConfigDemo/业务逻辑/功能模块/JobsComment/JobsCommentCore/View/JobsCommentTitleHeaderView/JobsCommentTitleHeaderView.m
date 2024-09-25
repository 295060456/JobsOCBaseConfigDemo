//
//  JobsCommentTitleHeaderView.m
//  JobsComment
//
//  Created by Jobs on 2020/11/17.
//

#import "JobsCommentTitleHeaderView.h"

@interface JobsCommentTitleHeaderView ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UIButton *cancelBtn;

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
-(jobsByIDBlock)jobsRichElementsInViewWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        super.jobsRichElementsInViewWithModel(model);
        self.backgroundColor = JobsWhiteColor;
        self.titleLab.alpha = 1;
        self.cancelBtn.alpha = 1;
    };
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.text = JobsInternationalization(@"评论");
        _titleLab.textColor = JobsCor(@"#999999");
        _titleLab.font = UIFontWeightRegularSize(18);
        [_titleLab labelAutoWidthByFont];
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
    }return _titleLab;
}

-(UIButton *)cancelBtn{
    if(!_cancelBtn){
        @jobs_weakify(self)
        _cancelBtn = BaseButton.initByBackgroundImage(JobsIMG(@"删除")).onClick(^(UIButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
        }).onLongPressGesture(^(id data){
            NSLog(@"");
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
