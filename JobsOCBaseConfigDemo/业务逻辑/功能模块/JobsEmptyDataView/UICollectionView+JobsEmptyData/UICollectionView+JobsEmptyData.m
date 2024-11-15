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
//    self.showEmptyLabelBy(self.textModelEmptyData);
    self.showEmptyButtonBy(self.buttonModelEmptyData);
}
#pragma mark —— 一些私有方法
-(BOOL)hasData{
    NSInteger numberOfSections = self.numberOfSections;
    BOOL hasData = NO;
    for (NSInteger section = 0; section < numberOfSections; section++) {
        if ([self numberOfItemsInSection:section] > 0) {
            hasData = YES;
            break;
        }
    }return hasData;
}

-(JobsReturnViewByTextModelBlock _Nonnull)showEmptyLabelBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UITextModel *model){
        @jobs_strongify(self)
        if(self.hasData){
            self.cleanSubview();
            return nil;
        }else{
            return jobsMakeView(^(__kindof UIView *_Nullable view) {
                @jobs_strongify(self)
                view.frame = self.bounds;
                self.addSubview(view);
                view.cleanSubview();
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
        }
    };
}

-(JobsReturnViewByButtonModelBlock _Nonnull)showEmptyButtonBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIButtonModel *model){
        @jobs_strongify(self)
        if(self.hasData){
            self.cleanSubview();
            return nil;
        }else{
            return jobsMakeView(^(__kindof UIView *_Nullable view) {
                @jobs_strongify(self)
                view.frame = self.bounds;
                self.addSubview(view);
                view.cleanSubview();
                view.addSubview(UIButton.initByButtonModel(model ? : jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                    data.title = JobsInternationalization(@"没有数据");
                    data.titleCor = JobsRedColor;
                    data.normalImage = JobsIMG(@"暂无数据");
                })).setMasonryBy(^(MASConstraintMaker *make){
                    @jobs_strongify(self)
                    make.center.equalTo(self);
                    make.width.equalTo(self);
                }));
            });
        }
    };
}

@end
