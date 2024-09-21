//
//  JobsArray.h
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#ifndef JobsArray_h
#define JobsArray_h

#ifndef JobsMutableArray
#define JobsMutableArray(MutArrInstace) (MutArrInstace ? [MutArrInstace removeAllObjects] : (MutArrInstace = NSMutableArray.array))
#endif /* JobsMutableArray */

#pragma mark —— Base
// TODO
#pragma mark —— Category
//#import "NSArray+Safety.h"
#import "NSArray+Tools.h"

#endif /* JobsArray_h */
