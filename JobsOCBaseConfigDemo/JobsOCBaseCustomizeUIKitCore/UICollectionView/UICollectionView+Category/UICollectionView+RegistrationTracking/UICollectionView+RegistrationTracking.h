//
//  UICollectionView+RegistrationTracking.h
//  FM
//
//  Created by User on 8/6/24.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (RegistrationTracking)

@property(nonatomic,strong)NSMutableSet <NSString *>*registeredIdentifiers;/// 自定义标志位
// 检查某个 reuseIdentifier 是否已注册
-(JobsReturnBOOLByStringBlock _Nonnull)isRegisteredForReuseIdentifier;

@end

NS_ASSUME_NONNULL_END
