//
//  MGSwipeButtonModel.h
//  JobsIM
//
//  Created by Jobs on 2020/11/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MGSwipeButtonModel : NSObject

Prop_strong()UIImage *IconIMG;
Prop_strong()UIColor *bgCor;
Prop_copy()NSString *titleStr;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof MGSwipeButtonModel *_Nonnull jobsMakeMGSwipeButtonModel(jobsByMGSwipeButtonModelBlock _Nonnull block){
    MGSwipeButtonModel *data = MGSwipeButtonModel.alloc.init;
    if (block) block(data);
    return data;
}
