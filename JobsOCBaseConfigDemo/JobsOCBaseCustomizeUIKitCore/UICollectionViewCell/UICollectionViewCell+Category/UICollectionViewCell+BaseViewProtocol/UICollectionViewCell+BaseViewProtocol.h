//
//  UICollectionViewCell+BaseViewProtocol.h
//  FMNormal
//
//  Created by Jobs on 2025/5/3.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewCell (BaseViewProtocol)

-(JobsReturnCollectionViewCellByBOOLBlock _Nonnull)bySelected;
-(JobsReturnCollectionViewCellByBOOLBlock _Nonnull)byHighlighted;

@end

NS_ASSUME_NONNULL_END
