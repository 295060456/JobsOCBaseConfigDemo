//
//  WebViewController.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 15/7/25.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebViewController : UIViewController

-(instancetype)initWithURL:(NSString *)url title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
