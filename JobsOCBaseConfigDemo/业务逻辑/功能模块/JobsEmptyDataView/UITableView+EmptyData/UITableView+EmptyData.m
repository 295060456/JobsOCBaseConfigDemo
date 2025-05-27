//
//  UITableView+EmptyData.m
//  FM
//
//  Created by Admin on 14/11/2024.
//

#import "UITableView+EmptyData.h"

@implementation UITableView (EmptyData)

+(void)initialize{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        method_exchangeImplementations(class_getInstanceMethod(self, @selector(reloadData)),
                                       class_getInstanceMethod(self, @selector(jobsReloadData)));
    });
}

-(void)jobsReloadData{
    [self jobsReloadData]; // 调用原始的 reloadData（已经交换过）
//    self.showEmptyLabelBy(self.textModelEmptyData)
    self.showEmptyButtonBy(self.buttonModelEmptyData);
}
#pragma mark —— 一些私有方法
-(BOOL)hasData{
    NSInteger numberOfSections = self.numberOfSections;
    BOOL hasData = NO;
    for (NSInteger section = 0; section < numberOfSections; section++) {
        if ([self numberOfRowsInSection:section] > 0) {
            hasData = YES;
            break;
        }
    }return hasData;
}

-(JobsReturnViewByButtonModelBlock _Nonnull)showEmptyButtonBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIButtonModel *model){
        @jobs_strongify(self)
        if(self.hasData){
            self.cleanSubviewBy(BaseView.class);
            return nil;
        }else{
            return jobsMakeBaseView(^(__kindof BaseView *_Nullable view) {
                @jobs_strongify(self)
                view.frame = self.bounds;
                view.cleanSubviewBy(BaseView.class);
                self.addSubview(view)
                    .addSubview(UIButton.initByButtonModel(model ? : jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                        data.title = JobsInternationalization(@"No Datas");
                        data.titleCor = JobsWhiteColor;
                        data.titleFont = bayonRegular(JobsWidth(30));
                        data.normalImage = JobsIMG(@"暂无数据");
                        data.baseBackgroundColor = JobsClearColor.colorWithAlphaComponentBy(0);
                })).setMasonryBy(^(MASConstraintMaker *make){
                    @jobs_strongify(self)
                    make.centerX.equalTo(self).offset(model.jobsOffsetX);
                    make.centerY.equalTo(self).offset(model.jobsOffsetY);
                    make.width.equalTo(self);
                }));
            });
        }
    };
}

-(JobsReturnViewByTextModelBlock _Nonnull)showEmptyLabelBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UITextModel *model){
        @jobs_strongify(self)
        if(self.hasData){
            self.cleanSubviewBy(BaseView.class);
            return nil;
        }else{
            return jobsMakeBaseView(^(__kindof BaseView *_Nullable view) {
                @jobs_strongify(self)
                view.frame = self.bounds;
                view.cleanSubviewBy(BaseView.class);
                self.addSubview(view);
                view.addSubview(jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
                    label.textAlignment = model.textAlignment ? : NSTextAlignmentCenter;
                    label.textColor = model.textCor ? : JobsRedColor;
                    label.text = isValue(model.text) ? model.text : JobsInternationalization(@"No Datas");
                    label.makeLabelByShowingType(UILabelShowingType_05);
                    label.setMasonryBy(^(MASConstraintMaker *make){
                        @jobs_strongify(self)
                        make.center.equalTo(self);
                        make.width.equalTo(self);
                    });
                }));
            });
        }
    };
}

@end
