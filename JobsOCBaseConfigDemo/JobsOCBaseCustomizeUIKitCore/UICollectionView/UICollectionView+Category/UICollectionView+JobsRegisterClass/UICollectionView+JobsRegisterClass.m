//
//  UICollectionView+JobsRegisterClass.m
//  UBallLive
//
//  Created by Jobs on 2020/10/31.
//

#import "UICollectionView+JobsRegisterClass.h"

@implementation UICollectionView (JobsRegisterClass)
/// 注册的时候不开辟内存，只有当用字符串进行取值的时候才开辟内存
/// UICollectionView 本身并没有直接提供公开的 API 来检查某个 reuseIdentifier 是否已经注册
/// 可以用方法交换去插入一个自定义标志位（NSMutableSet）
-(jobsByVoidBlock _Nonnull)registerCollectionViewClass{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        self.registerCollectionElementKindSectionFooterClass(UICollectionReusableView.class,@"");
        self.registerCollectionElementKindSectionFooterClass(BaseCollectionReusableView.class,@"");
#pragma mark —— CollectionReusableView-Header
        self.registerCollectionElementKindSectionHeaderClass(TMSWalletCollectionReusableView.class,@"");
#pragma mark —— CollectionReusableView—Footer
        self.registerCollectionElementKindSectionFooterClass(JobsHeaderFooterView.class,@"");
#pragma mark —— CollectionViewCell
        self.registerCollectionViewCellClass(UICollectionViewCell.class,@"");
        self.registerCollectionViewCellClass(BaseCollectionViewCell.class,@"");
        self.registerCollectionViewCellClass(JobsBaseCollectionViewCell.class,@"");
        self.registerCollectionViewCellClass(JobsHotLabelByMultiLineCVCell.class,@"");
        self.registerCollectionViewCellClass(JobsSearchDataCVCell.class,@"");
        self.registerCollectionViewCellClass(JobsBtnStyleCVCell.class,@"");
        self.registerCollectionViewCellClass(JobsImageViewStyleCVCell.class,@"");
        self.registerCollectionViewCellClass(JobsTextFieldStyleCVCell.class,@"");
        self.registerCollectionViewCellClass(ThreeClassCell.class,@"");
    };
}
#pragma mark —— 注册 UICollectionViewCell 及其子类
-(jobsByClassAndSaltStrBlock _Nonnull)registerCollectionViewCellClass{
    @jobs_weakify(self)
    return ^(Class _Nonnull cls,
             NSString * _Nullable salt) {
        @jobs_strongify(self)
        self.registerCollectionViewCellClass_(cls,cls.description.add(salt));
    };
}

-(jobsByClassAndSaltStrBlock _Nonnull)registerCollectionViewCellClass_{
    @jobs_weakify(self)
    return ^(Class _Nonnull cls,
             NSString * _Nullable reuseIdentifier) {
        @jobs_strongify(self)
        [self registerClass:cls forCellWithReuseIdentifier:reuseIdentifier];
    };
}
#pragma mark —— 注册 UICollectionElementKindSectionHeader 及其子类
-(jobsByClassAndSaltStrBlock _Nonnull)registerCollectionElementKindSectionHeaderClass{
    @jobs_weakify(self)
    return ^(Class _Nonnull cls,
             NSString * _Nullable salt) {
        @jobs_strongify(self)
        self.registerCollectionElementKindSectionHeaderClass_(cls,cls.description.add(salt));
    };
}

-(jobsByClassAndSaltStrBlock _Nonnull)registerCollectionElementKindSectionHeaderClass_{
    @jobs_weakify(self)
    return ^(Class _Nonnull cls,
             NSString * _Nullable reuseIdentifier) {
        @jobs_strongify(self)
        [self registerClass:cls
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
        withReuseIdentifier:reuseIdentifier];
    };
}
#pragma mark —— 注册 UICollectionElementKindSectionFooter 及其子类
-(jobsByClassAndSaltStrBlock _Nonnull)registerCollectionElementKindSectionFooterClass{
    @jobs_weakify(self)
    return ^(Class _Nonnull cls,
             NSString * _Nullable salt) {
        @jobs_strongify(self)
        self.registerCollectionElementKindSectionFooterClass_(cls,cls.description.add(salt));
    };
}

-(jobsByClassAndSaltStrBlock _Nonnull)registerCollectionElementKindSectionFooterClass_{
    @jobs_weakify(self)
    return ^(Class _Nonnull cls,
             NSString * _Nullable reuseIdentifier) {
        @jobs_strongify(self)
        [self registerClass:cls
        forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
        withReuseIdentifier:reuseIdentifier];
    };
}
#pragma mark —— 依据字符串取值
/// 依据字符串取UICollectionElementKindSectionHeader
-(__kindof UICollectionReusableView *)UICollectionElementKindSectionHeaderClass:(Class)cls
                                                                   forIndexPath:(NSIndexPath *)indexPath{
    self.registerCollectionElementKindSectionHeaderClass(cls,@"");
    UICollectionReusableView *collectionReusableView = [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                                withReuseIdentifier:cls.description
                                                                                       forIndexPath:indexPath];
    if (!collectionReusableView) {
        collectionReusableView = [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                          withReuseIdentifier:cls.description
                                                                 forIndexPath:indexPath];
    }
    collectionReusableView.indexPath = indexPath;
    return collectionReusableView;
}
/// 依据字符串取UICollectionElementKindSectionFooter
-(__kindof UICollectionReusableView *)UICollectionElementKindSectionFooterClass:(Class)cls
                                                                   forIndexPath:(NSIndexPath *)indexPath{
    self.registerCollectionElementKindSectionFooterClass(cls,@"");
    UICollectionReusableView *collectionReusableView = [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                                                                                withReuseIdentifier:cls.description
                                                                                       forIndexPath:indexPath];
    if (!collectionReusableView) {
        collectionReusableView = [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                                                          withReuseIdentifier:cls.description
                                                                 forIndexPath:indexPath];
    }
    collectionReusableView.indexPath = indexPath;
    return collectionReusableView;
}
/// 一种用字符串取UICollectionViewCell及其子类的方法❤️复用字符串是目标类的类名❤️
-(__kindof UICollectionViewCell *)collectionViewCellClass:(Class)cls
                                             forIndexPath:(NSIndexPath *)indexPath{
    return [self dequeueReusableCellWithReuseIdentifier:cls.description
                                           forIndexPath:indexPath];
}
#pragma mark ——
/// 先用UICollectionViewLayout生成CollectionView。frame后面设置
+(instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout{
    return [self.alloc initWithFrame:CGRectZero
                collectionViewLayout:layout];
}

@end
