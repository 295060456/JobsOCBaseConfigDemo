//
//  CollectionViewCell.h
//  UBallLive
//
//  Created by Jobs on 2020/10/18.
//

#import <UIKit/UIKit.h>
#import "MacroDef_Func.h"
#import "UIView+Extras.h"
#import "AppToolsProtocol.h"
#import "UICollectionViewCellProtocol.h"
#import "UICollectionViewCell+ShakeAnimation.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsBaseCollectionViewCell : UICollectionViewCell
<
UICollectionViewCellProtocol,
AppToolsProtocol
>
@property(nonatomic,strong,readonly)UILabel *label;
@property(nonatomic,strong,readonly)BaseButton *bgBtn;
@property(nonatomic,assign)BOOL forceUseLabel;
@property(nonatomic,assign)BOOL forceUseBgBtn;

@end

NS_ASSUME_NONNULL_END
