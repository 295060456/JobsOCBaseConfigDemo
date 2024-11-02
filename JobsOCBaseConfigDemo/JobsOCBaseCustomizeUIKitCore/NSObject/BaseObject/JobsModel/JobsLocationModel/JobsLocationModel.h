//
//  JobsLocationModel.h
//  FM
//
//  Created by User on 9/30/24.
//

#import <Foundation/Foundation.h>
#import "UILocationProtocol.h"
#import "BaseViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsLocationModel : NSObject<UILocationProtocol,BaseViewProtocol>
#pragma mark —— UILocationProtocol
///// Frame
//@property(nonatomic,assign)CGFloat jobsX;
//@property(nonatomic,assign)CGFloat jobsY;
//@property(nonatomic,assign)CGFloat jobsWidth;/// 宽
//@property(nonatomic,assign)CGFloat jobsHeight;/// 高
///// Edge
//@property(nonatomic,assign)CGFloat jobsTop;
//@property(nonatomic,assign)CGFloat jobsLeft;/// = leading
//@property(nonatomic,assign)CGFloat jobsRight;/// = trailing
//@property(nonatomic,assign)CGFloat jobsBottom;
///// NSRange
//@property(nonatomic,assign)NSUInteger location;
//@property(nonatomic,assign)NSUInteger length;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsLocationModel *_Nonnull jobsMakeLocationModel(jobsByLocationModelBlock _Nonnull block){
    JobsLocationModel *data = JobsLocationModel.alloc.init;
    if (block) block(data);
    return data;
}
