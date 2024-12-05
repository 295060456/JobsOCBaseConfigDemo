//
//  MasonryModel.h
//  FM
//
//  Created by User on 9/26/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MasonryModel : NSObject

@property(nonatomic,assign)MASAxisType axisType;
@property(nonatomic,assign)CGFloat fixedSpacing;
@property(nonatomic,assign)CGFloat fixedItemLength;
@property(nonatomic,assign)CGFloat leadSpacing;
@property(nonatomic,assign)CGFloat tailSpacing;
@property(nonatomic,assign)CGFloat top;
@property(nonatomic,assign)CGFloat bottom;
@property(nonatomic,assign)CGFloat left;
@property(nonatomic,assign)CGFloat right;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat centerX;
@property(nonatomic,assign)CGFloat centerY;
@property(nonatomic,assign)BOOL is_mas_makeConstraints;
@property(nonatomic,strong)__kindof UIView *view;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof MasonryModel *_Nonnull jobsMakeMasonryModel(jobsByMasonryModelBlock _Nonnull block){
    MasonryModel *data = MasonryModel.alloc.init;
    if (block) block(data);
    return data;
}
