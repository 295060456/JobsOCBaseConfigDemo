#import <Foundation/Foundation.h>
#import "MVP/MVPLoginContracts.h"
@protocol AuthService;
@interface MVPLoginPresenterImpl : NSObject <MVPLoginPresenter>
- (instancetype)initWithView:(id<MVPLoginView>)view service:(id<AuthService>)service;
@end
