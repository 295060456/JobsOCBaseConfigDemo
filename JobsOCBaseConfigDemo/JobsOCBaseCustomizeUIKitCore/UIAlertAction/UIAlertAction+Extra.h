//
//  UIAlertAction+Extra.h
//  FM
//
//  Created by Admin on 25/11/2024.
//

#import <UIKit/UIKit.h>
#import "JobsAlertModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertAction (Extra)

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UIAlertAction *_Nonnull JobsMakeAlertActionBy(JobsAlertModel *_Nonnull model){
    return [UIAlertAction actionWithTitle:model.alertActionTitle
                                    style:model.alertActionStyle
                                  handler:model.alertActionBlock];
}
