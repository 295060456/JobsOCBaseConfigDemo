//
//  JobsSearchBar.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import <UIKit/UIKit.h>
#import "JobsDoorInputViewProtocol.h"
#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchBar : BaseView
<
JobsDoorInputViewProtocol
,UITextFieldDelegate
>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsSearchBar *_Nonnull jobsMakeSearchBar(jobsBySearchBarBlock _Nonnull block){
    JobsSearchBar *data = JobsSearchBar.alloc.init;
    if (block) block(data);
    return data;
}
