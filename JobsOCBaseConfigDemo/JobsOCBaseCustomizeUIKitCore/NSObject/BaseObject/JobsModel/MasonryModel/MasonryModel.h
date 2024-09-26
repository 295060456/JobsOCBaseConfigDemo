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
@property(nonatomic,assign)CGFloat leadSpacing;
@property(nonatomic,assign)CGFloat tailSpacing;
@property(nonatomic,assign)CGFloat top;
@property(nonatomic,assign)CGFloat bottom;
@property(nonatomic,assign)CGFloat left;
@property(nonatomic,assign)CGFloat right;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,assign)CGFloat width;

@end

NS_ASSUME_NONNULL_END

static inline __kindof MasonryModel *_Nonnull jobsMakeMasonryModel(jobsByMasonryModelBlock _Nonnull block){
    MasonryModel *data = MasonryModel.alloc.init;
    if (block) block(data);
    return data;
}
