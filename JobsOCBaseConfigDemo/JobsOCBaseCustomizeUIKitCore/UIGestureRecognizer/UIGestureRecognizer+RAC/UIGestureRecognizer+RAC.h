//
//  UIGestureRecognizer+RAC.h
//  FM
//
//  Created by Admin on 19/11/2024.
//

#ifndef UIGestureRecognizer_RAC_h
#define UIGestureRecognizer_RAC_h

#import "RACGestureRecognizerActionHandler.h"
#import "UIGestureRecognizer+ReactiveCocoaProtected.h"
#import "UIGestureRecognizer+ReactiveCocoa.h"

#endif /* UIGestureRecognizer_RAC_h */

/**
 UITapGestureRecognizer *tapGesture = UITapGestureRecognizer.rac_recognizer;
 [tapGesture.rac_gestureSignal subscribeNext:^(__kindof UIGestureRecognizer * _Nullable gesture) {
     JobsLog(@"");
 }];
 self.topBar.addGesture(tapGesture);
 */
