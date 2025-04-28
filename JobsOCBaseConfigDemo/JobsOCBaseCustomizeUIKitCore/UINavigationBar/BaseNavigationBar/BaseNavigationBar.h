//
//  BaseNavigationBar.h
//  UBallLive
//
//  Created by Jobs on 2020/10/21.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "MacroDef_Func.h"
#import "DefineConstString.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseNavigationBar : UINavigationBar

-(void)actionBlockBaseNavigationBar:(jobsByIDBlock _Nonnull)baseNavigationBarBlock;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof BaseNavigationBar *_Nonnull jobsMakeNavigationBar(jobsByBaseNavigationBarBlock _Nonnull block){
    BaseNavigationBar *data = BaseNavigationBar.alloc.init;
    if (block) block(data);
    return data;
}
