//
//  JobsParagraphStyleModel.h
//  FM
//
//  Created by User on 9/25/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsParagraphStyleModel : NSObject

@property(nonatomic,strong)id value;
@property(nonatomic,assign)NSRange range;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsParagraphStyleModel *_Nonnull jobsMakeParagraphStyleModel(jobsByParagraphStyleModelBlock _Nonnull block){
    JobsParagraphStyleModel *data = JobsParagraphStyleModel.alloc.init;
    if (block) block(data);
    return data;
}
