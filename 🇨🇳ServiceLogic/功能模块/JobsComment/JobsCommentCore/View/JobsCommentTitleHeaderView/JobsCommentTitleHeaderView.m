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
-(void)richElementsInViewWithModel:(id _Nullable)model{
    [super richElementsInViewWithModel:model];
    self.backgroundColor = JobsWhiteColor;
    self.titleLab.alpha = 1;
    self.cancelBtn.alpha = 1;
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.text = Internationalization(@"评论");
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
        _cancelBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                       background:nil
                                                   titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                    textAlignment:NSTextAlignmentCenter
                                                 subTextAlignment:NSTextAlignmentCenter
                                                      normalImage:JobsIMG(@"删除")
                                                   highlightImage:nil
                                                  attributedTitle:nil
                                          selectedAttributedTitle:nil
                                               attributedSubtitle:nil
                                                            title:nil
                                                         subTitle:nil
                                                        titleFont:nil
                                                     subTitleFont:nil
                                                         titleCor:nil
                                                      subTitleCor:nil
                                               titleLineBreakMode:NSLineBreakByWordWrapping
                                            subtitleLineBreakMode:NSLineBreakByWordWrapping
                                              baseBackgroundColor:UIColor.whiteColor
                                                     imagePadding:JobsWidth(0)
                                                     titlePadding:JobsWidth(0)
                                                   imagePlacement:NSDirectionalRectEdgeNone
                                       contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                         contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                    contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                cornerRadiusValue:JobsWidth(0)
                                                  roundingCorners:UIRectCornerAllCorners
                                             roundingCornersRadii:CGSizeZero
                                                   layerBorderCor:nil
                                                      borderWidth:JobsWidth(0)
                                                    primaryAction:nil
                                                  clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
        [self addSubview:_cancelBtn];
        [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
    }return _cancelBtn;
}

@end
