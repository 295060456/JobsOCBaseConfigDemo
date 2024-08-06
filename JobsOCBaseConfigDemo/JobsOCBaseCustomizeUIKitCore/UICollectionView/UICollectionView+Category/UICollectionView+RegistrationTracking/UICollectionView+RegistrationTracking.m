//
//  UICollectionView+RegistrationTracking.m
//  FM
//
//  Created by User on 8/6/24.
//

#import "UICollectionView+RegistrationTracking.h"

@implementation UICollectionView (RegistrationTracking)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Swizzle dequeueReusableCellWithReuseIdentifier:forIndexPath:
        Method originalMethod1 = class_getInstanceMethod(self.class, @selector(dequeueReusableCellWithReuseIdentifier:forIndexPath:));
        Method swizzledMethod1 = class_getInstanceMethod(self.class, @selector(swizzled_dequeueReusableCellWithReuseIdentifier:forIndexPath:));
        method_exchangeImplementations(originalMethod1, swizzledMethod1);

        // Swizzle dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
        Method originalMethod2 = class_getInstanceMethod(self.class, @selector(dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:));
        Method swizzledMethod2 = class_getInstanceMethod(self.class, @selector(swizzled_dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:));
        method_exchangeImplementations(originalMethod2, swizzledMethod2);
    });
}
// Swizzled method for dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)swizzled_dequeueReusableCellWithReuseIdentifier:(NSString *)identifier 
                                                             forIndexPath:(NSIndexPath *)indexPath {
    if (![self.registeredIdentifiers containsObject:identifier]) {
        // 如果未注册，则进行注册
        [self registerClass:NSClassFromString(identifier) forCellWithReuseIdentifier:identifier];
        self.registeredIdentifiers.jobsAddObject(identifier);
    }return [self swizzled_dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath]; // 调用原方法
}

// Swizzled method for dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
- (UICollectionReusableView *)swizzled_dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind 
                                                          withReuseIdentifier:(NSString *)identifier
                                                                 forIndexPath:(NSIndexPath *)indexPath {
    if (![self.registeredIdentifiers containsObject:identifier]) {
        // 如果未注册，则进行注册
        [self registerClass:NSClassFromString(identifier)
 forSupplementaryViewOfKind:elementKind
        withReuseIdentifier:identifier];
        self.registeredIdentifiers.jobsAddObject(identifier);
    }return [self swizzled_dequeueReusableSupplementaryViewOfKind:elementKind
                                              withReuseIdentifier:identifier
                                                     forIndexPath:indexPath]; // 调用原方法
}
// 检查某个 reuseIdentifier 是否已注册
-(JobsReturnBOOLByStringBlock _Nonnull)isRegisteredForReuseIdentifier{
    @jobs_weakify(self)
    return ^(NSString * _Nullable reuseIdentifier) {
        @jobs_strongify(self)
        return [self.registeredIdentifiers containsObject:reuseIdentifier];
    };
}
#pragma mark —— @property(nonatomic,strong)NSMutableSet *registeredIdentifiers;/// 自定义标志位
JobsKey(_registeredIdentifiers)
@dynamic registeredIdentifiers;
-(NSMutableSet<NSString *> *)registeredIdentifiers{
    NSMutableSet *RegisteredIdentifiers = Jobs_getAssociatedObject(_registeredIdentifiers);
    if (!RegisteredIdentifiers) {
        RegisteredIdentifiers = NSMutableSet.set;
        Jobs_setAssociatedRETAIN_NONATOMIC(_registeredIdentifiers, RegisteredIdentifiers)
    }return RegisteredIdentifiers;
}

-(void)setRegisteredIdentifiers:(NSMutableSet<NSString *> *)registeredIdentifiers{
    Jobs_setAssociatedRETAIN_NONATOMIC(_registeredIdentifiers, registeredIdentifiers)
}

@end
