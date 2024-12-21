//
//  NSString+ID.h
//  FM
//
//  Created by Admin on 21/12/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ID)

-(JobsReturnCollectionViewLayoutAttributesByNSIndexPathBlock _Nonnull)initCollectionViewLayoutAttributesForSupplementaryViewBy;
-(JobsReturnCollectionViewLayoutAttributesByNSIndexPathBlock _Nonnull)initCollectionViewLayoutAttributesForDecorationViewBy;

@end

NS_ASSUME_NONNULL_END
