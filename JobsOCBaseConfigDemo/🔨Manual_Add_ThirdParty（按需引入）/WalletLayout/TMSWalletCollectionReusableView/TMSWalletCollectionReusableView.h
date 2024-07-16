//
//  TMSWalletCollectionReusableView.h
//  TMSWalletCollectionViewLayout
//
//  Created by TmmmS on 2019/8/8.
//  Copyright © 2019 TMS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"
#import "BaseProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMSWalletCollectionReusableView : UICollectionReusableView
<
BaseViewProtocol
,BaseProtocol
>

@end

NS_ASSUME_NONNULL_END
