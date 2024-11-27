//
//  MGSwipeButtonModel.h
//  JobsIM
//
//  Created by Jobs on 2020/11/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MGSwipeButtonModel : NSObject

@property(nonatomic,strong)UIImage *IconIMG;
@property(nonatomic,strong)UIColor *bgCor;
@property(nonatomic,copy)NSString *titleStr;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof MGSwipeButtonModel *_Nonnull jobsMakeMGSwipeButtonModel(jobsByMGSwipeButtonModelBlock _Nonnull block){
    MGSwipeButtonModel *data = MGSwipeButtonModel.alloc.init;
    if (block) block(data);
    return data;
}
