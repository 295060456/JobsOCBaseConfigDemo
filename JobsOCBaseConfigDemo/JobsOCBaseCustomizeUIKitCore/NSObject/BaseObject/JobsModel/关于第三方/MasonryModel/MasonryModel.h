//
//  MasonryModel.h
//  FM
//
//  Created by User on 9/26/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MasonryModel : NSObject

Prop_assign()MASAxisType axisType; /// 在水平（垂直）方向上分布这些视图
Prop_assign()CGFloat fixedSpacing; /// 指定每个视图之间的固定间距
Prop_assign()CGFloat fixedItemLength;
Prop_assign()CGFloat leadSpacing; /// 指定第一个视图与父视图左边缘（顶部）之间的距离
Prop_assign()CGFloat tailSpacing; /// 指定最后一个视图与父视图右边缘（底部）之间的距离
Prop_assign()CGFloat top;
Prop_assign()CGFloat bottom;
Prop_assign()CGFloat left;
Prop_assign()CGFloat right;
Prop_assign()CGFloat height;
Prop_assign()CGFloat width;
Prop_assign()CGFloat centerX;
Prop_assign()CGFloat centerY;
Prop_assign()BOOL is_mas_makeConstraints;
Prop_strong()__kindof UIView *view;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof MasonryModel *_Nonnull jobsMakeMasonryModel(jobsByMasonryModelBlock _Nonnull block){
    MasonryModel *data = MasonryModel.alloc.init;
    if (block) block(data);
    return data;
}
