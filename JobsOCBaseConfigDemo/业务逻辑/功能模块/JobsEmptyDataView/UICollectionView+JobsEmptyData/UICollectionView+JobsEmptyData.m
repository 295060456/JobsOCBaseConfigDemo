//
//  UICollectionView+JobsEmptyData.m
//  FM
//
//  Created by Admin on 14/11/2024.
//

#import "UICollectionView+JobsEmptyData.h"

@implementation UICollectionView (JobsEmptyData)

+(void)initialize{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        method_exchangeImplementations(class_getInstanceMethod(self, @selector(reloadData)),
                                       class_getInstanceMethod(self, @selector(jobsReloadData)));
    });
}

-(void)jobsReloadData{
    [self jobsReloadData];
    NSInteger numberOfSections = self.numberOfSections;
    BOOL hasData = NO;
    for (NSInteger section = 0; section < numberOfSections; section++) {
        if ([self numberOfItemsInSection:section] > 0) {
            hasData = YES;
            break;
        }
    }
//    self.showEmptyLabelBy(self.textModelEmptyData).jobsVisible = !hasData;
    self.showEmptyButtonBy(self.buttonModelEmptyData).jobsVisible = !hasData;
}

-(JobsReturnViewByTextModelBlock _Nonnull)showEmptyLabelBy{
    return ^__kindof UIView *_Nullable(UITextModel *model){
        @jobs_weakify(self)
        return jobsMakeView(^(__kindof UIView *_Nullable view) {
            @jobs_strongify(self)
            view.frame = self.bounds;
            self.addSubview(view);
            view.addSubview(jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
                label.textAlignment = model.textAlignment ? : NSTextAlignmentCenter;
                label.textColor = model.textCor ? : JobsRedColor;
                label.text = isValue(model.text) ? model.text : JobsInternationalization(@"没有数据");
                label.makeLabelByShowingType(UILabelShowingType_05);
                label.setMasonryBy(^(MASConstraintMaker *make){
                    @jobs_strongify(self)
                    make.center.equalTo(self);
                    make.width.equalTo(self);
                });
            }));
        });
    };
}

-(JobsReturnViewByButtonModelBlock _Nonnull)showEmptyButtonBy{
    return ^__kindof UIView *_Nullable(UIButtonModel *model){
        @jobs_weakify(self)
        return jobsMakeView(^(__kindof UIView *_Nullable view) {
            @jobs_strongify(self)
            view.frame = self.bounds;
            self.addSubview(view);
            view.addSubview(UIButton.initByButtonModel(model ? : jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                data.title = JobsInternationalization(@"没有数据");
                data.titleCor = JobsRedColor;
                data.normalImage = JobsIMG(@"小狮子");
            })).setMasonryBy(^(MASConstraintMaker *make){
                @jobs_strongify(self)
                make.center.equalTo(self);
                make.width.equalTo(self);
            }));
        });
    };
}

@end
