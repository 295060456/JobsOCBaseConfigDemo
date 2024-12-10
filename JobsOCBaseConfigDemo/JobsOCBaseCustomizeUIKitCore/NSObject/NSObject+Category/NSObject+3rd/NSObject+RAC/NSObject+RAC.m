//
//  NSObject+RAC.m
//  FM
//
//  Created by Admin on 10/12/2024.
//

#import "NSObject+RAC.h"

@implementation NSObject (RAC)
#pragma mark —— @property(nonatomic,strong,nonnull)RACSubject *racSubject;
JobsKey(_racSubject)
@dynamic racSubject;
-(RACSubject *)racSubject{
    RACSubject *RacSubject = Jobs_getAssociatedObject(_racSubject);
    if(!RacSubject){
        RacSubject = RACSubject.subject;
        Jobs_setAssociatedRETAIN_NONATOMIC(_racSubject, RacSubject);
    }return RacSubject;
}

-(void)setRacSubject:(RACSubject *)racSubject{
    Jobs_setAssociatedRETAIN_NONATOMIC(_racSubject, racSubject)
}

@end
