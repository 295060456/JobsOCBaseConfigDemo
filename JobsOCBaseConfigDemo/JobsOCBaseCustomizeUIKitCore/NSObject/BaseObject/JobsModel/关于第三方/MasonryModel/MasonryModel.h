//
//  MasonryModel.h
//  FM
//
//  Created by User on 9/26/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MasonryModel : NSObject

Prop_assign()MASAxisType axisType;
Prop_assign()CGFloat fixedSpacing;
Prop_assign()CGFloat fixedItemLength;
Prop_assign()CGFloat leadSpacing;
Prop_assign()CGFloat tailSpacing;
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
