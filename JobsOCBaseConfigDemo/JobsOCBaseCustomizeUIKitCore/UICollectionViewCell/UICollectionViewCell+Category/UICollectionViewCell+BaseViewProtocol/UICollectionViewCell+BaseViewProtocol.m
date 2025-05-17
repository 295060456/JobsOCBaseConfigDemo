//
//  UICollectionViewCell+BaseViewProtocol.m
//  FMNormal
//
//  Created by Jobs on 2025/5/3.
//

#import "UICollectionViewCell+BaseViewProtocol.h"

@implementation UICollectionViewCell (BaseViewProtocol)
/// 用于实例
-(JobsReturnCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        /// TODO
        return self;
    };
}

-(JobsReturnCollectionViewCellByBOOLBlock _Nonnull)bySelected{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.selected = data;
        return self;
    };
}

-(JobsReturnCollectionViewCellByBOOLBlock _Nonnull)byHighlighted{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.highlighted = data;
        return self;
    };
}

@end
