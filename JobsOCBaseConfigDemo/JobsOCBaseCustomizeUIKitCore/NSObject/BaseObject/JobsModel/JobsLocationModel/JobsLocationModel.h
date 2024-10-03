//
//  JobsLocationModel.h
//  FM
//
//  Created by User on 9/30/24.
//

#import <Foundation/Foundation.h>
#import "UILocationProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsLocationModel : NSObject<UILocationProtocol>
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
