//
//  BaseTextView.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/27.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "NSObject+AttributedStr.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTextView : UITextView

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof BaseTextView *_Nonnull jobsMakeBaseTextView(jobsByBaseTextViewBlock _Nonnull block){
    BaseTextView *data = BaseTextView.alloc.init;
    data.linkTextAttributes = NSObject.linkTextAttributes;
    if (block) block(data);
    return data;
}
